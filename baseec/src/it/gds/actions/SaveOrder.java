package it.gds.actions;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Carrello;
import it.gds.beans.Carrellodett;
import it.gds.beans.ClientiETessera;
import it.gds.beans.OrdiniEDettagli;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.*;

public class SaveOrder extends ActionSupport implements Constants {

	private static final long serialVersionUID = 2893465555904043117L;
	private String expmonth;
	private String paymentMethod;
	private String oid;
	private String response_hash;
	private String notification_hash;
	private String chargetotal;
	private String currency;
	private String cardnumber;
	private String expyear;
	private String refnumber;
	private String response_code_3dsecure;
	private String tdate;
	private String txntype;
	private String txndate_processed;
	private String ccbin;
	private String approval_code;
	private String status;
	private String timezone;
	private String terminal_id;
	private String processor_response_code;
	private String id_ordine;
	private long id_carrello;
	private long id_cliente;
	private long id_sito;
	private String sid;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;
	private Carrello c;
	private OrdiniEDettagli o;
	private List<Carrellodett> ld;
	private List<OrdiniEDettagli> ol = new ArrayList<OrdiniEDettagli>();

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String execute() {
		try {
			String payment_type = (String) session.getAttribute("PAYMENT_TYPE");
			c = (Carrello) session.getAttribute("CARRELLO");
			o = (OrdiniEDettagli) session.getAttribute("ORDINE");
			cli = (ClientiETessera) session.getAttribute("CLIENTE");

			c.setData(new Date());
			c.setId_cliente(cli.getId());
			HibernateUtil.saveOrUpdate(c);

			session.setAttribute("ID", getSid());
			// cli = (ClientiETessera) sx.createQuery(HQL_GETCLIENTE).setParameter("id_cliente", getId_cliente()).uniqueResult();
			String[] oidl = getId_ordine().split("-");
			o.setId_carrello(c.getId());
			if (payment_type.equals("cb") || payment_type.equals("co")  ) {
				o.setPagato(false);
			} else if (payment_type.equals("cc")) {
				o.setPagato(true);
			}

			o.setPagato_transaz(getOid());
			HibernateUtil.saveOrUpdate(o);

			session.setAttribute("CLIENTE", cli);
			session.setAttribute("ORDERS", ol);
			Connection conn = DriverManager.getConnection("jdbc:mysql://mysql.gds-italia.it:3306/gds-i41_gdsdb",
								"gds-i41_dbuser", "dbuser01");
			Statement stmt = conn.createStatement();

			session.removeAttribute("CARRELLO");
			session.removeAttribute("TOTCART");
			session.removeAttribute("TOTDETT");
			session.removeAttribute("PAYMENT_TYPE");

			stmt.execute("UPDATE sessioni SET id_carrello = " + c.getId() + " WHERE ip = '"
					+ session.getAttribute("ID") + "' AND attivo = '1'");
			stmt.close();
			conn.close();

			Boolean res = this.inviaConferma(cli, o, c, payment_type);
			if (res == false) {
				return ERROR;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	private Boolean inviaConferma ( ClientiETessera cli, 
									OrdiniEDettagli o, 
									Carrello c, 
									String payment_type) {
		try {
			String emailAddress= cli.getEmail();
			String emailObject = "Conferma ordine";
			String mailtext = this.readMail();

			if (o.getTipo_consegna().equals("pickup")) {
				mailtext = this.readMail2();
			}

			mailtext = mailtext.replace("__NOME", cli.getNome());
			mailtext = mailtext.replace("__NUMEROORDINE", String.valueOf(o.getId()));
			mailtext = mailtext.replace("__ORACONSEGNA", (o.getOra_consegna()));
			mailtext = mailtext.replace("__DATACONSEGNA", (new SimpleDateFormat("dd-MM-yyyy")).format(o.getData_consegna()));
			mailtext = mailtext.replace("__INDIRIZZO", (o.getD_indirizzo() + ", " + o.getD_localita()));
			mailtext = mailtext.replace("__TELEFONO", (o.getD_telefono()));
			if (payment_type.equals("cb")  ) {
				mailtext = mailtext.replace("__TIPOPAG", ("Carta o Bancomat"));
			} else if (payment_type.equals("co")) {
				mailtext = mailtext.replace("__TIPOPAG", ("Contanti"));
			}
			
			Iterator it = c.getDettagli().iterator();
			
			String temp= "";
			while (it.hasNext()) {
				Carrellodett object = (Carrellodett) it.next();
				temp += "<p> " + object.getQuantita() + " x "
						+ StringEscapeUtils.escapeHtml4(object.getDescrizione()) + " - &euro; "
						+ new DecimalFormat("#.00").format(object.getPrezzo()) + "</p>";
			}

			temp += "<p> TOTALE &euro; " + c.getTotale() + "</p>";
			
			if (c.getCoupon() != null) {
				temp += "<p> COUPON " + c.getCoupon() + "</p>";
				temp += "<p> TOTALE SCONTATO &euro; " + c.getTotcartwithdiscount() + "</p>";
			}

			mailtext = mailtext.replace("__LIST", (temp));

			SendMail.sendMessage(emailAddress, emailObject, mailtext);
			System.out.println("messaggio inviato a " + emailAddress);
			
			emailAddress = "tm@boostech.it";
			SendMail.sendMessage("tm@boostech.it", emailObject, mailtext);
			System.out.println("messaggio inviato a " + emailAddress);

			emailAddress = "amministrazione.vigevano@boostech.it";
			SendMail.sendMessage("ca@boostech.it", emailObject, mailtext);
			System.out.println("messaggio inviato a " + emailAddress);

			emailAddress = "ca@boostech.it";
			SendMail.sendMessage("ca@boostech.it", emailObject, mailtext);
			System.out.println("messaggio inviato a " + emailAddress);

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	public String getExpmonth() {
		return expmonth;
	}

	public void setExpmonth(String expmonth) {
		this.expmonth = expmonth;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getResponse_hash() {
		return response_hash;
	}

	public void setResponse_hash(String response_hash) {
		this.response_hash = response_hash;
	}

	public String getNotification_hash() {
		return notification_hash;
	}

	public void setNotification_hash(String notification_hash) {
		this.notification_hash = notification_hash;
	}

	public String getChargetotal() {
		return chargetotal;
	}

	public void setChargetotal(String chargetotal) {
		this.chargetotal = chargetotal;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}

	public String getExpyear() {
		return expyear;
	}

	public void setExpyear(String expyear) {
		this.expyear = expyear;
	}

	public String getRefnumber() {
		return refnumber;
	}

	public void setRefnumber(String refnumber) {
		this.refnumber = refnumber;
	}

	public String getResponse_code_3dsecure() {
		return response_code_3dsecure;
	}

	public void setResponse_code_3dsecure(String response_code_3dsecure) {
		this.response_code_3dsecure = response_code_3dsecure;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public String getTxntype() {
		return txntype;
	}

	public void setTxntype(String txntype) {
		this.txntype = txntype;
	}

	public String getTxndate_processed() {
		return txndate_processed;
	}

	public void setTxndate_processed(String txndate_processed) {
		this.txndate_processed = txndate_processed;
	}

	public String getCcbin() {
		return ccbin;
	}

	public void setCcbin(String ccbin) {
		this.ccbin = ccbin;
	}

	public String getApproval_code() {
		return approval_code;
	}

	public void setApproval_code(String approval_code) {
		this.approval_code = approval_code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTimezone() {
		return timezone;
	}

	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}

	public String getTerminal_id() {
		return terminal_id;
	}

	public void setTerminal_id(String terminal_id) {
		this.terminal_id = terminal_id;
	}

	public String getProcessor_response_code() {
		return processor_response_code;
	}

	public void setProcessor_response_code(String processor_response_code) {
		this.processor_response_code = processor_response_code;
	}

	public String getId_ordine() {
		return String.valueOf(o.getId());
	}

	public void setId_ordine(String id_ordine) {
		this.id_ordine = id_ordine;
	}

	public long getId_carrello() {
		return id_carrello;
	}

	public void setId_carrello(long id_carrello) {
		this.id_carrello = id_carrello;
	}

	public long getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(long id_cliente) {
		this.id_cliente = id_cliente;
	}

	public OrdiniEDettagli getO() {
		return o;
	}

	public List<Carrellodett> getLd() {
		return ld;
	}

	public long getId_sito() {
		return id_sito;
	}

	public void setId_sito(long id_sito) {
		this.id_sito = id_sito;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String readMail() throws IOException {
	    File file = new File("mails/__001_mail.html");
	    File f = new File(session.getServletContext().getRealPath("/") + "/mails/__001_mail.html");
	    return FileUtils.readFileToString (f);
	}

	public String readMail2() throws IOException {
	    File file = new File("mails/__002_mail.html");
	    File f = new File(session.getServletContext().getRealPath("/") + "/mails/__002_mail.html");
	    return FileUtils.readFileToString (f);
	}
}

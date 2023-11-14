package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Carrello;
import it.gds.beans.Carrellodett;
import it.gds.beans.ClientiETessera;
import it.gds.beans.OrdiniEDettagli;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class PaymentResponse extends ActionSupport implements Constants {

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
			session.setAttribute("ID", getSid());
			if (getStatus().equals("APPROVED") || getStatus().equals("APPROVATO") || getStatus().equals("GENEHMIGT")) {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				cli = (ClientiETessera) sx.createQuery(HQL_GETCLIENTE).setParameter("id_cliente", getId_cliente())
						.uniqueResult();
				String[] oidl = getId_ordine().split("-");
				for (int i = 0; i < oidl.length - 1; i++) {
					o = (OrdiniEDettagli) sx.createQuery(HQL_GETORDINE).setParameter("id_ordine", oidl[i])
							.uniqueResult();
					o.setPagato(true);
					o.setPagato_transaz(getOid());
					HibernateUtil.saveOrUpdate(o);
					ol.add(o);
				}
				session.setAttribute("CLIENTE", cli);
				session.setAttribute("ORDERS", ol);
				Connection conn =
							DriverManager.getConnection("jdbc:mysql://mysql.gds-italia.it:3306/gds-i41_gdsdb",
									"gds-i41_dbuser", "dbuser01");

				Statement stmt = conn.createStatement();
				stmt.execute("DELETE FROM carrello WHERE id = " + c.getId());
				Carrello c = new Carrello();
				c.setData(new Date());
				c.setId_cliente(cli.getId());
				c.setTessera(cli.getCtessera().getTessera());
				HibernateUtil.saveOrUpdate(c);
				session.setAttribute("CARRELLO", c);
				session.setAttribute("TOTCART", 0);
				session.setAttribute("TOTDETT", 0);
				stmt.execute("UPDATE sessioni SET id_carrello = " + c.getId() + " WHERE ip = '"
						+ session.getAttribute("ID") + "' AND attivo = '1'");
				stmt.close();
				conn.close();
				// if(cli.getCtessera().getTessera().contains("P")) {
				// sx = HibernateUtil.getSessionFactory().openSession();
				// Query q = sx.createQuery("FROM Tessera_da_assegnare WHERE used = '0' AND
				// codice_referente = '" + cli.getCod_referente() + "' AND tessera NOT LIKE
				// '%P%' ORDER BY tessera");
				// q.setMaxResults(1);
				// Tessera_da_assegnare new_card = (Tessera_da_assegnare)q.uniqueResult();
				// new_card.setUsed(true);
				// HibernateUtil.saveOrUpdate(new_card);
				// cli.getCtessera().setTessera(new_card.getTessera());
				// HibernateUtil.saveOrUpdate(cli);
				// Tessere t = cli.getCtessera();
				// t.setTessera(new_card.getTessera());
				// t.setCodice_alternativo(new_card.getCodice_alternativo());
				// HibernateUtil.saveOrUpdate(t);
				// sx.close();
				// session.setAttribute("CHANGE", true);
				// }
			} else {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				cli = (ClientiETessera) sx.createQuery(HQL_GETCLIENTE).setParameter("id_cliente", getId_cliente())
						.uniqueResult();
				String[] oidl = getId_ordine().split("-");
				for (int i = 0; i < oidl.length; i++) {
					o = (OrdiniEDettagli) sx.createQuery(HQL_GETORDINE.replace(":id_ordine", oidl[i])).uniqueResult();
					ld = (List<Carrellodett>) sx.createQuery(HQL_LISTCARTDETTBYORDER.replace(":id_ordine", oidl[i])).list();
					Iterator i1 = ld.iterator();
					while (i1.hasNext()) {
						Carrellodett d = (Carrellodett) i1.next();
						d.setId_ordine(null);
						d.setId_carrello(getId_carrello());
						HibernateUtil.saveOrUpdate(d);
					}
					sx.evict(o);
					HibernateUtil.delete(o);
				}
				c = (Carrello) sx.createQuery(HQL_GETCARRELLO).setParameter("id_carrello", getId_carrello()).uniqueResult();
				Iterator i1 = c.getDettagli().iterator();
				int totdett = 0;
				double totcart = 0;
				while (i1.hasNext()) {
					Carrellodett el = (Carrellodett) i1.next();
					totdett++;
					totcart = totcart + el.getTotale();
				}
				session.setAttribute("CLIENTE", cli);
				session.setAttribute("CARRELLO", c);
				session.setAttribute("TOTDETT", totdett);
				session.setAttribute("TOTCART", totcart);
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
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
		return id_ordine;
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

}

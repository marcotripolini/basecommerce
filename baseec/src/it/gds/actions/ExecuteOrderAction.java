package it.gds.actions;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Carrello;
import it.gds.beans.ClientiETessera;
import it.gds.beans.OrdiniEDettagli;
import it.gds.hibernate.HibernateUtil;
import it.gds.utils.Config;

@Action("executeorder")
@Results({@Result(name="success", location="/ipg.jsp")})
public class ExecuteOrderAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;
	private Carrello cart;
	private OrdiniEDettagli o;

	public String execute() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			if (cli != null) {
				cart = (Carrello)session.getAttribute("CARRELLO");
				Double totcart  = cart.getTotcartwithdiscount();
//				Double totcart = (Double)session.getAttribute("TOTCART");
				if(cart != null) {
					o = new OrdiniEDettagli();
					o.setId_cliente(cli.getId());
					o.setImporto(totcart);
					o.setSpesesped((double)0);
					o.setTotale(totcart);
					o.setD_cap(cli.getD_cap());
					o.setD_indirizzo(cli.getD_indirizzo());
					o.setD_localita(cli.getD_localita());
					o.setD_provincia(cli.getD_provincia());
					o.setD_note(cli.getD_note());
					o.setDettagli(cart.getDettagli());

					o.setContrassegno(true);
					o.setData(new Date());

					o.setD_cap(cli.getCap());
					o.setD_indirizzo(cli.getIndirizzo());
					o.setD_localita(cli.getLocalita());
					o.setD_provincia(cli.getProvincia());
					o.setD_nominativo(cli.getNome() + " " + cli.getCognome());
					o.setD_email(cli.getEmail());
					o.setD_telefono(cli.getTelefono_a());
					o.setShop_name(Config.getNOMEONLINE());

					if (cli.getCtessera() == null) {
						o.setTessera("NOCARD");
					} else {
						o.setTessera(cli.getCtessera().getTessera());
					}

					String delivery_time = (String)session.getAttribute("DELIVERY_TIME");
					String delivery_hour = (String)session.getAttribute("DELIVERY_HOUR");

					Date data_consegna = (Date)session.getAttribute("DELIVERY_DATE");
					String tipo_consegna = (String)session.getAttribute("DELIVERY_TYPE");

					System.out.println("tipo consegna = " + tipo_consegna);

					o.setOra_consegna(delivery_hour);
					o.setData_consegna(data_consegna);
					o.setTipo_consegna(tipo_consegna);

					String[] buf = delivery_time.split("/|");

					if(buf[0].equals("1")) {
						o.setConsegna_fascia_a(true);
					} else {
						o.setConsegna_fascia_a(false);
					}
					if(buf[2].equals("1")) {
						o.setConsegna_fascia_b(true);
					} else {
						o.setConsegna_fascia_b(false);
					}
					if(buf[4].equals("1")) {
						o.setConsegna_fascia_c(true);
					} else {
						o.setConsegna_fascia_c(false);
					}

					HibernateUtil.saveOrUpdate(o);
					session.setAttribute("ORDINE", o);
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
}

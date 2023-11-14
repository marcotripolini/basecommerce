package it.gds.actions;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.ClientiETessera;
import it.gds.beans.OrdiniEDettagli;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class storicoOrdini extends ActionSupport implements Constants {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6614358724755715904L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;
	private List<OrdiniEDettagli> lo;
	
	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			if(cli != null) {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				lo = (List<OrdiniEDettagli>)sx.createQuery(HQL_ORDINIEDETT).setParameter("id_cliente", cli.getId()).list();
				sx.close();
			} else 
				return SUCCESS_NOLOGIN;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public List<OrdiniEDettagli> getLo() {
		return lo;
	}
	
	
}

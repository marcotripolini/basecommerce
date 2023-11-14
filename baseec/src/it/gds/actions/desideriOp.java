package it.gds.actions;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.ClientiETessera;
import it.gds.beans.Desideratidett;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class desideriOp extends ActionSupport implements Constants {
	private static final long serialVersionUID = -343935059543245408L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;
	private Desideratidett d;
	private List<Desideratidett> ld;
	private String articolo;
	private String marchio;
	private String formato;
	private String barcode;

	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			if(cli != null) {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				ld = (List<Desideratidett>)sx.createQuery(HQL_LISTADESIDERI).setParameter("id_cliente", cli.getId()).list();
				sx.close();
			} else
				return SUCCESS_NOLOGIN;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public void saveDesiderio() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			if(cli != null) {
				d = new Desideratidett();
				d.setId_cliente(cli.getId());
				d.setData(new Date());
				d.setArticolo(getArticolo());
				d.setMarchio(getMarchio());
				d.setFormato(getFormato());
				d.setBarcode(getBarcode());
				HibernateUtil.saveOrUpdate(d);
				ServletActionContext.getResponse().getWriter().print(SUCCESS);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<Desideratidett> getLd() {
		return ld;
	}

	public String getArticolo() {
		return articolo;
	}

	public void setArticolo(String articolo) {
		this.articolo = articolo;
	}

	public String getMarchio() {
		return marchio;
	}

	public void setMarchio(String marchio) {
		this.marchio = marchio;
	}

	public String getFormato() {
		return formato;
	}

	public void setFormato(String formato) {
		this.formato = formato;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

}

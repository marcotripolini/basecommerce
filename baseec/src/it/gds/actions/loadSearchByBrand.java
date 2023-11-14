package it.gds.actions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.ClientiETessera;
import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class loadSearchByBrand extends ActionSupport implements Constants {
	private static final long serialVersionUID = -2013560184833646817L;
	private List<Prodotti> prodotti;
	private ClientiETessera cli;
	private long brand;
	private String category;

	private HttpSession session = ServletActionContext.getRequest().getSession();

	@SuppressWarnings("unchecked")
	public String execute() {

		try {
			cli = (ClientiETessera) session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			if (getCategory() != null) {
				Query q = sx.createQuery(HQL_SEARCHBYBRANDINCAT.replace(":cods", getAllCodes()));
				prodotti = (List<Prodotti>) q
						.setParameter("id_marchio", getBrand())
						.setParameter("category", getCategory())
						.setDate("date", new Date()).list();
			} else {
				Query q = sx.createQuery(HQL_SEARCHBYBRAND);
				prodotti = (List<Prodotti>) q.setParameter("id_marchio", getBrand()).setDate("date", new Date()).list();
			}

			sx.close();
			if (cli == null)
				return SUCCESS_NOLOGIN;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	private String getAllCodes() {
		return (String) ServletActionContext.getServletContext().getAttribute(ALLCODES);
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public List<Prodotti> getProdotti() {
		return prodotti;
	}

	public long getBrand() {
		return brand;
	}

	public void setBrand(long brand) {
		this.brand = brand;
	}
}

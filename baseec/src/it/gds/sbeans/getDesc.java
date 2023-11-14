package it.gds.sbeans;

import java.util.Date;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.All_products;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class getDesc extends ActionSupport implements Constants {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8350106015977799336L;
	private String code;
	private All_products p;
	private String descrizione;
	
	public String getDescrizione() {
		try {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			p = (All_products)sx.createQuery(HQL_APRODBYCOD).setParameter("codice_gds", getCode()).setDate("date", new Date()).uniqueResult();
			descrizione = p.getMarchio().getMarchio() + " - " + p.getTitolo().substring(6);
			sx.close();
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return descrizione;
	}
	
	public All_products getP() {
		try {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			p = (All_products)sx.createQuery(HQL_APRODBYCOD).setParameter("codice_gds", getCode()).setDate("date", new Date()).uniqueResult();
			sx.close();
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return p;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	
	
}

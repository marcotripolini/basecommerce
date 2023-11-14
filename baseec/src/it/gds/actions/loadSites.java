package it.gds.actions;

import java.util.List;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Siti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.sbeans.CheckSession;

public class loadSites extends ActionSupport implements Constants {
	private static final long serialVersionUID = -5385641529473260476L;
	private List<Siti> siti;

	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			CheckSession.check();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			siti = (List<Siti>)sx.createQuery(HQL_SITES).list();
			sx.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public List<Siti> getSiti() {
		return siti;
	}

}

package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.ClientiETessera;
import it.gds.beans.Config;
import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class loadOffers extends ActionSupport implements Constants {
	private static final long serialVersionUID = 4066922565421297444L;
	private List<Prodotti> offerte;
	private ClientiETessera cli;
	private HttpSession session = ServletActionContext.getRequest().getSession();

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String execute() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			Config c = (Config)ServletActionContext.getServletContext().getAttribute("CONFIG");

			if(c.getForce_offers() != null) {
				String str = c.getForce_offers();
				Query q = sx.createQuery(HQL_FORCEPRODS);
				offerte = (List<Prodotti>)q.setParameter("str", str).list();
			} else {
				Query q = sx.createQuery(HQL_OFFERS);
				q.setMaxResults(99);
				q.setDate("date", new Date());
				offerte = (List<Prodotti>)q.list();
			}

			Connection conn = DriverManager.getConnection(
					it.gds.utils.Config.getJDBCCONNECTION(),
					it.gds.utils.Config.getJDBCUSER(),
					it.gds.utils.Config.getJDBPASSWORD() );

			Iterator it = offerte.iterator();
			Locale locale = ActionContext.getContext().getLocale();

			while (it.hasNext()) {
				Prodotti prod = (Prodotti) it.next();
				prod.checkLanguage(locale.getLanguage(), conn);
			}

			conn.close();
			sx.close();
		} catch(Exception e) {
			e.printStackTrace();
		}

		if (cli == null) {
			return SUCCESS_NOLOGIN;
		} else {
			return SUCCESS;
		}
	}

	public List<Prodotti> getOfferte() {
		return offerte;
	}
}

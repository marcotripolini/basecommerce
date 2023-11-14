package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.I18nInterceptor;

import it.gds.utils.Config;
import it.gds.beans.Carrello;
import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.sbeans.CheckSession;

public class welcome extends ActionSupport implements Constants {
	private static final long serialVersionUID = 7578894634627494161L;
	private Boolean reload;
	private String action;
	private String language;
	private Boolean offers;

	public String execute() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			if (session.getAttribute(CART) != null) {
				Carrello c = (Carrello) sx.get(Carrello.class, ((Carrello)session.getAttribute(CART)).getId());
				session.setAttribute(CART, c);
			}
			sx.close();

			CheckSession.check();

			if (this.language != null) {
				if (this.language.equals("hu")) {
					ServletActionContext.getContext().setLocale(new Locale("hu", "HU"));
					Locale locale = new Locale("hu", "HU");
					ActionContext.getContext().setLocale(locale);
					ServletActionContext.getRequest().getSession()
							.setAttribute(I18nInterceptor.DEFAULT_SESSION_ATTRIBUTE, locale);
				} else if (this.language.equals("it")) {
					ServletActionContext.getContext().setLocale(new Locale("it", "IT"));
					Locale locale = new Locale("it", "IT");
					ActionContext.getContext().setLocale(locale);
					ServletActionContext.getRequest().getSession()
							.setAttribute(I18nInterceptor.DEFAULT_SESSION_ATTRIBUTE, locale);
				}
			}
			action = ServletActionContext.getContext().getName();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public Boolean getReload() {
		return reload;
	}

	public void setReload(Boolean reload) {
		this.reload = reload;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	@SuppressWarnings("unchecked")
	public Boolean getOffers() {
		List<Prodotti> offerte = new ArrayList<Prodotti>();
		try {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			it.gds.beans.Config c = (it.gds.beans.Config) ServletActionContext.getServletContext().getAttribute("CONFIG");

			if (c.getForce_offers() != null) {
				String str = c.getForce_offers();
				Query q = sx.createQuery(HQL_FORCEPRODS);
				offerte = (List<Prodotti>) q.setParameter("str", str).list();
			} else {
				Query q = sx.createQuery(HQL_OFFERS);
				q.setMaxResults(99);
				q.setDate("date", new Date());
				offerte = (List<Prodotti>) q.list();
			}

			Iterator it = offerte.iterator();
			Locale locale = ActionContext.getContext().getLocale();

			// Connection conn = ((SessionImpl) sx).connection();

			Connection conn = DriverManager.getConnection (Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD());
			while (it.hasNext()) {
				Prodotti prod = (Prodotti) it.next();
				prod.checkLanguage(locale.getLanguage(), conn);
			}

			conn.close();
			sx.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (offerte.size() > 0) {
			return true;
		} else {
			return false;
		}
	}
}

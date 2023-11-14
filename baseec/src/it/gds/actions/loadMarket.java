package it.gds.actions;

import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Categorie;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.sbeans.CheckSession;

public class loadMarket extends ActionSupport implements Constants, SessionAware {

	private static final long serialVersionUID = 3242415566849971961L;
	private List<Categorie> categorie;
	private List<Categorie> categorie2;
	Map<String, Object> session;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String execute() {
		try {

			// impostazione locale forzato
			// ServletActionContext.getContext().setLocale(new Locale("it","IT"));
			//

			CheckSession.check();
			Session sx = HibernateUtil.getSessionFactory().openSession();

			this.categorie = (List<Categorie>)  ((Map) ActionContext.getContext().get("application")).get("CATEGORIE1");
			this.categorie2 = (List<Categorie>) ((Map) ActionContext.getContext().get("application")).get("CATEGORIE2");

			if (categorie == null || categorie.size() < 1 ){
				categorie = (List<Categorie>) sx.createQuery(HQL_CAT1).list();
				((Map) ActionContext.getContext().get("application")).put("CATEGORIE1",categorie);
			}

			if (categorie2 == null || categorie2.size() < 1){
				categorie2 = (List<Categorie>)sx.createQuery(HQL_CAT2).list();
				((Map) ActionContext.getContext().get("application")).put("CATEGORIE2",categorie);
			}

			Locale locale = ActionContext.getContext().getLocale();

			Iterator it = this.categorie.iterator();
			while (it.hasNext()) {
				Categorie c = (Categorie) it.next();
				c.checkLanguage(locale.getLanguage());
			}

			it = this.categorie2.iterator();
			while (it.hasNext()) {
				Categorie c = (Categorie) it.next();
				c.checkLanguage(locale.getLanguage());
			}


			sx.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public List<Categorie> getCategorie() {
		return categorie;
	}

	public List<Categorie> getCategorie2() {
		return categorie2;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
}

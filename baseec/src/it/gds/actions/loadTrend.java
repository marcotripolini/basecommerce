package it.gds.actions;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.All_products;
import it.gds.beans.Carrellodett;
import it.gds.beans.ClientiETessera;
import it.gds.beans.Config;
import it.gds.beans.OrdiniEDettagli;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class loadTrend extends ActionSupport implements Constants {

	/**
	 *
	 */
	private static final long serialVersionUID = -6130234371271017692L;
	private List<OrdiniEDettagli> ordini;
	private List<All_products> trend;
	private ClientiETessera cli;

	private HttpSession session = ServletActionContext.getRequest().getSession();

	@SuppressWarnings({ "unchecked", "rawtypes"})
	public String execute() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			Config c = (Config)ServletActionContext.getServletContext().getAttribute("CONFIG");
			if(c.getForce_trend() != null) {
				Query q = sx.createQuery(HQL_FORCEPRODS);
				trend = (List<All_products>)q.setParameter("str", c.getForce_trend()).list();
			} else {
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.MONTH, -1);
				ordini = (List<OrdiniEDettagli>)sx.createQuery(HQL_ORDINIBYDATE).setDate("date", cal.getTime()).list();
				int pos = 0;
				trend = new ArrayList<All_products>();
				Iterator i = ordini.iterator();
				while(i.hasNext() && pos < 12) {
					OrdiniEDettagli o = (OrdiniEDettagli)i.next();
					Set<Carrellodett> dettagli = (Set<Carrellodett>)o.getDettagli();
					Iterator ii = dettagli.iterator();
					while(ii.hasNext()) {
						Carrellodett d = (Carrellodett)ii.next();
						All_products p = (All_products)sx.createQuery(HQL_PRODBYCOD).setParameter("codice_gds", d.getCodice_prodotto()).setDate("date", new Date()).uniqueResult();
						if(p != null) {
							trend.add(p);
							pos++;
						}
					}
				}
			}
			sx.close();
			if(cli == null)
				return SUCCESS_NOLOGIN;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public List<All_products> getTrend() {
		return trend;
	}

}

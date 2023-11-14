package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Categorie;
import it.gds.beans.ClientiETessera;
import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

public class showProduct extends ActionSupport implements Constants {
	private static final long serialVersionUID = 1L;
	private Prodotti prodotto;
	private ArrayList<Prodotti> prodotti;
	private ClientiETessera cli;
	private String codice_gds;
	private String codice_prodotto;
	private String id;
	private String idc;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private Categorie categoria;

	public String execute() {
		try {
			cli = (ClientiETessera) session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();

			if (this.getId()!= null) {
				prodotto = (Prodotti) sx.createQuery(HQL_PRODBYCOD).setParameter("codice_gds", getId())
						.setDate("date", new Date()).uniqueResult();
			}

			if (this.getCodice_prodotto()!= null) {
				prodotto = (Prodotti) sx.createQuery(HQL_PRODBYCOD).setParameter("codice_gds", getCodice_prodotto())
						.setDate("date", new Date()).uniqueResult();
			}

			categoria = (Categorie) sx.get(Categorie.class, prodotto.getCategoria_gds());
			// scollego il prodotto dalla sessione
			sx.evict(prodotto);
			// verifico il locale corrente
			Locale locale = ActionContext.getContext().getLocale();
			// prendo la connessione corrente

			// Connection conn = ((SessionImpl) sx).connection();

			Connection conn = ((DataSource)(new InitialContext()).lookup("java:comp/env/jdbc/ec_master")).getConnection();
//			Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD());
			// aggiorno la lingua del prodotto
			if (prodotto != null) {
				prodotto.checkLanguage(locale.getLanguage(), conn);
				if (cli != null)
					prodotto.applyDiscount(conn, cli.getId());
			}
			// chiudo connessione e sessione

			conn.close();
			sx.close();

			if (cli == null)
				return SUCCESS_NOLOGIN;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public Prodotti getProdotto() {
		return prodotto;
	}

	public void setCodice_gds(String codice_gds) {
		this.codice_gds = codice_gds;
	}

	public String getCodice_gds() {
		return codice_gds;
	}

	public String getIdc() {
		return idc;
	}

	public void setIdc(String idc) {
		this.idc = idc;
	}

	public Categorie getCategoria() {
		return categoria;
	}

	public void setCategoria(Categorie categoria) {
		this.categoria = categoria;
	}

	public String getCodice_prodotto() {
		return codice_prodotto;
	}

	public void setCodice_prodotto(String codice_prodotto) {
		this.codice_prodotto = codice_prodotto;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Prodotti> getProdotti() {
		try {
			cli = (ClientiETessera) session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			Connection conn = null;
			conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(),
					Config.getJDBPASSWORD());
			Query q = sx.createQuery(HQL_PRODSBYCAT_W);
			q.setFirstResult(1);
			q.setMaxResults(10);
			prodotti = (ArrayList<Prodotti>) q.setParameter("categoria_gds", categoria.getCategoria_gds() + '%')
					.setDate("date", new Date()).setString("cod_gds", codice_gds).list();
			Iterator<Prodotti> it = prodotti.iterator();
			while (it.hasNext()) {
				Prodotti prod = (Prodotti) it.next();
				prod.getTaglia(conn);
				prod.getProperties(conn);
			}
			conn.close();
			sx.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return prodotti;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}

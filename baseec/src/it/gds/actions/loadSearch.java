package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
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

import it.gds.beans.All_products;
import it.gds.beans.ClientiETessera;
import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.sbeans.CheckSession;
import it.gds.utils.Config;

public class loadSearch extends ActionSupport implements Constants {
	private static final long serialVersionUID = 7009603477871263213L;
	private List<Prodotti> prodotti;
	private All_products prodotti2;
	private ClientiETessera cli;
	private String key;
	private boolean check;
	private String link;

	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			CheckSession.check();
			HttpSession session = ServletActionContext.getRequest().getSession();
			cli = (ClientiETessera)session.getAttribute("CLIENTE");

			Session sx = HibernateUtil.getSessionFactory().openSession();
			String[] split = getKey().split(" ");
			String str = "";
			String str2 = "";
			for(int i = 0; i < split.length; i++) {
				if(split[i] != "" && split[i].length() >= 3) {
					str += "titolo LIKE '%" + split[i] + "%' OR ";
					str2 += "chiavi_ricerca LIKE '%" + split[i] + "%' AND ";
				}
			}

			String query = HQL_SEARCHBYKEY.replace(":a", str.substring(0, str.length() - 4)).replace(":b", str2.substring(0, str2.length() - 5));
			query = query.replace(":cod_gds", getAllCodes());
			Query q = sx.createQuery(query);
			if(getKey().length() < 3)
				q.setMaxResults(12);
			prodotti = (List<Prodotti>)q.setDate("date", new Date()).list();
			if(prodotti.isEmpty()) {
				query = HQL_SEARCHBYKEY2.replace(":a", str.substring(0, str.length() - 4)).replace(":b", str2.substring(0, str2.length() - 5));
				q = sx.createQuery(query);
				q.setMaxResults(1);
				prodotti2 = (All_products)q.setDate("date", new Date()).uniqueResult();
				sx.close();
				if(prodotti2 == null) check = false;
				else {
					Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );
					Statement stmt = conn.createStatement();
					ResultSet rs = null;
					try {
						rs = stmt.executeQuery("SELECT ext_description FROM sites, rel_sites_products WHERE rel_sites_products.codice_gds = '" + prodotti2.getCodice_gds()
							+ "' AND rel_sites_products.id_site = sites.id "
							+ "AND sites.id <> 0");
						if (rs.next()) {
							check = true;
							link = rs.getString("ext_description");
						}
					} catch(Exception e) {
						e.printStackTrace();
					} finally {
						if(rs != null)
							rs.close();
						if(stmt != null)
							stmt.close();
						if(conn != null)
							conn.close();
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}

		if (prodotti.isEmpty()) {
			return SUCCESS_NOPRODS;
 		} else {
 			return SUCCESS;
 		}
	}

	public List<Prodotti> getProdotti() {
		return prodotti;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public boolean isCheck() {
		return check;
	}

	public String getLink() {
		return link;
	}

	private String getAllCodes() {
		return (String) ServletActionContext.getServletContext().getAttribute(ALLCODES);
	}
}

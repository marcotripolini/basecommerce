package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Categorie;
import it.gds.beans.Vetrina;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

/**
 * @author nilux
 * http://localhost:8080/gds_italia_2/reloadcontextvar.action?name=aaa&pass=bbb&reload=true
 */
public class ReloadContextVar extends ActionSupport implements Constants {
	// ******************************************************************
	private static final long serialVersionUID = 4084375085707624937L;
	private String name;
	private String pass;
	private Boolean reload;
	/* (non-Javadoc)
	 * @see com.opensymphony.xwork2.ActionSupport#execute()
	 * http://localhost:8080/gds_italia_2/reloadcontextvar.action?name=aaa&pass=bbb&reload=true
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String execute() {
		if (reload != null){
			if (reload == true) {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				ServletContext context = ServletActionContext.getServletContext();
				String siteid = it.gds.utils.Config.getSITEID();

				context.setAttribute("SITEID", siteid);

				// caricamento categorie
				List<Categorie> categorie1 = (List<Categorie>) sx
						.createQuery(HQL_CAT1_W.replace("__catlist", this.getCategories(siteid))).list();


				Iterator it = categorie1.iterator();
				while (it.hasNext()) {
					Categorie cat = (Categorie) it.next();
					cat.backupLanguage();
				}
				ServletActionContext.getServletContext().setAttribute(CATEGORIE1, categorie1);

				// caricamento dati sito
				Vetrina vetrina = (Vetrina) sx.get(Vetrina.class, Long.parseLong(siteid));
				context.setAttribute(VETRINA, vetrina);

//				Connection conn = ((SessionImpl) sx).connection();


				String result = "";
				String strsql = "";
				strsql += "SELECT codice_gds "
						+ "from rel_vetrine_prodotti "
						+ "where id_vetrina =" + Config.getSITEID() + "";

				Statement stmt = null;
				ResultSet rs = null;
				Connection conn = null;
				try {
					conn = DriverManager.getConnection(
							Config.getJDBCCONNECTION(),
							Config.getJDBCUSER(),
							Config.getJDBPASSWORD() );

					stmt = conn.createStatement();
					rs = stmt.executeQuery(strsql);
					while (rs.next()) {
						result = result + "'" + (rs.getString("codice_gds").trim() + "',");
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						rs.close();
						stmt.close();
						conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}

				if (result.endsWith(",")) {
					result = result.substring(0, result.length() - 1);
				}

				System.out.println("VARIABILE DI CONTEXT ALLCODES SALVATA " + new Date().toString());

				ServletActionContext.getServletContext().setAttribute(ALLCODES, result);

				sx.close();
			}
		}
		return "success";
	}

	private String getCategories(String siteid) {
		String result = "";
		Session sx = HibernateUtil.getSessionFactory().openSession();
//		Connection conn = ((SessionImpl) sx).connection();
		Connection conn = null;

		String check_categories = "select categoria_prodotto_cliente as categoria_gds from `gds-i41_master`.rel_sites_categories where id_vetrina = '" + siteid + "'";
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(
					Config.getJDBCCONNECTION(),
					Config.getJDBCUSER(),
					Config.getJDBPASSWORD() );

			stmt = conn.createStatement();
			rs = stmt.executeQuery(check_categories);
			while (rs.next()) {
				if (rs.getString("categoria_gds") != null) {
					result = result + "'" + (rs.getString("categoria_gds").trim() + "',");
				}
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (result.endsWith(",")) {
			result = result.substring(0, result.length() - 1);
		}
		return result;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Boolean getReload() {
		return reload;
	}

	public void setReload(Boolean reload) {
		this.reload = reload;
	}
}
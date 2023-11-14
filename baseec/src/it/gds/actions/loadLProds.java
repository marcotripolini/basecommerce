package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
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
import it.gds.utils.Config;

public class loadLProds extends ActionSupport implements Constants {

	private static final long serialVersionUID = 3548021978696628329L;
	private List<Prodotti> prodotti;
	private ClientiETessera cli;
	private Integer qt = 0;
	private HttpSession session = ServletActionContext.getRequest().getSession();

	@SuppressWarnings("unchecked")
	public String execute() {
		// System.out.println((new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")).format(new Date()) + " >> execute on " + this.getClass().getName());
		cli = (ClientiETessera)session.getAttribute("CLIENTE");
		if (prodotti == null) {
			try {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				Query q = sx.createQuery(HQL_LASTPRODS
						.replace(":codes", this.getAllCodes())
						.replace(":date",
						"'" + (new SimpleDateFormat("yyyy-MM-dd")).format(new Date()) + "'"));
				if (qt < 2) {
					q.setFirstResult(0);
				}
				q.setFirstResult((qt - 1 ) * Integer.parseInt(it.gds.utils.Config.getMAX_FEATURED()));
				q.setMaxResults(Integer.parseInt(it.gds.utils.Config.getMAX_FEATURED()));
				prodotti = (List<Prodotti>) q.list();
				sx.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if(cli == null) {
			return SUCCESS_NOLOGIN;
		} else {
			return SUCCESS;
		}
	}

	private String getAllCodes() {
		return (String) ServletActionContext.getServletContext().getAttribute(ALLCODES);
	}

	private String getCodes () {
		//Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
		String result = "";
		String strsql = "";
		strsql += " SELECT p.codice_gds ";
		strsql += " FROM `gds-i41_master`.prodotti p";
		strsql += " join `gds-i41_master`.rel_vetrine_prodotti rvp on p.codice_gds = rvp.codice_gds";
		strsql += " join `gds-i41_master`.marchi m on p.id_marchio = m.id";
		strsql += " where";
		strsql += " id_vetrina = " + it.gds.utils.Config.getSITEID() + "";

		Statement stmt = null;
		ResultSet rs = null;
		Connection conn= null;
		try {
			// conn = ((SessionImpl)HibernateUtil.getSessionFactory().openSession()).connection();
			conn = DriverManager.getConnection(	Config.getJDBCCONNECTION(),
												Config.getJDBCUSER(),
												Config.getJDBPASSWORD());

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

		return result;
	}

	public List<Prodotti> getProdotti() {
		return prodotti;
	}

	public Integer getQt() {
		return qt;
	}

	public void setQt(Integer qt) {
		this.qt = qt;
	}
}
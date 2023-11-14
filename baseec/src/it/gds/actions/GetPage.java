package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.impl.SessionImpl;
import it.gds.hibernate.HibernateUtil;
import com.opensymphony.xwork2.ActionSupport;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

public class GetPage extends ActionSupport implements Constants {
	private static final long serialVersionUID = -3687137732778016529L;
	private String pageid;
	private String page;

	public String execute() {
		return SUCCESS;
	}

	public String getPageid() {
		return pageid;
	}

	public void setPageid(String pageid) {
		this.pageid = pageid;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPage() {
//		Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
		Connection conn = null;
		String result = "";
		String strsql = "";
		strsql += " SELECT body FROM `gds-i41_cms`.pages ";
		strsql += " where";
		strsql += " id_site = " + it.gds.utils.Config.getSITEID() + "";
		strsql += " and id = " + pageid + "";

		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strsql);
			while (rs.next()) {
				result = result + "" + (rs.getString("body").trim() + "");
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
		return result;
	}

}

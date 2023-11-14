package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.hibernate.impl.SessionImpl;

import com.opensymphony.xwork2.ActionSupport;
import it.gds.beans.Marchi;
import it.gds.hibernate.HibernateUtil;
import it.gds.sbeans.brandsSort;
import it.gds.utils.Config;

public class fBrands2 extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private String aisle;
	private List<Marchi> marchi = new ArrayList<Marchi>();

	public String execute() {
		try {
//			Connection conn = ((SessionImpl)HibernateUtil.getSessionFactory().openSession()).connection();
			Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );

			Statement stmt = conn.createStatement();
			ResultSet rs = null;
			try {
				String sql = "SELECT DISTINCT marchio, id FROM marchi_categorie WHERE categoria_gds = '" + getAisle() + "' ORDER BY marchio LIMIT 10, 9999";
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					Marchi m = new Marchi();
					m.setId(rs.getLong("id"));
					m.setMarchio(rs.getString("marchio"));
					marchi.add(m);
				}
				Collections.sort(marchi, new brandsSort());
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
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public List<Marchi> getMarchi() {
		return marchi;
	}

	public String getAisle() {
		return aisle;
	}

	public void setAisle(String aisle) {
		this.aisle = aisle;
	}


}

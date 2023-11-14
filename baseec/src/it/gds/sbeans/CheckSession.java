package it.gds.sbeans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.classic.Session;
import org.hibernate.impl.SessionImpl;

import it.gds.beans.Carrello;
import it.gds.beans.Carrellodett;
import it.gds.beans.ClientiETessera;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

public class CheckSession implements Constants {
	@SuppressWarnings("rawtypes")
	public static void check() {
		Boolean isChecked;
 		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			isChecked = (Boolean) session.getAttribute(SESSION_CHECKED);

			if (isChecked == null) {
				isChecked = false;
			}

			// non cambiare!!
			// non è l'id della sessione del sito ma un id comune definito da identity

			String jsessionid = "";
			if (Config.isDebug() == true ) {
				jsessionid = (String) session.getId();
			} else {
				jsessionid = (String) session.getAttribute("ID");
			}

			if (jsessionid != null ) {
				if (isChecked == false) {
					ClientiETessera cli = (ClientiETessera) session.getAttribute("CLIENTE");
					Carrello c;
					if (cli == null) {
//						conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
						conn =  DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );
						stmt = conn.createStatement();
						rs = stmt.executeQuery("SELECT * FROM sessioni WHERE ip = '" + jsessionid + "' AND attivo = '1'");
						if (rs.next()) {
							Session sx = HibernateUtil.getSessionFactory().openSession();
							cli = (ClientiETessera) sx.createQuery(HQL_REMOTELOGIN)
									.setParameter("id_cliente", rs.getLong("id_cliente")).uniqueResult();
							c = (Carrello) sx.createQuery(HQL_REMOTECART)
									.setParameter("id_carrello", rs.getLong("id_carrello")).uniqueResult();
							if (cli != null && c != null) {
								session.setAttribute("CLIENTE", cli);
								session.setAttribute("CARRELLO", c);
								Set<Carrellodett> dt = c.getDettagli();
								double totcart = 0;
								int totdett = 0;
								Iterator i = dt.iterator();
								while (i.hasNext()) {
									Carrellodett el = (Carrellodett) i.next();
									totdett++;
									totcart = totcart + el.getTotale();
								}
								session.setAttribute("TOTCART", totcart);
								session.setAttribute("TOTDETT", totdett);
								session.setAttribute(SESSION_CHECKED, true);
							} else {
								if (Config.isDebug() == false){
									session.invalidate();
									session = ServletActionContext.getRequest().getSession();
								}
							}
						} else {
							if (Config.isDebug() == false){
								session.invalidate();
								session = ServletActionContext.getRequest().getSession();
							}
						}
						rs.close();
					} else {
						conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
						stmt = conn.createStatement();
						rs = stmt.executeQuery(SQL_CHECK_SESSION.replace(":id_sessione", jsessionid));
						if (rs.next()) {
							Session sx = HibernateUtil.getSessionFactory().openSession();
							c = (Carrello) sx.createQuery(HQL_REMOTECART)
									.setParameter("id_carrello", rs.getLong("id_carrello")).uniqueResult();
							if (c != null) {
								session.setAttribute("CARRELLO", c);
								Set<Carrellodett> dt = c.getDettagli();
								double totcart = 0;
								int totdett = 0;
								Iterator i = dt.iterator();
								while (i.hasNext()) {
									Carrellodett el = (Carrellodett) i.next();
									totdett++;
									totcart = totcart + el.getTotale();
								}
								session.setAttribute("TOTCART", totcart);
								session.setAttribute("TOTDETT", totdett);
								session.setAttribute(SESSION_CHECKED, true);
							}
						} else {
							if (Config.isDebug() == false){
								session.invalidate();
								session = ServletActionContext.getRequest().getSession();
							}
						}
						rs.close();
					}
				}
			} else {
				if (Config.isDebug() == false){
					// problema sessione
					// session.invalidate();
					session = ServletActionContext.getRequest().getSession();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

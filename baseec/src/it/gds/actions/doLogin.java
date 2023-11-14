package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Carrello;
import it.gds.beans.ClientiETessera;
import it.gds.beans.Sessione;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

public class doLogin extends ActionSupport implements Constants {
	private static final long serialVersionUID = -7993255961510437149L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;
	private String tessera;
	private String password;
	private long id_cliente;
	private long id_carrello;
	private String last_cart_id = null;
	private String jsessionid;
	private String url;

	public String tryLogin() {
		try {
			url = (String) session.getAttribute(LASTURL);
			session.removeAttribute(LASTURL);
			if (url == null) {
				url = "index.html";
			}
			if (url != null) {
				if (url.equals("")) {
					url = "index.html";
				}
			}

			if (tessera == null || password == null || tessera.equals("") || password.equals("")) {
				return ERROR;
			}

			Session sx = HibernateUtil.getSessionFactory().openSession();
			cli = (ClientiETessera) sx.createQuery(HQL_LOGIN_E).setParameter("tessera", (getTessera()))
					.setParameter("password", getPassword()).setParameter("email", getTessera()).uniqueResult();
			if (cli != null) {
				session.setAttribute("CLIENTE", cli);
				Carrello c = null;

				if (getLastCartId(tessera)!= null) {
					c = (Carrello) sx.get(Carrello.class, Long.parseLong(getLastCartId(tessera)));
				}
				if (c == null) {
					c = new Carrello();
					session.setAttribute(CART, c);
					session.setAttribute("TOTCART", (double) 0);
					session.setAttribute("TOTDETT", (int) 0);
				} else {
					session.setAttribute(CART, c);
					session.setAttribute("TOTCART", (double) c.getTotcart());
					session.setAttribute("TOTDETT", (int) c.getTotdett());
				}
				setId_cliente(cli.getId());
				setId_carrello(c.getId());
				if (Config.isDebug() == false) {
					Properties p = (Properties) ServletActionContext.getServletContext().getAttribute("PROPERTIES");
//					ServletActionContext.getResponse()
//							.sendRedirect(p.getProperty("identity_url") + "create.html?id_cliente=" + getId_cliente()
//									+ "&id_carrello=" + getId_carrello() + "&url=" + p.getProperty("this_url"));
				} else {
					Sessione s = new Sessione();
					s.setAttivo("1");
					s.setId_carrello(c.getId());
					s.setId_cliente(cli.getId());
					s.setIp(session.getId());
					HibernateUtil.saveOrUpdate(s);
					// ServletActionContext.getResponse().sendRedirect("default.jsp");
					return SUCCESS;
				}
				sx.close();
			} else {
				System.out.println("Login error!");
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	public String getTessera() {
		return tessera;
	}

	public void setTessera(String tessera) {
		this.tessera = tessera;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(long id_cliente) {
		this.id_cliente = id_cliente;
	}

	public long getId_carrello() {
		return id_carrello;
	}

	public void setId_carrello(long id_carrello) {
		this.id_carrello = id_carrello;
	}

	public String getJsessionid() {
		return jsessionid;
	}

	public void setJsessionid(String jsessionid) {
		this.jsessionid = jsessionid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	private String getLastCartId(String tessera) {
		String strsql = "select max(id) as cart_id from carrello where tessera = '" + tessera + "' order by data desc";
		try {
			Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );

			Statement stmt = conn.createStatement();
			ResultSet rs = null;
			rs = stmt.executeQuery(strsql);
			try {
				while (rs.next()) {
					last_cart_id = rs.getString("cart_id");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return last_cart_id;
	}
}

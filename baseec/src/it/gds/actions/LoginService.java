package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
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

public class LoginService extends ActionSupport implements Constants {
	private static final long serialVersionUID = 1L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private HttpServletRequest request = ServletActionContext.getRequest();
	private String nome;
	private String cognome;
	private String tessera;
	private String card;
	private String tax_code;
	private String codfiscale;
	private long id_cliente;
	private long id_carrello;
	private String last_cart_id;
	private ClientiETessera cli;

	public String executeLogin() {
		try {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			cli = (ClientiETessera) sx.createQuery(HQL_LOGIN_R).setParameter("tessera", card).uniqueResult();
			if (cli != null) {
				HttpSession session = ServletActionContext.getRequest().getSession();
				session.setAttribute("CLIENTE", cli);
				Carrello c = (Carrello) sx.get(Carrello.class, Long.decode(getLastCartId(card)));
				sx.close();
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

				c.setData(new Date());
				c.setId_cliente(cli.getId());
				c.setTessera(cli.getCtessera().getTessera());
				HibernateUtil.saveOrUpdate(c);
//				session.setAttribute("CARRELLO", c);
//				session.setAttribute("TOTCART", (double) 0);
//				session.setAttribute("TOTDETT", (int) 0);
				setId_cliente(cli.getId());
				setId_carrello(c.getId());
				Sessione s = new Sessione();
				s.setAttivo("1");
				s.setId_carrello(c.getId());
				s.setId_cliente(cli.getId());
				s.setIp(session.getId());
				HibernateUtil.saveOrUpdate(s);
				return SUCCESS;
//				if (Config.isDebug() == false) {
//					Properties p = (Properties) ServletActionContext.getServletContext().getAttribute("PROPERTIES");
//					ServletActionContext.getResponse()
//							.sendRedirect(p.getProperty("identity_url") + "create.html?id_cliente=" + getId_cliente()
//									+ "&id_carrello=" + getId_carrello() + "&url=" + p.getProperty("this_url"));
//				} else {
//					Sessione s = new Sessione();
//					s.setAttivo("1");
//					s.setId_carrello(c.getId());
//					s.setId_cliente(cli.getId());
//					s.setIp(session.getId());
//					HibernateUtil.saveOrUpdate(s);
//					return SUCCESS;
//				}
			} else {
				sx.close();
				System.out.println("Login error!");
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String executeLogout() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String jsessionid = (String) session.getAttribute("ID");
			session.invalidate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getTessera() {
		return tessera;
	}

	public void setTessera(String tessera) {
		this.tessera = tessera;
	}

	public String getCodfiscale() {
		return codfiscale;
	}

	public void setCodfiscale(String codfiscale) {
		this.codfiscale = codfiscale;
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

	public ClientiETessera getCli() {
		return cli;
	}

	public void setCli(ClientiETessera cli) {
		this.cli = cli;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getTax_code() {
		return tax_code;
	}

	public void setTax_code(String tax_code) {
		this.tax_code = tax_code;
	}

	private String getLastCartId(String tessera) {
		String strsql = "select max(id) as cart_id from carrello where tessera = '" + tessera + "' order by data desc";
		try {
//			Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
			Connection conn = DriverManager.getConnection(
					it.gds.utils.Config.getJDBCCONNECTION(),
					it.gds.utils.Config.getJDBCUSER(),
					it.gds.utils.Config.getJDBPASSWORD() );

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

package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Carrello;
import it.gds.beans.ClientiETessera;
import it.gds.beans.SpeseSped;
import it.gds.beans.Tessere;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

@Action("selectpay")
@Results({ @Result(name = "success", location = "/selectpay.jsp") })
public class SelectPayAction extends ActionSupport implements Constants {
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request = ServletActionContext.getRequest();
	private ClientiETessera cli;
	private ArrayList<SpeseSped> spese_spedizione;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private Carrello c = (Carrello) session.getAttribute(CART);
	private String data_consegna;
	private String tipo_ordine_1;
	private String tipo_ordine_2;
	private String tipo_ordine_3;
	private String tipo_consegna;

	public String execute() {
		
		try {
			Date data_cons = null;
			try {
			    data_cons = new SimpleDateFormat("yyyy-MM-dd").parse(data_consegna);
			} catch (Exception e) {
				data_cons = new Date();
			}

			if (tipo_ordine_1 != null) {
				if (tipo_ordine_1.equals("on")) {
					tipo_consegna = "delivery";
				}
			}

			if (tipo_ordine_2 != null) {
				if (tipo_ordine_2.equals("on")){
					tipo_consegna = "pickup";
				}
			}

//			if (tipo_ordine_3 != null) {
//				if (tipo_ordine_3.equals("on")){
//					tipo_consegna = "onsite";
//				}
//			}
			
			System.out.println("tipo_consegna = " + tipo_consegna);

			Session sx = HibernateUtil.getSessionFactory().openSession();
			Tessere ctessera = (Tessere) sx.get(Tessere.class, "NOCARD");
			session.setAttribute(LASTURL, "selectpay");
			cli = (ClientiETessera) session.getAttribute("CLIENTE");
			if (cli == null) {
				cli = new ClientiETessera();
			}

			cli.setNome(request.getParameter("nome"));
			cli.setCognome(request.getParameter("cognome"));
			cli.setCodfiscale(request.getParameter("codfiscale"));
			cli.setIndirizzo(request.getParameter("indirizzo"));
			cli.setLocalita(request.getParameter("localita"));
			cli.setCap(request.getParameter("cap"));
			cli.setProvincia(request.getParameter("provincia"));
			cli.setD_nominativo(request.getParameter("d_nominativo"));
			cli.setD_indirizzo(request.getParameter("d_indirizzo"));
			cli.setD_localita(request.getParameter("d_localita"));
			cli.setD_cap(request.getParameter("d_cap"));
			cli.setD_provincia(request.getParameter("d_provincia"));
			cli.setD_note(request.getParameter("d_note"));
			cli.setEmail(request.getParameter("email").toLowerCase());
			cli.setCod_referente("999999");
			cli.setTelefono_a(request.getParameter("telefono"));
			cli.setPassword ("no_password");
			cli.setCtessera(ctessera);
			cli.setAttivo(true);

			if (cli.getId() == 0 ) {
				HibernateUtil.saveOrUpdate(cli);
			}

			if (request.getParameter("savedata") != null) {
				if (request.getParameter("savedata").equals("1")) {
					HibernateUtil.saveOrUpdate(cli);
				}
			}

			session.setAttribute("CLIENTE", cli);

			String delivery_time = "";
			String ora_consegna = request.getParameter("ora_consegna");

			if (request.getParameter("ck4") != null) {
				if (request.getParameter("ck4").equals("1")) {
					delivery_time = "1|1|1";
				}
			} else {
				if (request.getParameter("ck1") != null) {
					if (request.getParameter("ck1").equals("1")) {
						delivery_time += "1|";
					} else {
						delivery_time += "0|";
					}
				} else {
					delivery_time += "0|";
				}

				if (request.getParameter("ck2") != null) {
					if (request.getParameter("ck2").equals("1")) {
						delivery_time += "1|";
					} else {
						delivery_time += "0|";
					}
				} else {
					delivery_time += "0|";
				}

				if (request.getParameter("ck3") != null) {
					if (request.getParameter("ck3").equals("1")) {
						delivery_time += "1";
					} else {
						delivery_time += "0";
					}
				} else {
					delivery_time += "0";
				}
			}
			
			session.setAttribute("DELIVERY_TIME", delivery_time);
			session.setAttribute("DELIVERY_HOUR", ora_consegna);
			session.setAttribute("DELIVERY_DATE", data_cons);
			session.setAttribute("DELIVERY_TYPE", tipo_consegna);

//			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<SpeseSped> getSpese_spedizione() {
		if (this.spese_spedizione == null) {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			try {
				spese_spedizione = (ArrayList<SpeseSped>) sx
						.createQuery("from SpeseSped where id in (" + Config.getCONSEGNA() + ") order by importo_sped")
						.list();
			} catch (Exception e) {
				e.printStackTrace();
			}

			boolean result = checkDistances(Config.getCAP_RIF(), cli.getD_cap(), cli.getD_localita());

			Iterator<SpeseSped> it = spese_spedizione.iterator();

			boolean control = false;
			while (it.hasNext()) {
				SpeseSped ss = (SpeseSped) it.next();
				ss.setDettagli(ss.getDettagli().replace("__cap__", Config.getCAP_RIF()));
				ss.setDettagli(ss.getDettagli().replace("__citta__", Config.getCITY_RIF()));
				if (c != null) {
					if(ss.getId() != 10) {
						if (c.getTotaleNumber() >= ss.getImporto_min() ) {
							if (control == false) {
								ss.setSelected(true);
								control = true;
							}
						} else {
							ss.setDisabled(true);
						}
						// ss.setSelected(false);
					} else {
						if (result == true) {
							ss.setSelected(true);
							ss.setDisabled(false);
						} else {
							ss.setSelected(false);
							ss.setDisabled(true);
						}
					}
				}

				if (result == true) {
					if (ss.getId() == 10) {
						ss.setSelected(true);
						ss.setDisabled(false);
					} else {
						ss.setSelected(false);
						ss.setDisabled(true);
					}
				}

				// System.out.println(result);
			}

			Iterator<SpeseSped> it1 = spese_spedizione.iterator();
			while (it1.hasNext()) {
				SpeseSped ss = (SpeseSped) it1.next();
			}
		}
		return spese_spedizione;
	}

	@SuppressWarnings("resource")
	private boolean checkDistances (String cap_origine, String cap_destinazione, String localita_destinazione ) {
//		Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
		Connection conn = null;
		String strsql = " select denominaz_destinazione, cap_destinazione from distanze_cap where cap_origine = '" + Config.getCAP_RIF() + "' AND TOTAL_METERS < 10001";
		boolean result = false;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strsql);
			conn = DriverManager.getConnection(
					Config.getJDBCCONNECTION(),
					Config.getJDBCUSER(),
					Config.getJDBPASSWORD() );
			while (rs.next()) {
				String db_cap_destinazione = rs.getString("cap_destinazione").trim().toLowerCase();
				String db_localita_destinazione = rs.getString("denominaz_destinazione").trim().toLowerCase();

				if (db_cap_destinazione.equals(cap_destinazione.trim().toLowerCase())
						&& localita_destinazione.trim().toLowerCase().equals(db_localita_destinazione)) {
					result = true;
				}
			}
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

	public String getTipo_ordine_1() {
		return tipo_ordine_1;
	}

	public void setTipo_ordine_1(String tipo_ordine_1) {
		this.tipo_ordine_1 = tipo_ordine_1;
	}

	public String getTipo_ordine_2() {
		return tipo_ordine_2;
	}

	public void setTipo_ordine_2(String tipo_ordine_2) {
		this.tipo_ordine_2 = tipo_ordine_2;
	}

	public String getData_consegna() {
		return data_consegna;
	}

	public void setData_consegna(String data_consegna) {
		this.data_consegna = data_consegna;
	}

	public String getTipo_ordine_3() {
		return tipo_ordine_3;
	}

	public void setTipo_ordine_3(String tipo_ordine_3) {
		this.tipo_ordine_3 = tipo_ordine_3;
	}
}

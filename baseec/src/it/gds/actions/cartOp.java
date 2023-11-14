package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Carrello;
import it.gds.beans.Carrellodett;
import it.gds.beans.ClientiETessera;
import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

public class cartOp extends ActionSupport implements Constants {
	private static final long serialVersionUID = -4727008912129968842L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private HttpServletResponse response = ServletActionContext.getResponse();
	private ClientiETessera cli;
	private List<Carrellodett> dt;
	private Carrellodett d;
	private List<Prodotti> otherproducts;
	private int quantita;
	private String codice_gds;
	private String codice_prodotto;
	public String getCodice_prodotto() {
		return codice_prodotto;
	}

	public void setCodice_prodotto(String codice_prodotto) {
		this.codice_prodotto = codice_prodotto;
	}

	private double prezzo;
	private String descrizione;
	private String coupon;
	private String vars;
	private String vars_2;
	private String vars_3;
	private String vars_4;
	private String vars_5;
	private Long weight;

	private Carrello c = (Carrello) session.getAttribute(CART);

	public String getCart() {
		if (c != null) {
			if (this.coupon != null) {
				c.setCoupon(coupon);
			}
		}
		return SUCCESS;
	}

	public String getOthers() {
		if (this.getOtherproducts() != null) {
			if (this.getOtherproducts().size() > 0) {
				return SUCCESS;
			} else {
				return NONE;
			}
		} else {
			return NONE;
		}
	}

	public String removeDiscountFromCart() {
		if (c != null) {
			c.setCoupon(coupon);
			c.setC(null);
		}
		return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public void addToCart() {
		try {
				c = (Carrello) session.getAttribute(CART);
				if (c == null) {
					c = new Carrello();
					c.setData(new Date());
					HibernateUtil.saveOrUpdate (c);
				}

				if (c != null) {
					Session sx = HibernateUtil.getSessionFactory().openSession();
					Prodotti p = (Prodotti) sx.get(Prodotti.class, codice_gds);
					sx.evict(p);
					System.out.println("addtocart - descrizione= " + descrizione);

					if (vars == null) {
						d = c.getCarrelloDett(codice_gds);
					} else {
						if (vars != null && vars_2 != null && vars_3 != null && vars_4 != null  && vars_5 != null  ) {
							d = c.getCarrelloDett(codice_gds, descrizione + ", " + vars + " " + vars_2 + " " + vars_3 + " " + vars_4 + " " + vars_5 );
						} else if (vars != null && vars_2 != null && vars_3 != null && vars_4 != null && vars_5 == null ) {
							d = c.getCarrelloDett(codice_gds, descrizione + ", " + vars + " " + vars_2 + " " + vars_3 + " " + vars_4 );
						} else if (vars != null && vars_2 != null && vars_3 != null && vars_4 == null && vars_5 == null  ) {
							d = c.getCarrelloDett(codice_gds, descrizione + ", " + vars + " " + vars_2 + " " + vars_3 );
						} else if (vars != null && vars_2 != null && vars_3 == null && vars_4 == null && vars_5 == null ) {
							d = c.getCarrelloDett(codice_gds, descrizione + ", " + vars + " " + vars_2);
						} else if (vars != null && vars_2 == null && vars_3 == null && vars_4 == null && vars_5 == null ) {
							d = c.getCarrelloDett(codice_gds, descrizione + ", " + vars );
						}
					}
					if (d != null) {
						d.setQuantita(d.getQuantita() + getQuantita());
						d.setTotale(d.getPrezzo() * d.getQuantita());
						// gestione offerte quantità
						if (it.gds.utils.Config.getENABLE_QUANTITY_OFFERS().equals("1")) {
							if (d.getProdotto().getPp() != null
									&& d.getProdotto().getPp().getOfferta_quantita().getId() != null) {
								if (d.getQuantita() >= d.getProdotto().getPp().getOfferta_quantita().getOfferta_quantita_limite_1() ) {
									d.setPrezzo(d.getProdotto().getP_offerta_1());
								}
							}
						} // end gestione offerte quantità
						HibernateUtil.saveOrUpdate(d);
						dt = (List<Carrellodett>) sx.createQuery(HQL_LISTCARTDETT).setParameter("id_carrello", c.getId()).list();
						c.setDettagli(new HashSet<Carrellodett>(dt));
						if (this.coupon != null) {
							c.setCoupon(coupon);
						}
						session.setAttribute(CART, c);
//						session.setAttribute(TOTCART, c.getTotcart());
					} else {
						d = new Carrellodett();
						d.setCodice_prodotto(getCodice_gds());
						if (vars == null) vars = "";
						if (vars_2 == null) vars_2 = "";
						if (vars_3 == null) vars_3 = "";
						if (vars_4 == null) vars_4 = "";
						if (vars_5 == null) vars_5 = "";

						d.setDescrizione(getDescrizione() + ", " + vars + " " + vars_2 + " " + vars_3 + " " + vars_4 + " " + vars_5);
						d.setId_carrello(c.getId());
						d.setId_sito(1);

						if (p.getUnita_misura().contentEquals("g")) {
							d.setPrezzo(getPrezzo());
							d.setQuantita((double)getWeight()/(double)1000);
							d.setTotale((double)d.getPrezzo()/1000 * (double)getWeight());
						} else {
							d.setPrezzo(getPrezzo());
							d.setQuantita(getQuantita());
							d.setTotale(d.getPrezzo() * d.getQuantita());
						}
						d.setProdotto(p);
						// gestione offerte quantità
						if (it.gds.utils.Config.getENABLE_QUANTITY_OFFERS().equals("1")) {
							if (d.getProdotto().getPp() != null
									&& d.getProdotto().getPp().getOfferta_quantita().getId() != null) {
								if (d.getQuantita() >= d.getProdotto().getPp().getOfferta_quantita().getOfferta_quantita_limite_1() ) {
									d.setPrezzo(d.getProdotto().getP_offerta_1());
								}
							}
						} // end gestione offerte quantità
						HibernateUtil.saveOrUpdate(d);
						dt = (List<Carrellodett>) sx.createQuery(HQL_LISTCARTDETT)
								.setParameter("id_carrello", c.getId()).list();
						c.setDettagli(new HashSet<Carrellodett>(dt));
						session.setAttribute(CART, c);
//						session.setAttribute(TOTCART, c.getTotcart());
					}

					sx.close();
					response.getWriter().print(SUCCESS);
				} else {
					response.getWriter().print(ERROR);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void remFromCart() {
		try {
			cli = (ClientiETessera) session.getAttribute(CUSTOMER);
			// if (cli != null) {
				c = (Carrello) session.getAttribute(CART);
				if (c != null) {
					Session sx = HibernateUtil.getSessionFactory().openSession();
					c.getTotcart();
//					d = (Carrellodett)
//							sx.createQuery(HQL_CARTDETT).setParameter("codice_gds", getCodice_gds()).setParameter("id_carrello", c.getId()).uniqueResult();

					System.out.println("remfromcart - descrizione= " + descrizione);

					if (descrizione == null ) descrizione = "";
					List<Carrellodett> ds;
					ds = (List<Carrellodett>)
							sx.createQuery(HQL_CARTDETT2)
								.setParameter("codice_prodotto", getCodice_prodotto())
								.setParameter("descrizione", "%" + descrizione + "%")
								.setParameter("id_carrello", c.getId()).list();
					if (ds.size() > 0) {
						d= ds.get(0);
					}
//					d = (Carrellodett)
//							sx.createQuery(HQL_CARTDETT2)
//								.setParameter("codice_gds", getCodice_gds())
//								.setParameter("descrizione", "%" + descrizione + "%")
//								.setParameter("id_carrello", c.getId()).uniqueResult();
					if (d != null) {
						HibernateUtil.delete(d);
						dt = (List<Carrellodett>) sx.createQuery(HQL_LISTCARTDETT).setParameter("id_carrello", c.getId()).list();
						c.setDettagli(new HashSet<Carrellodett>(dt));
						session.setAttribute(CART, c);
						session.setAttribute(TOTCART, c.getTotcart());
					}
					sx.close();
					response.getWriter().print(SUCCESS);
				} else {
					response.getWriter().print(ERROR);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void remProdFromCart() {
		try {
			cli = (ClientiETessera) session.getAttribute(CUSTOMER);
			if (cli != null) {
				c = (Carrello) session.getAttribute(CART);
				c.getTotcart();
				if (c != null) {
					Session sx = HibernateUtil.getSessionFactory().openSession();
					d = (Carrellodett) sx.createQuery(HQL_CARTDETT).setParameter("codice_gds", getCodice_gds()).setParameter("id_carrello", c.getId()).uniqueResult();
					if (d != null) {
						HibernateUtil.delete(d);
//						double totcart = (double) session.getAttribute(TOTCART);
//						totcart = totcart - d.getTotale();
						d.setQuantita(d.getQuantita() - getQuantita());
						d.setTotale(d.getPrezzo() * d.getQuantita());
//						totcart = totcart + d.getTotale();
						// HibernateUtil.saveOrUpdate(d);
						dt = (List<Carrellodett>) sx.createQuery(HQL_LISTCARTDETT).setParameter("id_carrello", c.getId()).list();
						c.setDettagli(new HashSet<Carrellodett>(dt));
						session.setAttribute(CART, c);
//						session.setAttribute(TOTCART, totcart);
//					} else {
//						double totcart = (double) session.getAttribute(TOTCART);
//						int totdett = (int) session.getAttribute(TOTDETT);
//						d = new Carrellodett();
//						d.setCodice_gds(getCodice_gds());
//						d.setDescrizione(getDescrizione());
//						d.setId_carrello(c.getId());
//						d.setId_sito(1);
//						// d.setId_vetrina((long) 1);
//						d.setPrezzo(getPrezzo());
//						d.setQuantita(getQuantita());
//						d.setTotale(d.getPrezzo() * d.getQuantita());
//						totcart = totcart + d.getTotale();
//						totdett++;
//						HibernateUtil.saveOrUpdate(d);
//						dt = (List<Carrellodett>) sx.createQuery(HQL_LISTCARTDETT)
//								.setParameter("id_carrello", c.getId()).list();
//						c.setDettagli(new HashSet<Carrellodett>(dt));
//						session.setAttribute(CART, c);
//						session.setAttribute(TOTCART, totcart);
//						session.setAttribute(TOTDETT, totdett);
					}
					sx.close();
					response.getWriter().print(SUCCESS);
				} else {
					response.getWriter().print(ERROR);
				}
			} else {
				response.getWriter().print(ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addQta() {
		try {
				c = (Carrello) session.getAttribute(CART);
				if (c != null) {
					Session sx = HibernateUtil.getSessionFactory().openSession();
					// d = c.getCarrelloDett(codice_gds);
					d = c.getCarrelloDett(codice_prodotto, descrizione);

					if (d != null) {
						Set<Carrellodett> dt;
						dt = c.getDettagli();
						dt.remove(d);
						d.setQuantita(getQuantita());
						// gestione offerte quantità
						if (it.gds.utils.Config.getENABLE_QUANTITY_OFFERS().equals("1")) {
							if (d.getProdotto().getPp() != null
									&& d.getProdotto().getPp().getOfferta_quantita().getId() != null) {
								if (d.getQuantita() >= d.getProdotto().getPp().getOfferta_quantita().getOfferta_quantita_limite_1() ) {
									d.setPrezzo(d.getProdotto().getP_offerta_1());
								} else {
									d.setPrezzo(d.getProdotto().getP_alpubblico_0());
								}
							}
						} // end gestione offerte quantità

						dt.add(d);

						HibernateUtil.saveOrUpdate(d);
						// totcart = totcart + d.getTotale();
						c.setDettagli(new HashSet<Carrellodett>(dt));
						session.setAttribute(CART, c);
						session.setAttribute(TOTCART, c.getTotcart());
						response.getWriter().print(SUCCESS);
					} else {
						response.getWriter().print(ERROR);
					}
					sx.close();
				} else {
					response.getWriter().print(ERROR);
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void eraseCart() {
		try {
			cli = (ClientiETessera) session.getAttribute(CUSTOMER);
			if (cli != null) {
				c = (Carrello) session.getAttribute(CART);
				if (c != null) {
					Session sx = HibernateUtil.getSessionFactory().openSession();
					dt = (List<Carrellodett>) sx.createQuery(HQL_LISTCARTDETT).setParameter("id_carrello", c.getId())
							.list();
					Iterator i = dt.iterator();
					while (i.hasNext()) {
						Carrellodett el = (Carrellodett) i.next();
						HibernateUtil.delete(el);
					}
					c = (Carrello) sx.createQuery(HQL_REMOTECART).setParameter("id_carrello", c.getId()).uniqueResult();
					session.setAttribute(CART, c);
					session.setAttribute(TOTCART, (double) 0);
					session.setAttribute(TOTDETT, 0);
					response.getWriter().print(SUCCESS);
					sx.close();
				} else {
					response.getWriter().print(ERROR);
				}
			} else {
				response.getWriter().print(ERROR);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public String getCodice_gds() {
		return codice_gds;
	}

	public void setCodice_gds(String codice_gds) {
		this.codice_gds = codice_gds;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public Carrello getC() {
		c = (Carrello) session.getAttribute(CART);
		return c;
	}

	public void setC(Carrello c) {
		this.c = c;
	}

	public String numberformat (Double d) {
		return new DecimalFormat("#.00").format(d);
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}

	@SuppressWarnings("unchecked")
	public List<Prodotti> getOtherproducts() {
		String tessera = this.getTessera();
		if (tessera == null) return null;

		String id_carrello = this.getIdCarrello();
		if (id_carrello == null) return null;

		String strSQL ="";
		strSQL += "SELECT distinct codice_gds ";
		strSQL += "FROM `gds-i41_master`.carrellodett  inner join carrello on carrello.id = carrellodett.id_carrello ";
		strSQL += "where id_carrello is not null " ;
		strSQL += "and id_carrello <> '" + id_carrello + "'" ;
		strSQL += "and tessera = '" + tessera + "' ";
		strSQL += "order by data desc " ;
		strSQL += "limit 6";
		ArrayList <String> ids = new ArrayList<String>();
		try {

//			Connection conn = ((SessionImpl)HibernateUtil.getSessionFactory().openSession()).connection();
			Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );

			Statement stmt = conn.createStatement();
			ResultSet rs = null;
			rs = stmt.executeQuery(strSQL);
			try {
				while(rs.next()) {
					ids.add(rs.getString("codice_gds"));
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
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(Arrays.toString(ids.toArray()));
		String lista = "";
		Iterator<String> it = ids.iterator();
		while (it.hasNext()) {
			String s = (String) it.next();
			lista += "'" + s + "', ";
		}
		lista = lista.substring(0, lista.length() -2 );

		Session sx = HibernateUtil.getSessionFactory().openSession();
		otherproducts = (List<Prodotti>)sx.createQuery("from Prodotti where codice_gds in (" + lista + ") and codice_gds not in (" + getAllCodes() + ")").list();

		return otherproducts;

	}

	private String getIdCarrello() {
		c = (Carrello) session.getAttribute(CART);
		if (c != null) {
			return Long.toString(c.getId());
		} else  {
			return null;
		}
	}

	private String getTessera() {
		String tessera = null;
		if (session.getAttribute("CLIENTE") != null) {
			if (((ClientiETessera)session.getAttribute("CLIENTE")).getCtessera() != null) {
				if (((ClientiETessera) session.getAttribute("CLIENTE")).getCtessera().getTessera() != null) {
					tessera = ((ClientiETessera)session.getAttribute("CLIENTE")).getCtessera().getTessera();
				}
			}
		}
		return tessera;
	}

	private String getAllCodes() {
		return (String) ServletActionContext.getServletContext().getAttribute(ALLCODES);
	}

	public Long getWeight() {
		return weight;
	}

	public void setWeight(Long weight) {
		this.weight = weight;
	}

	public String getVars() {
		return vars;
	}

	public void setVars(String vars) {
		this.vars = vars;
	}

	public String getVars_2() {
		return vars_2;
	}

	public void setVars_2(String vars_2) {
		this.vars_2 = vars_2;
	}

	public String getVars_3() {
		return vars_3;
	}

	public void setVars_3(String vars_3) {
		this.vars_3 = vars_3;
	}

	public String getVars_4() {
		return vars_4;
	}

	public void setVars_4(String vars_4) {
		this.vars_4 = vars_4;
	}

	public String getVars_5() {
		return vars_5;
	}

	public void setVars_5(String vars_5) {
		this.vars_5 = vars_5;
	}
}


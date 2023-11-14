package it.gds.actions;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.All_products;
import it.gds.beans.Carrello;
import it.gds.beans.Carrellodett;
import it.gds.beans.ClientiETessera;
import it.gds.beans.Listaspesa;
import it.gds.beans.Listaspesadett;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class listaspesaOp extends ActionSupport implements Constants {
	private static final long serialVersionUID = -4977167801305087858L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;
	private Carrello c;
	private List<Listaspesa> lls;
	private Listaspesa ls;
	private long id_lista;
	private int livello_listino;
	private String codice_gds;
	private Boolean test;
	private int quantita;
	private double prezzo;

	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			if(cli!= null) {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				lls = (List<Listaspesa>)sx.createQuery(HQL_LISTESPESA).setParameter("id_cliente", cli.getId()).list();
				sx.close();
			} else
				return SUCCESS_NOLOGIN;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	@SuppressWarnings("rawtypes")
	public void saveLista() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			c = (Carrello)session.getAttribute("CARRELLO");
			if(cli != null && c != null) {
				ls = new Listaspesa();
				ls.setData(new Date());
				ls.setId_cliente(cli.getId());
				ls.setDescrizione("Lista della spesa");
				HibernateUtil.saveOrUpdate(ls);
				Iterator i = c.getDettagli().iterator();
				while(i.hasNext()) {
					Carrellodett el = (Carrellodett)i.next();
					Listaspesadett lsd = new Listaspesadett();
					lsd.setId_lista(ls.getId());
					lsd.setId_sito(el.getId_sito());
					lsd.setId_vetrina(el.getId_vetrina());
					lsd.setCodice_gds(el.getCodice_prodotto());
					lsd.setDescrizione(el.getDescrizione());
					lsd.setPrezzo(el.getPrezzo());
					lsd.setQuantita(el.getQuantita());
					lsd.setTotale(el.getTotale());
					lsd.setAttivo(true);
					HibernateUtil.saveOrUpdate(lsd);
				}
				Session sx = HibernateUtil.getSessionFactory().openSession();
				ls = (Listaspesa)sx.createQuery(HQL_LISTASPESA).setParameter("id_lista", ls.getId()).uniqueResult();
				//session.setAttribute("LISTA", ls);
				sx.close();
				ServletActionContext.getResponse().getWriter().print(SUCCESS);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void attDisatt() {
		try {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			Listaspesadett lsd = (Listaspesadett)sx.createQuery(HQL_LISTASPESADETT).setParameter("codice_gds", getCodice_gds()).setParameter("id_lista", getId_lista()).uniqueResult();
			lsd.setAttivo(getTest());
			HibernateUtil.saveOrUpdate(lsd);
			sx.close();
			ServletActionContext.getResponse().getWriter().print(SUCCESS);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void addQta() {
		try {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			Listaspesadett lsd = (Listaspesadett)sx.createQuery(HQL_LISTASPESADETT).setParameter("codice_gds", getCodice_gds()).setParameter("id_lista", getId_lista()).uniqueResult();
			lsd.setQuantita(getQuantita());
			lsd.setTotale(getPrezzo() * getQuantita());
			HibernateUtil.saveOrUpdate(lsd);
			sx.close();
			BigDecimal bd = new BigDecimal(lsd.getTotale());
			bd = bd.setScale(2, BigDecimal.ROUND_HALF_UP);
			ServletActionContext.getResponse().getWriter().print(SUCCESS + "|" + bd.doubleValue());
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("rawtypes" )
	public void listToCart() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			c = (Carrello)session.getAttribute("CARRELLO");
			if(cli != null && c != null) {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				ls = (Listaspesa)sx.createQuery(HQL_LISTASPESA).setParameter("id_lista", getId_lista()).uniqueResult();
				sx.close();
				Carrello c = (Carrello)session.getAttribute("CARRELLO");
				Iterator i = c.getDettagli().iterator();
				while(i.hasNext()) {
					Carrellodett el = (Carrellodett)i.next();
					HibernateUtil.delete(el);
				}
				Set<Carrellodett> lcd = new HashSet<Carrellodett>(0);
				Carrellodett cd;
				All_products p;
				double totcart = 0;
				int totdett = 0;
				i = ls.getDettagli().iterator();
				sx = HibernateUtil.getSessionFactory().openSession();
				while(i.hasNext()) {
					Listaspesadett el = (Listaspesadett)i.next();
					if(el.isAttivo()) {
						p = (All_products)sx.createQuery(HQL_APRODBYCOD).setParameter("codice_gds", el.getCodice_gds()).setParameter("date", new Date()).uniqueResult();
						if(p != null) {
							cd = new Carrellodett();
							cd.setCodice_prodotto(el.getCodice_gds());
							cd.setDescrizione(el.getDescrizione());
							cd.setId_carrello(c.getId());
							cd.setId_sito(1);
							if(cd.getCodice_prodotto().contains("_O")) {
								cd.setPrezzo(p.getP_alpubblico_0());
								cd.setQuantita(el.getQuantita());
								cd.setTotale(p.getP_alpubblico_0() * el.getQuantita());
							} else {
								switch(getLivello_listino()) {
									case 0:
										cd.setPrezzo(p.getP_alpubblico_0());
										cd.setQuantita(el.getQuantita());
										cd.setTotale(p.getP_alpubblico_0() * el.getQuantita());
										break;
									case 1:
										cd.setPrezzo(p.getP_alpubblico_1());
										cd.setQuantita(el.getQuantita());
										cd.setTotale(p.getP_alpubblico_1() * el.getQuantita());
										break;
									case 2:
										cd.setPrezzo(p.getP_alpubblico_2());
										cd.setQuantita(el.getQuantita());
										cd.setTotale(p.getP_alpubblico_2() * el.getQuantita());
										break;
									case 3:
										cd.setPrezzo(p.getP_alpubblico_3());
										cd.setQuantita(el.getQuantita());
										cd.setTotale(p.getP_alpubblico_3() * el.getQuantita());
										break;
									case 4:
										cd.setPrezzo(p.getP_alpubblico_4());
										cd.setQuantita(el.getQuantita());
										cd.setTotale(p.getP_alpubblico_4() * el.getQuantita());
										break;
								}
							}
							totcart = totcart + cd.getTotale();
							totdett++;
							HibernateUtil.saveOrUpdate(cd);
							lcd.add(cd);
						}
					}
				}
				sx.close();
				c.setDettagli(lcd);
				session.setAttribute("CARRELLO", c);
				session.setAttribute("TOTCART", totcart);
				session.setAttribute("TOTDETT", totdett);
				ServletActionContext.getResponse().getWriter().print(SUCCESS);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<Listaspesa> getLls() {
		return lls;
	}

	public long getId_lista() {
		return id_lista;
	}

	public void setId_lista(long id_lista) {
		this.id_lista = id_lista;
	}

	public int getLivello_listino() {
		return livello_listino;
	}

	public void setLivello_listino(int livello_listino) {
		this.livello_listino = livello_listino;
	}

	public String getCodice_gds() {
		return codice_gds;
	}

	public void setCodice_gds(String codice_gds) {
		this.codice_gds = codice_gds;
	}

	public Boolean getTest() {
		return test;
	}

	public void setTest(Boolean test) {
		this.test = test;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
}

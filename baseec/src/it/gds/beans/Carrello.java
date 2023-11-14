package it.gds.beans;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import it.gds.utils.Config;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import it.gds.hibernate.HibernateUtil;

public class Carrello {
	private long id;
	private Date data;
	private long id_cliente;
	private String tessera;
	private Set<Carrellodett> dettagli = new HashSet<Carrellodett>(0);
	private double totcart;
	private double totcartwithdiscount;
	private long totdett;
	private SpeseSped spesesped = new SpeseSped();
	private double totale;
	private int numarticoli;
	private String coupon;
	private Coupon c;
	private String paymentid;
	private String token;
	private String payerid;

	private Boolean pagato;
	private Date pagato_il;

	public Carrello(long id, Date data, long id_cliente, String tessera, Set<Carrellodett> dettagli) {
		super();
		this.id = id;
		this.data = data;
		this.id_cliente = id_cliente;
		this.tessera = tessera;
		this.dettagli = dettagli;
	}

	public Carrello() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public long getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(long id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getTessera() {
		return tessera;
	}

	public void setTessera(String tessera) {
		this.tessera = tessera;
	}

	public Set<Carrellodett> getDettagli() {
		return dettagli;
	}

	public void setDettagli(Set<Carrellodett> dettagli) {
		this.dettagli = dettagli;
	}

	@SuppressWarnings("rawtypes")
	public double getTotcart() {

		Iterator<Carrellodett> it1 = dettagli.iterator();
		double totpar;
		totcart = 0;

		if (it.gds.utils.Config.getENABLE_QUANTITY_OFFERS().equals("2")) {
			Map<Integer, Double> saveData = new HashMap<Integer, Double>();
			// fase 0: reggruppiamo eventuali prodotti duplicati
			// non necessario, l'operazione fiene eseguita nell'aggiunta prodotti

			// fase 1: valutiamo se ci sono degli sconti quantità da applicare
			while (it1.hasNext()) {
				Carrellodett cd = (Carrellodett) it1.next();
				if (cd.getProdotto().getPp() != null
						&& cd.getProdotto().getPp().getOfferta_quantita().getId() != null) {
					Double quantita = saveData.get(cd.getProdotto().getPp().getOfferta_quantita().getId());
					if (quantita == null)
						quantita = (double) 0;
					saveData.put(cd.getProdotto().getPp().getOfferta_quantita().getId(), cd.getQuantita() + quantita);
				}
			}

			Session sx = HibernateUtil.getSessionFactory().openSession();
			Iterator it2 = saveData.keySet().iterator();

			// fase 2: verifico se le quantità reali sono pari a quelle di sconto.
			while (it2.hasNext()) {
				Integer o1_id = (Integer) it2.next();
				OffertaQuantita o1 = (OffertaQuantita) sx.get(OffertaQuantita.class, o1_id);
				if (saveData.get(o1_id) >= o1.getOfferta_quantita_limite_1()) {
					Iterator it3 = dettagli.iterator();
					while (it3.hasNext()) {
						Carrellodett cd = (Carrellodett) it3.next();
						cd.setPrezzo(cd.getProdotto().getP_alpubblico_1());
					}
				} else {
					Iterator it3 = dettagli.iterator();
					while (it3.hasNext()) {
						Carrellodett cd = (Carrellodett) it3.next();
						cd.setPrezzo(cd.getProdotto().getP_alpubblico_0());
					}
				}
			}
		} // gestione offerte quantità

		// fase 3: calcolo finalmente il totale
		Iterator<Carrellodett> it4 = dettagli.iterator();

		while (it4.hasNext()) {
			Carrellodett cd = (Carrellodett) it4.next();
			totpar = cd.getTotale();
			totcart = totcart + totpar;
		}

		// fase 4: applico eventuali sconti
		totcartwithdiscount = totcart;
		// Coupon cp = this.getCouponValue(coupon);
		Coupon cp = c;
		if (cp != null) {
			if (cp.isPerc() == true) { // sconto percentuale
				totcartwithdiscount = totcart - (totcart * (cp.getValue() / 100));
			} else { // sconto importo
				totcartwithdiscount = totcart - cp.getValue();
			}
		}
//		System.out.println("totcart==" + totcart);
		return round(totcart, 2);

	}

	public String getTotale() {
		Double sconto = Config.getSCONTO_CARRELLO_PERC().doubleValue();
		if (sconto > 0) {
			totcartwithdiscount = this.getTotcart() - (this.getTotcart() * (sconto / 100));
		}
		this.totale = totcart;
		this.totale = this.totale + this.spesesped.getImporto_sped();
		return new DecimalFormat("#.00").format(this.totale);
	}

	public Double getTotaleNumber() {
		Double sconto = Config.getSCONTO_CARRELLO_PERC().doubleValue();
		if (sconto > 0) {
			totcartwithdiscount = this.getTotcart() - (this.getTotcart() * (sconto / 100));
		}
		this.totale = totcart;
		this.totale = this.totale + this.spesesped.getImporto_sped();
		return totale;
	}

	public static double round(double value, int places) {
		if (places < 0)
			throw new IllegalArgumentException();

		BigDecimal bd = new BigDecimal(value);
		bd = bd.setScale(places, RoundingMode.HALF_UP);
		return bd.doubleValue();
	}

	public void setTotcart(double totcart) {
		this.totcart = totcart;
	}

	public long getTotdett() {
		return this.getDettagli().size();
	}

	public void setTotdett(long totdett) {
		this.totdett = totdett;
	}

	public Carrellodett getCarrelloDett(String codice_gds) {
		@SuppressWarnings("rawtypes")
		Iterator it = dettagli.iterator();
		while (it.hasNext()) {
			Carrellodett o = (Carrellodett) it.next();
			if (o.getCodice_prodotto().equals(codice_gds)) {
				return o;
			}
		}
		return null;
	}

	public Carrellodett getCarrelloDett(String codice_gds, String descrizione) {
		@SuppressWarnings("rawtypes")
		Iterator it = dettagli.iterator();
		while (it.hasNext()) {
			Carrellodett o = (Carrellodett) it.next();
			if (o.getCodice_prodotto().equals(codice_gds) && o.getDescrizione().trim().equals(descrizione.trim())) {
				return o;
			}
		}
		return null;
	}

	public double getTotcartwithdiscount() {
//		Double sconto = Config.getSCONTO_CARRELLO_PERC().doubleValue();
//		if (sconto > 0) {
//			totcartwithdiscount = this.getTotcart() - (this.getTotcart() * (sconto / 100));
//		}
		return round(totcartwithdiscount, 2);
	}

	public void setTotcartwithdiscount(double totcartwithdiscount) {
		this.totcartwithdiscount = totcartwithdiscount;
	}

	public SpeseSped getSpesesped() {
		return spesesped;
	}

	public void setSpesesped(SpeseSped spesesped) {
		this.setTotale(this.getTotcart() + spesesped.getImporto_sped());
		this.spesesped = spesesped;
	}

	public void setTotale(double totale) {
		this.totale = totale;
	}

	public int getNumarticoli() {
		numarticoli = 0;
		Iterator it = dettagli.iterator();
		return dettagli.size();
//		while (it.hasNext()) {
//			Carrellodett o = (Carrellodett) it.next();
//			numarticoli += o.getQuantita();
//		}
//		return numarticoli;
	}

	public int getNewId() {
		int next_id = 0;
		try {
//			Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();

			Connection conn = DriverManager.getConnection(
					it.gds.utils.Config.getJDBCCONNECTION(),
					it.gds.utils.Config.getJDBCUSER(),
					it.gds.utils.Config.getJDBPASSWORD() );

			Statement stmt = conn.createStatement();
			ResultSet rs = null;
			try {
				String sql = "SELECT max(id) + 1 as next_id FROM carrello";
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					next_id = rs.getInt("next_id");
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
		return next_id;
	}

	public String getCoupon() {
		return coupon;
	}

	public void setCoupon(String coupon) {
		this.coupon = coupon;
		this.getCouponValue(coupon);
		this.getTotcart();
	}

	public void removeCoupon() {
		this.coupon = null;
		this.getCouponValue(coupon);
		this.getTotcart();
	}

	private Coupon getCouponValue(String coupon) {
		if (coupon != null && !coupon.equals("") ) {
			if (c == null || (!c.getCode().equals(coupon))) {
				try {
//					Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();

					Connection conn = DriverManager.getConnection(
							it.gds.utils.Config.getJDBCCONNECTION(),
							it.gds.utils.Config.getJDBCUSER(),
							it.gds.utils.Config.getJDBPASSWORD() );

					Statement stmt = conn.createStatement();
					ResultSet rs = null;
					try {
						String sql = "SELECT "
								+ "tipo_codice, "
								+ "valore, "
								+ "descrizione "
								+ "FROM `gds-i41_master`.codici_promozionali "
								+ "WHERE "
								+ "codice = '" + coupon + "' "
								+ "and (vetrina is null or vetrina =" + Config.getSITEID() + ")"
								+ "and codice not in "
									+ "(select codice from codici_promozionali_app where vetrina =" + Config.getSITEID() +")";

						rs = stmt.executeQuery(sql);
						while (rs.next()) {
							c = new Coupon();
							c.setCode(coupon);
							c.setValue(rs.getDouble("valore"));
							c.setDescrizione(rs.getString("descrizione"));
							if (rs.getString("tipo_codice").equals("S")) {
								c.setPerc(true);
							} else {
								c.setPerc(false);
							}
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
			}
		}
		return c;
	}

	public Coupon getC() {
		return c;
	}

	public void setC(Coupon c) {
		this.c = c;
	}

	public String getPaymentid() {
		return paymentid;
	}

	public void setPaymentid(String paymentid) {
		this.paymentid = paymentid;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getPayerid() {
		return payerid;
	}

	public void setPayerid(String payerid) {
		this.payerid = payerid;
	}

	public Boolean getPagato() {
		return pagato;
	}

	public void setPagato(Boolean pagato) {
		this.pagato = pagato;
	}

	public Date getPagato_il() {
		return pagato_il;
	}

	public void setPagato_il(Date pagato_il) {
		this.pagato_il = pagato_il;
	}

}

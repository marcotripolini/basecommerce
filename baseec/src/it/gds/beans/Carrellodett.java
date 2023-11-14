package it.gds.beans;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import org.hibernate.Session;

import it.gds.hibernate.HibernateUtil;

public class Carrellodett {
	private long id;
	private long id_sito;
	private Long id_carrello;
	private Long id_vetrina;
	private String codice_prodotto;

	private double prezzo;
	private double quantita;
	private double totale;
	private String descrizione;
	private Long id_ordine;
	private Boolean pagato;
	private Date pagato_il;
	private String pagato_transaz;
	private Prodotti prodotto;

	public Carrellodett() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getId_sito() {
		return id_sito;
	}

	public void setId_sito(long id_sito) {
		this.id_sito = id_sito;
	}

	public Long getId_carrello() {
		return id_carrello;
	}

	public void setId_carrello(Long id_carrello) {
		this.id_carrello = id_carrello;
	}

	public Long getId_vetrina() {
		return id_vetrina;
	}

	public void setId_vetrina(Long id_vetrina) {
		this.id_vetrina = id_vetrina;
	}

	public String getCodice_prodotto() {
		return codice_prodotto;
	}

	public void setCodice_prodotto(String codice_prodotto) {
		this.codice_prodotto = codice_prodotto;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public double getQuantita() {
		return quantita;
	}

	public void setQuantita(double quantita) {
		this.quantita = quantita;
	}

	public static double round(double value, int places) {
		if (places < 0)
			throw new IllegalArgumentException();

		BigDecimal bd = new BigDecimal(value);
		bd = bd.setScale(places, RoundingMode.HALF_UP);
		return bd.doubleValue();
	}

	public double getTotale() {
		return round ((quantita * prezzo), 2);
	}

	public void setTotale(double totale) {
		this.totale = round ((quantita * prezzo), 2);
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public Long getId_ordine() {
		return id_ordine;
	}

	public void setId_ordine(Long id_ordine) {
		this.id_ordine = id_ordine;
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

	public String getPagato_transaz() {
		return pagato_transaz;
	}

	public void setPagato_transaz(String pagato_transaz) {
		this.pagato_transaz = pagato_transaz;
	}

	public Prodotti getProdotto() {
		if (this.prodotto == null) {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			prodotto = (Prodotti) sx.createQuery("from Prodotti where codice_prodotto ='" + codice_prodotto + "'").uniqueResult();
			prodotto.checkPp(sx);
			sx.evict(prodotto);
			sx.close();
		}
		return prodotto;
	}

	public void setProdotto(Prodotti prodotto) {
		this.prodotto = prodotto;
	}
}

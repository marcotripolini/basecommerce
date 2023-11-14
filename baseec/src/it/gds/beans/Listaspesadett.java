package it.gds.beans;

public class Listaspesadett {
	private long id;
	private long id_lista;
	private long id_sito;
	private Long id_vetrina;
	private String codice_gds;
	private double prezzo;
	private double quantita;
	private double totale;
	private String descrizione;
	private boolean attivo;
	public Listaspesadett(long id, long id_lista, long id_sito, Long id_vetrina, String codice_gds, double prezzo,
			int quantita, double totale, String descrizione, boolean attivo) {
		super();
		this.id = id;
		this.id_lista = id_lista;
		this.id_sito = id_sito;
		this.id_vetrina = id_vetrina;
		this.codice_gds = codice_gds;
		this.prezzo = prezzo;
		this.quantita = quantita;
		this.totale = totale;
		this.descrizione = descrizione;
		this.attivo = attivo;
	}
	public Listaspesadett() {

	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getId_lista() {
		return id_lista;
	}
	public void setId_lista(long id_lista) {
		this.id_lista = id_lista;
	}
	public long getId_sito() {
		return id_sito;
	}
	public void setId_sito(long id_sito) {
		this.id_sito = id_sito;
	}
	public Long getId_vetrina() {
		return id_vetrina;
	}
	public void setId_vetrina(Long id_vetrina) {
		this.id_vetrina = id_vetrina;
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
	public double getQuantita() {
		return quantita;
	}
	public void setQuantita(double d) {
		this.quantita = d;
	}
	public double getTotale() {
		return totale;
	}
	public void setTotale(double totale) {
		this.totale = totale;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public boolean isAttivo() {
		return attivo;
	}
	public void setAttivo(boolean attivo) {
		this.attivo = attivo;
	}
}

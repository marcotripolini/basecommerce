package it.gds.beans;

import java.util.Date;
import java.util.Set;

import it.gds.beans.Carrellodett;

public class OrdiniEDettagli {
	private long id;
	private Date data;
	private long id_cliente;
	private double importo;
	private double spesesped;
	private double totale;
	private Boolean pagato;
	private Boolean consegna_fascia_a;
	private Boolean consegna_fascia_b;
	private Boolean consegna_fascia_c;
	private String tessera;
	private Date pagato_il;
	private String pagato_transaz;
	private String shop_name;
	private String ora_consegna;
	private long id_carrello;
	private String d_nominativo;
	private String d_email;
	private String d_telefono;
	private Date data_consegna;
	private String tipo_consegna;

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
	public double getImporto() {
		return importo;
	}
	public void setImporto(double importo) {
		this.importo = importo;
	}
	public double getSpesesped() {
		return spesesped;
	}
	public void setSpesesped(double spesesped) {
		this.spesesped = spesesped;
	}
	public double getTotale() {
		return totale;
	}
	public void setTotale(double totale) {
		this.totale = totale;
	}
	public Boolean getPagato() {
		return pagato;
	}
	public void setPagato(Boolean pagato) {
		this.pagato = pagato;
	}
	public String getD_indirizzo() {
		return d_indirizzo;
	}
	public void setD_indirizzo(String d_indirizzo) {
		this.d_indirizzo = d_indirizzo;
	}
	public String getD_localita() {
		return d_localita;
	}
	public void setD_localita(String d_localita) {
		this.d_localita = d_localita;
	}
	public String getD_provincia() {
		return d_provincia;
	}
	public void setD_provincia(String d_provincia) {
		this.d_provincia = d_provincia;
	}
	public String getD_cap() {
		return d_cap;
	}
	public void setD_cap(String d_cap) {
		this.d_cap = d_cap;
	}
	public String getD_note() {
		return d_note;
	}
	public void setD_note(String d_note) {
		this.d_note = d_note;
	}
	public Boolean getContrassegno() {
		return contrassegno;
	}
	public void setContrassegno(Boolean contrassegno) {
		this.contrassegno = contrassegno;
	}
	public Set<Carrellodett> getDettagli() {
		return dettagli;
	}
	public void setDettagli(Set<Carrellodett> dettagli) {
		this.dettagli = dettagli;
	}
	private String d_indirizzo;
	private String d_localita;
	private String d_provincia;
	private String d_cap;
	private String d_note;
	private Boolean contrassegno;
	private Set<Carrellodett> dettagli;
	public OrdiniEDettagli(long id, Date data, long id_cliente, double importo, double spesesped, double totale,
			Boolean pagato, String d_indirizzo, String d_localita, String d_provincia, String d_cap, String d_note,
			Boolean contrassegno, Set<Carrellodett> dettagli) {
		super();
		this.id = id;
		this.data = data;
		this.id_cliente = id_cliente;
		this.importo = importo;
		this.spesesped = spesesped;
		this.totale = totale;
		this.pagato = pagato;
		this.d_indirizzo = d_indirizzo;
		this.d_localita = d_localita;
		this.d_provincia = d_provincia;
		this.d_cap = d_cap;
		this.d_note = d_note;
		this.contrassegno = contrassegno;
		this.dettagli = dettagli;
	}
	public OrdiniEDettagli() {

	}
	public String getTessera() {
		return tessera;
	}
	public void setTessera(String tessera) {
		this.tessera = tessera;
	}
	public Boolean getConsegna_fascia_a() {
		return consegna_fascia_a;
	}
	public void setConsegna_fascia_a(Boolean consegna_fascia_a) {
		this.consegna_fascia_a = consegna_fascia_a;
	}
	public Boolean getConsegna_fascia_b() {
		return consegna_fascia_b;
	}
	public void setConsegna_fascia_b(Boolean consegna_fascia_b) {
		this.consegna_fascia_b = consegna_fascia_b;
	}
	public Boolean getConsegna_fascia_c() {
		return consegna_fascia_c;
	}
	public void setConsegna_fascia_c(Boolean consegna_fascia_c) {
		this.consegna_fascia_c = consegna_fascia_c;
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
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getOra_consegna() {
		return ora_consegna;
	}
	public void setOra_consegna(String ora_consegna) {
		this.ora_consegna = ora_consegna;
	}
	public long getId_carrello() {
		return id_carrello;
	}
	public void setId_carrello(long id_carrello) {
		this.id_carrello = id_carrello;
	}
	public String getD_nominativo() {
		return d_nominativo;
	}
	public void setD_nominativo(String d_nominativo) {
		this.d_nominativo = d_nominativo;
	}
	public String getD_email() {
		return d_email;
	}
	public void setD_email(String d_email) {
		this.d_email = d_email;
	}
	public String getD_telefono() {
		return d_telefono;
	}
	public void setD_telefono(String d_telefono) {
		this.d_telefono = d_telefono;
	}
	public Date getData_consegna() {
		return data_consegna;
	}
	public void setData_consegna(Date data_consegna) {
		this.data_consegna = data_consegna;
	}
	public String getTipo_consegna() {
		return tipo_consegna;
	}
	public void setTipo_consegna(String tipo_consegna) {
		this.tipo_consegna = tipo_consegna;
	}
}

package it.gds.beans;

import java.util.Date;
import java.util.Set;

public class Listaspesa {
	private long id;
	private long id_cliente;
	private Date data;
	private String descrizione;
	private Set<Listaspesadett> dettagli;
	public Listaspesa(long id, long id_cliente, Date data, String descrizione, Set<Listaspesadett> dettagli) {
		super();
		this.id = id;
		this.id_cliente = id_cliente;
		this.data = data;
		this.descrizione = descrizione;
		this.dettagli = dettagli;
	}
	public Listaspesa() {
		
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(long id_cliente) {
		this.id_cliente = id_cliente;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public Set<Listaspesadett> getDettagli() {
		return dettagli;
	}
	public void setDettagli(Set<Listaspesadett> dettagli) {
		this.dettagli = dettagli;
	}
}

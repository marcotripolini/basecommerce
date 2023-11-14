package it.gds.beans;

import java.util.Date;

public class StoricoTessere {
	private long id;
	private String cliente_tessera;
	private Date data_operazione;
	private String descrizione;
	private int cliente_punti;
	private double cliente_valore;
	public StoricoTessere(long id, String cliente_tessera, Date data_operazione, String descrizione, int cliente_punti,
			double cliente_valore) {
		super();
		this.id = id;
		this.cliente_tessera = cliente_tessera;
		this.data_operazione = data_operazione;
		this.descrizione = descrizione;
		this.cliente_punti = cliente_punti;
		this.cliente_valore = cliente_valore;
	}
	public StoricoTessere() {
		
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCliente_tessera() {
		return cliente_tessera;
	}
	public void setCliente_tessera(String cliente_tessera) {
		this.cliente_tessera = cliente_tessera;
	}
	public Date getData_operazione() {
		return data_operazione;
	}
	public void setData_operazione(Date data_operazione) {
		this.data_operazione = data_operazione;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public int getCliente_punti() {
		return cliente_punti;
	}
	public void setCliente_punti(int cliente_punti) {
		this.cliente_punti = cliente_punti;
	}
	public double getCliente_valore() {
		return cliente_valore;
	}
	public void setCliente_valore(double cliente_valore) {
		this.cliente_valore = cliente_valore;
	}
}

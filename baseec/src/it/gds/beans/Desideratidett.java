package it.gds.beans;

import java.util.Date;

public class Desideratidett {
	private long id;
	private long id_cliente;
	private Date data;
	private String articolo;
	private String marchio;
	private String formato;
	private String barcode;
	public Desideratidett(long id, long id_cliente, Date data, String articolo, String marchio, String formato,
			String barcode) {
		super();
		this.id = id;
		this.id_cliente = id_cliente;
		this.data = data;
		this.articolo = articolo;
		this.marchio = marchio;
		this.formato = formato;
		this.barcode = barcode;
	}
	public Desideratidett() {
		
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
	public String getArticolo() {
		return articolo;
	}
	public void setArticolo(String articolo) {
		this.articolo = articolo;
	}
	public String getMarchio() {
		return marchio;
	}
	public void setMarchio(String marchio) {
		this.marchio = marchio;
	}
	public String getFormato() {
		return formato;
	}
	public void setFormato(String formato) {
		this.formato = formato;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	
}

package it.gds.beans;

public class Sessione {
	private long id;
	private long id_cliente;
	private long id_carrello;
	private String ip;
	private String attivo;

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

	public long getId_carrello() {
		return id_carrello;
	}

	public void setId_carrello(long id_carrello) {
		this.id_carrello = id_carrello;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getAttivo() {
		return attivo;
	}

	public void setAttivo(String attivo) {
		this.attivo = attivo;
	}
}

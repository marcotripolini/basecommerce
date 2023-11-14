package it.gds.beans;

public class Clientidettagli {
	private long id_cliente;
	private String regioni_attive;
	private String province_attive;
	private String comuni_attivi;
	public Clientidettagli(long id_cliente, String regioni_attive, String province_attive, String comuni_attivi) {
		super();
		this.id_cliente = id_cliente;
		this.regioni_attive = regioni_attive;
		this.province_attive = province_attive;
		this.comuni_attivi = comuni_attivi;
	}
	public Clientidettagli() {
		
	}
	public long getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(long id_cliente) {
		this.id_cliente = id_cliente;
	}
	public String getRegioni_attive() {
		return regioni_attive;
	}
	public void setRegioni_attive(String regioni_attive) {
		this.regioni_attive = regioni_attive;
	}
	public String getProvince_attive() {
		return province_attive;
	}
	public void setProvince_attive(String province_attive) {
		this.province_attive = province_attive;
	}
	public String getComuni_attivi() {
		return comuni_attivi;
	}
	public void setComuni_attivi(String comuni_attivi) {
		this.comuni_attivi = comuni_attivi;
	}
}

package it.gds.beans;

public class Comuni_serviti {
	private String codice_comune;
	private String cap;
	private String nome_comune;
	private String sigla_provincia;
	public Comuni_serviti(String codice_comune, String cap, String nome_comune, String sigla_provincia) {
		super();
		this.codice_comune = codice_comune;
		this.cap = cap;
		this.nome_comune = nome_comune;
		this.sigla_provincia = sigla_provincia;
	}
	public Comuni_serviti() {
		
	}
	public String getCodice_comune() {
		return codice_comune;
	}
	public void setCodice_comune(String codice_comune) {
		this.codice_comune = codice_comune;
	}
	public String getCap() {
		return cap;
	}
	public void setCap(String cap) {
		this.cap = cap;
	}
	public String getNome_comune() {
		return nome_comune;
	}
	public void setNome_comune(String nome_comune) {
		this.nome_comune = nome_comune;
	}
	public String getSigla_provincia() {
		return sigla_provincia;
	}
	public void setSigla_provincia(String sigla_provincia) {
		this.sigla_provincia = sigla_provincia;
	}
}

package it.gds.beans;

import java.util.Date;

public class ModBistrotNovara {
	private Integer id;
	private Integer livello;
	private Date data;
	private String codice_gds;
	private String titolo;
	private String dettaglio;
	private Double p_alpubblico_0;
	private String nome_immagine;

	public Integer getLivello() {
		return livello;
	}

	public void setLivello(Integer livello) {
		this.livello = livello;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public String getCodice_gds() {
		return codice_gds;
	}

	public void setCodice_gds(String codice_gds) {
		this.codice_gds = codice_gds;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDettaglio() {
		return dettaglio;
	}

	public void setDettaglio(String dettaglio) {
		this.dettaglio = dettaglio;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getP_alpubblico_0() {
		return p_alpubblico_0;
	}

	public void setP_alpubblico_0(Double p_alpubblico_0) {
		this.p_alpubblico_0 = p_alpubblico_0;
	}

	public String getNome_immagine() {
		return nome_immagine;
	}

	public void setNome_immagine(String nome_immagine) {
		this.nome_immagine = nome_immagine;
	}

}

package it.gds.beans;

public class SpeseSped {
	Long id;
	Double importo_min;
	Double importo_sped;
	String descrizione;
	String zona;
	Integer vincolo;
	String dettagli;
	boolean selected;
	boolean disabled = false;

	public boolean getDisabled() {
		return disabled;
	}

	public void setDisabled(boolean disabled) {
		this.disabled = disabled;
	}


	public boolean getSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getImporto_min() {
		return importo_min;
	}

	public void setImporto_min(Double importo_min) {
		this.importo_min = importo_min;
	}

	public Double getImporto_sped() {
		if (importo_sped != null) {
			return importo_sped;
		} else {
			return (double) 0;
		}
	}

	public void setImporto_sped(Double importo_sped) {
		this.importo_sped = importo_sped;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getZona() {
		return zona;
	}

	public void setZona(String zona) {
		this.zona = zona;
	}

	public Integer getVincolo() {
		return vincolo;
	}

	public void setVincolo(Integer vincolo) {
		this.vincolo = vincolo;
	}

	public String getDettagli() {
		return dettagli;
	}

	public void setDettagli(String dettagli) {
		this.dettagli = dettagli;
	}
}

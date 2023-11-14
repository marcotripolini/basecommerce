package it.gds.beans;

public class Marchi {
	private long id;
	private String marchio;
	private Boolean visualizza;
	private String immagine;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getMarchio() {
		return marchio;
	}

	public void setMarchio(String marchio) {
		this.marchio = marchio;
	}

	public Boolean getVisualizza() {
		return visualizza;
	}

	public void setVisualizza(Boolean visualizza) {
		this.visualizza = visualizza;
	}

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	private String url;
	private String descrizione;

	public Marchi(long id, String marchio, Boolean visualizza, String immagine, String url, String descrizione) {
		super();
		this.id = id;
		this.marchio = marchio;
		this.visualizza = visualizza;
		this.immagine = immagine;
		this.url = url;
		this.descrizione = descrizione;
	}

	public Marchi() {

	}
}

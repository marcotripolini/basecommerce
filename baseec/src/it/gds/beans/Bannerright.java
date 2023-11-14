package it.gds.beans;

import java.util.Date;

public class Bannerright {
	private long id;
	private String url;
	private String url2;
	private Date dal;
	private Date al;
	private String descrizione;
	public Bannerright(long id, String url, String url2, Date dal, Date al, String descrizione) {
		super();
		this.id = id;
		this.url = url;
		this.url2 = url2;
		this.dal = dal;
		this.al = al;
		this.descrizione = descrizione;
	}
	public Bannerright() {
		
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUrl2() {
		return url2;
	}
	public void setUrl2(String url2) {
		this.url2 = url2;
	}
	public Date getDal() {
		return dal;
	}
	public void setDal(Date dal) {
		this.dal = dal;
	}
	public Date getAl() {
		return al;
	}
	public void setAl(Date al) {
		this.al = al;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
}

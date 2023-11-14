package it.gds.beans;

public class Config {

	public long id;
	private String force_trend;
	private String force_offers;
	private String force_lasts;

	public Config(long id, String force_trend, String force_offers, String force_lasts) {
		super();
		this.id = id;
		this.force_trend = force_trend;
		this.force_offers = force_offers;
		this.force_lasts = force_lasts;
	}

	public Config() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getForce_trend() {
		return force_trend;
	}

	public void setForce_trend(String force_trend) {
		this.force_trend = force_trend;
	}

	public String getForce_offers() {
		return force_offers;
	}

	public void setForce_offers(String force_offers) {
		this.force_offers = force_offers;
	}

	public String getForce_lasts() {
		return force_lasts;
	}

	public void setForce_lasts(String force_lasts) {
		this.force_lasts = force_lasts;
	}
}

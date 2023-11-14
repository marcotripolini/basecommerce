package it.gds.beans;

public class Coupon {
	private double value;
	private boolean perc;
	private String code;
	private String descrizione;

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}

	public boolean isPerc() {
		return perc;
	}

	public void setPerc(boolean perc) {
		this.perc = perc;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
}

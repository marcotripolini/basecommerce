package it.gds.beans;

public class Categorie {
	private String categoria_gds;
	private String categoria_1;
	private String categoria_2;
	private String categoria_3;
	private String categoria_4;
	private int attiva_sn;
	private int tipo;
	private String categoria_1_EN;
	private String categoria_2_EN;
	private String categoria_1_FR;
	private String categoria_2_FR;
	private String categoria_1_DE;
	private String categoria_2_DE;
	private String categoria_1_HU;
	private String categoria_2_HU;

	private String categoria_1_base;
	private String categoria_2_base;

	private Categorie_menu categoria_menu;

	private int seq;

	public Categorie() {

	}

	public String getCategoria_gds() {
		return categoria_gds;
	}

	public void setCategoria_gds(String categoria_gds) {
		this.categoria_gds = categoria_gds;
	}

	public String getCategoria_1() {
		return categoria_1;
	}

	public void setCategoria_1(String categoria_1) {
		this.categoria_1 = categoria_1;
	}

	public String getCategoria_2() {
		return categoria_2;
	}

	public void setCategoria_2(String categoria_2) {
		this.categoria_2 = categoria_2;
	}

	public String getCategoria_3() {
		return categoria_3;
	}

	public void setCategoria_3(String categoria_3) {
		this.categoria_3 = categoria_3;
	}

	public String getCategoria_4() {
		return categoria_4;
	}

	public void setCategoria_4(String categoria_4) {
		this.categoria_4 = categoria_4;
	}

	public int getAttiva_sn() {
		return attiva_sn;
	}

	public void setAttiva_sn(int attiva_sn) {
		this.attiva_sn = attiva_sn;
	}

	public int getTipo() {
		return tipo;
	}

	public void setTipo(int tipo) {
		this.tipo = tipo;
	}

	public String getCategoria_1_EN() {
		return categoria_1_EN;
	}

	public void setCategoria_1_EN(String categoria_1_EN) {
		this.categoria_1_EN = categoria_1_EN;
	}

	public String getCategoria_2_EN() {
		return categoria_2_EN;
	}

	public void setCategoria_2_EN(String categoria_2_EN) {
		this.categoria_2_EN = categoria_2_EN;
	}

	public String getCategoria_1_FR() {
		return categoria_1_FR;
	}

	public void setCategoria_1_FR(String categoria_1_FR) {
		this.categoria_1_FR = categoria_1_FR;
	}

	public String getCategoria_2_FR() {
		return categoria_2_FR;
	}

	public void setCategoria_2_FR(String categoria_2_FR) {
		this.categoria_2_FR = categoria_2_FR;
	}

	public String getCategoria_1_DE() {
		return categoria_1_DE;
	}

	public void setCategoria_1_DE(String categoria_1_DE) {
		this.categoria_1_DE = categoria_1_DE;
	}

	public String getCategoria_2_DE() {
		return categoria_2_DE;
	}

	public void setCategoria_2_DE(String categoria_2_DE) {
		this.categoria_2_DE = categoria_2_DE;
	}

	public Categorie_menu getCategoria_menu() {
		return categoria_menu;
	}

	public void setCategoria_menu(Categorie_menu categoria_menu) {
		this.categoria_menu = categoria_menu;
	}

	public String getCategoria_1_HU() {
		return categoria_1_HU;
	}

	public void setCategoria_1_HU(String categoria_1_HU) {
		this.categoria_1_HU = categoria_1_HU;
	}

	public String getCategoria_2_HU() {
		return categoria_2_HU;
	}

	public void setCategoria_2_HU(String categoria_2_HU) {
		this.categoria_2_HU = categoria_2_HU;
	}

	public void backupLanguage () {
		this.categoria_1_base = this.categoria_1;
		this.categoria_2_base = this.categoria_2;
		this.categoria_menu.setDesc_base(this.categoria_menu.getDescrizione());
	}

	public void checkLanguage (String locale) {
		if (locale.equals("hu")) {
			this.categoria_1 = this.categoria_1_HU;
			this.categoria_2 = this.categoria_2_HU;
			this.categoria_menu.setDescrizione(this.categoria_menu.getDesc_HU());
		} else if (locale.equals("en")) {
			this.categoria_1 = this.categoria_1_EN;
			this.categoria_2 = this.categoria_2_EN;
			this.categoria_menu.setDescrizione(this.categoria_menu.getDesc_EN());
		} else if (locale.equals("fr")) {
			this.categoria_1 = this.categoria_1_FR;
			this.categoria_2 = this.categoria_2_FR;
			this.categoria_menu.setDescrizione(this.categoria_menu.getDesc_FR());
		} else if (locale.equals("de")) {
			this.categoria_1 = this.categoria_1_DE;
			this.categoria_2 = this.categoria_2_DE;
			this.categoria_menu.setDescrizione(this.categoria_menu.getDesc_DE());
		} else if (locale.equals("it")) {
			this.categoria_1 = this.categoria_1_base;
			this.categoria_2 = this.categoria_2_base;
			this.categoria_menu.setDescrizione(this.categoria_menu.getDesc_base());
		}
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
}
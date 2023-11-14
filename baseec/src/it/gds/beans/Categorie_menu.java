package it.gds.beans;

public class Categorie_menu {
	private String id;
	private String descrizione;
	private String desc_EN;
	private String desc_FR;
	private String desc_DE;
	private String desc_HU;
	private String desc_base;
	private String img;
	private boolean attiva_sn;
	private String img_totem;
	private Categorie_menu_dettagli dettagli;

	public Categorie_menu() {

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getDesc_EN() {
		return desc_EN;
	}

	public void setDesc_EN(String desc_EN) {
		this.desc_EN = desc_EN;
	}

	public String getDesc_FR() {
		return desc_FR;
	}

	public void setDesc_FR(String desc_FR) {
		this.desc_FR = desc_FR;
	}

	public String getDesc_DE() {
		return desc_DE;
	}

	public void setDesc_DE(String desc_DE) {
		this.desc_DE = desc_DE;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public boolean isAttiva_sn() {
		return attiva_sn;
	}

	public void setAttiva_sn(boolean attiva_sn) {
		this.attiva_sn = attiva_sn;
	}

	public String getImg_totem() {
		return img_totem;
	}

	public void setImg_totem(String img_totem) {
		this.img_totem = img_totem;
	}

	public Categorie_menu_dettagli getDettagli() {
		return dettagli;
	}

	public void setDettagli(Categorie_menu_dettagli dettagli) {
		this.dettagli = dettagli;
	}

	public String getDesc_HU() {
		return desc_HU;
	}

	public void setDesc_HU(String desc_HU) {
		this.desc_HU = desc_HU;
	}

	public void checkLanguage (String locale) {
		if (locale.equals("hu")) {
			this.descrizione = this.desc_HU ;
		} else if (locale.equals("en")) {
			this.descrizione = this.desc_EN ;
		} else if (locale.equals("fr")) {
			this.descrizione = this.desc_FR ;
		} else if (locale.equals("de")) {
			this.descrizione = this.desc_DE ;
		} else if (locale.equals("it")) {
			this.descrizione = this.desc_base ;
		}
	}

	public String getDesc_base() {
		return desc_base;
	}

	public void setDesc_base(String desc_base) {
		this.desc_base = desc_base;
	}
}

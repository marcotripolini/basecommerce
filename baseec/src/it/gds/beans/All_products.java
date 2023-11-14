package it.gds.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class All_products {
	private long id;
	private String codice_gds;
	private String ean;
	private long id_fornitore;
	private long id_produttore;
	private long id_marchio;
	private String titolo;
	private double ivaperc;
	private double imponibile;
	private double ricarico;
	private double acquisto_imponibile;
	private double p_alpubblico_0;
	private double p_alpubblico_1;
	private double p_alpubblico_2;
	private double p_alpubblico_3;
	private double p_alpubblico_4;
	private double p_alpubblico_5;
	private double p_alpubblico_6;
	private double p_alpubblico_7;
	private double p_alpubblico_8;
	private double p_alpubblico_9;
	private String unita_misura;
	private String quantita;
	private boolean visibile;
	private String categoria_gds;
	private String chiavi_ricerca;
	private Integer priorita_ricerca;
	private String vita_media;
	private String nome_immagine;
	private String nome_immagine2;
	private String nome_immagine3;
	private String nome_immagine4;
	private Date data_modifica;
	private String dettaglio;
	private String dettaglio2;
	private String offerta;
	private int superofferta;
	private long qmvend;
	private boolean visualizza_prezzo_unitario;
	private String car_immagini;
	private Date valido_dal;
	private Date valido_fino_al;
	private double campo2;
	private All_brands marchio;
	private Integer tipo_offerta;

	public All_products() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCodice_gds() {
		return codice_gds;
	}

	public void setCodice_gds(String codice_gds) {
		this.codice_gds = codice_gds;
	}

	public String getEan() {
		return ean;
	}

	public void setEan(String ean) {
		this.ean = ean;
	}

	public long getId_fornitore() {
		return id_fornitore;
	}

	public void setId_fornitore(long id_fornitore) {
		this.id_fornitore = id_fornitore;
	}

	public long getId_produttore() {
		return id_produttore;
	}

	public void setId_produttore(long id_produttore) {
		this.id_produttore = id_produttore;
	}

	public long getId_marchio() {
		return id_marchio;
	}

	public void setId_marchio(long id_marchio) {
		this.id_marchio = id_marchio;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public double getIvaperc() {
		return ivaperc;
	}

	public void setIvaperc(double ivaperc) {
		this.ivaperc = ivaperc;
	}

	public double getImponibile() {
		return imponibile;
	}

	public void setImponibile(double imponibile) {
		this.imponibile = imponibile;
	}

	public double getRicarico() {
		return ricarico;
	}

	public void setRicarico(double ricarico) {
		this.ricarico = ricarico;
	}

	public double getAcquisto_imponibile() {
		return acquisto_imponibile;
	}

	public void setAcquisto_imponibile(double acquisto_imponibile) {
		this.acquisto_imponibile = acquisto_imponibile;
	}

	public double getP_alpubblico_0() {
		return p_alpubblico_0;
	}

	public void setP_alpubblico_0(double p_alpubblico_0) {
		this.p_alpubblico_0 = p_alpubblico_0;
	}

	public double getP_alpubblico_1() {
		return p_alpubblico_1;
	}

	public void setP_alpubblico_1(double p_alpubblico_1) {
		this.p_alpubblico_1 = p_alpubblico_1;
	}

	public double getP_alpubblico_2() {
		return p_alpubblico_2;
	}

	public void setP_alpubblico_2(double p_alpubblico_2) {
		this.p_alpubblico_2 = p_alpubblico_2;
	}

	public double getP_alpubblico_3() {
		return p_alpubblico_3;
	}

	public void setP_alpubblico_3(double p_alpubblico_3) {
		this.p_alpubblico_3 = p_alpubblico_3;
	}

	public double getP_alpubblico_4() {
		return p_alpubblico_4;
	}

	public void setP_alpubblico_4(double p_alpubblico_4) {
		this.p_alpubblico_4 = p_alpubblico_4;
	}

	public double getP_alpubblico_5() {
		return p_alpubblico_5;
	}

	public void setP_alpubblico_5(double p_alpubblico_5) {
		this.p_alpubblico_5 = p_alpubblico_5;
	}

	public double getP_alpubblico_6() {
		return p_alpubblico_6;
	}

	public void setP_alpubblico_6(double p_alpubblico_6) {
		this.p_alpubblico_6 = p_alpubblico_6;
	}

	public double getP_alpubblico_7() {
		return p_alpubblico_7;
	}

	public void setP_alpubblico_7(double p_alpubblico_7) {
		this.p_alpubblico_7 = p_alpubblico_7;
	}

	public double getP_alpubblico_8() {
		return p_alpubblico_8;
	}

	public void setP_alpubblico_8(double p_alpubblico_8) {
		this.p_alpubblico_8 = p_alpubblico_8;
	}

	public double getP_alpubblico_9() {
		return p_alpubblico_9;
	}

	public void setP_alpubblico_9(double p_alpubblico_9) {
		this.p_alpubblico_9 = p_alpubblico_9;
	}

	public String getUnita_misura() {
		return unita_misura;
	}

	public void setUnita_misura(String unita_misura) {
		this.unita_misura = unita_misura;
	}

	public String getQuantita() {
		return quantita;
	}

	public void setQuantita(String quantita) {
		this.quantita = quantita;
	}

	public boolean isVisibile() {
		return visibile;
	}

	public void setVisibile(boolean visibile) {
		this.visibile = visibile;
	}

	public String getCategoria_gds() {
		return categoria_gds;
	}

	public void setCategoria_gds(String categoria_gds) {
		this.categoria_gds = categoria_gds;
	}

	public String getChiavi_ricerca() {
		return chiavi_ricerca;
	}

	public void setChiavi_ricerca(String chiavi_ricerca) {
		this.chiavi_ricerca = chiavi_ricerca;
	}

	public Integer getPriorita_ricerca() {
		return priorita_ricerca;
	}

	public void setPriorita_ricerca(Integer priorita_ricerca) {
		this.priorita_ricerca = priorita_ricerca;
	}

	public String getVita_media() {
		return vita_media;
	}

	public void setVita_media(String vita_media) {
		this.vita_media = vita_media;
	}

	public String getNome_immagine() {
		return nome_immagine;
	}

	public void setNome_immagine(String nome_immagine) {
		this.nome_immagine = nome_immagine;
	}

	public Date getData_modifica() {
		return data_modifica;
	}

	public void setData_modifica(Date data_modifica) {
		this.data_modifica = data_modifica;
	}

	public String getDettaglio() {
		return dettaglio;
	}

	public void setDettaglio(String dettaglio) {
		this.dettaglio = dettaglio;
	}

	public String getOfferta() {
		return offerta;
	}

	public void setOfferta(String offerta) {
		this.offerta = offerta;
	}

	public int getSuperofferta() {
		return superofferta;
	}

	public void setSuperofferta(int superofferta) {
		this.superofferta = superofferta;
	}

	public long getQmvend() {
		return qmvend;
	}

	public void setQmvend(long qmvend) {
		this.qmvend = qmvend;
	}

	public boolean isVisualizza_prezzo_unitario() {
		return visualizza_prezzo_unitario;
	}

	public void setVisualizza_prezzo_unitario(boolean visualizza_prezzo_unitario) {
		this.visualizza_prezzo_unitario = visualizza_prezzo_unitario;
	}

	public String getCar_immagini() {
		return car_immagini;
	}

	public void setCar_immagini(String car_immagini) {
		this.car_immagini = car_immagini;
	}

	public Date getValido_dal() {
		return valido_dal;
	}

	public void setValido_dal(Date valido_dal) {
		this.valido_dal = valido_dal;
	}

	public Date getValido_fino_al() {
		return valido_fino_al;
	}

	public void setValido_fino_al(Date valido_fino_al) {
		this.valido_fino_al = valido_fino_al;
	}

	public double getCampo2() {
		return campo2;
	}

	public void setCampo2(double campo2) {
		this.campo2 = campo2;
	}

	public All_brands getMarchio() {
		return marchio;
	}

	public void setMarchio(All_brands marchio) {
		this.marchio = marchio;
	}

	public void checkLanguage(String locale, Connection conn) {
		String sql1 = " select titolo, " + "dettaglio, " + "dettaglio2 " + "from prodotti_translate " + "where EAN ='"
				+ this.ean + "' " + "and locale ='" + locale + "'";
		Statement stmt = null;
		// Connection conn = ((SessionImpl)
		// HibernateUtil.getSessionFactory().openSession()).connection();
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql1);
			while (rs.next()) {
				this.titolo = rs.getString("titolo");
				this.dettaglio = rs.getString("dettaglio");
				this.dettaglio2 = rs.getString("dettaglio2");
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				// conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public String getDettaglio2() {
		return dettaglio2;
	}

	public void setDettaglio2(String dettaglio2) {
		this.dettaglio2 = dettaglio2;
	}

	public String getNome_immagine2() {
		return nome_immagine2;
	}

	public void setNome_immagine2(String nome_immagine2) {
		this.nome_immagine2 = nome_immagine2;
	}

	public String getNome_immagine3() {
		return nome_immagine3;
	}

	public void setNome_immagine3(String nome_immagine3) {
		this.nome_immagine3 = nome_immagine3;
	}

	public String getNome_immagine4() {
		return nome_immagine4;
	}

	public void setNome_immagine4(String nome_immagine4) {
		this.nome_immagine4 = nome_immagine4;
	}

	public Integer getTipo_offerta() {
		return tipo_offerta;
	}

	public void setTipo_offerta(Integer tipo_offerta) {
		this.tipo_offerta = tipo_offerta;
	}
}

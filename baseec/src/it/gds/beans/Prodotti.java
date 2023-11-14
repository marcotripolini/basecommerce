package it.gds.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringEscapeUtils;
import org.hibernate.Session;
import org.hibernate.impl.SessionImpl;

import it.gds.hibernate.HibernateUtil;
import it.gds.sbeans.ProductProperty;

public class Prodotti {
    private String id;
    private String codice_prodotto;
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
    private double p_offerta_1;
    private double p_offerta_2;
    private double p_offerta_3;
    private double p_offerta_4;
    private double p_offerta_5;
    private double p_offerta_6;
    private double p_offerta_7;
    private double p_offerta_8;
    private double p_offerta_9;
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
    private Integer superofferta;
    private long qmvend;
    private Boolean visualizza_prezzo_unitario;
    private String car_immagini;
    private Date valido_dal;
    private Date valido_fino_al;
    private double campo2;
    private Marchi marchio;
    private Integer tipo_offerta;
    private Double giacenza_magazzino;
    private String taglia;
    private String categoria_prodotto_cliente;
	private Boolean menu_dish_mod;
	private Integer menu_dish_mod_type;
    private String HTML_CODE;
    private String HTML_DESC;
    private String HTML_CODE_2;
    private String HTML_DESC_2;
    private String HTML_CODE_3;
    private String HTML_DESC_3;
    private String HTML_CODE_4;
    private String HTML_DESC_4;
    private String HTML_CODE_5;
    private String HTML_DESC_5;
    private String immagine_esempio;

	public String getImmagine_esempio() {
		return immagine_esempio;
	}

	public void setImmagine_esempio(String immagine_esempio) {
		this.immagine_esempio = immagine_esempio;
	}

	private Set<it.gds.beans.ProductProperty> prodproperty;
    private it.gds.beans.ProductProperty pp;
    private List<ProductProperty> properties = new ArrayList<ProductProperty>();

    public String getCategoria_prodotto_cliente() {
		return categoria_prodotto_cliente;
	}

	public void setCategoria_prodotto_cliente(String categoria_prodotto_cliente) {
		this.categoria_prodotto_cliente = categoria_prodotto_cliente;
	}


    public Prodotti() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
    	this.codice_prodotto = id;
        this.id = id;
    }

    public String getCodice_gds() {
        return codice_prodotto;
    }

    public void setCodice_gds(String codice_gds) {
        this.codice_prodotto = codice_gds;
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
    	return StringEscapeUtils.escapeHtml4(titolo);
//        return titolo;
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

    public String getDettaglio2() {
        return dettaglio2;
    }

    public void setDettaglio2(String dettaglio2) {
        this.dettaglio2 = dettaglio2;
    }

    public String getOfferta() {
        return offerta;
    }

    public void setOfferta(String offerta) {
        this.offerta = offerta;
    }

    public long getQmvend() {
        return qmvend;
    }

    public void setQmvend(long qmvend) {
        this.qmvend = qmvend;
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

    public Marchi getMarchio() {
        return marchio;
    }

    public void setMarchio(Marchi marchio) {
        this.marchio = marchio;
    }

    public void checkLanguage(String locale, Connection conn) {
        String sql1 = " select titolo, " + "dettaglio, " + "dettaglio2 " + "from prodotti_translate " + "where EAN ='"
                + this.ean + "' " + "and locale ='" + locale + "'";
        Statement stmt = null;
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
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void checkLanguage(String locale) {
        String sql1 = "select titolo, " + "dettaglio, " + "dettaglio2 " + "from prodotti_translate " + "where EAN ='"
                + this.ean + "' " + "and locale ='" + locale + "'";
        Statement stmt = null;
        Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
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
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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

    public Integer getSuperofferta() {
        return superofferta;
    }

    public void setSuperofferta(Integer superofferta) {
        this.superofferta = superofferta;
    }

    public Boolean getVisualizza_prezzo_unitario() {
        return visualizza_prezzo_unitario;
    }

    public void setVisualizza_prezzo_unitario(Boolean visualizza_prezzo_unitario) {
        this.visualizza_prezzo_unitario = visualizza_prezzo_unitario;
    }

    public String getTaglia() {
        return taglia;
    }

    public void getTaglia(Connection conn) {
        if (taglia == null) {
            String strsql = "select distinct taglia from prodottidettagli ";
            strsql += "	where codice_gds = '" + codice_prodotto + "' ";

            Statement stmt = null;
            ResultSet rs = null;
            try {
                stmt = conn.createStatement();
                rs = stmt.executeQuery(strsql);
                while (rs.next()) {
                    taglia = (rs.getString("taglia").trim());
                }
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    rs.close();
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void setTaglia(String taglia) {
        this.taglia = taglia;
    }

    public List<ProductProperty> getProperties() {
        return properties;
    }

    public void getProperties(Connection conn) {
        if (this.properties.size() == 0) {
            String strsql = "select id, colore, udb, p_alpubblico_0";
            strsql += "	from prodottidettagli ";
            strsql += "	where codice_gds = '" + codice_prodotto + "' and taglia = '" + getTaglia() + "' ";

            Statement stmt = null;
            ResultSet rs = null;
            try {
                stmt = conn.createStatement();
                rs = stmt.executeQuery(strsql);
                while (rs.next()) {
                    ProductProperty pro = new ProductProperty();
                    pro.setId(rs.getLong("id"));
                    pro.setColore(rs.getString("colore"));
                    pro.setUdb(rs.getString("udb"));
                    pro.setP_alpubblico_0(rs.getDouble("p_alpubblico_0"));
                    this.properties.add(pro);
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public Double getGiacenza_magazzino() {
        return giacenza_magazzino;
    }

    public void setGiacenza_magazzino(Double giacenza_magazzino) {
        this.giacenza_magazzino = giacenza_magazzino;
    }

    public Set<it.gds.beans.ProductProperty> getProdproperty() {
        return prodproperty;
    }

    public void setProdproperty(Set<it.gds.beans.ProductProperty> prodproperty) {
        this.prodproperty = prodproperty;
    }

    public void checkPp(Session sx) {
        pp = (it.gds.beans.ProductProperty) sx.get(it.gds.beans.ProductProperty.class, this.getCodice_gds());
        this.setPp(pp);
        sx.evict(pp);
    }

    public it.gds.beans.ProductProperty getPp() {
        return pp;
    }

    public void setPp(it.gds.beans.ProductProperty pp) {
        this.pp = pp;
    }

    public void applyDiscount(Connection conn, Long id_cliente) {
        if (id_cliente != null) {
            double p_alpubblico_0 = this.p_alpubblico_0;

            // valutazione sconto su intero listino
            String strsql = "select li/100 from prodotti_listino_clienti where id_cliente = " + id_cliente;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                stmt = conn.createStatement();
                rs = stmt.executeQuery(strsql);
                while (rs.next()) {
                    double discount = rs.getDouble(1);
                    this.p_alpubblico_0 = p_alpubblico_0 - (p_alpubblico_0 * discount);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // valutazione sconto su categoria
            strsql = "select c1/100 from prodotti_listino_clienti where id_cliente = " + id_cliente + " and cat_c1='" + this.getCategoria_gds() + "';";
            rs = null;
            try {
                rs = stmt.executeQuery(strsql);
                while (rs.next()) {
                    double discount = rs.getDouble(1);
                    this.p_alpubblico_0 = p_alpubblico_0 - (p_alpubblico_0 * discount);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // valutazione sconto su marchio
            strsql = "select marchio/100 from prodotti_listino_clienti where id_cliente = " + id_cliente + " and id_marchio='" + this.getMarchio().getId() + "';";
            rs = null;

            try {
                rs = stmt.executeQuery(strsql);
                while (rs.next()) {
                    double discount = rs.getDouble(1);
                    this.p_alpubblico_0 = p_alpubblico_0 - (p_alpubblico_0 * discount);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

	public double getP_offerta_1() {
		return p_offerta_1;
	}

	public void setP_offerta_1(double p_offerta_1) {
		this.p_offerta_1 = p_offerta_1;
	}

	public double getP_offerta_2() {
		return p_offerta_2;
	}

	public void setP_offerta_2(double p_offerta_2) {
		this.p_offerta_2 = p_offerta_2;
	}

	public double getP_offerta_3() {
		return p_offerta_3;
	}

	public void setP_offerta_3(double p_offerta_3) {
		this.p_offerta_3 = p_offerta_3;
	}

	public double getP_offerta_4() {
		return p_offerta_4;
	}

	public void setP_offerta_4(double p_offerta_4) {
		this.p_offerta_4 = p_offerta_4;
	}

	public double getP_offerta_5() {
		return p_offerta_5;
	}

	public void setP_offerta_5(double p_offerta_5) {
		this.p_offerta_5 = p_offerta_5;
	}

	public double getP_offerta_6() {
		return p_offerta_6;
	}

	public void setP_offerta_6(double p_offerta_6) {
		this.p_offerta_6 = p_offerta_6;
	}

	public double getP_offerta_7() {
		return p_offerta_7;
	}

	public void setP_offerta_7(double p_offerta_7) {
		this.p_offerta_7 = p_offerta_7;
	}

	public double getP_offerta_8() {
		return p_offerta_8;
	}

	public void setP_offerta_8(double p_offerta_8) {
		this.p_offerta_8 = p_offerta_8;
	}

	public double getP_offerta_9() {
		return p_offerta_9;
	}

	public void setP_offerta_9(double p_offerta_9) {
		this.p_offerta_9 = p_offerta_9;
	}

	public String getHTML_CODE() {
		return HTML_CODE;
	}

	public void setHTML_CODE(String hTML_CODE) {
		HTML_CODE = hTML_CODE;
	}

	public Boolean getMenu_dish_mod() {
		return menu_dish_mod;
	}

	public void setMenu_dish_mod(Boolean menu_dish_mod) {
		this.menu_dish_mod = menu_dish_mod;
	}

	public Integer getMenu_dish_mod_type() {
		return menu_dish_mod_type;
	}

	public void setMenu_dish_mod_type(Integer menu_dish_mod_type) {
		this.menu_dish_mod_type = menu_dish_mod_type;
	}

	public String getHTML_CODE_2() {
		return HTML_CODE_2;
	}

	public void setHTML_CODE_2(String hTML_CODE_2) {
		HTML_CODE_2 = hTML_CODE_2;
	}

	public String getHTML_DESC() {
		return HTML_DESC;
	}

	public void setHTML_DESC(String hTML_DESC) {
		HTML_DESC = hTML_DESC;
	}

	public String getHTML_DESC_2() {
		return HTML_DESC_2;
	}

	public void setHTML_DESC_2(String hTML_DESC_2) {
		HTML_DESC_2 = hTML_DESC_2;
	}

	public String getHTML_CODE_3() {
		return HTML_CODE_3;
	}

	public void setHTML_CODE_3(String hTML_CODE_3) {
		HTML_CODE_3 = hTML_CODE_3;
	}

	public String getHTML_DESC_3() {
		return HTML_DESC_3;
	}

	public void setHTML_DESC_3(String hTML_DESC_3) {
		HTML_DESC_3 = hTML_DESC_3;
	}

	public String getHTML_CODE_4() {
		return HTML_CODE_4;
	}

	public void setHTML_CODE_4(String hTML_CODE_4) {
		HTML_CODE_4 = hTML_CODE_4;
	}

	public String getHTML_DESC_4() {
		return HTML_DESC_4;
	}

	public void setHTML_DESC_4(String hTML_DESC_4) {
		HTML_DESC_4 = hTML_DESC_4;
	}

	public String getHTML_CODE_5() {
		return HTML_CODE_5;
	}

	public void setHTML_CODE_5(String hTML_CODE_5) {
		HTML_CODE_5 = hTML_CODE_5;
	}

	public String getHTML_DESC_5() {
		return HTML_DESC_5;
	}

	public void setHTML_DESC_5(String hTML_DESC_5) {
		HTML_DESC_5 = hTML_DESC_5;
	}
}

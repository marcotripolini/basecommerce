package it.gds.beans;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Tessere {
	private String tessera;
	private Date assign_date;
	private Date last_use_date;
	private long score;
	private double valore;
	private String codice_alternativo;
	private String livello_listino;
	private String livello_listino_successivo;
	private double tot_fatturato;
	private double differenza_x_listino_succ;
	private String periodo_fatturato;
	private String livello_tessera;
	private Date data_scadenza;
	private Set<StoricoTessere> storico = new HashSet<StoricoTessere>(0);
	public Tessere(String tessera, Date assign_date, Date last_use_date, long score, double valore,
			String codice_alternativo, String livello_listino, String livello_listino_successivo, double tot_fatturato,
			double differenza_x_listino_succ, String periodo_fatturato, String livello_tessera, Date data_scadenza,
			Set<StoricoTessere> storico) {
		super();
		this.tessera = tessera;
		this.assign_date = assign_date;
		this.last_use_date = last_use_date;
		this.score = score;
		this.valore = valore;
		this.codice_alternativo = codice_alternativo;
		this.livello_listino = livello_listino;
		this.livello_listino_successivo = livello_listino_successivo;
		this.tot_fatturato = tot_fatturato;
		this.differenza_x_listino_succ = differenza_x_listino_succ;
		this.periodo_fatturato = periodo_fatturato;
		this.livello_tessera = livello_tessera;
		this.data_scadenza = data_scadenza;
		this.storico = storico;
	}
	public Tessere() {
		
	}
	public String getTessera() {
		return tessera;
	}
	public void setTessera(String tessera) {
		this.tessera = tessera;
	}
	public Date getAssign_date() {
		return assign_date;
	}
	public void setAssign_date(Date assign_date) {
		this.assign_date = assign_date;
	}
	public Date getLast_use_date() {
		return last_use_date;
	}
	public void setLast_use_date(Date last_use_date) {
		this.last_use_date = last_use_date;
	}
	public long getScore() {
		return score;
	}
	public void setScore(long score) {
		this.score = score;
	}
	public double getValore() {
		return valore;
	}
	public void setValore(double valore) {
		this.valore = valore;
	}
	public String getCodice_alternativo() {
		return codice_alternativo;
	}
	public void setCodice_alternativo(String codice_alternativo) {
		this.codice_alternativo = codice_alternativo;
	}
	public String getLivello_listino() {
		return livello_listino;
	}
	public void setLivello_listino(String livello_listino) {
		this.livello_listino = livello_listino;
	}
	public String getLivello_listino_successivo() {
		return livello_listino_successivo;
	}
	public void setLivello_listino_successivo(String livello_listino_successivo) {
		this.livello_listino_successivo = livello_listino_successivo;
	}
	public double getTot_fatturato() {
		return tot_fatturato;
	}
	public void setTot_fatturato(double tot_fatturato) {
		this.tot_fatturato = tot_fatturato;
	}
	public double getDifferenza_x_listino_succ() {
		return differenza_x_listino_succ;
	}
	public void setDifferenza_x_listino_succ(double differenza_x_listino_succ) {
		this.differenza_x_listino_succ = differenza_x_listino_succ;
	}
	public String getPeriodo_fatturato() {
		return periodo_fatturato;
	}
	public void setPeriodo_fatturato(String periodo_fatturato) {
		this.periodo_fatturato = periodo_fatturato;
	}
	public String getLivello_tessera() {
		return livello_tessera;
	}
	public void setLivello_tessera(String livello_tessera) {
		this.livello_tessera = livello_tessera;
	}
	public Set<StoricoTessere> getStorico() {
		return storico;
	}
	public void setStorico(Set<StoricoTessere> storico) {
		this.storico = storico;
	}
	public Date getData_scadenza() {
		return data_scadenza;
	}
	public void setData_scadenza(Date data_scadenza) {
		this.data_scadenza = data_scadenza;
	}
}

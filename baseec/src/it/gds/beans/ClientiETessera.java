package it.gds.beans;

public class ClientiETessera {
	private long id;
	private long presentato_da;
	private String email;
	private String cod_referente;
	private String codfiscale;
	private String nome;
	private String password;
	private String cognome;
	private String indirizzo;
	private String localita;
	private String provincia;
	private String cap;
	private String telefono_a;
	private String telefono_c;
	private Boolean attivo;
	private Boolean privacy;
	private Boolean privacy_a;
	private Boolean privacy_b;
	private String d_nominativo;
	private String d_indirizzo;
	private String d_localita;
	private String d_provincia;
	private String d_cap;
	private String d_note;
	private String codice_controllo;
	private long id_listino;
	private long livello_registrazione;
	private long livello_amministrativo;
	private boolean abilita_contrassegno;
	private Clientidettagli dettagli;
	private Tessere ctessera;

	public ClientiETessera(long id, long presentato_da, String email, String cod_referente, String codfiscale,
			String nome, String password, String cognome, String indirizzo, String localita, String provincia,
			String cap, String telefono_a, String telefono_c, Boolean attivo, Boolean privacy, Boolean privacy_a,
			Boolean privacy_b, String d_nominativo, String d_indirizzo, String d_localita, String d_provincia,
			String d_cap, String d_note, String codice_controllo, long id_listino, long livello_registrazione,
			long livello_amministrativo, boolean abilita_contrassegno, Clientidettagli dettagli, Tessere ctessera) {
		super();
		this.id = id;
		this.presentato_da = presentato_da;
		this.email = email;
		this.cod_referente = cod_referente;
		this.codfiscale = codfiscale;
		this.nome = nome;
		this.password = password;
		this.cognome = cognome;
		this.indirizzo = indirizzo;
		this.localita = localita;
		this.provincia = provincia;
		this.cap = cap;
		this.telefono_a = telefono_a;
		this.telefono_c = telefono_c;
		this.attivo = attivo;
		this.privacy = privacy;
		this.privacy_a = privacy_a;
		this.privacy_b = privacy_b;
		this.d_nominativo = d_nominativo;
		this.d_indirizzo = d_indirizzo;
		this.d_localita = d_localita;
		this.d_provincia = d_provincia;
		this.d_cap = d_cap;
		this.d_note = d_note;
		this.codice_controllo = codice_controllo;
		this.id_listino = id_listino;
		this.livello_registrazione = livello_registrazione;
		this.livello_amministrativo = livello_amministrativo;
		this.abilita_contrassegno = abilita_contrassegno;
		this.dettagli = dettagli;
		this.ctessera = ctessera;
	}

	public ClientiETessera() {

	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getPresentato_da() {
		return presentato_da;
	}

	public void setPresentato_da(long presentato_da) {
		this.presentato_da = presentato_da;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCod_referente() {
		return cod_referente;
	}

	public void setCod_referente(String cod_referente) {
		this.cod_referente = cod_referente;
	}

	public String getCodfiscale() {
		return codfiscale;
	}

	public void setCodfiscale(String codfiscale) {
		this.codfiscale = codfiscale;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getLocalita() {
		return localita;
	}

	public void setLocalita(String localita) {
		this.localita = localita;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getTelefono_a() {
		return telefono_a;
	}

	public void setTelefono_a(String telefono_a) {
		this.telefono_a = telefono_a;
	}

	public String getTelefono_c() {
		return telefono_c;
	}

	public void setTelefono_c(String telefono_c) {
		this.telefono_c = telefono_c;
	}

	public Boolean getAttivo() {
		return attivo;
	}

	public void setAttivo(Boolean attivo) {
		this.attivo = attivo;
	}

	public Boolean getPrivacy() {
		return privacy;
	}

	public void setPrivacy(Boolean privacy) {
		this.privacy = privacy;
	}

	public Boolean getPrivacy_a() {
		return privacy_a;
	}

	public void setPrivacy_a(Boolean privacy_a) {
		this.privacy_a = privacy_a;
	}

	public Boolean getPrivacy_b() {
		return privacy_b;
	}

	public void setPrivacy_b(Boolean privacy_b) {
		this.privacy_b = privacy_b;
	}

	public String getD_nominativo() {
		return d_nominativo;
	}

	public void setD_nominativo(String d_nominativo) {
		this.d_nominativo = d_nominativo;
	}

	public String getD_indirizzo() {
		return d_indirizzo;
	}

	public void setD_indirizzo(String d_indirizzo) {
		this.d_indirizzo = d_indirizzo;
	}

	public String getD_localita() {
		return d_localita;
	}

	public void setD_localita(String d_localita) {
		this.d_localita = d_localita;
	}

	public String getD_provincia() {
		return d_provincia;
	}

	public void setD_provincia(String d_provincia) {
		this.d_provincia = d_provincia;
	}

	public String getD_cap() {
		return d_cap;
	}

	public void setD_cap(String d_cap) {
		this.d_cap = d_cap;
	}

	public String getD_note() {
		return d_note;
	}

	public void setD_note(String d_note) {
		this.d_note = d_note;
	}

	public String getCodice_controllo() {
		return codice_controllo;
	}

	public void setCodice_controllo(String codice_controllo) {
		this.codice_controllo = codice_controllo;
	}

	public long getId_listino() {
		return id_listino;
	}

	public void setId_listino(long id_listino) {
		this.id_listino = id_listino;
	}

	public long getLivello_registrazione() {
		return livello_registrazione;
	}

	public void setLivello_registrazione(long livello_registrazione) {
		this.livello_registrazione = livello_registrazione;
	}

	public long getLivello_amministrativo() {
		return livello_amministrativo;
	}

	public void setLivello_amministrativo(long livello_amministrativo) {
		this.livello_amministrativo = livello_amministrativo;
	}

	public boolean isAbilita_contrassegno() {
		return abilita_contrassegno;
	}

	public void setAbilita_contrassegno(boolean abilita_contrassegno) {
		this.abilita_contrassegno = abilita_contrassegno;
	}

	public Clientidettagli getDettagli() {
		return dettagli;
	}

	public void setDettagli(Clientidettagli dettagli) {
		this.dettagli = dettagli;
	}

	public Tessere getCtessera() {
		return ctessera;
	}

	public void setCtessera(Tessere ctessera) {
		this.ctessera = ctessera;
	}
}

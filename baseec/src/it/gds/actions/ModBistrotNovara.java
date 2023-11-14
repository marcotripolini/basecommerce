package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.lang.time.DateUtils;

import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

public class ModBistrotNovara extends ActionSupport implements Constants {
	private static final long serialVersionUID = 6097736121932028562L;
	HttpSession session = ServletActionContext.getRequest().getSession();
	List<ModBistrotNovara> primi = new ArrayList<ModBistrotNovara>();
	List<ModBistrotNovara> secondi = new ArrayList<ModBistrotNovara>();
	List<ModBistrotNovara> contorni = new ArrayList<ModBistrotNovara>();
	private String SUCCESS_NOMENU = "success_nomenu";
	private int num = 0;
	private String data;
	private String data_formattata;
	private Prodotti menu_completo;
	private Prodotti menu_primo;
	private Prodotti menu_secondo;
	private Prodotti menu_primo_contorno;
	private Prodotti menu_secondo_contorno;
	private Prodotti menu_primo_secondo;

	@SuppressWarnings({ "unchecked", "deprecation" })
	public String execute() {

		Date d = DateUtils.addDays(new Date(), num);
		data_formattata = new SimpleDateFormat("EEEE dd MMMM").format(d);
		String dt = new SimpleDateFormat("yyyy-MM-dd").format(d);

		if (data != null) {
			dt=data;
			try {
				d=new SimpleDateFormat("yyyy-MM-dd").parse(data);
				data_formattata = new SimpleDateFormat("EEEE dd MMMM").format(d);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		try {
			Session sx = HibernateUtil.getSessionFactory().openSession();
			Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );

			Query q_primi = sx.createQuery("from ModBistrotNovara where data = '"
					+ dt + "' and livello = 1");
			primi = (List<ModBistrotNovara>) q_primi.list();

			Statement stmt = null;
			ResultSet rs = null;

			Iterator it_primi = primi.iterator();
			{
				while (it_primi.hasNext()) {
					it.gds.beans.ModBistrotNovara object = (it.gds.beans.ModBistrotNovara) it_primi.next();
					String strsql = "select p_alpubblico_0 from prodotti where codice_gds= '" + object.getCodice_gds()
							+ "'";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(strsql);
					while (rs.next()) {
						object.setP_alpubblico_0(rs.getDouble("p_alpubblico_0"));
					}
					rs.close();
					stmt.close();
				}
			}
			Query q_secondi = sx.createQuery("from ModBistrotNovara where data = '"
					+ dt + "' and livello = 2");
			secondi = (List<ModBistrotNovara>) q_secondi.list();
			Iterator it_secondi = secondi.iterator();
			{
				stmt = null;
				rs = null;
				while (it_secondi.hasNext()) {
					it.gds.beans.ModBistrotNovara object = (it.gds.beans.ModBistrotNovara) it_secondi.next();
					String strsql = "select p_alpubblico_0, nome_immagine from prodotti where codice_gds= '" + object.getCodice_gds()
							+ "'";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(strsql);
					while (rs.next()) {
						object.setP_alpubblico_0(rs.getDouble("p_alpubblico_0"));
						object.setNome_immagine(rs.getString("nome_immagine"));

					}
					rs.close();
					stmt.close();
				}
			}
			Query q_contorni = sx.createQuery("from ModBistrotNovara where data = '"
					+ dt + "' and livello = 3");
			contorni = (List<ModBistrotNovara>) q_contorni.list();
			Iterator it_contorni = contorni.iterator();
			{
				stmt = null;
				rs = null;
				while (it_contorni.hasNext()) {
					it.gds.beans.ModBistrotNovara object = (it.gds.beans.ModBistrotNovara) it_contorni.next();
					String strsql = "select p_alpubblico_0 from prodotti where codice_gds= '" + object.getCodice_gds()
							+ "'";
					stmt = conn.createStatement();
					rs = stmt.executeQuery(strsql);
					while (rs.next()) {
						object.setP_alpubblico_0(rs.getDouble("p_alpubblico_0"));
					}
					rs.close();
					stmt.close();
				}
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (primi.size() > 1) {
			return SUCCESS;
		} else {
			return SUCCESS_NOMENU;
		}

	}

	public List<ModBistrotNovara> getPrimi() {
		return primi;
	}

	public void setPrimi(List<ModBistrotNovara> primi) {
		this.primi = primi;
	}

	public List<ModBistrotNovara> getSecondi() {
		return secondi;
	}

	public void setSecondi(List<ModBistrotNovara> secondi) {
		this.secondi = secondi;
	}

	public List<ModBistrotNovara> getContorni() {
		return contorni;
	}

	public void setContorni(List<ModBistrotNovara> contorni) {
		this.contorni = contorni;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getData_formattata() {
		return data_formattata;
	}

	public void setData_formattata(String data_formattata) {
		this.data_formattata = data_formattata;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Prodotti getMenu_completo() {
		if (menu_completo == null) {
			String codice_gds = Config.getMenuCompleto();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			menu_completo = (Prodotti) sx.get(Prodotti.class, codice_gds);
			sx.evict(menu_completo);
			sx.close();
		}
		return menu_completo;
	}

	public Prodotti getMenu_primo() {
		if (menu_primo== null) {
			String codice_gds = Config.getMenuPrimo();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			menu_primo = (Prodotti) sx.get(Prodotti.class, codice_gds);
			sx.evict(menu_primo);
			sx.close();
		}
		return menu_primo;
	}

	public Prodotti getMenu_secondo() {
		if (menu_secondo== null) {
			String codice_gds = Config.getMenuSecondo();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			menu_secondo= (Prodotti) sx.get(Prodotti.class, codice_gds);
			sx.evict(menu_secondo);
			sx.close();
		}
		return menu_secondo;
	}

	public Prodotti getMenu_primo_contorno() {
		if (menu_primo_contorno== null) {
			String codice_gds = Config.getMenuPrimoContorno();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			menu_primo_contorno= (Prodotti) sx.get(Prodotti.class, codice_gds);
			sx.evict(menu_primo_contorno);
			sx.close();
		}
		return menu_primo_contorno;
	}

	public Prodotti getMenu_secondo_contorno() {
		if (menu_secondo_contorno== null) {
			String codice_gds = Config.getMenuSecondoContorno();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			menu_secondo_contorno= (Prodotti) sx.get(Prodotti.class, codice_gds);
			sx.evict(menu_secondo_contorno);
			sx.close();
		}
		return menu_secondo_contorno;
	}

	public Prodotti getMenu_primo_secondo() {
		if (menu_primo_secondo== null) {
			String codice_gds = Config.getMenuPrimoSecondo();
			Session sx = HibernateUtil.getSessionFactory().openSession();
			menu_primo_secondo= (Prodotti) sx.get(Prodotti.class, codice_gds);
			sx.evict(menu_primo_secondo);
			sx.close();
		}
		return menu_primo_secondo;
	}
}

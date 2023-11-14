package it.gds.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Categorie;
import it.gds.beans.ClientiETessera;
import it.gds.beans.Marchi;
import it.gds.beans.Prodotti;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

public class loadProducts extends ActionSupport implements Constants {
	private static final long serialVersionUID = -3883599538912926748L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;
	private String cat;
	private String category;
	private String p;
	private ArrayList <Marchi> marchi = new ArrayList<Marchi>();
	private Integer qt = 0;
	private List<Prodotti> prodotti;
	private int start, stop;
	private String brfilter;
	private boolean continue_iter = true;
	private Boolean next;

	@SuppressWarnings("unchecked")
	public ArrayList<Marchi> getMarchi() {
		String str_marchi = "";
		Session sx = HibernateUtil.getSessionFactory().openSession();
		String strsql = " SELECT DISTINCT ID_MARCHIO FROM Prodotti INNER JOIN MARCHI "
		+ "WHERE prodotti.id_marchio = marchi.id "
		+ "AND (categoria_prodotto_cliente LIKE '" + getCat() + "') "
	    + "AND codice_gds in (" + getAllCodes() + ") "
	    + "AND visibile = true "
		+ "AND valido_dal <= '" + (new SimpleDateFormat("yyyy-MM-dd")).format(new Date()) + "' "
		+ "AND (valido_fino_al > '" + (new SimpleDateFormat("yyyy-MM-dd")).format(new Date()) + "' OR valido_fino_al IS NULL) ";

        Statement stmt = null;
        ResultSet rs = null;
        Connection conn = null;
        try {
    		conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );
            stmt = conn.createStatement();
            rs = stmt.executeQuery(strsql);
            while (rs.next()) {
                str_marchi += "" + (rs.getString("id_marchio").trim()) + ", ";
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

        try {
            if (str_marchi.length() > 1) {
	        	str_marchi = str_marchi.substring(0, str_marchi.length() -2 );
	    		Query q = sx.createQuery( "from Marchi m where id in (" + str_marchi + ") order by marchio");
	    		marchi = (ArrayList<Marchi>) q.list();
            }
    		conn.close();
    		sx.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return marchi;
	}

	public void setMarchi(ArrayList<Marchi> marchi) {
		this.marchi = marchi;
	}

	public String execute() {
//		try {
//			System.out.println("loadProducts execute " + new Date());
//			cli = (ClientiETessera) session.getAttribute("CLIENTE");
//			Session sx = HibernateUtil.getSessionFactory().openSession();
////			Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
////			Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );
//			if (getBrfilter() != null) {
//				String qq = HQL_PRODSBYCATBR.replace("_brands_", getBrfilter());
//				Query q = sx.createQuery(qq).setParameter("categoria_gds", getCat()).setDate("date", new Date());
//				q.setFirstResult(getStart());
//				q.setMaxResults(Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS()));
//				prodotti = (List<Prodotti>) q.list();
//			} else {
//				Query q = sx.createQuery(HQL_PRODSBYCAT.replace(":cod_gds", getAllCodes()));
//				q.setFirstResult(getStart());
//				q.setMaxResults(Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS()));
//				prodotti = (List<Prodotti>) q.setParameter("categoria_gds", getCat() + '%').setDate("date", new Date())
//						.list();
//			}
////			Iterator<Prodotti> it = prodotti.iterator();
////			while (it.hasNext()) {
////				Prodotti prod = (Prodotti) it.next();
////				prod.getTaglia(conn);
////				prod.getProperties(conn);
////			}
////			conn.close();
//			sx.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		if (cli == null)
			return SUCCESS_NOLOGIN;
		else
			return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public String executeMulti() {
		try {
			System.out.println("loadProducts executeMulti " + new Date());
			cli = (ClientiETessera) session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			if (getBrfilter() != null) {
				String qq = HQL_PRODSBYCATBR.replace("_brands_", getBrfilter());
				Query q = sx.createQuery(qq).setParameter("categoria_gds", getCat()).setDate("date", new Date());
				q.setFirstResult((qt - 1) * Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS()));
				q.setMaxResults(Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS()));
				prodotti = (List<Prodotti>) q.list();
			} else {
				Query q = sx.createQuery(HQL_PRODSBYCAT.replace(":cod_gds", getAllCodes()));
				q.setFirstResult((qt - 1) * Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS()));
				q.setMaxResults(Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS()));
				prodotti = (List<Prodotti>) q.setParameter("categoria_gds", getCat() + '%').setDate("date", new Date()).list();
				Query query = sx.createQuery("select count(*) " + HQL_PRODSBYCAT.replace(":cod_gds", getAllCodes()));
				query.setParameter("categoria_gds", getCat() + '%');
				query.setDate("date", new Date());
				Long count = (Long)query.uniqueResult();
				if (count > Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS())) {
					this.setNext(true);
				} else {
					this.setNext(false);
				}
			}
			sx.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (cli == null)
			return SUCCESS_NOLOGIN;
		else
			return SUCCESS;
	}

	@SuppressWarnings("unchecked")
	public synchronized String executeGetNewProds() {
		try {
			System.out.println("loadProducts executeGetNewProds " + new Date());
			cli = (ClientiETessera) session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			// Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
//			Connection conn = DriverManager.getConnection(Config.getJDBCCONNECTION(), Config.getJDBCUSER(), Config.getJDBPASSWORD() );
			String qq = HQL_PRODSBYNEW.replace(":cods", getAllCodes());
			Query q = sx.createQuery(qq).setDate("date", new Date());
			q.setFirstResult(getStart());
			q.setMaxResults(Integer.parseInt(it.gds.utils.Config.getMAX_RESULTS()));
			prodotti = (List<Prodotti>) q.list();
//			Iterator<Prodotti> it = prodotti.iterator();
//			while (it.hasNext()) {
//				Prodotti prod = (Prodotti) it.next();
//				// prod.getTaglia(conn);
//				prod.getProperties(conn);
//			}
//			conn.close();
			sx.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (cli == null)
			return SUCCESS_NOLOGIN;
		else
			return SUCCESS;
	}

	private String getAllCodes() {
		return (String) ServletActionContext.getServletContext().getAttribute(ALLCODES);
	}

	@SuppressWarnings("unchecked")
	public String executeSearch() {
		String query = HQL_SEARCHBYCOD.replace(":cods", getAllCodes());
		try {
			cli = (ClientiETessera) session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			List<Prodotti> pcheck;

			String qq = query;
			Query q = sx.createQuery(qq).setDate("date", new Date());
			q.setFirstResult(getStart());
			q.setMaxResults(12);
			prodotti = (List<Prodotti>) q.list();
			q = sx.createQuery(qq);
			q.setFirstResult(getStart() + Integer.parseInt(Config.getMAX_RESULTS()));
			q.setMaxResults(1);
			pcheck = (List<Prodotti>) q.setDate("date", new Date()).list();

			if (pcheck.size() == 0)
				continue_iter = false;
			sx.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (cli == null)
			return SUCCESS_NOLOGIN;
		else
			return SUCCESS;
	}

	public List<Prodotti> getProdotti() {
		return prodotti;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getStop() {
		return stop;
	}

	public void setStop(int stop) {
		this.stop = stop;
	}

	public boolean isContinue_iter() {
		return continue_iter;
	}

	public String getBrfilter() {
		return brfilter;
	}

	public void setBrfilter(String brfilter) {
		this.brfilter = brfilter;
	}

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

	public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	public String getCategory() {
		Session sx = HibernateUtil.getSessionFactory().openSession();
		category = ((Categorie) (sx.get(it.gds.beans.Categorie.class, getCat()))).getCategoria_2();
		sx.close();
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getQt() {
		return qt;
	}

	public void setQt(Integer qt) {
		this.qt = qt;
	}

	public Boolean getNext() {
		return next;
	}

	public void setNext(Boolean next) {
		this.next = next;
	}
}

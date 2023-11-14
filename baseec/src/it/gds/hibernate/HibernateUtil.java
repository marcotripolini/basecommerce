package it.gds.hibernate;

import org.hibernate.cfg.Configuration;
import org.hibernate.impl.SessionImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class HibernateUtil {
	private static final SessionFactory sessionFactory;

	static {
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (Throwable e) {
			System.err.println("Initial SessionFactory creation failed." + e);
			throw new ExceptionInInitializerError(e);
		}
	}

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void shutdown() {
		getSessionFactory().close();
	}

	public synchronized static void saveOrUpdate(Object o) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().setTimeout(10);
			session.getTransaction().begin();
			session.saveOrUpdate(o);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public synchronized static void delete(Object o) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			session.getTransaction().setTimeout(10);
			session.getTransaction().begin();
			session.delete(o);
			session.getTransaction().commit();
		} catch (RuntimeException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public synchronized static void directSQL(String sql) {
		// TODO AGGIUNGERE connessione JDBC SENZA CONVERSIONE HIBERNATE.
		// importante perchè la conversione della connessione esaurisce la memoria
		// ************************************************************************

		// Connection conn = ((SessionImpl) HibernateUtil.getSessionFactory().openSession()).connection();
		Connection conn = null;

		Statement stmt = null;
		try {
			conn = DriverManager.getConnection(
					it.gds.utils.Config.getJDBCCONNECTION(),
					it.gds.utils.Config.getJDBCUSER(),
					it.gds.utils.Config.getJDBPASSWORD());
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
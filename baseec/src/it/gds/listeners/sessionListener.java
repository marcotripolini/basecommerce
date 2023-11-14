package it.gds.listeners;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.hibernate.Session;
import it.gds.beans.Carrello;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;

public class sessionListener implements HttpSessionListener, Constants {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
//		try {
//			Session sx = HibernateUtil.getSessionFactory().openSession();
//			Carrello c = (Carrello) sx.get(Carrello.class, ((Carrello) event.getSession().getAttribute(CART)).getId());
//			event.getSession().setAttribute(CART, c);
//			sx.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		System.out.println("Sessione creata: " + event.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {

	}
}
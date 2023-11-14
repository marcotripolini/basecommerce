package it.gds.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Carrello;
import it.gds.beans.SpeseSped;
import it.gds.hibernate.HibernateUtil;
import it.gds.interfaces.Constants;
import it.gds.utils.Config;

@Action("buycart")
@Results({@Result(name="success", location="/buycart.jsp")})
public class BuyCartAction extends ActionSupport implements Constants {
	private static final long serialVersionUID = 1L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private HttpServletRequest request = ServletActionContext.getRequest();
	private Carrello c = (Carrello) session.getAttribute(CART);
	private String delivery;
	private String payment;
	private Double discount;

	public String execute() {

		SpeseSped ss = null;

		try {
			session.setAttribute("PAYMENT_TYPE", payment);

			if (delivery != null && payment != null) {
				System.out.println("consegna = " + delivery);
				System.out.println("pagamento = " + payment);
			}

			if (delivery != null) {
				Session sx = HibernateUtil.getSessionFactory().openSession();
				ss = (SpeseSped) sx.get(SpeseSped.class, Long.parseLong(delivery));
			}

			if (ss != null) {
				c.setSpesesped(ss);
			}
			System.out.println("totale = " + c.getTotale());

		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public Carrello getC() {
		return c;
	}

	public void setC(Carrello c) {
		this.c = c;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public Double getDiscount() {
		if (Config.getSCONTO_CARRELLO_PERC() > 0) {
			discount = Config.getSCONTO_CARRELLO_PERC().doubleValue();
		}else {
			discount = Config.getSCONTO_CARRELLO_PERC().doubleValue();
		}
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}
}

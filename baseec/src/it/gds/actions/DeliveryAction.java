package it.gds.actions;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.ClientiETessera;
import it.gds.beans.Comuni_serviti;
import it.gds.interfaces.Constants;
import it.gds.hibernate.HibernateUtil;

@Action("delivery")
@Results({@Result(name="success", location="/delivery.jsp")})
public class DeliveryAction extends ActionSupport implements Constants {
	private static final long serialVersionUID = 1L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private List<Comuni_serviti> cs;
	private ClientiETessera cli;

	@SuppressWarnings("unchecked")
	public String execute() {
		try {
			session.setAttribute(LASTURL, "delivery");
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			Session sx = HibernateUtil.getSessionFactory().openSession();
			cs = (List<Comuni_serviti>) sx.createQuery( HQL_COMUNISERVITI ).list();
			sx.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public List<Comuni_serviti> getCs() {
		return cs;
	}

	public ClientiETessera getCli() {
		return cli;
	}
}

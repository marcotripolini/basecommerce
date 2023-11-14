package it.gds.actions;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.ClientiETessera;
import it.gds.interfaces.Constants;

public class mailUs extends ActionSupport implements Constants {
	private static final long serialVersionUID = 6898286941720954662L;
	private HttpSession session = ServletActionContext.getRequest().getSession();
	private ClientiETessera cli;

	public String execute() {
		try {
			cli = (ClientiETessera)session.getAttribute("CLIENTE");
			if(cli == null)
				return SUCCESS_NOLOGIN;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}


}

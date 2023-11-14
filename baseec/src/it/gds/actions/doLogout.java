package it.gds.actions;

import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import it.gds.utils.Config;

public class doLogout extends ActionSupport {
	private static final long serialVersionUID = -405609729391966074L;
	public void tryLogout() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String jsessionid = (String) session.getAttribute("ID");
			if (Config.isDebug() == false) {
				if(!(jsessionid == (null))) {
					Properties p = (Properties) ServletActionContext.getServletContext().getAttribute("PROPERTIES");
					ServletActionContext.getResponse().sendRedirect(p.getProperty("identity_url") + "invalidate.action?jsessionid=" + jsessionid + "&url=" + p.getProperty("this_url"));
				} else {
					ServletActionContext.getResponse().sendRedirect("index.html?logout=error");
				}
				session.invalidate();
			} else {
				session.invalidate();
				ServletActionContext.getResponse().sendRedirect("index.html");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

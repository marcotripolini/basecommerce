package it.gds.actions;

import java.util.List;

import javax.servlet.ServletContext;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import it.gds.beans.Categorie;
import it.gds.interfaces.Constants;

public class GetCategories extends ActionSupport implements Constants {
	private static final long serialVersionUID = 7665516297437069334L;
	private List<Categorie> categorie;
	private List<Categorie> categorie_shop;

	public String execute() {
		ServletContext context = ServletActionContext.getServletContext();
		categorie = (List<Categorie>) context.getAttribute(CATEGORIE1);
		return SUCCESS;
	}

	public List<Categorie> getCategorie() {
		ServletContext context = ServletActionContext.getServletContext();
		categorie = (List<Categorie>) context.getAttribute(CATEGORIE1);
		return categorie;
	}

	public void setCategorie(List<Categorie> categorie) {
		this.categorie = categorie;
	}

	public List<Categorie> getCategorie_shop() {
		return categorie_shop;
	}

	public void setCategorie_shop(List<Categorie> categorie_shop) {
		this.categorie_shop = categorie_shop;
	}
}

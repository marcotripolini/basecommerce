package it.gds.actions;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

import it.gds.beans.Categorie;
import it.gds.interfaces.Constants;

public class loadAisle extends ActionSupport implements Constants {
	private static final long serialVersionUID = -7368817407357080634L;
	private String aisle;
	private Categorie categoria;
	private List<Categorie> categorie2;

	@SuppressWarnings("unchecked")
	public String execute() {

		try {

			List<Categorie> categorie_1 = (List<Categorie>) ServletActionContext.getServletContext().getAttribute(CATEGORIE1);
			List<Categorie> categorie_2 = (List<Categorie>) ServletActionContext.getServletContext().getAttribute(CATEGORIE2);

			Iterator it_1 = categorie_1.iterator();
			while (it_1.hasNext()) {
				Categorie categoria = (Categorie) it_1.next();
				if (categoria.getCategoria_gds().equals(aisle.substring(0, 6))) {
					this.categoria = categoria;
					break;
				}
			}

			Iterator it_2 = categorie_2.iterator();
			categorie2 = new ArrayList<Categorie>();

			while (it_2.hasNext()) {
				Categorie categoria = (Categorie) it_2.next();
				if (categoria.getCategoria_gds().startsWith(aisle.substring(0, 6))) {
					categorie2.add(categoria);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String getAisle() {
		return aisle;
	}

	public void setAisle(String aisle) {
		this.aisle = aisle;
	}

	public List<Categorie> getCategorie2() {
		return categorie2;
	}

	public Categorie getCategoria() {
		return categoria;
	}
}

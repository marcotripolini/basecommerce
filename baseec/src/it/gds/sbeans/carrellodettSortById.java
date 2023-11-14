package it.gds.sbeans;

import java.util.Comparator;

import it.gds.beans.Carrellodett;

public class carrellodettSortById implements Comparator<Carrellodett> {
	public int compare(Carrellodett d1, Carrellodett d2) {
		String c1 = d1.getCodice_prodotto();
		String c2 = d2.getCodice_prodotto();
		return c1.compareTo(c2);
	}
}

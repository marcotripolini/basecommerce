package it.gds.sbeans;

import java.util.Comparator;

import it.gds.beans.Marchi;

public class brandsSort implements Comparator<Marchi> {

	@Override
	public int compare(Marchi o1, Marchi o2) {
		// TODO Auto-generated method stub
		return o1.getMarchio().compareTo(o2.getMarchio());
	}

}

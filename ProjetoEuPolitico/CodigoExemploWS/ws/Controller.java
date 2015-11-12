package br.com.ws;

import java.util.ArrayList;

public class Controller {
	
	public ArrayList<ResulBuscaDeputado> getDeputados(){
		return new DeputadoDAO().getDeputados();
	}

}

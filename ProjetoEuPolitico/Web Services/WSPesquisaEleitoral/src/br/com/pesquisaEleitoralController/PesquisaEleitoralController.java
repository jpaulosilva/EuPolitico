package br.com.pesquisaEleitoralController;

import java.util.List;

import br.com.BDPesquisaEleitoral.PesquisaEleitoralResultado;
import br.com.consultaDAOPesquisaEleitoral.ConsultaDAO;

public class PesquisaEleitoralController {
	
	public List<PesquisaEleitoralResultado> getPesquisaEleitoral(){
		
		return new ConsultaDAO().getPesquisaEleitoral();
	}

}

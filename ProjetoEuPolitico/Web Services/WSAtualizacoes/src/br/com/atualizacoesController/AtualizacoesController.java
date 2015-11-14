package br.com.atualizacoesController;

import java.util.List;

import br.com.BDAtualizacoes.AtualizacoesResultado;
import br.com.BDAtualizacoes.PautaResultado;
import br.com.consultaDAOAtualizacoes.ConsultaDAO;

public class AtualizacoesController {
	
	public List<AtualizacoesResultado> getAtualizacoes(){
		
		return new ConsultaDAO().getAtualizacoes();
	}
	
	public List<PautaResultado> getPauta(){
		
		return new ConsultaDAO().getPauta();
	}

}

package br.com.estatisticasContoller;

import java.util.List;

import br.com.BDEstatisticas.EstatisticasCandidatosResultado;
import br.com.BDEstatisticas.EstatisticasEleitoradoResultado;
import br.com.BDEstatisticas.EstatisticasPoliticosResultado;
import br.com.consultaDAOEstatisticas.ConsultaDAO;

public class EstatisticasController {
	
	public List<EstatisticasCandidatosResultado> getEstatisticasCandidatos(){
		
		return new ConsultaDAO().getEstatisticasCandidatos();
	}
	
	public List<EstatisticasPoliticosResultado> getEstatisticasPoliticos() {
		
		return new ConsultaDAO().getEstatisticasPoliticos();
	}
	
	public List<EstatisticasEleitoradoResultado> getEstatisticasEleitorado() {
		
		return new ConsultaDAO().getEstatisticasEleitorado();
	}

}

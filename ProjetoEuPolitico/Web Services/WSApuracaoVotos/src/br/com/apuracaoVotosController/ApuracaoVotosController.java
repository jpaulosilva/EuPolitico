package br.com.apuracaoVotosController;

import java.util.List;

import br.com.BDApuracaoVotos.ApuracaoVotosResultado;
import br.com.consultaDAOApuracaoVotos.ConsultaDAO;

public class ApuracaoVotosController {
	
	public List<ApuracaoVotosResultado> getApuracaoVotos(){
		
		return new ConsultaDAO().getApuracaoVotos();
	}

}

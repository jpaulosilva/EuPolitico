package br.com.consultaDAOApuracaoVotos;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import br.com.BDApuracaoVotos.ApuracaoVotos;
import br.com.BDApuracaoVotos.ApuracaoVotosResultado;
import br.com.conexaoDAOApuracaoVotos.PMF;

public class ConsultaDAO {
	
	public List<ApuracaoVotosResultado> getApuracaoVotos() {

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(ApuracaoVotos.class);

		q.setOrdering("id asc");

		List<ApuracaoVotos> resultSet = null;
		List<ApuracaoVotosResultado> resultadoBusca = new ArrayList<>();

		try {
			resultSet = (List<ApuracaoVotos>) q.execute();

			if (!resultSet.isEmpty()) {
				for (ApuracaoVotos av : resultSet) {

					ApuracaoVotosResultado avr = new ApuracaoVotosResultado();

					avr.setId(av.getId());
					avr.setEstado(av.getEstado());
					avr.setCidade(av.getCidade());
					avr.setCargo(av.getCargo());
					avr.setNumeroCandidato(av.getNumeroCandidato());
					avr.setCandidato(av.getCandidato());
					avr.setNumeroVotos(av.getNumeroVotos());
					avr.setPorcentagemVotos(av.getPorcentagemVotos());

					resultadoBusca.add(avr);

				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}

		return resultadoBusca;
	}

}

package br.com.consultaDAOEstatisticas;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import br.com.BDEstatisticas.EstatisticasCandidatos;
import br.com.BDEstatisticas.EstatisticasCandidatosResultado;
import br.com.BDEstatisticas.EstatisticasEleitorado;
import br.com.BDEstatisticas.EstatisticasEleitoradoResultado;
import br.com.BDEstatisticas.EstatisticasPoliticos;
import br.com.BDEstatisticas.EstatisticasPoliticosResultado;
import br.com.conexaoDAOEstatisticas.PMF;

public class ConsultaDAO {
	
	public List<EstatisticasCandidatosResultado> getEstatisticasCandidatos() {

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(EstatisticasCandidatos.class);

		q.setOrdering("id asc");

		List<EstatisticasCandidatos> resultSet = null;
		List<EstatisticasCandidatosResultado> resultadoBusca = new ArrayList<>();

		try {
			resultSet = (List<EstatisticasCandidatos>) q.execute();

			if (!resultSet.isEmpty()) {
				for (EstatisticasCandidatos ec : resultSet) {

					EstatisticasCandidatosResultado ecr = new EstatisticasCandidatosResultado();

					ecr.setId(ec.getId());
					ecr.setEstado(ec.getEstado());
					ecr.setCidade(ec.getCidade());
					ecr.setCargo(ec.getCargo());
					ecr.setPartido(ec.getPartido());
					ecr.setTotalBens(ec.getTotalBens());
					ecr.setTotalDoacoes(ec.getTotalDoacoes());
					ecr.setGastosCampanha(ec.getGastosCampanha());

					resultadoBusca.add(ecr);

				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}

		return resultadoBusca;
	}
	
	public List<EstatisticasPoliticosResultado> getEstatisticasPoliticos() {

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(EstatisticasPoliticos.class);

		q.setOrdering("id asc");

		List<EstatisticasPoliticos> resultSet = null;
		List<EstatisticasPoliticosResultado> resultadoBusca = new ArrayList<>();

		try {
			resultSet = (List<EstatisticasPoliticos>) q.execute();

			if (!resultSet.isEmpty()) {
				for (EstatisticasPoliticos ep : resultSet) {

					EstatisticasPoliticosResultado epr = new EstatisticasPoliticosResultado();

					epr.setId(ep.getId());
					epr.setEstado(ep.getEstado());
					epr.setCidade(ep.getCidade());
					epr.setCargo(ep.getCargo());
					epr.setPartido(ep.getPartido());
					epr.setEscolaridadeEnsinoMedio(ep.getEscolaridadeEnsinoMedio());
					epr.setFaixaEtariaMedia(ep.getFaixaEtariaMedia());

					resultadoBusca.add(epr);

				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}

		return resultadoBusca;
	}
	
	public List<EstatisticasEleitoradoResultado> getEstatisticasEleitorado() {

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(EstatisticasEleitorado.class);

		q.setOrdering("id asc");

		List<EstatisticasEleitorado> resultSet = null;
		List<EstatisticasEleitoradoResultado> resultadoBusca = new ArrayList<>();

		try {
			resultSet = (List<EstatisticasEleitorado>) q.execute();

			if (!resultSet.isEmpty()) {
				for (EstatisticasEleitorado ee : resultSet) {

					EstatisticasEleitoradoResultado eer = new EstatisticasEleitoradoResultado();

					eer.setId(ee.getId());
					eer.setEstado(ee.getEstado());
					eer.setCidade(ee.getCidade());
					eer.setQtdEleitores(ee.getQtdEleitores());
					eer.setFaixaEtariaMedia(ee.getFaixaEtariaMedia());
					
					resultadoBusca.add(eer);

				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}

		return resultadoBusca;
	}



}

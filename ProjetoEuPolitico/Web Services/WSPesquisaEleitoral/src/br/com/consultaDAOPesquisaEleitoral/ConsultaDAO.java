package br.com.consultaDAOPesquisaEleitoral;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import br.com.BDPesquisaEleitoral.PesquisaEleitoral;
import br.com.BDPesquisaEleitoral.PesquisaEleitoralResultado;
import br.com.conexaoDAOPesquisaEleitoral.PMF;

public class ConsultaDAO {

	public List<PesquisaEleitoralResultado> getPesquisaEleitoral() {

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(PesquisaEleitoral.class);

		q.setOrdering("id asc");

		List<PesquisaEleitoral> resultSet = null;
		List<PesquisaEleitoralResultado> resultadoBusca = new ArrayList<>();

		try {
			resultSet = (List<PesquisaEleitoral>) q.execute();

			if (!resultSet.isEmpty()) {
				for (PesquisaEleitoral pe : resultSet) {

					PesquisaEleitoralResultado per = new PesquisaEleitoralResultado();

					per.setId(pe.getId());
					per.setEstado(pe.getEstado());
					per.setCidade(pe.getCidade());
					per.setCargo(pe.getCargo());
					per.setNumeroCandidato(pe.getNumeroCandidato());
					per.setNomeCandidato(pe.getNomeCandidato());
					per.setQtdVotos(pe.getQtdVotos());
					per.setInstitutoPesquisa(pe.getInstitutoPesquisa());

					resultadoBusca.add(per);

				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}

		return resultadoBusca;
	}

}

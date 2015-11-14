package br.com.consultaDAOAtualizacoes;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

import br.com.BDAtualizacoes.Atualizacoes;
import br.com.BDAtualizacoes.AtualizacoesResultado;
import br.com.BDAtualizacoes.Pauta;
import br.com.BDAtualizacoes.PautaResultado;
import br.com.conexaoDAOAtualizacoes.PMF;

public class ConsultaDAO {
	
	public List<AtualizacoesResultado> getAtualizacoes() {

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(Atualizacoes.class);

		q.setOrdering("id asc");

		List<Atualizacoes> resultSet = null;
		List<AtualizacoesResultado> resultadoBusca = new ArrayList<>();

		try {
			resultSet = (List<Atualizacoes>) q.execute();

			if (!resultSet.isEmpty()) {
				for (Atualizacoes atual : resultSet) {

					AtualizacoesResultado atualResultado = new AtualizacoesResultado();

					atualResultado.setId(atual.getId());
					atualResultado.setEstado(atual.getEstado());
					atualResultado.setCidade(atual.getCidade());
					atualResultado.setCargo(atual.getCargo());
					atualResultado.setPoliticoAcompanhado(atual.getPoliticoAcompanhado());
					atualResultado.setNovidades(atual.getNovidades());

					resultadoBusca.add(atualResultado);

				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}

		return resultadoBusca;
	}
	
	public List<PautaResultado> getPauta() {

		PersistenceManager pm = PMF.get().getPersistenceManager();

		Query q = pm.newQuery(Pauta.class);

		q.setOrdering("id asc");

		List<Pauta> resultSet = null;
		List<PautaResultado> resultadoBusca = new ArrayList<>();

		try {
			resultSet = (List<Pauta>) q.execute();

			if (!resultSet.isEmpty()) {
				for (Pauta p : resultSet) {

					PautaResultado pr = new PautaResultado();

					pr.setId(p.getId());
					pr.setAssunto(p.getAssunto());
					pr.setData(p.getData());
					pr.setHorario(p.getHorario());
					

					resultadoBusca.add(pr);

				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}

		return resultadoBusca;
	}



}

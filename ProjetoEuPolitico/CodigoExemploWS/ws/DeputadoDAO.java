package br.com.ws;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;

public class DeputadoDAO {
	
	public ArrayList<ResulBuscaDeputado> getDeputados() {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		Query q = pm.newQuery(Deputado.class);
		q.setOrdering("nome asc");
		
		List<Deputado> resultado = null;
		ArrayList<ResulBuscaDeputado> resultBusca = new ArrayList<>();
		
		try {
			resultado = (List<Deputado>) q.execute();
			
			if (!resultado.isEmpty()) {
				for (Deputado deputado : resultado) {
					
					ResulBuscaDeputado rb = new ResulBuscaDeputado();
					
					rb.setId(deputado.getId());
					rb.setNome(deputado.getNome());
					rb.setPartido(deputado.getPartido());
					resultBusca.add(rb);
				}
			}
		} finally {
			q.closeAll();
			pm.close();
		}
		return resultBusca;
	}

}

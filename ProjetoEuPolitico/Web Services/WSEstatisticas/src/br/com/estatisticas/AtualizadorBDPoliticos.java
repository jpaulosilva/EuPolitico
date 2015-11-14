package br.com.estatisticas;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.BDEstatisticas.EstatisticasPoliticos;
import br.com.conexaoDAOEstatisticas.PMF;

public class AtualizadorBDPoliticos extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		EstatisticasPoliticos ep = new EstatisticasPoliticos();
		
		ep.setId("1");
		ep.setEstado("RN");
		ep.setCidade("Natal");
		ep.setCargo("Senador");
		ep.setEscolaridadeEnsinoMedio(0.75);
		ep.setFaixaEtariaMedia(55.7);
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();

		try {
			pm.makePersistent(ep);
		} finally {
			pm.close();
		}

	}

}

package br.com.estatisticas;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.BDEstatisticas.EstatisticasEleitorado;
import br.com.conexaoDAOEstatisticas.PMF;

public class AtualizadorBDEleitorado extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		EstatisticasEleitorado ee = new EstatisticasEleitorado();
		
		ee.setId("1");
		ee.setEstado("PE");
		ee.setCidade("Recife");
		ee.setFaixaEtariaMedia(35.5);
		ee.setQtdEleitores(1_500_000);
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();

		try {
			pm.makePersistent(ee);
		} finally {
			pm.close();
		}


	}

}

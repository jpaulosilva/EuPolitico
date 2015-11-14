package br.com.pesquisaEleitoral;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.BDPesquisaEleitoral.PesquisaEleitoral;
import br.com.conexaoDAOPesquisaEleitoral.PMF;

public class AtualizadorBDPesquisaEleitoral extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PesquisaEleitoral pe = new PesquisaEleitoral();

		pe.setId("1");
		pe.setEstado("Pernambuco");
		pe.setCidade("Camaragibe");
		pe.setCargo("Deputado");
		pe.setNumeroCandidato("50");
		pe.setNomeCandidato("José de Abreu");
		pe.setQtdVotos("72340");
		pe.setInstitutoPesquisa("IBOPE");

		PersistenceManager pm = PMF.get().getPersistenceManager();

		try {
			pm.makePersistent(pe);
		} finally {
			pm.close();
		}
	}

}

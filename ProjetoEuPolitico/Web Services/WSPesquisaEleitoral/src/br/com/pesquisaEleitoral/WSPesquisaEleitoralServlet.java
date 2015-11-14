package br.com.pesquisaEleitoral;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.BDPesquisaEleitoral.PesquisaEleitoralResultado;
import br.com.pesquisaEleitoralController.PesquisaEleitoralController;

public class WSPesquisaEleitoralServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PesquisaEleitoralController controlador = new PesquisaEleitoralController();

		List<PesquisaEleitoralResultado> pesquisaTotal = controlador.getPesquisaEleitoral();

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(pesquisaTotal);

		ServletUtil.writeJSON(response, json);
	}

}

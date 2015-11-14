package br.com.apuracaoVotos;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.BDApuracaoVotos.ApuracaoVotosResultado;
import br.com.apuracaoVotosController.ApuracaoVotosController;

public class WSApuracaoVotosServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ApuracaoVotosController controlador = new ApuracaoVotosController();
		
		List<ApuracaoVotosResultado> apuracaoVotos = controlador.getApuracaoVotos();
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(apuracaoVotos);

		ServletUtil.writeJSON(response, json);

	}

}

package br.com.estatisticas;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.BDEstatisticas.EstatisticasPoliticosResultado;
import br.com.estatisticasContoller.EstatisticasController;

public class WSEstatisticasPoliticosServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		EstatisticasController controlador = new EstatisticasController();
		
		List<EstatisticasPoliticosResultado> estatisticasPoliticos = controlador.getEstatisticasPoliticos();
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(estatisticasPoliticos);

		ServletUtil.writeJSON(response, json);
	}

}

package br.com.ws;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.ws.ServletUtil;

public class BuscaDeputadoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	Controller controlador = new Controller();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<ResulBuscaDeputado> listaDeputados = controlador.getDeputados();
		
		Gson gson = new  GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(listaDeputados);
		
		ServletUtil.writeJSON(response, json);
	}
}

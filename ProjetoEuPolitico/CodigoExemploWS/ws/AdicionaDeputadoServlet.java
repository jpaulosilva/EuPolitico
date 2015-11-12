package br.com.ws;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdicionaDeputadoServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().print("Olá Servlet!");
		
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String partido = request.getParameter("partido");
		
		Deputado d = new Deputado();
		d.setId(id);
		d.setNome(nome);
		d.setPartido(partido);
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		try {
			pm.makePersistent(d);
		} finally {
			pm.close();
		}
		response.getWriter().println("Deputado: " + d.getNome() + " adicionando!");
	}
		
	

}

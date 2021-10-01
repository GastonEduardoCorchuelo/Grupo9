package co.edu.unbosque.ciclo3;

import java.io.IOException;
import java.util.ArrayList;

import javax.el.ValueExpression;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DemoServlet")
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DemoServlet() {
		super();
	}

	public void validarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Usuarios> lista = TestJSON.getJSON();
			request.setAttribute("lista", lista);
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			int respuesta = 0;
			for (Usuarios usuario : lista) {
				if (usuario.getEmail_usuario().equals(email) && usuario.getPassword().equals(pass)) {
					request.setAttribute("usuario", usuario);
					request.getRequestDispatcher("/Principal.jsp").forward(request, response);
					respuesta = 1;
				}
			}

			if (respuesta == 0) {
				request.getRequestDispatcher("/Inicio.jsp").forward(request, response);
				System.out.println("El usuario no se encuentra registrado.");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("login");
		if (accion.equals("Iniciar Sesión")) {
			this.validarUsuarios(request, response);
		}
	}
}
package co.edu.unbosque.ciclo3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	public void validarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Usuarios> lista = JSONUsuarios.getJSON();
			request.setAttribute("lista", lista);
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			int respuesta = 0;
			for (Usuarios usuario : lista) {
				if (usuario.getEmail_usuario().equals(email) && usuario.getPassword().equals(pass)) {
					request.setAttribute("usuario", usuario);
					RequestDispatcher dispatcher = request.getRequestDispatcher("Principal.jsp");
					dispatcher.forward(request, response);
					respuesta = 1;
				}
			}

			if (respuesta == 0) {
				String message = "Usuario o contraseña incorrectos.";
				request.setAttribute("message", message);
				RequestDispatcher dispatcher = request.getRequestDispatcher("Inicio.jsp");
				dispatcher.forward(request, response);
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
package co.edu.unbosque.ciclo3;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.edu.unbosque.ciclo3front.json.JSONUsuarios;
import co.edu.unbosque.ciclo3front.modelo.Usuarios;

/**
 * Servlet implementation class RegistroServlet
 */
@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistroServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			ArrayList<Usuarios> lista = JSONUsuarios.getJSON();
			Long cedula = Long.parseLong(request.getParameter("cedula"));
			String email = request.getParameter("email");
			String user = request.getParameter("usuario");
			boolean encontrado = false;

			for (Usuarios usuario : lista) {
				if (usuario.getCedula_usuario().equals(cedula) || usuario.getEmail_usuario().equals(email)
						|| usuario.getNombre_usuario().equals(user)) {
					encontrado = true;
					break;
				}
			}

			if (encontrado) {
				String message = "Ya existe un usuario registrado con la misma cédula, nombre de usuario o correo electrónico.";
				request.setAttribute("message", message);
				RequestDispatcher dispatcher = request.getRequestDispatcher("Registro.jsp");
				dispatcher.forward(request, response);
			} else {
				Usuarios usuario = new Usuarios();
				usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula")));
				usuario.setEmail_usuario(request.getParameter("email"));
				usuario.setNombre_usuario(request.getParameter("nombre"));
				usuario.setUsuario(request.getParameter("usuario"));
				usuario.setPassword(request.getParameter("password"));
				JSONUsuarios.postJSON(usuario);
				String message = "Usuario registrado exitosamente";
				request.setAttribute("message", message);
				RequestDispatcher dispatcher = request.getRequestDispatcher("Inicio.jsp");
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			throw new ServletException("Registro fallido", e);
		}
	}
}

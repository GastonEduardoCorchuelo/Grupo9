package co.edu.unbosque.ciclo3;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class ControladorUsuarios
 */
@WebServlet("/ControladorUsuarios")
public class ControladorUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorUsuarios() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		try {
			switch (action) {
			case "nuevo":
				nuevoFormulario(request, response);
				break;
			case "agregar":
				agregarUsuario(request, response);
				break;
			case "eliminar":
				eliminarUsuario(request, response);
				break;
			case "editar":
				nuevaEdicion(request, response);
				break;
			case "actualizar":
				actualizarUsuario(request, response);
				break;
			case "listar":
				listarUsuarios(request, response);
				break;
			default:
				listarUsuarios(request, response);
				break;
			}
		} catch (SQLException | ParseException ex) {
			throw new ServletException(ex);
		}
	}

	private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		ArrayList<Usuarios> lista = JSONUsuarios.getJSON();
		request.setAttribute("usuario", lista);
		RequestDispatcher dispatcher = request.getRequestDispatcher("usuarios.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevoFormulario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioUsuario.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevaEdicion(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		ArrayList<Usuarios> lista = JSONUsuarios.getJSON();
		request.setAttribute("usuario", lista);
		Long cedula = Long.parseLong(request.getParameter("cedula"));
		for (Usuarios usuario : lista) {
			if (usuario.getCedula_usuario().equals(cedula)) {
				request.setAttribute("usuario", usuario);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioUsuario.jsp");
		dispatcher.forward(request, response);

	}

	private void agregarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Usuarios usuario = new Usuarios();
		usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula")));
		usuario.setEmail_usuario(request.getParameter("email"));
		usuario.setNombre_usuario(request.getParameter("nombre"));
		usuario.setUsuario(request.getParameter("user"));
		usuario.setPassword(request.getParameter("password"));
		JSONUsuarios.postJSON(usuario);
		String message = "Usuario agregado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("usuarios.jsp");
		dispatcher.forward(request, response);
	}

	private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Usuarios usuario = new Usuarios();
		usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula")));
		usuario.setNombre_usuario(request.getParameter("nombre"));
		usuario.setEmail_usuario(request.getParameter("email"));
		usuario.setUsuario(request.getParameter("user"));
		usuario.setPassword(request.getParameter("password"));
		JSONUsuarios.putJSON(usuario, usuario.getCedula_usuario());
		String message = "Usuario actualizado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("usuarios.jsp");
		dispatcher.forward(request, response);
	}

	private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Long cedula = Long.parseLong(request.getParameter("cedula"));
		JSONUsuarios.deleteJSON(cedula);
		String message = "Usuario eliminado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("usuarios.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
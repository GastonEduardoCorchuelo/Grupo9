package co.edu.unbosque.ciclo3front.controlador;

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

import co.edu.unbosque.ciclo3front.json.JSONClientes;
import co.edu.unbosque.ciclo3front.modelo.Clientes;

@WebServlet("/ControladorClientes")
public class ControladorClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorClientes() {
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
				agregarCliente(request, response);
				break;
			case "eliminar":
				eliminarCliente(request, response);
				break;
			case "editar":
				nuevaEdicion(request, response);
				break;
			case "actualizar":
				actualizarCliente(request, response);
				break;
			case "listar":
				listarClientes(request, response);
				break;
			default:
				listarClientes(request, response);
				break;
			}
		} catch (SQLException | ParseException ex) {
			throw new ServletException(ex);
		}
	}

	private void listarClientes(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		ArrayList<Clientes> lista = JSONClientes.getJSON();
		request.setAttribute("cliente", lista);
		RequestDispatcher dispatcher = request.getRequestDispatcher("clientes.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevoFormulario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioCliente.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevaEdicion(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		ArrayList<Clientes> lista = JSONClientes.getJSON();
		Long cedula = Long.parseLong(request.getParameter("cedula"));
		for (Clientes cliente : lista) {
			if (cliente.getCedula_cliente().equals(cedula)) {
				request.setAttribute("cliente", cliente);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioCliente.jsp");
		dispatcher.forward(request, response);

	}

	private void agregarCliente(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Clientes cliente = new Clientes();
		cliente.setCedula_cliente(Long.parseLong(request.getParameter("cedula")));
		cliente.setDireccion_cliente(request.getParameter("direccion"));
		cliente.setEmail_cliente(request.getParameter("email"));
		cliente.setNombre_cliente(request.getParameter("nombre"));
		cliente.setTelefono_cliente(request.getParameter("telefono"));
		JSONClientes.postJSON(cliente);
		String message = "Cliente agregado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("clientes.jsp");
		dispatcher.forward(request, response);
	}

	private void actualizarCliente(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Clientes cliente = new Clientes();
		cliente.setCedula_cliente(Long.parseLong(request.getParameter("cedula")));
		cliente.setDireccion_cliente(request.getParameter("direccion"));
		cliente.setEmail_cliente(request.getParameter("email"));
		cliente.setNombre_cliente(request.getParameter("nombre"));
		cliente.setTelefono_cliente(request.getParameter("telefono"));
		JSONClientes.putJSON(cliente, cliente.getCedula_cliente());
		String message = "Cliente actualizado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("clientes.jsp");
		dispatcher.forward(request, response);
	}

	private void eliminarCliente(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Long cedula = Long.parseLong(request.getParameter("cedula"));
		JSONClientes.deleteJSON(cedula);
		String message = "Cliente eliminado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("clientes.jsp");
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

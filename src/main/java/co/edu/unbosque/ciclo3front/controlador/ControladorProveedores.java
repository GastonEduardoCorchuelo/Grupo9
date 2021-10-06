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

import co.edu.unbosque.ciclo3front.json.JSONProveedores;
import co.edu.unbosque.ciclo3front.modelo.Proveedores;


@WebServlet("/ControladorProveedores")
public class ControladorProveedores extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorProveedores() {
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
				agregarProveedor(request, response);
				break;
			case "eliminar":
				eliminarProveedor(request, response);
				break;
			case "editar":
				nuevaEdicion(request, response);
				break;
			case "actualizar":
				actualizarProveedor(request, response);
				break;
			case "listar":
				listarProveedores(request, response);
				break;
			default:
				listarProveedores(request, response);
				break;
			}
		} catch (SQLException | ParseException ex) {
			throw new ServletException(ex);
		}
	}

	private void listarProveedores(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		ArrayList<Proveedores> lista = JSONProveedores.getJSON();
		request.setAttribute("proveedor", lista);
		RequestDispatcher dispatcher = request.getRequestDispatcher("proveedores.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevoFormulario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioProveedor.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevaEdicion(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		ArrayList<Proveedores> lista = JSONProveedores.getJSON();
		request.setAttribute("proveedor", lista);
		Long nit = Long.parseLong(request.getParameter("nit"));
		for (Proveedores proveedor : lista) {
			if (proveedor.getNit_proveedor().equals(nit)) {
				request.setAttribute("proveedor", proveedor);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioProveedor.jsp");
		dispatcher.forward(request, response);

	}

	private void agregarProveedor(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Proveedores proveedor = new Proveedores();
		proveedor.setNit_proveedor(Long.parseLong(request.getParameter("nit")));
		proveedor.setNombre_proveedor(request.getParameter("nombre"));
		proveedor.setCiudad_proveedor(request.getParameter("ciudad"));
		proveedor.setDireccion_proveedor(request.getParameter("direccion"));
		proveedor.setTelefono_proveedor(request.getParameter("telefono"));
		JSONProveedores.postJSON(proveedor);
		String message = "Proveedor agregado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("proveedores.jsp");
		dispatcher.forward(request, response);
	}

	private void actualizarProveedor(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Proveedores proveedor = new Proveedores();
		proveedor.setNit_proveedor(Long.parseLong(request.getParameter("nit")));
		proveedor.setNombre_proveedor(request.getParameter("nombre"));
		proveedor.setCiudad_proveedor(request.getParameter("ciudad"));
		proveedor.setDireccion_proveedor(request.getParameter("direccion"));
		proveedor.setTelefono_proveedor(request.getParameter("telefono"));
		JSONProveedores.putJSON(proveedor, proveedor.getNit_proveedor());
		String message = "Proveedor actualizado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("proveedores.jsp");
		dispatcher.forward(request, response);
	}

	private void eliminarProveedor(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Long nit = Long.parseLong(request.getParameter("nit"));
		JSONProveedores.deleteJSON(nit);
		String message = "Proveedor eliminado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("proveedores.jsp");
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
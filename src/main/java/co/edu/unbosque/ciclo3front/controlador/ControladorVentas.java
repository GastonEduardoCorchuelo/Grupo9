package co.edu.unbosque.ciclo3front.controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;

import co.edu.unbosque.ciclo3front.json.JSONClientes;
import co.edu.unbosque.ciclo3front.json.JSONProductos;
import co.edu.unbosque.ciclo3front.json.JSONVentas;
import co.edu.unbosque.ciclo3front.modelo.Clientes;
import co.edu.unbosque.ciclo3front.modelo.Productos;
import co.edu.unbosque.ciclo3front.modelo.Ventas;

/**
 * Servlet implementation class ControladorUsuarios
 */
@WebServlet("/ControladorVentas")
public class ControladorVentas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControladorVentas() {
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
			case "agregar":
				agregarVenta(request, response);
				break;
			case "listar":
				listarVentas(request, response);
				break;
			case "consultar_cliente":
				consultarCliente(request, response);
				break;
			case "consultar_producto":
				consultarProducto(request, response);
				break;
			case "calcular_valor_producto":
				calcularValorVenta(request, response);
				break;
			default:
				listarVentas(request, response);
				break;
			}
		} catch (SQLException | ParseException ex) {
			throw new ServletException(ex);
		}
	}

	private void consultarCliente(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException, ServletException {
		ArrayList<Clientes> lista = JSONClientes.getJSON();
		if (request.getParameter("cedula").isEmpty()) {
			String message = "El campo de cédula no puede quedar vacío.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
			dispatcher.forward(request, response);
		}
		Long cedula = Long.parseLong(request.getParameter("cedula"));
		boolean encontrado = false;
		for (Clientes cliente : lista) {
			if (cliente.getCedula_cliente().equals(cedula)) {
				encontrado = true;
				request.setAttribute("cliente", cliente);
				break;
			}
		}
		if (!encontrado) {
			String message = "El cliente no se encuentra registrado.";
			request.setAttribute("message", message);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
		dispatcher.forward(request, response);
	}

	private void consultarProducto(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException, ServletException {
		ArrayList<Clientes> listaclientes = JSONClientes.getJSON();
		if (request.getParameter("ced").isEmpty()) {
			String message = "Debe buscar un cliente primero para asignarle la venta.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
			dispatcher.forward(request, response);
		}
		String nombre = request.getParameter("cliente");		
		for (Clientes cliente : listaclientes) {
			if (cliente.getNombre_cliente().equals(nombre)) {				
				request.setAttribute("cliente", cliente);
				break;
			}
		}
		ArrayList<Productos> listaproductos = JSONProductos.getJSON();
		if (request.getParameter("codigo").isEmpty()) {
			String message = "El campo de código del producto no puede quedar vacío.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
			dispatcher.forward(request, response);
		}
		Long codigo = Long.parseLong(request.getParameter("codigo"));
		boolean encontrado = false;
		for (Productos producto : listaproductos) {
			if (producto.getCodigo_producto().equals(codigo)) {
				encontrado = true;
				request.setAttribute("producto", producto);
				break;
			}
		}
		if (!encontrado) {
			String message = "El producto no se encuentra registrado.";
			request.setAttribute("message", message);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
		dispatcher.forward(request, response);

	}

	private void calcularValorVenta(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ParseException {
		if (request.getParameter("ced").isEmpty() || request.getParameter("cod").isEmpty()) {
			String message = "Primero debe buscar un cliente y un producto para realizar la operación";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
			dispatcher.forward(request, response);
		}
		if (request.getParameter("cantidad").isEmpty()) {
			String message = "El campo de cantidad no puede quedar vacío.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
			dispatcher.forward(request, response);
		}
		Double valor_producto = Double.parseDouble(request.getParameter("precio"));
		int cant = Integer.parseInt(request.getParameter("cantidad"));
		Double valor_venta = valor_producto * cant;
		Double iva_venta = (valor_producto * cant) * 0.19;
		Double total = valor_venta + iva_venta;
		request.setAttribute("cant", cant);
		request.setAttribute("valor_venta", valor_venta);
		request.setAttribute("iva_venta", iva_venta);
		request.setAttribute("total_venta", total);
		ArrayList<Clientes> listaclientes = JSONClientes.getJSON();
		Long cedula = Long.parseLong(request.getParameter("ced"));
		for (Clientes cliente : listaclientes) {
			if (cliente.getCedula_cliente().equals(cedula)) {
				request.setAttribute("cliente", cliente);
				break;
			}
		}
		ArrayList<Productos> listaproductos = JSONProductos.getJSON();
		Long codigo = Long.parseLong(request.getParameter("cod"));
		for (Productos producto : listaproductos) {
			if (producto.getCodigo_producto().equals(codigo)) {
				request.setAttribute("producto", producto);
				break;
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
		dispatcher.forward(request, response);
	}

	private void listarVentas(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		ArrayList<Ventas> lista = JSONVentas.getJSON();
		request.setAttribute("venta", lista);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
		dispatcher.forward(request, response);
	}

	private void agregarVenta(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		if (request.getParameter("ced").isEmpty() || request.getParameter("cod").isEmpty() || request.getParameter("cant").isEmpty() ) {
			String message = "Primero debe buscar un cliente, un producto y una cantidad para realizar la operación";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
			dispatcher.forward(request, response);
		}
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd HH:mm");
		LocalDateTime now = LocalDateTime.now();
		String fecha = dtf.format(now);
		Ventas venta = new Ventas();
		venta.setCedula_cliente(Long.parseLong(request.getParameter("ced")));
		venta.setNombre_cliente(request.getParameter("cliente"));
		venta.setNombre_producto(request.getParameter("nombre_producto"));
		venta.setCantidad_producto(Integer.parseInt(request.getParameter("cant")));
		venta.setValor_venta(Double.parseDouble(request.getParameter("valor_venta")));
		venta.setIva_venta(Double.parseDouble(request.getParameter("iva_venta")));
		venta.setTotal_venta(Double.parseDouble(request.getParameter("total_venta")));
		venta.setFecha(fecha);
		JSONVentas.postJSON(venta);
		String message = "Venta registrada exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ventas.jsp");
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

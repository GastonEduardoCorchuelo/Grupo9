package co.edu.unbosque.ciclo3front.controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;
import org.json.simple.parser.ParseException;

import co.edu.unbosque.ciclo3front.json.JSONProductos;
import co.edu.unbosque.ciclo3front.json.JSONProveedores;
import co.edu.unbosque.ciclo3front.modelo.Productos;
import co.edu.unbosque.ciclo3front.modelo.Proveedores;

@WebServlet("/ControladorProductos")
@MultipartConfig
public class ControladorProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ControladorProductos() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		try {
			switch (action) {
			case "nuevo":
				nuevoFormulario(request, response);
				break;
			case "agregar":
				agregarProducto(request, response);
				break;
			case "eliminar":
				eliminarProducto(request, response);
				break;
			case "editar":
				nuevaEdicion(request, response);
				break;
			case "actualizar":
				actualizarProducto(request, response);
				break;
			case "listar":
				listarProductos(request, response);
				break;
			case "enviar":
				cargarProducto(request, response);
				break;
			default:
				listarProductos(request, response);
				break;
			}
		} catch (SQLException | ParseException ex) {
			throw new ServletException(ex);
		}
	}

	private void cargarProducto(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, ParseException {

		boolean existearchivo = false;
		if (request.getPart("archivo").getSize() > 0) {
			existearchivo = true;
		}
		if (request.getPart("archivo").getSize() <= 0) {
			existearchivo = false;
		}
		if (!existearchivo) {
			String message = "Error: ningún archivo fue seleccionado.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
			dispatcher.forward(request, response);

		} else {
			Part filePart = request.getPart("archivo");
			InputStream fileContent = filePart.getInputStream();
			Reader in = new InputStreamReader(fileContent);
			final CSVFormat csvFormat = CSVFormat.Builder.create().setHeader().setSkipHeaderRecord(true).build();
			final Iterable<CSVRecord> elementos = csvFormat.parse(in);

			ArrayList<Productos> lista = JSONProductos.getJSON();
			ArrayList<Long> listacodigos = new ArrayList<>();
			for (Productos producto : lista) {
				listacodigos.add(producto.getCodigo_producto());
			}
			ArrayList<Proveedores> listaproveedores = JSONProveedores.getJSON();
			ArrayList<Long> listanit = new ArrayList<>();
			for (Proveedores proveedor : listaproveedores) {
				listanit.add(proveedor.getNit_proveedor());
			}
			try {
				for (CSVRecord elemento : elementos) {
					Long codigo = Long.parseLong(elemento.get("codigo_producto"));
					String nombre = elemento.get("nombre_producto");
					Double preciocompra = Double.parseDouble(elemento.get("precio_compra"));
					Double precioventa = Double.parseDouble(elemento.get("precio_venta"));
					Double iva = Double.parseDouble(elemento.get("iva_compra"));
					Long nit = Long.parseLong(elemento.get("nit_proveedor"));
					Productos producto = new Productos();
					if (listacodigos.contains(codigo) || !listanit.contains(nit)) {
						continue;
					} else {
						producto.setCodigo_producto(codigo);
						producto.setNombre_producto(nombre);
						producto.setPrecio_compra(preciocompra);
						producto.setPrecio_venta(precioventa);
						producto.setIva_compra(iva);
						producto.setNit_proveedor(nit);
						JSONProductos.postJSON(producto);
					}
				}
				String message = "Lista de productos agregada exitosamente.\nAviso: Puede que uno o más productos no se hayan añadido si tenían un código ya existente en la base de datos o si tenían un NIT no registrado.";
				request.setAttribute("message", message);
			} catch (Exception e) {
				String message = "Error al agregar la lista: Uno o más elementos no fueron compatibles.";
				request.setAttribute("message", message);
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void listarProductos(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		ArrayList<Productos> lista = JSONProductos.getJSON();
		request.setAttribute("producto", lista);
		RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevoFormulario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioProducto.jsp");
		dispatcher.forward(request, response);
	}

	private void nuevaEdicion(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException, ParseException {
		ArrayList<Productos> lista = JSONProductos.getJSON();
		Long codigo = Long.parseLong(request.getParameter("codigo"));
		for (Productos producto : lista) {
			if (producto.getCodigo_producto().equals(codigo)) {
				request.setAttribute("producto", producto);
			}
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("FormularioProducto.jsp");
		dispatcher.forward(request, response);

	}

	private void agregarProducto(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		ArrayList<Productos> listaproductos = JSONProductos.getJSON();
		Long codigo = Long.parseLong(request.getParameter("codigo"));
		ArrayList<Proveedores> listaproveedores = JSONProveedores.getJSON();
		Long nit = Long.parseLong(request.getParameter("nit"));
		boolean nitencontrado = false;
		for (Proveedores proveedor : listaproveedores) {
			if (proveedor.getNit_proveedor().equals(nit)) {
				nitencontrado = true;
				break;
			}
		}
		boolean encontrado = false;
		for (Productos producto : listaproductos) {
			if (producto.getCodigo_producto().equals(codigo)) {
				encontrado = true;
				break;
			}
		}
		if (encontrado) {
			String message = "Ya existe un producto registrado con ese código";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
			dispatcher.forward(request, response);
		} else if (!nitencontrado) {
			String message = "No existe un proveedor registrado en la base de datos con el NIT indicado.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
			dispatcher.forward(request, response);
		} else {
			Productos producto = new Productos();
			producto.setCodigo_producto(Long.parseLong(request.getParameter("codigo")));
			producto.setNombre_producto(request.getParameter("nombre"));
			producto.setPrecio_compra(Double.parseDouble(request.getParameter("preciocompra")));
			producto.setPrecio_venta(Double.parseDouble(request.getParameter("precioventa")));
			producto.setIva_compra(Double.parseDouble(request.getParameter("iva")));
			producto.setNit_proveedor(Long.parseLong(request.getParameter("nit")));
			JSONProductos.postJSON(producto);
			String message = "Producto agregado exitosamente";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, ParseException {
		ArrayList<Proveedores> listaproveedores = JSONProveedores.getJSON();
		Long nit = Long.parseLong(request.getParameter("nit"));
		boolean nitencontrado = false;
		for (Proveedores proveedor : listaproveedores) {
			if (proveedor.getNit_proveedor().equals(nit)) {
				nitencontrado = true;
				break;
			}
		}
		if (!nitencontrado) {
			String message = "No existe un proveedor registrado en la base de datos con el NIT indicado.";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
			dispatcher.forward(request, response);
		} else {
			Productos producto = new Productos();
			producto.setCodigo_producto(Long.parseLong(request.getParameter("codigo")));
			producto.setNombre_producto(request.getParameter("nombre"));
			producto.setPrecio_compra(Double.parseDouble(request.getParameter("preciocompra")));
			producto.setPrecio_venta(Double.parseDouble(request.getParameter("precioventa")));
			producto.setIva_compra(Double.parseDouble(request.getParameter("iva")));
			producto.setNit_proveedor(Long.parseLong(request.getParameter("nit")));
			JSONProductos.putJSON(producto, producto.getCodigo_producto());
			String message = "Producto actualizado exitosamente";
			request.setAttribute("message", message);
			RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		Long codigo = Long.parseLong(request.getParameter("codigo"));
		JSONProductos.deleteJSON(codigo);
		String message = "Producto eliminado exitosamente";
		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("productos.jsp");
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

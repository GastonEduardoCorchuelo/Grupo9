package co.edu.unbosque.ciclo3;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controlador() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String menu = request.getParameter("menu");
		String accion = request.getParameter("accion");

		switch (menu) {
		case "usuarios":
			if (accion.equals("Listar")) {
				request.getRequestDispatcher("usuarios.jsp").forward(request, response);
			} else if (accion.equals("Agregar")) {
				Usuarios usuario = new Usuarios();
				usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula")));
				usuario.setNombre_usuario(request.getParameter("nombre"));
				usuario.setEmail_usuario(request.getParameter("email"));
				usuario.setUsuario(request.getParameter("usuario"));
				usuario.setPassword(request.getParameter("password"));

				int respuesta = 0;
				try {
					respuesta = TestJSON.postJSON(usuario);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=usuarios&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Actualizar")) {
				try {
					ArrayList<Usuarios> lista = TestJSON.getJSON();
					request.setAttribute("lista", lista);
				} catch (Exception e) {
					e.printStackTrace();
				}
				Usuarios usuario = new Usuarios();
				usuario.setCedula_usuario(Long.parseLong(request.getParameter("cedula")));
				usuario.setNombre_usuario(request.getParameter("nombre"));
				usuario.setEmail_usuario(request.getParameter("email"));
				usuario.setUsuario(request.getParameter("usuario"));
				usuario.setPassword(request.getParameter("password"));

				int respuesta = 0;
				try {
					respuesta = TestJSON.putJSON(usuario, usuario.getCedula_usuario());
					PrintWriter write = response.getWriter();

					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=Usuarios&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Editar")) {
				Long cedula_usuario = Long.parseLong(request.getParameter("cedula_usuario"));
				try {
					ArrayList<Usuarios> lista1 = TestJSON.getJSON();
					System.out.println("Parametro: " + cedula_usuario);
					for (Usuarios usuarios : lista1) {
						if (usuarios.getCedula_usuario() == cedula_usuario) {
							request.setAttribute("usuarioSeleccionado", usuarios);
							request.getRequestDispatcher("Controlador?menu=usuarios&accion=Listar").forward(request,
									response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (accion.equals("Eliminar")) {
				Long cedula_usuario = Long.parseLong(request.getParameter("cedula_usuario"));
				int respuesta = 0;
				try {
					respuesta = TestJSON.deleteJSON(cedula_usuario);
					PrintWriter write = response.getWriter();
					if (respuesta == 200) {
						request.getRequestDispatcher("Controlador?menu=usuarios&accion=Listar").forward(request,
								response);
					} else {
						write.println("Error: " + respuesta);
					}
					write.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.getRequestDispatcher("/usuarios.jsp").forward(request, response);
				break;
			}
		case "clientes":
			request.getRequestDispatcher("/clientes.jsp").forward(request, response);
			break;
		case "proveedores":
			request.getRequestDispatcher("/proveedores.jsp").forward(request, response);
			break;
		case "productos":
			request.getRequestDispatcher("/productos.jsp").forward(request, response);
			break;
		case "ventas":
			request.getRequestDispatcher("/ventas.jsp").forward(request, response);
			break;
		case "reportes":
			request.getRequestDispatcher("/reportes.jsp").forward(request, response);
			break;
		case "informacion":
			request.getRequestDispatcher("/informacion.jsp").forward(request, response);
			break;
		}

	}
}

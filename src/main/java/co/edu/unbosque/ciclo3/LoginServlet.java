package co.edu.unbosque.ciclo3;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		LoginDAO loginDao = new LoginDAO();

		try {
			Usuario usuario = loginDao.validar(email, password);
			String destPage = "/JSP/index.jsp";

			if (usuario != null) {
				HttpSession session = request.getSession();
				session.setAttribute("usuario", usuario);
				destPage = "/JSP/inicio.jsp";
			} else {
				String message = "Correo o contraseña no válidos.";
				request.setAttribute("message", message);
			}

			RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
			dispatcher.forward(request, response);

		} catch (SQLException | ClassNotFoundException ex) {
			throw new ServletException(ex);
		}
	}
}

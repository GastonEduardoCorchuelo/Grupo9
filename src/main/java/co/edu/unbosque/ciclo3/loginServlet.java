package co.edu.unbosque.ciclo3;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("username");
        String contrasena = request.getParameter("password");
         
        System.out.println("Usuario: " + usuario);
        System.out.println("Contraseña: " + contrasena);
 
        PrintWriter writer = response.getWriter();
         
        String respuestaHTML = "<html>";
        respuestaHTML += "<h2>Nombre de usuario: " + usuario + "<br/>";      
        respuestaHTML += "Contraseña: " + contrasena + "</h2>";    
        respuestaHTML += "</html>";
        
        writer.println(respuestaHTML);
	}

}

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String cedula = request.getParameter("cedula");
String nombres = request.getParameter("nombres");
String email = request.getParameter("email");
String usuario = request.getParameter("usuario");
String password = request.getParameter("password");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/tiendagenerica?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
	"root", "8Q[J_.9pF9wU#=pf");
	Statement st = conn.createStatement();
	int i = st.executeUpdate(
	"insert into usuarios(cedula_usuario,nombre_usuario,email_usuario,usuario,password)values("
			+ cedula + ",'" + nombres + "','" + email + "','" + usuario + "','" + password
			+ "')");
	out.println("Gracias por registrarte!</br><a href='Inicio.jsp'>Inicia sesión</a> para continuar.");

} catch (java.sql.SQLIntegrityConstraintViolationException e) {
	out.println("El usuario ya se encuentra registrado.");
	out.println("</br><a href='Registro.jsp'>Volver a la pantalla de registro.</a>");
}
%>
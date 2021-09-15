<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Genérica</title>
</head>
<body>
	<h1>Tienda genérica</h1>
	<h2>Registro de usuario</h2>
	<form name="loginForm" method="post" action="../loginServlet">
			<input type="text" placeholder="Usuario" name="username" required><br><br>
			<input type="password" placeholder="Contraseña" name="password" required><br><br>
			<input type="submit" value="Entrada" />
			<input type="checkbox" checked="checked"> Recordar usuario
			<a href="#"> Olvidé mi contraseña </a>
	</form>
</body>
</html>
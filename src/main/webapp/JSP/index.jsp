<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Gen�rica</title>
<meta name="viewport"
	content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">

</head>
<body>
	<form class="formulario" method="post" action="${pageContext.request.contextPath }/LoginServlet">

		<h1>Inicio de Sesi�n</h1>
		<div class="contenedor">

			${message}<br>
			<div class="input-contenedor">
				<i class="fas fa-envelope icon"></i> <input name="email" type="text"
					placeholder="Correo electr�nico" required>
			</div>

			<div class="input-contenedor">
				<i class="fas fa-key icon"></i> <input name="password"
					type="password" placeholder="Contrase�a" required>
			</div>

			<input type="submit" value="Iniciar Sesi�n" class="button">
			<p>
				�No tienes una cuenta? <a class="link" href="Registro.jsp">Reg�strate
				</a>
			</p>
		</div>
	</form>
</body>
</html>

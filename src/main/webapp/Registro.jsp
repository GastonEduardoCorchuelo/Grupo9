<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro - Tienda Equipo 9</title>
<meta name="viewport"
	content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" type="text/css" href="./style.css">


</head>
<body>
	<form class="formulario" action="RegistroServlet" method="post">

		<h1>Registrate</h1>
		
		<p>${message}</p>
		
		<div class="contenedor">		
			<div class="input-contenedor">
			
				<i class="fas fa-address-card icon"></i>
				<input type="number" name="cedula" placeholder="C�dula" required>
			</div>

			<div class="input-contenedor">
			
				<i class="fas fa-user icon"></i>
				<input type="text" name="nombre" placeholder="Nombres completos" required>
			</div>

			<div class="input-contenedor">
			
				<i class="fas fa-envelope icon"></i>
				<input type="email" name="email" placeholder="Correo Electr�nico" required>
			</div>
					
			<div class="input-contenedor">
			
				<i class="fas fa-user-circle icon"></i>
				<input type="text" name="usuario" placeholder="Usuario" required>
			</div>

			<div class="input-contenedor">
			
				<i class="fas fa-key icon"></i>
				<input type="password" name="password" placeholder="Contrase�a" required>
			</div>
			
			<input type="submit" value="Registrar" class="button">
			
			<p>Al registrarte, aceptas nuestras Condiciones de uso y Pol�tica
				de privacidad.</p>
			<p>�Ya tienes una cuenta? <a class="link" href="Inicio.jsp">Inicia Sesi�n</a>
			</p>
			
		</div>
	</form>
</body>
</html>
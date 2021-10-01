<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro</title>
<meta name="viewport"
	content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">


</head>
<body>
	<form class="formulario" action="Registro-Proceso.jsp" method="post">

		<h1>Registrate</h1>
		<div class="contenedor">
		
			<div class="input-contenedor">
				<i class="fas fa-address-card icon"></i> <input type="text" name="cedula"
					placeholder="Cédula" required>
			</div>

			<div class="input-contenedor">
				<i class="fas fa-user icon"></i> <input type="text" name="nombres"
					placeholder="Nombres completos" required>
			</div>

			<div class="input-contenedor">
				<i class="fas fa-envelope icon"></i> <input type="text" name="email"
					placeholder="Correo Electrónico" required>
			</div>
					
			<div class="input-contenedor">
				<i class="fas fa-user-circle icon"></i> <input type="text" name="usuario"
					placeholder="Usuario" required>
			</div>

			<div class="input-contenedor">
				<i class="fas fa-key icon"></i> <input type="password" name="password"
					placeholder="Contraseña" required>
			</div>
			
			<input type="submit" value="Registrar" class="button">
			<p>Al registrarte, aceptas nuestras Condiciones de uso y Política
				de privacidad.</p>
			<p>
				¿Ya tienes una cuenta? <a class="link" href="index.jsp">Inicia
					Sesion</a>
			</p>
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Página principal - Tienda genérica</title>
</head>
<body>
	<h1>Bienvenido a Tienda Genérica</h1>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item"><a style="margin-left: 6px; border: none"
					class="btn btn-outline-light px-4" href="Principal.jsp">Home</a></li>
				<li class="nav-item"><a style="margin-left: 7px; border: none"
					class="btn btn-outline-light px-5" href="usuarios.jsp"
					target="myFrame">Usuarios</a></li>
				<li class="nav-item"><a style="margin-left: 7px; border: none"
					class="btn btn-outline-light px-5" href="clientes.jsp"
					target="myFrame">Clientes</a></li>
				<li class="nav-item"><a style="margin-left: 7px; border: none"
					class="btn btn-outline-light px-5" href="productos.jsp"
					target="myFrame">Productos</a></li>
				<li class="nav-item"><a style="margin-left: 7px; border: none"
					class="btn btn-outline-light px-5" href="ventas.jsp"
					target="myFrame">Ventas</a></li>
				<li class="nav-item"><a style="margin-left: 7px; border: none"
					class="btn btn-outline-light px-5" href="proveedores.jsp"
					target="myFrame">Proveedores</a></li>
				<li class="nav-item"><a style="margin-left: 7px; border: none"
					class="btn btn-outline-light px-5" href="reportes.jsp"
					target="myFrame">Reportes</a></li>
				<li class="nav-item"><a style="margin-left: 7px; border: none"
					class="btn btn-outline-light px-3" href="informacion.jsp"
					target="myFrame">Acerca de</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">${usuario.nombre_usuario}</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="Inicio.jsp">Cerrar Sesión</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<div class="m-4" style="height: 550px;">
		<iframe style="height: 100%; width: 100%; border: none" name="myFrame"></iframe>
	</div>
</body>
</html>
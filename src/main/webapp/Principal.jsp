<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Generica - Página principal</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
</head>
<body>
	<h1>Bienvenido a Tienda Genérica</h1>
	<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
		<div class="container-fluid">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item"><a style="margin-left: 6px; border: none"
					class="btn btn-outline-light px-4" href="Controlador?menu=Principal"
					target="myFrame">Home</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light px-5"
					href="Controlador?menu=usuarios&accion=Listar" target="myFrame">Usuarios</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light px-5"
					href="Controlador?menu=clientes&accion=Listar" target="myFrame">Clientes</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light px-5"
					href="Controlador?menu=productos&accion=Listar" target="myFrame">Productos</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light px-5"
					href="Controlador?menu=ventas&accion=Listar" target="myFrame">Ventas</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light px-5"
					href="Controlador?menu=proveedores&accion=Listar" target="myFrame">Proveedores</a>
				</li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light px-5"
					href="Controlador?menu=reportes&accion=Listar" target="myFrame">Reportes</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light px-3"
					href="Controlador?menu=informacion&accion=Listar" target="myFrame">Acerca de</a></li>
			</ul>
		</div>
		<div class="dropdown">
			<button class="btn btn-outline-light dropdown-toggle px-5" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false">${usuario.getNombre_usuario()}</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<a class="dropdown-item" href="#">${usuario.getUsuario()}</a> <a
					class="dropdown-item" href="#">${usuario.getEmail_usuario()}</a>
				<div class="dropdown-divider"></div>
				<form class="dropdown-item" method="POST" action="#">
					<button class="btn btn-danger center-block" type="submit"
						name="accion" value="Salir">Cerrar Sesion</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="m-4" style="height: 550px;">
		<iframe style="height: 100%; width: 100%; border: none" name="myFrame"></iframe>
	</div>
</body>
</html>
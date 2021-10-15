<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página principal - Tienda Equipo 9</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<link rel="stylesheet" type="text/css" href="./style1.css">
</head>
<body>

	<header>
		<a href="#" class="logo">TIENDA GENERICA</a>
		<div class="image">
			<img src="./misiontic.png" alt="">
		</div>
		<nav class="navbar">
		  <a href="./Principal.jsp">Inicio</a>
		  <a href="./usuarios.jsp" target="myFrame">Usuarios</a>
		  <a href="./clientes.jsp"target="myFrame">Clientes</a>
		  <a href="./proveedores.jsp"target="myFrame">Proveedores</a>
		  <a href="./productos.jsp"target="myFrame">Productos</a>			
		  <a href="./ventas.jsp"target="myFrame">Ventas</a>
		  <a href="./informacion.jsp"target="myFrame">Acerca de</a>
			
			<div  aria-labelledby="navbarDropdown">
			<a class="dropdown-item" href="Inicio.jsp">Cerrar Sesión</a>
			</div>
		</nav>
	</header>
	<div class="m-4" style="height: 550px;">
		<iframe style="height: 100%; width: 100%; border: none" name="myFrame"></iframe>
	</div>
</body>

</html>
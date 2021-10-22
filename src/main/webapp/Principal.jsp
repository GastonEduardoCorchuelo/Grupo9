<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página principal - Tienda Equipo 9</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css">
<link rel="stylesheet" type="text/css" href="Styles.css">
</head>
<body>
	<div class="topnav">
		<p>
			<b>Tienda Equipo 9</b>
		</p>
		<a class="logo" href="ControladorUsuarios?action=principal&username=${usuario.nombre_usuario}"><img alt="minticlogo"
			src="misiontic.png"></a>
		<a href="usuarios.jsp" target="myFrame">Usuarios</a>
		<a href="clientes.jsp" target="myFrame">Clientes</a>
		<a href="proveedores.jsp" target="myFrame">Proveedores</a>
		<a href="productos.jsp" target="myFrame">Productos</a>
		<a href="ventas.jsp" target="myFrame">Ventas</a>
		<a href="informacion.jsp" target="myFrame">Acerca de</a>

		<div class="dropdown">
			<div class="dropbtn">${usuario.nombre_usuario}</div>
			<div class="dropdown-content">
				<a href="Inicio.jsp">Cerrar Sesión</a>
			</div>
		</div>
	</div>
	<div class="m-4" style="height: 550px;">
		<iframe style="height: 100%; width: 100%; border: none" name="myFrame"></iframe>
	</div>
</body>
</html>
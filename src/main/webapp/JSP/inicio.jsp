<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Genérica</title>
</head>
<body>
	<h1>Tienda Generica</h1>
	<div style="text-align: center">
			<h1>Bienvenido a la página de inicio</h1>
			<b>${usuario.usuario} | (${usuario.email})</b> <br> <br> <a
				href="${pageContext.request.contextPath }/LogoutServlet">Cerrar sesión</a>
	</div>
	<div class="links-pages">
		<ul>
			<li><a href="../usuarios/usuarios.jsp">Usuarios</a></li>
			<li><a href="../clientes/clientes.jsp">Clientes</a></li>
			<li><a href="../proveedores/proveedores.jsp">Proveedores</a></li>
			<li><a href="../productos/productos.jsp">Productos</a></li>
			<li><a href="../ventas/ventas.jsp">Ventas</a></li>
			<li><a href="../aeportes/reportes.jsp">Reportes</a></li>
			<li><a href="../acerca_de/informacion.jsp">Acerca de</a></li>
		</ul>
	</div>

	<form method="get" action="/inicio.jsp">
		<table>
			<tr>
				<td><label>Cedula:</label></td>
				<td><input type="text" name="cedula"></td>
			</tr>
			<tr>
				<td><label>Nombre:</label></td>
				<td><input type="text" name="nombre"></td>
			</tr>
			<tr>
				<td><label>Correo Electronico:</label></td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td><label>Usuario:</label></td>
				<td><input type="text" name="usuario"></td>
			</tr>
			<tr>
				<td><label>Contraseña:</label></td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Agregar" name="Agregar"></td>
			</tr>
			<tr>
				<td><button type="submit" name="Listar">Listar
						Usuarios</button></td>
			</tr>
		</table>
	</form>
</body>
</html>
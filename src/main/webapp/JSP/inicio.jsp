<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Genérica</title>
</head>
<body>
	<p align="center">CREACION DE USUARIOS</p>
	<form method="get" action="./inicio">
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
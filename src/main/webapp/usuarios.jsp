<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creacion de Usuario - Tienda gen�rica</title>
</head>
<body>
	<h2>Usuarios</h2>
	<div class="row">
		<div class="card col-md-4">
			<div class="card-body">
				<form method="post" action="ControladorUsuarios">
					<h2>
						<a href="ControladorUsuarios?action=nuevo">Agregar nuevo
							usuario</a> &nbsp;&nbsp;&nbsp; <a
							href="ControladorUsuarios?action=listar">Listar usuarios</a>
					</h2>
					<p>${message}</p>
					<table class="table" border="1">
						<caption>Listado de usuarios</caption>
						<tr>
							<th>C�dula</th>
							<th>Nombre</th>
							<th>Correo Electr�nico</th>
							<th>Usuario</th>
							<th>Acciones</th>
						</tr>
						<c:forEach var="usuario" items="${usuario}">
							<tr>
								<td><c:out value="${usuario.cedula_usuario}" /></td>
								<td><c:out value="${usuario.nombre_usuario}" /></td>
								<td><c:out value="${usuario.email_usuario}" /></td>
								<td><c:out value="${usuario.usuario}" /></td>
								<td><a
									href="ControladorUsuarios?action=editar&cedula=<c:out value="${usuario.cedula_usuario}"/>">Editar</a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="ControladorUsuarios?action=eliminar&cedula=<c:out value="${usuario.cedula_usuario}"/>"
									onclick="return confirm('�Desea eliminar este registro?')">Eliminar</a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
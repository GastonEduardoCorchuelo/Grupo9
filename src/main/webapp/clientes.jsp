<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de clientes - Tienda genérica</title>
</head>
<body>
	<h2>Clientes</h2>
	<div class="row">
		<div class="card col-md-4">
			<div class="card-body">
				<form method="post" action="ControladorClientes">
					<h2>
						<a href="ControladorClientes?action=nuevo">Agregar nuevo
							cliente</a> &nbsp;&nbsp;&nbsp; <a
							href="ControladorClientes?action=listar">Listar clientes</a>
					</h2>
					<p>${message}</p>
					<table class="table" border="1">
						<caption>Listado de clientes</caption>
						<tr>
							<th>Cédula</th>
							<th>Dirección</th>
							<th>Correo Electrónico</th>
							<th>Nombre</th>
							<th>Teléfono</th>
							<th>Acciones</th>
						</tr>
						<c:forEach var="cliente" items="${cliente}">
							<tr>
								<td><c:out value="${cliente.cedula_cliente}" /></td>
								<td><c:out value="${cliente.direccion_cliente}" /></td>
								<td><c:out value="${cliente.email_cliente}" /></td>
								<td><c:out value="${cliente.nombre_cliente}" /></td>
								<td><c:out value="${cliente.telefono_cliente}" /></td>
								<td><a
									href="ControladorClientes?action=editar&cedula=<c:out value="${cliente.cedula_cliente}"/>">Editar</a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="ControladorClientes?action=eliminar&cedula=<c:out value="${cliente.cedula_cliente}"/>"
									onclick="return confirm('¿Desea eliminar este registro?')">Eliminar</a>
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
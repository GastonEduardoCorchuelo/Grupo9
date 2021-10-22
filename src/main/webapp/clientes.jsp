<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Clientes - Tienda Equipo 9</title>
<link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body>
	<main class="container container-form-users">
		<form class="users-form" method="post" action="ControladorClientes">
			<h2>Clientes</h2>

			<div class="botones">
				<a class="btn" href="ControladorClientes?action=nuevo">Agregar
					nuevo cliente</a> &nbsp;&nbsp;&nbsp; <a class="btn"
					href="ControladorClientes?action=listar">Listar clientes</a>
			</div>

			<p>${message}</p>

			<c:if test="${cliente != null}">
				<table>
					<caption>Listado de clientes</caption>
					<thead>
						<tr>
							<th>Cédula</th>
							<th>Dirección</th>
							<th>Correo Electrónico</th>
							<th>Nombre</th>
							<th>Teléfono</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<c:forEach var="cliente" items="${cliente}">
						<tbody>
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
						</tbody>
					</c:forEach>
				</table>
			</c:if>
		</form>
	</main>
</body>
</html>
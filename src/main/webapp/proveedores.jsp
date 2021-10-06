<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de proveedores - Tienda genérica</title>
</head>
<body>
	<h2>Proveedores</h2>
	<div class="row">
		<div class="card col-md-4">
			<div class="card-body">
				<form method="post" action="ControladorProveedores">
					<h2>
						<a href="ControladorProveedores?action=nuevo">Agregar nuevo
							proveedor</a> &nbsp;&nbsp;&nbsp; <a
							href="ControladorProveedores?action=listar">Listar proveedores</a>
					</h2>
					<p>${message}</p>
					<table class="table" border="1">
						<caption>Listado de proveedores</caption>
						<tr>
							<th>NIT</th>
							<th>Nombre</th>
							<th>Ciudad</th>
							<th>Dirección</th>
							<th>Teléfono</th>
							<th>Acciones</th>
						</tr>
						<c:forEach var="proveedor" items="${proveedor}">
							<tr>
								<td><c:out value="${proveedor.nit_proveedor}" /></td>
								<td><c:out value="${proveedor.nombre_proveedor}" /></td>
								<td><c:out value="${proveedor.ciudad_proveedor}" /></td>
								<td><c:out value="${proveedor.direccion_proveedor}" /></td>
								<td><c:out value="${proveedor.telefono_proveedor}" /></td>
								<td><a
									href="ControladorProveedores?action=editar&nit=<c:out value="${proveedor.nit_proveedor}"/>">Editar</a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="ControladorProveedores?action=eliminar&nit=<c:out value="${proveedor.nit_proveedor}"/>"
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
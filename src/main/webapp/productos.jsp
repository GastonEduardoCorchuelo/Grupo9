<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Productos"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Productos - Tienda Equipo 9</title>
<link rel="stylesheet" type="text/css" href="./style2.css">
</head>
<body>
	<br>
	<br>
	<main class="container container-form-users">
		<form class="users-form" method="post" enctype="multipart/form-data"
			action="ControladorProductos" enctype="multipart/form-data">

			<h2>Productos</h2>
			
			<div class="field1">
			<label>Elegir archivo csv:</label> 
			<input  type="file" name="archivo" accept=".csv, .txt">
			</div>
			
			
			
			
			  
			  <div class="botones">
			<button class="bton" type="submit" value="enviar" name="action">Subir archivo</button>
			</div>
			
			<div class="botones">
				<ul>
					<a class="btn" href="ControladorProductos?action=nuevo">Agregar nuevo producto</a> &nbsp;&nbsp;&nbsp;
					<a class="btn" href="ControladorProductos?action=listar">Listar productos</a>
				</ul>

				<p>${message}</p>

				<c:if test="${producto != null}">
					<table>

						<caption>Listado de productos</caption>
						<tr>
							<th>Código del producto</th>
							<th>Nombre del producto</th>
							<th>Precio de compra</th>
							<th>Precio de venta</th>
							<th>IVA</th>
							<th>NIT del proveedor</th>
							<th>Acciones</th>
						</tr>

						<c:forEach var="producto" items="${producto}">
							<tr>
								<td><c:out value="${producto.codigo_producto}" /></td>
								<td><c:out value="${producto.nombre_producto}" /></td>
								<td><c:out value="${producto.precio_compra}" /></td>
								<td><c:out value="${producto.precio_venta}" /></td>
								<td><c:out value="${producto.iva_compra}" /></td>
								<td><c:out value="${producto.nit_proveedor}" /></td>
								<td><a
									href="ControladorProductos?action=editar&codigo=<c:out value="${producto.codigo_producto}"/>">Editar</a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="ControladorProductos?action=eliminar&codigo=<c:out value="${producto.codigo_producto}"/>"
									onclick="return confirm('¿Desea eliminar este registro?')">Eliminar</a>
								</td>
							</tr>
						</c:forEach>

					</table>
				</c:if>
			</div>
		</form>
	</main>
</body>
</html>
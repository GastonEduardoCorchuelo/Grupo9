<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Productos"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de productos - Tienda Equipo 9</title>
</head>
<body>
	<div>
		<form action="ControladorProductos" method="post">
				<h3>Listado de productos</h3>
				
				<c:if test="${producto == null}">
						<p>Código del producto:</p>
						<input type="number" name="codigo" maxlength="10" size="45"
							value="<c:out value="${producto.codigo_producto}"/>" required />
				</c:if>
				
				<c:if test="${producto != null}">
						<p>Código del producto(No editable):</p>
						<input type="number" name="codigo" maxlength="10" size="45"
							value="<c:out value="${producto.codigo_producto}"/>" readonly />
				</c:if>
				
					<p>Nombre del producto:</p>
					<input type="text" name="nombre" size="45"
						value="<c:out value="${producto.nombre_producto}"/>" required />
						
					<p>Precio de compra:</p>
					<input type="number" name="preciocompra" size="45"
						value="<c:out value="${producto.precio_compra}"/>" required />
						
					<p>Precio de venta:</p>
					<input type="number" name="precioventa" size="45"
						value="<c:out value="${producto.precio_venta}"/>" required />
						
					<p>IVA:</p>
					<input type="number" name="iva" size="45"
						value="<c:out value="${producto.iva_compra}"/>" required />
						
					<p>NIT del proveedor:</p>
					<input type="number" name="nit" size="45"
						value="<c:out value="${producto.nit_proveedor}"/>" required />
						
			<c:if test="${producto == null}">
				<button type="submit" name="action" value="agregar">Agregar
					producto</button>
			</c:if>
			
			<c:if test="${producto != null}">
				<button type="submit" name="action" value="actualizar">Actualizar
					producto</button>
			</c:if>
			
		</form>
	</div>
</body>
</html>
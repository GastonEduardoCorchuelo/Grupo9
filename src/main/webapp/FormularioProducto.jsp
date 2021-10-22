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
<link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body>
	 <main  class="container container-form-users">
		<form class="users-form" action="ControladorProductos" method="post">
				<h2>Productos</h2>
				
					<div class="field">
					<label>Nombre del producto:</label>
					<input type="text" placeholder="Nombre de producto" name="nombre" 
						value="<c:out value="${producto.nombre_producto}"/>" required />
						
					<label>Precio de compra:</label>
					<input type="number" placeholder="precio compra" name="preciocompra" 
						value="<c:out value="${producto.precio_compra}"/>" required />
					</div>
					<div class="field">	
					<label>Precio de venta:</label>
					<input type="number" placeholder="precio venta" name="precioventa" 
						value="<c:out value="${producto.precio_venta}"/>" required />
					
						
					<label>IVA:</label>
					<input type="number" placeholder="IVA" name="iva" 
						value="<c:out value="${producto.iva_compra}"/>" required />
					
					</div>	
					<div class="field1">
					<label>NIT del proveedor:</label>
					<input type="number" placeholder="NIT proveedor" name="nit" 
						value="<c:out value="${producto.nit_proveedor}"/>" required />
				</div>
				
				<c:if test="${producto == null}">
				<div class="field1">
						<label>Código del producto:</label>
						<input type="number" placeholder="Código del producto" name="codigo" 
							value="<c:out value="${producto.codigo_producto}"/>" required />
				</div>
				</c:if>
				
				<c:if test="${producto != null}">
					<div class="field1">
						<label>Código del producto(No editable):</label>
						<input type="number" placeholder="Ingrese su codigo"  name="codigo" 
							value="<c:out value="${producto.codigo_producto}"/>" readonly />
				</div>
				</c:if>
						
			<c:if test="${producto == null}">
				<div class="botones">
				<button class="bton"   type="submit"  name="action" value="agregar">Agregar
					producto</button>
			</div>
			</c:if>
			
			<c:if test="${producto != null}">
				<div class="botones">
				<button class="bton" type="submit" name="action" value="actualizar">Actualizar
					producto</button>
				</div>	
			</c:if>
			
		</form>
	</main>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de proveedores - Tienda Equipo 9</title>
</head>
<body>
	<div>
		<form action="ControladorProveedores" method="post">
			<h3>Listado de proveedores</h3>
			
			<c:if test="${proveedor == null}">
					<p>NIT:</p>
					<input type="number" name="nit" maxlength="10" size="45"
						value="<c:out value="${proveedor.nit_proveedor}"/>" required />
			</c:if>
			
			<c:if test="${proveedor != null}">
					<p>NIT(No editable):</p>
					<input type="number" name="nit" maxlength="10" size="45"
						value="<c:out value="${proveedor.nit_proveedor}"/>" readonly />
			</c:if>
			
				<p>Nombre:</p>
				<input type="text" name="nombre" size="45"
					value="<c:out value="${proveedor.nombre_proveedor}"/>" required />
					
				<p>Ciudad:</p>
				<input type="text" name="ciudad" size="45"
					value="<c:out value="${proveedor.ciudad_proveedor}"/>" required />
					
				<p>Dirección:</p>
				<input type="text" name="direccion" size="45"
					value="<c:out value="${proveedor.direccion_proveedor}"/>" required />
					
				<p>Teléfono:</p>
				<input type="text" name="telefono" size="45"
					value="<c:out value="${proveedor.telefono_proveedor}"/>" required />
					
			<c:if test="${proveedor == null}">
				<button type="submit" name="action" value="agregar">Agregar
					proveedor</button>
			</c:if>
			
			<c:if test="${proveedor != null}">
				<button type="submit" name="action" value="actualizar">Actualizar
					proveedor</button>
			</c:if>
			
		</form>
	</div>
</body>
</html>
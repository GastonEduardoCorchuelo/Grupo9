<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de proveedores - Tienda genérica</title>
</head>
<body>
	<div>
		<form action="ControladorProveedores" method="post">
			<table border="1">
				<caption>Listado de proveedores</caption>
				<c:if test="${proveedor == null}">
					<tr>
						<th>NIT:</th>
						<td><input type="text" name="nit" maxlength="10" size="45"
							value="<c:out value="${proveedor.nit_proveedor}"/>" required /></td>
					</tr>
				</c:if>
				<c:if test="${proveedor != null}">
					<tr>
						<th>NIT(No editable):</th>
						<td><input type="text" name="nit" maxlength="10" size="45"
							value="<c:out value="${proveedor.nit_proveedor}"/>" readonly /></td>
					</tr>
				</c:if>
				<tr>
					<th>Nombre:</th>
					<td><input type="text" name="nombre" size="45"
						value="<c:out value="${proveedor.nombre_proveedor}"/>" required /></td>
				</tr>
				<tr>
					<th>Ciudad:</th>
					<td><input type="text" name="ciudad" size="45"
						value="<c:out value="${proveedor.ciudad_proveedor}"/>" required /></td>
				</tr>
				<tr>
					<th>Dirección:</th>
					<td><input type="text" name="direccion" size="45"
						value="<c:out value="${proveedor.direccion_proveedor}"/>" required /></td>
				</tr>
				<tr>
					<th>Teléfono:</th>
					<td><input type="text" name="telefono" size="45"
						value="<c:out value="${proveedor.telefono_proveedor}"/>" required /></td>
				</tr>
			</table>
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
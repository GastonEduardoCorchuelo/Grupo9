<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Clientes"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de clientes - Tienda genérica</title>
</head>
<body>
	<div>
		<form action="ControladorClientes" method="post">
			<table border="1">
				<caption>Listado de clientes</caption>
				<c:if test="${cliente == null}">
					<tr>
						<th>Cédula:</th>
						<td><input type="text" name="cedula" maxlength="10" size="45"
							value="<c:out value="${cliente.cedula_cliente}"/>" required /></td>
					</tr>
				</c:if>
				<c:if test="${cliente != null}">
					<tr>
						<th>Cédula(No editable):</th>
						<td><input type="text" name="cedula" maxlength="10" size="45"
							value="<c:out value="${cliente.cedula_cliente}"/>" readonly /></td>
					</tr>
				</c:if>
				<tr>
					<th>Dirección:</th>
					<td><input type="text" name="direccion" size="45"
						value="<c:out value="${cliente.direccion_cliente}"/>" required /></td>
				</tr>
				<tr>
					<th>Correo electrónico:</th>
					<td><input type="text" name="email" size="45"
						value="<c:out value="${cliente.email_cliente}"/>" required /></td>
				</tr>
				<tr>
					<th>Nombres:</th>
					<td><input type="text" name="nombre" size="45"
						value="<c:out value="${cliente.nombre_cliente}"/>" required /></td>
				</tr>
				<tr>
					<th>Teléfono:</th>
					<td><input type="text" name="telefono" size="45"
						value="<c:out value="${cliente.telefono_cliente}"/>" required /></td>
				</tr>
			</table>
			<c:if test="${cliente == null}">
				<button type="submit" name="action" value="agregar">Agregar
					cliente</button>
			</c:if>
			<c:if test="${cliente != null}">
				<button type="submit" name="action" value="actualizar">Actualizar
					cliente</button>
			</c:if>
		</form>
	</div>
</body>
</html>
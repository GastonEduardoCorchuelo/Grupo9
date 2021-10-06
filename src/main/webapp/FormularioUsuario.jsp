<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de usuarios - Tienda genérica</title>
</head>
<body>
	<div>
		<form action="ControladorUsuarios" method="post">
			<table border="1">
				<caption>Listado de usuarios</caption>
				<c:if test="${usuario == null}">
					<tr>
						<th>Cédula:</th>
						<td><input type="text" name="cedula" maxlength="10" size="45"
							value="<c:out value="${usuario.cedula_usuario}"/>" required /></td>
					</tr>
				</c:if>
				<c:if test="${usuario != null}">
					<tr>
						<th>Cédula(No editable):</th>
						<td><input type="text" name="cedula" maxlength="10" size="45"
							value="<c:out value="${usuario.cedula_usuario}"/>" readonly /></td>
					</tr>
				</c:if>
				<tr>
					<th>Correo electrónico:</th>
					<td><input type="text" name="email" size="45"
						value="<c:out value="${usuario.email_usuario}"/>" required /></td>
				</tr>
				<tr>
					<th>Nombre:</th>
					<td><input type="text" name="nombre" size="45"
						value="<c:out value="${usuario.nombre_usuario}"/>" required /></td>
				</tr>
				<tr>
					<th>Nombre de usuario:</th>
					<td><input type="text" name="user" size="45"
						value="<c:out value="${usuario.usuario}"/>" required /></td>
				</tr>
				<tr>
					<th>Contraseña:</th>
					<td><input type="password" name="password" size="45"
						value="<c:out value="${usuario.password}"/>" required /></td>
				</tr>
			</table>
			<c:if test="${usuario == null}">
				<button type="submit" name="action" value="agregar">Agregar
					usuario</button>
			</c:if>
			<c:if test="${usuario != null}">
				<button type="submit" name="action" value="actualizar">Actualizar
					usuario</button>
			</c:if>
		</form>
	</div>
</body>
</html>
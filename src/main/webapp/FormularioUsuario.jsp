<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de usuarios - Tienda Equipo 9</title>
</head>
<body>
	<div>
		<form action="ControladorUsuarios" method="post">
				<h3>Listado de usuarios</h3>
				
				<c:if test="${usuario == null}">
						<p>Cédula:</p>
						<input type="number" name="cedula" maxlength="10" size="45"
							value="<c:out value="${usuario.cedula_usuario}"/>" required />
				</c:if>
				
				<c:if test="${usuario != null}">
						<p>Cédula(No editable):</p>
						<input type="number" name="cedula" maxlength="10" size="45"
							value="<c:out value="${usuario.cedula_usuario}"/>" readonly />
				</c:if>
				
					<p>Correo electrónico:</p>
					<input type="email" name="email" size="45"
						value="<c:out value="${usuario.email_usuario}"/>" required />
						
					<p>Nombre:</p>
					<input type="text" name="nombre" size="45"
						value="<c:out value="${usuario.nombre_usuario}"/>" required />
						
					<p>Nombre de usuario:</p>
					<input type="text" name="user" size="45"
						value="<c:out value="${usuario.usuario}"/>" required />
						
					<p>Contraseña:</p>
					<input type="password" name="password" size="45"
						value="<c:out value="${usuario.password}"/>" required />
						
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
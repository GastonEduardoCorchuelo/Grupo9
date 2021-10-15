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
<link rel="stylesheet" type="text/css" href="./style2.css">
</head>
<body>
	 <br>
     <br>
     
	<main class="container container-form-users">
		<form class="users-form"  action="ControladorUsuarios" method="post">
				<h2>Usuarios</h2>
				
				
				
					
					<div class="field">
					<label>Correo electrónico:</label>
					<input type="email" placeholder="Ingrese Su Correo"
						value="<c:out value="${usuario.email_usuario}"/>" required />
						
					<label>Nombre:</label>
					<input type="text" placeholder="Ingrese su nombre completo" name="nombre" 
						value="<c:out value="${usuario.nombre_usuario}"/>" required />
					</div>
					<div class="field">
					<label>usuario:</label>
					<input type="text" placeholder="Ingrese su usuario" name="user" 
						value="<c:out value="${usuario.usuario}"/>" required />
						
					<label>Contraseña:</label>
					<input type="password" placeholder="Ingrese su contraseña" name="password" 
						value="<c:out value="${usuario.password}"/>" required />
					</div>
					
					<c:if test="${usuario == null}">
				<div class="field1">
						<label>Cédula:</label>
						<input type="number" placeholder="Ingrese su cédula" name="cedula" 
							value="<c:out value="${usuario.cedula_usuario}"/>" required />
				</div>
				</c:if>
				
				<c:if test="${usuario != null}">
				<div class="field1">
						<label>Cédula(No editable):</label>
						<input type="number" name="cedula" 
							value="<c:out value="${usuario.cedula_usuario}"/>" readonly />
				</div>				
				</c:if>
			<c:if test="${usuario == null}">
			<div class="botones">
				<button class="bton" type="submit" name="action" value="agregar">Agregar
					usuario</button>
			</div>		
			</c:if>
			
			<c:if test="${usuario != null}">
			<div class="botones">
				<button class="bton" type="submit" name="action" value="actualizar">Actualizar
					usuario</button>
			</div>
			</c:if>
		
		</form>
		</main>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Clientes"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Formulario de clientes - Tienda Equipo 9</title>
</head>
<body>
	<div>
		<form action="ControladorClientes" method="post">
				<h3>Listado de clientes</h3>
								
				<c:if test="${cliente == null}">
						<p>Cédula:</p>
						<input type="number" name="cedula" maxlength="10" size="45"
							value="<c:out value="${cliente.cedula_cliente}"/>" required />
				</c:if>
				
				<c:if test="${cliente != null}">
						<p>Cédula(No editable):</p>
						<input type="number" name="cedula" maxlength="10" size="45"
							value="<c:out value="${cliente.cedula_cliente}"/>" readonly />
				</c:if>
				
					<p>Dirección:</p>
					<input type="text" name="direccion" size="45"
						value="<c:out value="${cliente.direccion_cliente}"/>" required />
						
					<p>Correo electrónico:</p>
					<input type="email" name="email" size="45"
						value="<c:out value="${cliente.email_cliente}"/>" required />
						
					<p>Nombres:</p>
					<input type="text" name="nombre" size="45"
						value="<c:out value="${cliente.nombre_cliente}"/>" required />
						
					<p>Teléfono:</p>
					<input type="text" name="telefono" size="45"
						value="<c:out value="${cliente.telefono_cliente}"/>" required />
						
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
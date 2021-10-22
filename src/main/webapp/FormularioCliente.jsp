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
<link rel="stylesheet" type="text/css" href="style2.css">
</head>
<body>
    <main class="container container-form-users">
		<form class="users-form" action="ControladorClientes" method="post">
				 <h2>Clientes</h2>
								
				
					 <div class="field">
					<label>Dirección:</label>
					<input type="text" placeholder="Ingrese su dirección" name="direccion" 
						value="<c:out value="${cliente.direccion_cliente}"/>" required />
						
					<label>Correo electrónico:</label>
					<input type="email" placeholder="Ingrese su correo electrónico"  name="email" 
						value="<c:out value="${cliente.email_cliente}"/>" required />
					</div>
					 <div class="field">	
					<label>Nombre:</label>
					<input type="text" placeholder="Ingrese su nombre completo" name="nombre"
						value="<c:out value="${cliente.nombre_cliente}"/>" required />
						
					<label>Teléfono:</label>
					<input type="text" placeholder="Ingrese su numero de telefono" name="telefono" 
						value="<c:out value="${cliente.telefono_cliente}"/>" required />
					</div>
					<c:if test="${cliente == null}">
				<div class="field1">
						<label>Cédula:</label>
						<input type="number" placeholder="Ingrese su cédula" name="cedula" 
							value="<c:out value="${cliente.cedula_cliente}"/>" required />
				</div>
				</c:if>
				
				<c:if test="${cliente != null}">
				<div class="field1">
						<label>Cédula(No editable):</label>
						<input type="number" placeholder="Ingrese su cédula" name="cedula" maxlength="10" size="45"
							value="<c:out value="${cliente.cedula_cliente}"/>" readonly />
				</div>
				</c:if>
			<c:if test="${cliente == null}">
				 <div class="botones">
				<button class="bton" type="submit" name="action" value="agregar">Agregar
					cliente</button>
				</div> 		
			</c:if>
			
			<c:if test="${cliente != null}">
				 <div class="botones">
				<button class="bton" type="submit" name="action" value="actualizar">Actualizar
					cliente</button>
				</div>
			</c:if>
			
		</form>
		</main>
</body>
</html>
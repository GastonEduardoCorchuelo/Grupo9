<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de usuarios - Tienda genérica</title>
<link rel="stylesheet" type="text/css" href="./style2.css">
</head>
<body>
	 <br>
	 <br>
     <main class="container container-form-users">
				<form class="users-form"  method="post" action="ControladorUsuarios">
					  <h2>Usuarios</h2>
					   <div class="botones">
           				 <ul>
						<a class="btn"  href="ControladorUsuarios?action=nuevo">Agregar nuevo usuario</a> &nbsp;&nbsp;&nbsp; 
						<a class="btn"  href="ControladorUsuarios?action=listar">Listar usuarios</a>
					  </ul>
					  
					<p>${message}</p>
					<c:if test="${usuario != null}">
					
						<table>
							<caption>Listado de usuarios</caption>
							<thead>
								<tr>
									<th>Cédula</th>
									<th>Nombre</th>
									<th>Correo Electrónico</th>
									<th>Usuario</th>
									<th>Acciones</th>
								</tr>
							</thead>
							<c:forEach var="usuario" items="${usuario}">
								<tbody>
									<tr>
										<td><c:out value="${usuario.cedula_usuario}" /></td>
										<td><c:out value="${usuario.nombre_usuario}" /></td>
										<td><c:out value="${usuario.email_usuario}" /></td>
										<td><c:out value="${usuario.usuario}" /></td>
										<td><a
											href="ControladorUsuarios?action=editar&cedula=<c:out value="${usuario.cedula_usuario}"/>">Editar</a>
											&nbsp;&nbsp;&nbsp;&nbsp; <a
											href="ControladorUsuarios?action=eliminar&cedula=<c:out value="${usuario.cedula_usuario}"/>"
											onclick="return confirm('¿Desea eliminar este registro?')">Eliminar</a>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</c:if>
					</div>
				</form>
				</main>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="co.edu.unbosque.ciclo3.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creacion de Usuario</title>
</head>
<body>
	<h2>Usuarios</h2>
	<div class="row">
		<div class="card col-md-4">
			<div class="card-body">
				<div>
					<form class="form-sign" method="get" action="Controlador">

						<div class="form-group">
							<input type="hidden" name="menu" value="usuarios"> <label>Cedula:</label>
							<input type="number" name="cedula" class="form-control"
								value="${usuarioSeleccionado.getCedula_usuario()}">
						</div>
						<div class="form-group">
							<label>Nombre:</label> <input type="text" name="nombre"
								class="form-control"
								value="${usuarioSeleccionado.getNombre_usuario()}">
						</div>
						<div class="form-group">
							<label>Email:</label> <input type="text" name="email"
								class="form-control"
								value="${usuarioSeleccionado.getEmail_usuario()}">
						</div>
						<div class="form-group">
							<label>Usuario:</label> <input type="text" name="usuario"
								class="form-control" value="${usuarioSeleccionado.getUsuario()}">
						</div>
						<div class="form-group">
							<label>Password:</label> <input type="password" name="password"
								class="form-control"
								value="${usuarioSeleccionado.getPassword()}">
						</div>
						<h2>
							<input type="submit" class="btn btn-primary" name="accion"
								value="Agregar"> <input type="submit"
								class="btn btn-success" name="accion" value="Actualizar">
						</h2>
						<%
						ArrayList<Usuarios> lista = new ArrayList<Usuarios>();
						%>
						<table class="table" border="1">
							<caption>Listado de usuarios</caption>
							<tr>
								<th>Cédula</th>
								<th>Nombre</th>
								<th>Correo Electrónico</th>
								<th>Usuario</th>
								<th>Contraseña</th>
								<th>Acciones</th>
							</tr>
							<tr>
								<%
								for (Usuarios usuario : lista) {
								%>
								<td><%=usuario.getCedula_usuario()%></td>
								<td><%=usuario.getNombre_usuario()%></td>
								<td><%=usuario.getEmail_usuario()%></td>
								<td><%=usuario.getUsuario()%></td>
								<td><%=usuario.getPassword()%></td>
								<td><input type="submit" class="btn btn-primary"
									name="accion" value="Editar"> <input type="submit"
									class="btn btn-success" name="accion" value="Eliminar">
								</td>
								<%
								}
								%>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
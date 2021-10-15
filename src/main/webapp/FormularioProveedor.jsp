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
<link rel="stylesheet" type="text/css" href="./style2.css">
</head>
<body>
	<br>
	<br>
	<main class="container container-form-users">
		<form class="users-form" action="ControladorProveedores" method="post">
			<h2>proveedores</h2>


			<div class="field">
				<label>Nombre:</label> <input type="text" placeholder="Ingrese su nombre" name="nombre"
					value="<c:out value="${proveedor.nombre_proveedor}"/>" required />

				<label>Ciudad:</label> <input type="text" placeholder="Ciudad"
					name="ciudad"
					value="<c:out value="${proveedor.ciudad_proveedor}"/>" required />
			</div>

			<div class="field">
				<label>Dirección:</label> <input type="text"
					placeholder="Ingrese su direccion" name="direccion"
					value="<c:out value="${proveedor.direccion_proveedor}"/>" required />

				<label>Teléfono:</label> <input type="text"
					placeholder="Número telefonico" name="telefono"
					value="<c:out value="${proveedor.telefono_proveedor}"/>" required />
			</div>

			<c:if test="${proveedor == null}">
				<div class="field1">
					<label>NIT:</label> <input type="number"
						placeholder="Ingrese su NIT" name="nit"
						value="<c:out value="${proveedor.nit_proveedor}"/>" required />
				</div>
			</c:if>

			<c:if test="${proveedor != null}">
				<div class="field1">
					<label>NIT(No editable):</label> <input type="number"
						placeholder="Ingrese su NIT" name="nit"
						value="<c:out value="${proveedor.nit_proveedor}"/>" readonly />
				</div>
			</c:if>
			<c:if test="${proveedor == null}">
				<div class="botones">
					<button class="bton" type="submit" name="action" value="agregar">Agregar
						proveedor</button>
				</div>
			</c:if>

			<c:if test="${proveedor != null}">
				<div class="botones">
					<button class="bton" type="submit" name="action" value="actualizar">Actualizar
						proveedor</button>
				</div>
			</c:if>

		</form>
	</main>

</body>
</html>
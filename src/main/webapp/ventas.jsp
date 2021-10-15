<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="co.edu.unbosque.ciclo3front.modelo.Clientes"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ventas - Tienda Equipo 9</title>
<link rel="stylesheet" type="text/css" href="./style2.css">
</head>
<body>
	<br>
	<br>
	<main class="container container-form-users">
		<form class="users-form" action="ControladorVentas" method="post">
			<h2>Ventas</h2>

			<p>${message}</p>


			<div class="field1">


				<label for="cedula">Cedula:</label> <input type="number"
					name="cedula">
				<button class="bton" name="action" value="consultar_cliente">Consultar
					Cliente</button>
				<input type="hidden" name="ced"
					value="<c:out value="${cliente.cedula_cliente}"/>" readonly>
				<input type="hidden" name="cod"
					value="<c:out value="${producto.codigo_producto}"/>" readonly>
				<input type="hidden" name="cant" value="<c:out value="${cant}"/>"
					readonly>

			</div>

			<div class="field1">
				<label for="cedula">Cliente:</label><input type="text"
					name="cliente" value="<c:out value="${cliente.nombre_cliente}"/>"
					readonly>

			</div>



			<div class="field1">
				<label>Código de producto:</label> <input type="number"
					name="codigo">
				<button class="btn-ventas" name="action" value="consultar_producto">Consultar
					Producto</button>

			</div>

			<div class="field1">
				<label>Nombre Producto</label> <input type="text"
					name="nombre_producto"
					value="<c:out value="${producto.nombre_producto}" />" readonly>
			</div>
			<div class="field1">
				<label>Valor del producto(Unidad): $</label> <input type="number"
					name="precio" value="<c:out value="${producto.precio_venta}" />"
					readonly>
			</div>
			<div class="field1">
				<label>IVA: $</label> <input type="number" name="iva"
					value="<c:out value="${producto.iva_compra}" />" readonly>

			</div>

			<div class="field">
				<label>Cantidad:</label> <input type="number" name="cantidad">
				<button class="btn-ventas" name="action"
					value="calcular_valor_producto">Calcular valor</button>
			</div>


			<div class="field">
				<label>Valor de la venta: $</label> <input type="number"
					name="valor_venta" value="<c:out value="${valor_venta}" />"
					readonly>
			</div>
			<div class="field1">
				<label>Valor IVA: $</label> <input type="number" name="iva_venta"
					value="<c:out value="${iva_venta}" />" readonly>
			</div>
			<div class="field1">
				<label>Valor total: $</label> <input type="number"
					name="total_venta" value="<c:out value="${total_venta}" />"
					readonly>
			</div>



			<div class="botones">
				<ul>
					<button class="btn" name="action" value="agregar">Registrar
						venta</button>

					<a class="btn" href="ControladorVentas?action=listar">Listar
						ventas</a>
				</ul>

				<c:if test="${venta != null}">
					<div class="campos-operacion">

						<table>
							<caption>Listado de ventas</caption>
							<tr>
								<th>Código de factura</th>
								<th>Cédula del cliente</th>
								<th>Nombre del cliente</th>
								<th>Producto</th>
								<th>Cantidad</th>
								<th>Valor de la venta</th>
								<th>Total IVA</th>
								<th>Total venta</th>
								<th>Fecha</th>
							</tr>

							<c:forEach var="venta" items="${venta}">
								<tr>
									<td><c:out value="${venta.codigo_venta}" /></td>
									<td><c:out value="${venta.cedula_cliente}" /></td>
									<td><c:out value="${venta.nombre_cliente}" /></td>
									<td><c:out value="${venta.nombre_producto}" /></td>
									<td><c:out value="${venta.cantidad_producto}" /></td>
									<td><c:out value="${venta.valor_venta}" /></td>
									<td><c:out value="${venta.iva_venta}" /></td>
									<td><c:out value="${venta.total_venta}" /></td>
									<td><c:out value="${venta.fecha}" /></td>
							</c:forEach>

						</table>
					</div>
				</c:if>
			</div>
		</form>
	</main>
</body>
</html>
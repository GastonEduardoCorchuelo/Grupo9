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
</head>
<body>
	<h2>Ventas</h2>
	<main class="contenedor contenedor-form-ventas">
		<form action="ControladorVentas" method="post">
		
			<p>${message}</p>
			
			<div class="informacion-cliente">
				<div class="campo">
				
					<label for="cedula">Cedula:</label>
					<input type="number" name="cedula">
					<button class="btn-ventas" name="action" value="consultar_cliente">Consultar
						Cliente</button>
					<input type="hidden" name="ced"
						value="<c:out value="${cliente.cedula_cliente}"/>" readonly>
					<input type="hidden" name="cod"
						value="<c:out value="${producto.codigo_producto}"/>" readonly>
					<input type="hidden" name="cant"
						value="<c:out value="${cant}"/>" readonly>
				</div>
				
				<div class="campo">
					<label for="cedula">Cliente:</label><input type="text"
						name="cliente" value="<c:out value="${cliente.nombre_cliente}"/>"
						readonly>
				</div>				
			</div>
			
			<div class="contenedor-productos">
				<div class="informacion-productos">
				
					<label>Código de producto:</label>
					<input type="number" name="codigo">
					<button class="btn-ventas" name="action" value="consultar_producto">Consultar
						Producto</button>
				</div>
				
				<div class="informacion-productos">
				
					<label>Nombre Producto</label>
					<input type="text" name="nombre_producto"
						value="<c:out value="${producto.nombre_producto}" />" readonly>
					
					<label>Valor del producto(Unidad): $</label>
					<input type="number" name="precio"
						value="<c:out value="${producto.precio_venta}" />" readonly>
					
					<label>IVA: $</label>
					<input type="number" name="iva"
						value="<c:out value="${producto.iva_compra}" />" readonly>
					
				</div>
				<div class="cantidad">
				
					<label>Cantidad:</label>
					<input type="number" name="cantidad">
					<button class="btn-ventas" name="action"
						value="calcular_valor_producto">Calcular valor</button>
				</div>
				
				<div class="informacion-productos-valor">
				
					<label>Valor de la venta: $</label>
					<input type="number" name="valor_venta" value="<c:out value="${valor_venta}" />"
						readonly>
						
					<label>Valor IVA: $</label>
					<input type="number" name="iva_venta"
						value="<c:out value="${iva_venta}" />" readonly>

					<label>Valor total: $</label>
					<input type="number" name="total_venta"
						value="<c:out value="${total_venta}" />" readonly>
				</div>
			</div>			
							
			<div class="informacion-operacion">
				<div class="campos">
				
					<button class="btn-ventas" name="action" value="agregar">Registrar
						venta</button>
						
					<a href="ControladorVentas?action=listar">Listar ventas</a>
				
					<c:if test="${venta != null}">
						<div class="campos-operacion">
						
							<table class="table" border="1">
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
			</div>

		</form>
	</main>
</body>
</html>
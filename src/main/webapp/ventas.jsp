<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Generica</title>
</head>
<body>
	<h2>Ventas</h2>
	<main class="contenedor contenedor-form-ventas">
		<form>
			<div class="informacion-cliente">
				<div class="campo">
					<label for="cedula">Cedula:</label> <input type="number" required>
					<button class="btn-ventas">Consultar</button>
				</div>
				<div class="campo">
					<label for="cedula">Cliente:</label> <input type="number" required>
				</div>
				<div class="campo">
					<label for="cedula">Consec.:</label> <input required>
				</div>
			</div>
			<div class="contenedor-productos">
				<div class="informacion-productos">
					<label> Cod. Producto</label> <input type="text"> <input
						type="text"> <input type="text">
				</div>
				<div class="informacion-productos buttons">
					<button class="btn-ventas">Consultar</button>
					<button class="btn-ventas">Consultar</button>
					<button class="btn-ventas">Consultar</button>
				</div>
				<div class="informacion-productos">
					<label> Nombre Producto</label> <input type="text"> <input
						type="text"> <input type="text">
				</div>
				<div class="informacion-productos cantidad">
					<label> Cant</label> <input type="text"> <input type="text">
					<input type="text">
				</div>
				<div class="informacion-productos">
					<label> Vlr. Total</label> <input type="text"> <input
						type="text"> <input type="text">
				</div>
			</div>
			<div class="informacion-operacion">
				<div class="campos">
					<button class="btn-ventas">Confirmar</button>
					<div class="campos-operacion">
						<div class="campo">
							<label>Total Venta</label> <input type="text">
						</div>
						<div class="campo">
							<label>Total IVA</label> <input type="text">
						</div>
						<div class="campo">
							<label>Total con IVA</label> <input type="text">
						</div>
					</div>
				</div>
			</div>
		</form>
	</main>
</body>
</html>
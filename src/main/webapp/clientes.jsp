<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Generica</title>
</head>
<body>
	<h2>Clientes</h2>
	<main class="contenedor contenedor-form-cliente">
		<form>
			<div class="double-campo">
				<div class="campo">
					<label for="cedula"> &iinfin; Cedula:</label> <input type="number"
						name="cedula" id="cedula" placeholder="tu cedula"
						title="campo de la cedula*" required>
				</div>
				<div class="campo">
					<label for="nombreCompleto"> &iinfin; Nombre Completo:</label> <input
						type="text" name="nombreCompleto" id="nombreCompleto"
						placeholder="tu nombre completo" title="campo del nombre*"
						required>
				</div>
			</div>
			<div class="double-campo">
				<div class="campo">
					<label for="direccion"> &iinfin; Dirección:</label> <input
						type="text" name="direccion" id="direccion"
						placeholder="tu dirección" title="campo de la direccion*" required>
				</div>
				<div class="campo">
					<label for="telefono"> &iinfin; Telefono:</label> <input
						type="number" name="telefono" id="telefono"
						placeholder="tu telefono" title="campo del telefono*" required>
				</div>
			</div>
			<div class="double-campo">
				<div class="campo">
					<label for="correoElectronico"> &iinfin; Correo
						Electronico:</label> <input type="email" name="correoElectronico"
						id="correoElectronico" placeholder="tu correo electronico"
						title="campo del correo*" required>
				</div>
			</div>
			<div class="botones">
				<button class="btn">Consultar</button>
				<button class="btn">Crear</button>
				<button class="btn">Actualizar</button>
				<button class="btn">Borrar</button>
			</div>
		</form>
	</main>
</body>
</html>
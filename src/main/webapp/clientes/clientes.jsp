<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Generica</title>

</head>

<body>

    <header>
        <h1>TIENDA GENERICA</h1>
        <div class="link">
            <ul>
                <li><a href="../usuarios/usuarios.jsp">Usuarios</a></li>
                <li><a href="../clientes/clientes.jsp">Clientes</a></li>
                <li><a href="../Proveedores/proveedores.jsp">Proveedores</a></li>
                <li><a href="../productos/productos.jsp">Productos</a></li>
                <li><a href="../ventas/ventas.jsp">Ventas</a></li>
                <li><a href="../reportes/reportes.jsp">Reportes</a></li>
                <li><a href="../acerca_de/informacion.jsp">Acerca de</a></li>
            </ul>
        </div>
    </header>

    <br>
    <hr />

    <h2>Clientes</h2>

    <main class="contenedor contenedor-form-cliente">

        <form>

            <div class="double-campo">
                <div class="campo">
                    <label for="cedula"> &iinfin; Cedula:</label>
                    <input type="number" name="cedula" id="cedula" placeholder="tu cedula" title="campo de la cedula*"
                        required="true">
                </div>
                <div class="campo">
                    <label for="nombreCompleto"> &iinfin; Nombre Completo:</label>
                    <input type="text" name="nombreCompleto" id="nombreCompleto" placeholder="tu nombre completo"
                        title="campo del nombre*" required="true">
                </div>
            </div>

            <div class="double-campo">
                <div class="campo">
                    <label for="direccion"> &iinfin; Dirección:</label>
                    <input type="text" name="direccion" id="direccion" placeholder="tu dirección"
                        title="campo de la direccion*" required="true">
                </div>
                <div class="campo">
                    <label for="telefono"> &iinfin; Telefono:</label>
                    <input type="number" name="telefono" id="telefono" placeholder="tu telefono"
                        title="campo del telefono*" required="true">
                </div>
            </div>

            <div class="double-campo">
                <div class="campo">
                    <label for="correoElectronico"> &iinfin; Correo Electronico:</label>
                    <input type="correoElectronico" name="correoElectronico" id="correoElectronico"
                        placeholder="tu correo electronico" title="campo del correo*" required="true">
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
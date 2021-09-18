<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Generica</title>
</head>
<body>
<header class="site-header container">
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
    <hr>
 <h2>VENTAS</h2>

    <main class="contenedor contenedor-form-ventas">

        <form>
            <div class="informacion-cliente">
                <div class="campo">
                    <label for="cedula">Cedula:</label>
                    <input type="number" required="true">
                    <button class="btn-ventas">Consultar</button>
                </div>

                <div class="campo">
                    <label for="cedula">Cliente:</label>
                    <input type="number" required="true">
                </div>
                <div class="campo">

                    <label for="cedula">Consec.:</label>
                    <input required="true">
                </div>
            </div>

            <div class="contenedor-productos">
                <div class="informacion-productos">
                    <label> Cod. Producto</label>
                    <input type="text">
                    <input type="text">
                    <input type="text">
                </div>

                <div class="informacion-productos buttons">
                    <button class="btn-ventas">Consultar</button>
                    <button class="btn-ventas">Consultar</button>
                    <button class="btn-ventas">Consultar</button>
                </div>

                <div class="informacion-productos">
                    <label> Nombre Producto</label>
                    <input type="text">
                    <input type="text">
                    <input type="text">
                </div>

                <div class="informacion-productos cantidad">
                    <label> Cant</label>
                    <input type="text">
                    <input type="text">
                    <input type="text">

                </div>

                <div class="informacion-productos">
                    <label> Vlr. Total</label>
                    <input type="text">
                    <input type="text">
                    <input type="text">
                </div>
            </div>

            <div class="informacion-operacion">

                <div class="campos">

                    <button class="btn-ventas">Confirmar</button>

                    <div class="campos-operacion">
                        <div class="campo">
                            <label>Total Venta</label>
                            <input type="text">
                        </div>

                        <div class="campo">
                            <label>Total IVA</label>
                            <input type="text">
                        </div>

                        <div class="campo">
                            <label>Total con IVA</label>
                            <input type="text">
                        </div>
                    </div>

                </div>

            </div>


        </form>
    </main>
</body>
</html>
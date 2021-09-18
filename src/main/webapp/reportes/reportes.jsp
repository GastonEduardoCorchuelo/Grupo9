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
    <h2>Reportes</h2>
     <main class="contenedor-botones-reportes">
        <div class="botones">
        <ul>
            <li><a class="btn" href="../reportes/tabla_usuario.jsp">Listado de Usuarios</a></li>
            <li><a href="../reportes/tabla_cliente.jsp">Listado de clientes</a></li>
            <li><a href="../reportes/ventas_clientes.jsp">Ventas por cliente</a></li>
            </ul>
        </div>
    </main>
</body> 
</html>
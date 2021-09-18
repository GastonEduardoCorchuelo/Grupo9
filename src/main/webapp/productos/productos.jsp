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
 <main class="container container-form-users">
        <h2>Productos</h2>

        <form class="users-form">
            <div class="field">
                <label>Nombre del Archivo </label>
                <input type="text">

                <button class="btn btn-rojo">Examinar</button>
            </div>

            <div class="buttons">
                
                <button class="btn btn-rojo">Cargar</button>
            </div>
        </form>
    </main>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Generica</title>
</head>
  <body> 
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
        
        <br>
    <hr>
         
        <h2>Usuarios</h2>

            <form class="users-form">
                <div class="field">
                    <label>Cédula</label>
                    <input type="text" placeholder="Ingrese su cédula">

                    <label> Usuario</label>
                    <input type="text" placeholder="Ingrese su usuario">
                </div>
                <div class="field">
                    <label>Nombre Completo</label>
                    <input type="text" placeholder="Ingrese su nombre completo">

                    <label> Contraseña </label>
                    <input type="password" placeholder="Ingrese su contraseña">
                </div>
                <div class="field1">
                    <label>Correo</label>
                    <input type="email" placeholder="Ingrese su correo electrónico">
                </div>
                <div class="buttons">
                    <button class="btn btn-rojo">Consultar</button>
                    <button class="btn btn-tojo">Crear</button>
                    <button class="btn btn-rojo">Actualizar</button>
                    <button class="btn btn-rojo">Borrar</button>
                </div>
            </form>
</body>
</html>
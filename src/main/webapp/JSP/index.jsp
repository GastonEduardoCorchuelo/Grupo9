<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Genérica</title>
<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
	<link rel="stylesheet" type="text/css" href="../style.css">
	

</head>  
<body>
    <form class="formulario" method="post" action="../loginServlet">
    
    <h1>Login</h1>
     <div class="contenedor">
     
         <div class="input-contenedor">
         <i class="fas fa-envelope icon"></i>
         <input name="email" type="text" placeholder="Correo Electronico" required>
         
         </div>
         
         <div class="input-contenedor">
        <i class="fas fa-key icon"></i>
         <input name="password" type="password" placeholder="Contraseña" required>
         
         </div>
         <input type="submit" value="Login" class="button">
         <p>Al registrarte, aceptas nuestras Condiciones de uso y Política de privacidad.</p>
         <p>¿No tienes una cuenta? <a class="link" href="Registro.jsp">Registrate </a></p>
     </div>
    </form>
</body>
</html>

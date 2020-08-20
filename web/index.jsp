<%-- 
    Document   : index
    Created on : 25/07/2020, 06:53:35 AM
    Author     : emanjarres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGMAA| Login</title>
        <link rel="icon" href="public/img/favicon.ico">
        <link href="public/css/bootstrap.min.css" rel="stylesheet">
        <link href="public/css/login.css" rel="stylesheet">
    </head>
    <body style="background: #8ad951;">
        <div class="login-clean" >
        <form action="Controlador" method="POST">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><img src="public/img/LogoUno.png" width="250"></div>
            <div class="form-group"><input class="form-control" type="email" name="email" id="email" placeholder="Correo Electronico" required maxlength="40"></div>
            <div class="form-group">
           <input class="form-control" type="password" name="password" id="password" placeholder="Clave de Usuario" maxlength="15"" required pattern="[A-Za-z0-9]+"  title="Sólo se permiten letras : (mayúsculas y miúsculas) y números">
               <%
                   if(request.getParameter("error")!=null)
                   {
                       out.print("<div class='text-danger text-center' style='margin-top:2%;'>Usuario y/o Clave incorrecta!</div>");
                   }
               %>
            </div>
           
            <div class="form-group">
                <input class="btn btn-primary btn-block" name="accion"  type="submit" value="Ingresar" style="background-color: rgb(119,192,67);">
                 <hr>
                <a class="forgot" href="https://forms.gle/VgArHFkztSQXJb7s6" target="_blank" style="margin-top: 4%; text-align: center; color:#8ad951;"><b>¿Soporte TI inconvenientes Presentados?</b></a>
            </div>
            
        </form>
            
    </div>
       
    </body>
</html>

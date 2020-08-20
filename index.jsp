<%-- 
    Document   : index
    Created on : 25/07/2020, 06:53:35 AM
    Author     : emanjarres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGMAA|Login</title>
        <link rel="icon" href="public/img/icon.png" type="img/png">
        <link href="public/css/bootstrap.min.css" rel="stylesheet">
        <link href="public/css/login.css" rel="stylesheet">
    </head>
    <body style="background: #f1f7fc;">
        <div class="login-clean" >
        <form action="Controlador" method="POST">
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><img src="public/img/LogoUno.png" width="250"></div>
            <div class="form-group"><input class="form-control" type="email" name="email" id="email" placeholder="Email o Username" required maxleght="35"></div>
            <div class="form-group">
                <input class="form-control" type="password" name="password" id="password" placeholder="Password" maxleght="15" required>
                
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" name="accion"  type="submit" value="ingresar" style="background-color: rgb(119,192,67);">
            </div>
            
        </form>
            
    </div>
       
    </body>
</html>

<%-- 
    Document   : CrearCampus
    Created on : 25/07/2020, 03:50:42 PM
    Author     : emanjarres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  session="true"%>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("UsuarioLogeado");
    if(usuario.equals(" ")){
        response.sendRedirect("index.jsp");
    }  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../public/img/favicon.ico">
        <title>SIGMAA| Registro de Campus</title>
        <script src="../public/js/jquery-3.5.1.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="../public/js/misScripts.js" type="text/javascript"></script>
        <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/misestilos.css" rel="stylesheet" type="text/css"/>
        
       
    </head>
    <body>
       <%--Inicio del encabezado de la página --%>  
    <div class="card-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="text-center">
                        <img src="../public/img/LogoUno.png" class="img-fluid float-left" alt="Responsive image" width="100% \9">
                    </div>
                </div>
                <div class="col-sm-7">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="index.jsp">Inicio<span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../index.jsp" tabindex="-1" aria-disabled="true">Salir</a>
                                </li>
                            </ul>                            
                        </div>
                    </nav>
                </div>
                <div class="col-sm-3">
                    <h6>Inicio de sesión como:</h6>
                    <% out.print(usuario); %>
                </div>
            </div>                    
        </div> 
    </div>
<%--Fin del encabezado de la página --%>  

<%-- Cuerpo de la página --%>
    <div class="card-body" id="body_administrador">
        <div class="card text-center">
            <h1>Crear campus universitarios o sedes</h1>
        </div>       
        
        <div class="container" style="margin-top: 1%;">
            <div class="row justify-content-md-center">
                <div class="col-sm-4">
                    <form action="../CrearCampus" method="post" id="formularioCrear" class="needs-validation" novalidate>
                        <div class="form-group">
                            <label for="validationCustom01">Nombre del campus universitario</label>
                            <input type="text" class="form-control" id="nombreCrearCampus" name="nombre" placeholder="Nombre del Campus" required>
                        </div>
                        <div class="form-group">
                            <label for="validationCustom01">Direccion del Campus</label>
                            <input type="text" class="form-control" id="direccionCrearCampus" name="direccion" placeholder="Direccion Campus" required>
                        </div>
                        <div class="form-group">
                            <label for="validationCustom04">Tipo de campus</label>
                            <select class="custom-select" id="tipoCrearCampus" name="tipo" required>
                                <option selected disabled value="">Seleccione</option>
                                <option>Sede</option> 
                                <option>Seccional</option>
                            </select>                                                
                        </div>            
                        <button class="btn btn-primary" type="button" id="btnformularioCrear">Guardar</button>
                    </form>
                </div>
            </div>
        </div>       
        
    </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%>  
        
        
        
        
        
        
        
        <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
    
</html>

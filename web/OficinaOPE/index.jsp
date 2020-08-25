<%-- 
    Document   : index
    Created on : 31/07/2020, 11:22:11 AM
    Author     : emanjarres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  session="true"%>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("UsuarioAutenticado");
    if(usuario.equals(" ")){
        response.sendRedirect("../index.jsp");
    }  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../public/img/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <title>SIGMAA | Oficina de Orientacion y Permanencia Estudiantil</title>
    </head>
    <body>
       <%--Inicio del encabezado de la página --%>  
    <div class="card-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="text-center">
                        <img src="../public/img/LogoUno.png" class="img-fluid float-left" alt="Responsive image" width="100% ">
                    </div>
                </div>
                <div class="col-sm-7">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Nuevo
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="../OficinaOPE/NuevoMonitor.jsp">Nuevo Monitor</a>                                      
                                        <a class="dropdown-item" href="../OficinaOPE/CrearTutorias.jsp">Remision de Monitorias</a>   
                                        
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Editar 
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="ModificarUsuarios.jsp">Editar Monitores</a>
                                        <a class="dropdown-item" href="ModificarMonitorias.jsp">Remision de Monitoria</a>
                                        <a class="dropdown-item" href="ActualizarPassword.jsp">Cambiar Clave</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Manual de Funcionario</a>
                        
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
            <div class="card-body" >                
                <div class="card text-center">
                    <h1> Orientación y Permanencia Estudiantil</h1>
                </div>
                <div class="container" style="margin-top: 3%;">                    
                    <div class="row justify-content-md-center">
                        <div class="col-lg-4">                           
                            <a class="nav-link" href="ConsultarUsuarios.jsp">
                                <img src="../public/img/Monitor2.jpg" class="rounded mx-auto d-block" alt="..." width="100px" height="100px">
                            </a>   
                        </div>
                        <div class="col-lg-3" >
                            <a class="nav-link" href="ConsultarMonitoria.jsp">
                                <img src="../public/img/Monitorias.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px">
                            </a>
                        </div>
                        <div class="col-lg-3">
                            <a class="nav-link" href="ConsultarDatos.jsp">
                                <img src="../public/img/Resumen.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px">
                            </a>
                        </div>
                         <div class="col-lg-3" style="margin-top: 2%;">                            
                            <a class="nav-link" href="https://meet.google.com/" target="_blank">
                                <img src="../public/img/Videoconferencia.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px">
                            </a>   
                      </div> 
                         <div class="col-lg-3"style="margin-top: 2%;">                            
                            <a class="nav-link" href="http://gmail.com/" target="_blank">
                                <img src="../public/img/email.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px">
                            </a>   
                      </div> 
                    </div>
                </div>           
                
            </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center" style="margin-top: 14.9%";>    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
<%-- Fin del píe de la página --%>  
    </body>
</html>

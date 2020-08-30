<%-- 
    Document   : index
    Created on : 31/07/2020, 11:21:15 AM
    Author     : emanjarres
--%>
<%@page session="true" %>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("Usuario");
    try{
        if(usuario.equals(" ")){
        response.sendRedirect("./index.jsp");
    }  
    }catch(Exception e){
        response.sendRedirect("./index.jsp");
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../public/img/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <title>SIGMAA |Portal de Monitoria</title>
    </head>
    <body>
        <%--Inicio del encabezado de la página --%>  
    <div class="card-header">
        <div class="container" >
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
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Nuevo
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">                                        
                                        <a class="dropdown-item" href="RegistroMonitoria.jsp">Registrar Monitoria</a>
                                    </div>
                                </li>
                                <li class="nav-item active">                                    
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Actualizar
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">                                        
                                        <a class="dropdown-item" href="ActualizarPassword.jsp">Contraseña</a>
                                    </div>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="../index.jsp">Salir<span class="sr-only">(current)</span></a>
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
                    <h1>Zona de monitores</h1>
                </div>                  
                
                <div class="container" >
                    <div class="row justify-content-md-center" style="margin-top:8%;" >
                        <div class="col-lg-2">                            
                            <a class="nav-link" href="ConsultaMonitorias.jsp" target="_blank">
                                <img src="../public/img/Monitorias.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="Consulta Monitorias Pendientes">
                            </a>   
                        </div>
                        <div class="col-lg-2">                            
                            <a class="nav-link" href="CargueEvidencias.jsp" target="_blank">
                                <img src="../public/img/Evidencia.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="Atención Monitorias Remitidas OPE">
                            </a>   
                        </div>                        
                                            
                        <div class="col-lg-2">                            
                            <a class="nav-link" href="https://meet.google.com/" target="_blank">
                                <img src="../public/img/Videoconferencia.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="VideoConferencias">
                            </a>   
                        </div> 
                        <div class="col-lg-2">                            
                            <a class="nav-link" href="http://gmail.com/" target="_blank">
                                <img src="../public/img/email.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="Correo Institucional">
                            </a>   
                        </div> 
                    </div>                    
                </div> 
            </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center" style="margin-top: 21%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%> 
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>

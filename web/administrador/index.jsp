<%-- 
    Document   : index
    Created on : 25/07/2020, 07:17:29 AM
    Author     : emanjarres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  session="true"%>
<%
    
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("UsuarioLogeado");
    if(usuario.equals(" ")){
        response.sendRedirect("../index.jsp");
    } 

    if(request.getParameter("cerrar")!=null){
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta  http-equiv="Expires" content="-1">
        <meta  http-equiv=="Pragma" content="no-cache">
        <meta  http-equiv="Cache-Control" content="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../public/img/favicon.ico">
        <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/misestilos.css" rel="stylesheet" type="text/css"/>
        
        
        <title>SIGMAA|Dashboard de TI</title>
    </head>
    <body>
        <%--Inicio del encabezado de la página --%>  
    <div class="card-header" >
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="text-center">
                        <img src="../public/img/LogoUno.png" class="img-fluid float-left" alt="Responsive image" width="100%">
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
                                         <a class="dropdown-item" href="CargaRegistroEstudiantes.jsp">Estudiantes</a>
                                        <a class="dropdown-item" href="CrearCampus.jsp">Campus</a>
                                        <a class="dropdown-item" href="CrearFacultad.jsp">Facultad</a>
                                        <a class="dropdown-item" href="CrearProgramas.jsp">Programa</a>
                                         <a class="dropdown-item" href="CrearMaterias.jsp">Materias</a>
                                        <a class="dropdown-item" href="CrearUsuarios.jsp">Usuarios</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Editar
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="ModificarCampus.jsp">Campus</a>
                                        <a class="dropdown-item" href="ModificarFacultad.jsp">Facultad</a>
                                        <a class="dropdown-item" href="ModificarProgramas.jsp">Programa</a>
                                        
                                         <a class="dropdown-item" href="ModificarMaterias.jsp">Materias</a>
                                        <a class="dropdown-item" href="ModificarUsuarios.jsp">Usuarios</a>
                                    </div>
                                </li>
                                 <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Actualizar
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        
                                        <a class="dropdown-item" href="ActualizarPassword.jsp">Actualizar Password</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Manual de Usuario</a>
                        
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
            <div class="card-body" style="margin-top:3.8%;" >
                
                <div class="container">
                    <div class="row justify-content-md-center">
                      <div class="col-lg-2">
                 
                            <a class="nav-link" href="ConsultaCampus.jsp">
                                <img src="../public/img/Campus.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="Consulta de campus universitario">
                            </a>   
                      </div>
                      <div class="col-lg-2">
                            <a class="nav-link" href="ConsultaFacultades.jsp">
                                <img src="../public/img/Facultades.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="Consulta de Facultades">
                            </a>
                      </div>
                      <div class="col-lg-2">
                            <a class="nav-link" href="ConsultaMaterias.jsp">
                                <img src="../public/img/Materias.png" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="Consulta de Materias">
                            </a>
                      </div>
                    </div>
                    <div class="row justify-content-md-center">
                      <div class="col-lg-2" >
                            <a class="nav-link" href="ConsultaUsuarios.jsp">
                                <img src="../public/img/Monitores.jpg" class="rounded mx-auto d-block" alt="..." width="100px" height="100px" title="Consulta de Usuarios">
                            </a>   
                      </div>
                     
                      
                    </div>
                </div>           
                
            </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center"  style="margin-top:18.19%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%>
        <h1></h1>
        <script src="../public/js/jquery-3.5.1.js" type="text/javascript"></script>
        <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
        
    </body>
</html>

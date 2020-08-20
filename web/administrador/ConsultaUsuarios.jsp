<%-- 
    Document   : ConsultaUsuarios
    Created on : 7/08/2020, 08:52:04 AM
    Author     : emanjarres
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>SIGMAA |Listado de Usuarios Registrados</title>
        <link rel="icon" href="../public/img/favicon.ico">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <link href="../public/css/estilos.css" rel="stylesheet" type="text/css"/>
          <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
 <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
 <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../public/css/estilos.css" rel="stylesheet" type="text/css"/>
         <script type="text/javascript">
            
            $(document).ready(function() {
                
                $('#tablaUsuarios').DataTable({
                    
                    "ajax":{
                      "method":"POST",
                      "url":"../ConsultarTodosUsuarios",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "Id_usuarios" },
                      { "data": "Name_users" },
                      { "data": "Mail_users" },
                      { "data": "Phone_users" },
                      { "data": "nombre" },
                      { "data": "Name_campus" },
                      { "data": "Name_faculty" },
                      { "data": "Name_program" },
                      { "data": "Semestre" },
                      { "data": "Modalidad" }
                      
                    ]
                });
              
                //$.fn.dataTable.ext.errMode = 'throw';
               
            });
        
        </script>
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
            <div class="card-body">
                <div class="card text-center">
                    <h1>Listado de Usuarios Registrados</h1>
                </div> 
            </div>
                 <div class="container-fluid" style="margin-top: 1%;">
                    <div class="table-responsive">
                        <table id="tablaUsuarios" class="table table-bordered table-striped table-hover" style="width:100%">
                            <thead class="text-center">
                                <tr>
                                    <th>Documento</th>
                                    <th>Nombres</th>
                                  
                                    <th>Correo</th>
                                    <th>Teléfono</th>
                                    <th>Tipo</th>
                                    <th>Campus</th>
                                    <th>Facultad</th>
                                    <th>Programa</th>
                                    <th>Semestre</th>
                                    <th>Modalidad</th>                                    
                                </tr>
                            </thead>
                            <tbody  class="text-center">
                            </tbody>                                
                        </table>
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
       
    </body>
</html>

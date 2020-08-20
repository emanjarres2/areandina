<%-- 
    Document   : ConsultaProgramas
    Created on : 26/07/2020, 03:44:57 PM
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
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../public/img/favicon.ico">
         <title>SIGMAA | Listado de Programas Registrados</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#tablaprogramas').DataTable(
                        {
                    "ajax":{
                      "method":"POST",
                      "url":"../ConsultarProgramas",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "Id_program" },
                      { "data": "Name_program" },
                      { "data": "Modalidad" },
                      { "data": "Name_campus" },
                      { "data": "Name_faculty" }
                      
                      
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
                    <h1>Listado de Programas Registrados</h1>
                </div> 
                  <div class="container-fluid" style="margin-top:1%;">
                    <div class="table-responsive" >
                        <table id="tablaprogramas" class="table table-bordered table-striped table-hover" style="width:100%">
                            <thead>
                                <tr class="text-center">
                                    <th>N°</th>
                                    <th>Programa</th>
                                    <th>Modalidad</th>                                                                        
                                    <th>Campus</th>                                                                        
                                    <th>Facultad</th>                                                                        
                                </tr>
                            </thead>
                            <tbody>
                                      
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

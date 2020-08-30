<%-- 
    Document   : ConsultaMonitorias
    Created on : 2/08/2020, 05:58:16 AM
    Author     : emanjarres
--%>
<%@page  session="true"%>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("Usuario");
    if(usuario.equals(" ")){
        response.sendRedirect("index.jsp");
    }  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../public/img/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
         <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <title>SIGMAA | Listado de Registro de Monitoria</title>
        <link href="../public/css/estilos.css" rel="stylesheet" type="text/css"/>
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
                    <h1>Monitorias Pendientes</h1>
                    <input id="nombre" name="nombre" value="${usuario}" visibility: hidden>
                </div>  
            </div>
            <div class="container-fluid" style="margin-top: 2%;">
                    <div class="table-responsive">
                        <table id="tablaTutorias" class="table table-bordered table-striped table-hover" style="width:100%">
                            <thead class="text-center ">
                                <tr>
                                    <th>N°</th>
                                    <th>Fecha</th>                                   
                                    <th>Estudiante</th>
                                    <th>Telefono</th>
                                    <th>Correo</th>
                                    <th>Semestre</th>
                                    <th>Factor</th>
                                    <th>Monitor</th>
                                    <th>Observaciones</th>
                                </tr>
                            </thead>
                            <tbody class="text-center">
                       
                            </tbody>                                
                        </table>
                    </div>                    
                </div>  
                
            </div>        
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center" style="margin-top: 16.4%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%>  
        
            <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        
        <script type="text/javascript">            
            $(document).ready(function() {                
                $('#tablaTutorias').DataTable({                    
                    "ajax":{
                      "method":"POST",
                      "url":"../ConsultaTutorias",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "Id_tutorias" },
                      { "data": "fecha" },
                      { "data": "Name_estudiantes" },
                      { "data": "Telefono_estudiantes" },
                      { "data": "Mail_estudiantes" },
                      { "data": "nombre" },
                      { "data": "Name_factor" },
                      { "data": "Name_users" },
                      { "data": "observaciones" }
                    ]
                });
              
                //$.fn.dataTable.ext.errMode = 'throw';
               
            });
        
        </script>
    </body>
</html>

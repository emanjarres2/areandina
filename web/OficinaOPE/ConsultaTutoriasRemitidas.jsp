<%-- 
    Document   : ConsultaTutoriasRemitidas
    Created on : Aug 29, 2020, 9:48:08 PM
    Author     : manjarres
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
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
        <title>JSP Page</title>
        <link href="../public/css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
        
         <script type="text/javascript">
            
            $(document).ready(function() {                
                $('#tablaxxx').DataTable({                   
                    "ajax":{
                      "method":"POST",
                      "url":"../consultatotalmonitoriasasignadas",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "fecha" },                   
                      { "data": "estudiante" },
                      { "data": "semestre" },
                      { "data": "factor" },
                      { "data": "monitor" },
                      { "data": "observaciones" } 
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
            <h1>Consulta de resultado de monitorias asignadas por OPE</h1>
        </div>
    </div>  
    <div class="container-fluid" style="margin-top: 2%;">
            <div class="table-responsive">
                <table id="tablaxxx" class="table table-bordered table-striped table-hover" style="width:100%">
                    <thead class="text-center ">
                        <tr>
                            <th>Fecha</th>
                            <th>Estudiante</th>
                            <th>Semestre</th>
                            <th>Factor</th>
                            <th>Monitor</th>                              
                            <th>Obs. OPE</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>                                
                </table>
            </div>                    
        </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center" style="margin-top: 10%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%>          
    </body>
</html>

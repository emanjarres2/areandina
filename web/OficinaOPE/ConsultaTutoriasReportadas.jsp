<%-- 
    Document   : ConsultaTutoriasReportadas
    Created on : Aug 29, 2020, 9:48:37 PM
    Author     : manjarres
--%>


<%@page  session="true"%>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("UsuarioAutenticado");
    if(usuario.equals(" ")){
        response.sendRedirect("index.jsp");
    }  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGMAA | Consulta de Monitorias Reportadas</title>
        <link rel="icon" href="../public/img/icon.png" type="img/png">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <link href="../public/css/estilos.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.3/css/buttons.bootstrap4.min.css"/>
        <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.3/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.3/js/buttons.bootstrap4.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.3/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.3/js/buttons.print.min.js"></script>
        
        <script type="text/javascript">            
            $(document).ready(function() {                
                $('#tablaMonitorias').DataTable({
                    "responsive":"true",
                    "dom":'Bfrtilp',
                    "buttons":[
                        {
                            "extend":'excelHtml5',
                            "text":'<i class="fas fa-file-excel"></i>',
                            "titleAttr":'Exportar a Excel',
                            "className":'btn btn-success'
                        },{
                            "extend":'pdfHtml5',
                            "text":'<i class="fas fa-file-pdf"></i>',
                            "titleAttr":'Exportar a PDF',
                            "className":'btn btn-danger' 
                        } ,
                        {
                            "extend":'print',
                            "text":'<i class="fas fa-print"></i>',
                            "titleAttr":'Imprimir',
                            "className":'btn btn-info'
                        }
                    ],
                    "ajax":{
                      "method":"POST",
                      "url":"../consultamonitoriasreportadas",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "fecha" },
                      { "data": "idEstudiante" },
                      { "data": "nombreEstudiante" },
                      { "data": "factor" },
                      { "data": "tipoMonitoria" },
                      { "data": "monitor" },
                      { "data": "sede" },
                      { "data": "facultad" },
                      { "data": "programa" },   
                      { "data": "materia" },   
                      { "data": "observaciones" },   
                      { "data": "remision" },   
                      { "data": "evidencia" }
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
                    <h1> Consulta de Monitorias Reportadas</h1>
                </div> 
            </div>
            <div class="container-fluid" style="margin-top: 2%;">
                <div class="table-responsive">
                    <table id="tablaMonitorias" class="table table-bordered table-striped table-hover" style="width:100%">
                        <thead class="text-center ">
                            <tr>                                
                                <th>Fecha</th>
                                <th>Identificación Estudiante</th>
                                <th>Nombre del Estudiante</th>
                                <th>Factor</th>
                                <th>Tipo Monitoria</th>
                                <th>Monitor</th>                                
                                <th>Sede</th>
                                <th>Facultad</th>                                    
                                <th>Programa</th>                                    
                                <th>Materia</th>                                    
                                <th>Observaciones del Monitor</th>                                    
                                <th>Remisión</th>                                    
                                <th>Evidencia</th>                                    
                            </tr>
                        </thead>
                        <tbody></tbody>                                
                    </table>
                </div>                    
            </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card-footer text-center" style="margin-top: 14%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%>             
    
                   
                
    </body>
</html>

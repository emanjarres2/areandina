<%-- 
    Document   : ModificarCampus
    Created on : 26/07/2020, 04:40:04 PM
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
        <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../public/js/jquery-3.5.1.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <title>SIGMAA | Editar Registro de Campus</title>
        <script type="text/javascript">
            
            $(document).ready(function() {
                
                $('#tablaSedes').DataTable({
                    "ajax":{
                      "method":"POST",
                      "url":"../ConsultarCampus",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "Id_campus" },
                      { "data": "Name_campus" },
                      { "data": "Tipo" },
                      { "data": "Direccion" }
                    ]
                });
              
                //$.fn.dataTable.ext.errMode = 'throw';
               
            });
        
        </script>
        <script type="text/javascript">
            
          
            $(document).on('click', '.eliminar', function(){
                var idCampus = $(this).attr('id');
                var row = $(this).parent().parent();
                var texto;
                var respuesta =  confirm("¿Estas seguro de eliminar el registro?");
                if (respuesta === true){
                    $.ajax({
                        url: '../eliminarCampus',
                        method: 'POST',
                        data: {"action":"eliminar", "idCampus":"idCampus"},
                        
                        success: function (data) {
                            row.remove();   
                        },
                        error: function(error){
                            alert('Error en Ajax');
                        }
                       
                    });
                }else{
                    
                }              
                
                
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
                    <h1>Sedes disponibles</h1>
                </div>                
               
            </div>
                  <div class="container-fluid">
            <div class="table-responsive" style="margin-top: 1%">
                        <table id="tablaSedes" class="table table-bordered table-striped table-hover " style="width:100%">
                            <thead>
                                <tr>
                                    <th>N°</th>
                                    <th>Sede</th>
                                    <th>Tipo</th>
                                    <th>Dirección</th>                                                                        
                                </tr>
                            </thead>
                            <tbody>
                      
                            </tbody>                                
                        </table>
                    </div>                    
                </div> 
       
            </div> 
                <br>        
            <div class="card text-center">
                    <h1>Área de modificaciones</h1>
            </div>        
            <div class="container"style="margin-top:7%;">
                <form action="../ModificarCampus" method="post" id="formularioModificarCampus" class="needs-validation" novalidate>
                <div class="row justify-content-md-center">                    
                    <div class="col-sm-1">
                        <div class="form-group">
                            <div class="form-group text-center">
                                <label for="validationCustom01">Id</label>
                                <input type="text" class="form-control" id="identificadorCampus" name="identificadorCampus" placeholder="Id" required>
                            </div>                                                                       
                        </div> 
                    </div>
                    <div class="col-sm-3">
                        <div class="form-group">                       
                            <div class="form-group text-center">
                                <label for="validationCustom01">Nombre del campus</label>
                                <input type="text" class="form-control" id="nombreCampus" name="nombreCampus" placeholder="Campus"  required>
                            </div>                                                                        
                        </div> 
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group text-center">                                                
                            <label for="validationCustom04">Tipo</label>
                            <select class="custom-select" id="tipoCampus" name="tipoCampus" required>
                                <option selected disabled value="">Seleccione</option>
                                <option>Sede</option> 
                                <option>Seccional</option>
                            </select>                                                
                        </div> 
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">                        
                            <div class="form-group text-center">
                                <label for="validationCustom01">Direccion del Campus</label>
                                <input type="text" class="form-control" id="direccionCampus" name="direccionCampus" placeholder="Direccion" required>
                            </div>                                         
                        </div> 
                    </div>                    
                    <div class="col-sm-2">
                        <div class="form-group text-center">
                            <label for="validationCustom04">Acción</label><br>
                            <button value="1" type="submit" name="btnModificarCampus" id="btnModificarCampus" class="btn btn-outline-primary" data-toggle="tooltip" title="Actualizar el registro"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                            <button value="2" type="submit" name="btnEliminarCampus" id="btnEliminarCampus" class="btn btn-outline-primary" data-toggle="tooltip" title="Eliminar el registro"><i class="fa fa-trash" aria-hidden="true"></i></button>
                        </div> 
                    </div>                   
                </div>
                </form>
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

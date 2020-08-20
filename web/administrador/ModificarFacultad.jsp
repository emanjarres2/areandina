<%-- 
    Document   : ModificarFacultad
    Created on : 29/07/2020, 05:00:49 PM
    Author     : emanjarres
--%>

<%@page import="Controller.MuestraCampus"%>
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
        <title>SIGMAA |ModificarCampus</title>
        <link rel="icon" href="../public/img/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
        <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <script>
                 $(document).ready(function(){
                    $('#tablaFacultades').DataTable({
                    
                    "ajax":{
                      "method":"POST",
                      "url":"../ConsultarFacultades",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "Id_faculty" },
                      { "data": "Name_faculty" },
                      { "data": "Name_campus" }
                    ]
                });
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
                    <h1>Facultades</h1>
                </div> 
             <div class="container-fluid" style="margin-top: 1%;">
                    <div class="table-responsive">
                        <table id="tablaFacultades" class="table table-bordered table-striped table-hover" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Identificador</th>
                                    <th>Facultad</th>
                                    <th>Pertenece a la sede</th>
                                                                        
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
        <div class="container">
                <form action="../ModificarFacultades" method="post" id="formularioModificarFacultad" class="needs-validation" novalidate>
                <div class="row justify-content-md-center">                    
                    <div class="col-sm-1">
                        <div class="form-group">
                            <div class="form-group text-center">
                                <label for="validationCustom01">Id</label>
                                <input type="text" class="form-control" id="identificadorFacultad" name="identificadorFacultad" placeholder="Id" required>
                            </div>                                                                       
                        </div> 
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">                       
                            <div class="form-group text-center">
                                <label for="validationCustom01">Facultad</label>
                                <input type="text" class="form-control" id="nombreFacultad" name="nombreFacultad" placeholder="Nombre Facultad" required>
                            </div>                                                                        
                        </div> 
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group text-center">                                                
                            <label for="validationCustom04">Campus</label>
                            <select class="custom-select" id="nombreCampus" name="nombreCampus" required>
                                <option selected disabled value="">Seleccione</option>
                                <% MuestraCampus mc = new MuestraCampus(); %>
                                <%= mc.getNombreCampus() %>
                            </select>                                                
                        </div> 
                    </div>                                        
                    <div class="col-sm-2">
                        <div class="form-group text-center">
                            <label for="validationCustom04">Acción</label><br>
                            <button value="1" type="submit" name="btnModificarFacultad" id="btnModificarFacultad" class="btn btn-outline-primary" data-toggle="tooltip" title="Actualizar el registro"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                            <button value="2" type="submit" name="btnEliminarFacultad" id="btnEliminarFacultad" class="btn btn-outline-primary" data-toggle="tooltip" title="Eliminar el registro"><i class="fa fa-trash" aria-hidden="true"></i></button>
                        </div> 
                    </div>                   
                </div>
                </form>
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

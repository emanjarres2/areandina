<%-- 
    Document   : ModificarEstudiantes
    Created on : 31/07/2020, 05:40:56 PM
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
        <link rel="icon" href="../public/img/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <title>SIGMAA |Editar Registro de Estudiantes</title>
        <script type="text/javascript">
            
            $(document).ready(function() {
                
                $('#tablaEstudiantes').DataTable({
                    
                    "ajax":{
                      "method":"POST",
                      "url":"../ConsultaEstudiantes",
                      "dataSrc":"datos"
                    },"columns":[
                      { "data": "Id_estudiante" },
                      { "data": "Documento" },
                      { "data": "Name_estudiantes" },
                      { "data": "Mail_users" },
                      { "data": "Phone_users" },
                      { "data": "Estado_usuario" },
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
                <h1>Estudiantes</h1>
            </div> 
        </div>
                <div class="container-fluid" style="margin-top: 1%;" >
            
                        <table id="tablaEstudiantes" class="table table-bordered table-striped table-hover " style="width:100%">
                            <thead class="text-center">
                                <tr>
                                    <th>N°</th>
                                    <th>Documento</th>
                                    <th>Nombres</th>
                                    <th>Correo</th>
                                    <th>Teléfono</th>
                                    <th>Estado</th>
                                    <th>Campus</th>
                                    <th>Facultad</th>
                                    <th>Programa</th>
                                    <th>Semestre</th>
                                    <th>Modalidad</th>
                                    
                                </tr>
                            </thead>
                           
                            <tbody>
                            
                           
                            </tbody>                                
                        </table>
        </div>
            <br>
            <div class="card text-center">
                <h1>Área de modificaciones</h1>
            </div>
            <div class="container">
                <form action="../ModificarEstudiantes" method="post" id="formularioModificarEstudiantes" class="needs-validation" novalidate>
                    <div class="row text-center">
                    <div class="col-2">
                        <div class="form-group">
                            <label for="validationCustom01">Identificación</label><br>                                                          
                            <input type="text" class="form-control" id="identificacion" name="identificacion" placeholder="Numero de documento" required >
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="form-group">
                            <label for="validationCustom01">Nombres y Apellidos</label>
                            <input type="text" class="form-control" id="nombresApellidos" name="nombresApellidos" placeholder="Nombre Completo" required>
                        </div>                                
                    </div>
                    <div class="col-5">
                        <div class="form-group">
                            <label for="validationCustom04">Correo electrónico</label>
                            <input type="email" class="form-control" id="mail" name="mail" required placeholder="email@estudiantes.areandina.edu.co">
                        </div>
                    </div>                        
                </div>               
                    <div class="row text-center">
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Número de contacto</label>
                            <input type="tel" size="10" class="form-control" id="telefono" name="telefono" required placeholder="Ej: 3201111111">
                        </div>    
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Estado del estudiante</label>
                            <select class="custom-select" id="estado" name="estado" required>
                                <option selected disabled>Seleccione...</option>
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Modalidad</label>
                            <select class="custom-select" id="nombreModalidad" name="nombreModalidad" required>
                                <option selected disabled>Seleccione...</option>
                                <option value="Presencial">Presencial</option>
                                <option value="Virtual">Virtual</option>
                                <option value="Distancia">Distancia</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Semestre</label>
                            <select class="custom-select" id="semestre" name="semestre" required>
                                <option selected disabled>Seleccione...</option>
                                <option value="1">Primero</option>
                                <option value="2">Segundo</option>
                                <option value="3">Tercero</option>
                                <option value="4">Cuarto</option>
                                <option value="5">Quinto</option>
                                <option value="6">Sexto</option>
                                <option value="7">Septimo</option>
                                <option value="8">Octavo</option>
                                <option value="9">Noveno</option>
                                <option value="10">Décimo</option>
                            </select>
                        </div>
                    </div>
                </div> 
                    <div class="row justify-content-md-center">                     
                        <div class="col-4">
                            <div class="form-group">
                                <select class="custom-select" id="idcampus" name="idcampus" >
                                    <option selected disabled value="">Seleccione la sede o campus</option>
                                    <% MuestraCampus mc = new MuestraCampus();%>
                                    <%= mc.getNombreCampus()%>
                                </select>                                                
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group">
                                <select class="custom-select" id="idfacultad" name="idfacultad" >
                                    <option selected disabled value="">Seleccione la facultad</option>  
                                </select>                                                
                            </div>
                        </div> 
                        <div class="col-4">
                            <div class="form-group">
                                <select class="custom-select" id="idprograma" name="idprograma" >
                                    <option selected disabled value="">Seleccione el programa</option>  
                                </select>                                                
                            </div>
                        </div>                      
                        <div class="col-sm-2">
                            <div class="form-group text-center">
                                <label for="validationCustom04">Acción</label><br>
                                <button value="3" type="submit" name="btnModificarEstudiante" id="btnModificarEstudiante" class="btn btn-outline-primary" data-toggle="tooltip" title="Actualizar el registro"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>
                                <button value="4" type="submit" name="btnEliminarEstudiante" id="btnEliminarEstudiante" class="btn btn-outline-primary" data-toggle="tooltip" title="Eliminar el registro"><i class="fa fa-trash" aria-hidden="true"></i></button>
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

 
    </body>
</html>

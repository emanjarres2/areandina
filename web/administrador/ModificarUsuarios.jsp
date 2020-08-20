<%-- 
    Document   : ModificarUsuarios
    Created on : 30/07/2020, 06:16:31 PM
    Author     : emanjarres
--%>

<%@page import="Controller.MuestraListas"%>
<%@page import="Controller.MuestraCampus"%>
<%@page import="Controller.MuestraCampus"%>

<!DOCTYPE html>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("UsuarioLogeado");
    if(usuario.equals(" ")){
        response.sendRedirect("../index.jsp");
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGMAA |Editar Registro de Usuario</title>
        <link rel="icon" href="../public/img/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link href="../public/css/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
        <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
         <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
     <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
        <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>  
        
        <script type="text/javascript">
            
            $(document).ready(function() {
                
                $('#tablaUsuarios').DataTable({
                    
                    "ajax":{
                      "method":"POST",
                      "url":"../ConsultarUsuarios",
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
        
         <script type="text/javascript">
        
        $(document).ready(function(){
            $('select[name=idcampus]').on('change', function(){
                $.ajax({
                    type: 'GET',
                    url: '../SeleccionarFacultad',
                    data: 'codigocampus='+$('select[name=idcampus]').val(),
                    statusCod:{
                        404: function(){
                            alert('Pagina no enocntrada');
                        },
                        500: function(){
                            alert('Error de servidor');
                        }
                    },
                    success: function(datos){
                        $('select[name=idprograma] option').remove();
                        $('select[name=idfacultad] option').remove();
                        var pegados = datos.split(":");
                        
                        if(datos ===""){
                           $('select[name=idfacultad]').append('<option>La sede no tiene facultades</option>');
                        }else{
                            var vacio ="Seleccione Facultad";  
                            for(var i = 0; i < pegados.length-1; i++){
                                var codigo = pegados[i].split("-")[0];
                                var nombre = pegados[i].split("-")[1];
                                if(i>0){
                                $('select[name=idfacultad]').append("<option value="+codigo+">"+nombre+"</option>");    
                                }else{
                                $('select[name=idfacultad]').append("<option selected>"+vacio+"</option><option value="+codigo+">"+nombre+"</option>");    
                                }
                                
                            } 
                        }
                        
                    }
                });
                
            });
        });
               
    </script>
        <script type="text/javascript">
        
        $(document).ready(function(){
            $('select[name=idfacultad]').on('change', function(){
                $.ajax({
                    type: 'GET',
                    url: '../SeleccionarPrograma',
                    data: 'codigofacultad='+$('select[name=idfacultad]').val(),
                    statusCod:{
                        404: function(){
                            alert('Pagina no enocntrada');
                        },
                        500: function(){
                            alert('Error de servidor');
                        }
                    },
                    success: function(datos){
                        $('select[name=idprograma] option').remove();
                        var pegados = datos.split(":");
                        
                        if(datos ===""){
                           $('select[name=idprograma]').append('<option>La facultad no tiene programas</option>');
                        }else{
                            var vacio = "Seleccione Programa";
                            for(var i = 0; i < pegados.length-1; i++){
                                var codigo = pegados[i].split("-")[0];
                                var nombre = pegados[i].split("-")[1];
                                var modalidad = pegados[i].split("-")[2];
                                if(i>0){
                                $('select[name=idprograma]').append("<option value="+codigo+">"+nombre+" - "+modalidad+"</option>");    
                                }else{
                                $('select[name=idprograma]').append("<option selected>"+vacio+"</option><option value="+codigo+">"+nombre+" - "+modalidad+"</option>");    
                                }                                
                            } 
                        }                        
                    }
                });                
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
                    <h1>Usuarios</h1>
                   
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
                <div class="card text-center">
                    <h1 align="center">Área de modificaciones</h1>
                </div>
                 
                <div class="container" style="margin-top: 1%;">
                <form action="../ModificarUsuarios" method="post" id="formularioModificarUsuarios" class="needs-validation" novalidate>
                    <div class="row text-center">
                    <div class="col-2">
                        <div class="form-group">
                            <label for="validationCustom01">Documento</label><br>                                                          
                            <input type="text" class="form-control" id="identificacion" name="identificacion" placeholder="documento" required >
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="form-group">
                            <label for="validationCustom01">Nombres Completo</label>
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
                            <label for="validationCustom04">Tipo</label>
                            <select class="custom-select" id="tipo" name="tipo" required>
                                <option selected disabled>Seleccione...</option>
                                <%  MuestraListas mf = new MuestraListas(); %>
                                <%= mf.getListaTipoMonitor() %>
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
                                <option value="No Aplica">No aplica</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Semestre</label>
                            <select class="custom-select" id="semestre" name="semestre" required>
                                <%= mf.getListaSemestres() %>
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
                                <button value="1" type="submit" name="btnModificarUsuario" id="btnModificarUsuario" class="btn btn-outline-primary" data-toggle="tooltip" title="Actualizar el registro"><i class="far fa-edit" aria-hidden="true"></i></button>
                                <button value="2" type="submit" name="btnEliminarUsuario" id="btnEliminarUsuario" class="btn btn-outline-primary" data-toggle="tooltip" title="Eliminar el registro"><i class="far fa-trash-alt" aria-hidden="true"></i></button>
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

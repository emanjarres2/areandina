<%-- 
    Document   : CrearUsuarios
    Created on : 26/07/2020, 03:28:53 PM
    Author     : emanjarres
--%>

<%@page import="Controller.MuestraListas"%>
<%@page import="Controller.MuestraCampus"%>
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
        <meta http-equiv="Content-Type" content="text/html;text/javascript; charset=UTF-8">
        <title>SIGMAA | Registro de Usuarios</title>
        <link rel="icon" href="../public/img/favicon.ico">
         
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
        
         <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
         
    </head>
    <body>
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
<div class="container" style="margin-top:1%;">
    <div class="card" >
        <div class=" card-header mb-3  text-center text-white " style="background:#77C043;" > <i class="fas  fa-users fa-2x fa-lg" style="float:left;"> </i> <h2 style="margin-left: 1.5em;">Registro de Usuario</h2>  </div>
            <div class=" card-body" > 
               <form action="${pageContext.request.contextPath}/CrearUsuarios" method="post" id="formularioUsuarios" name="formularioUsuarios" novalidate>
                <div class="row">
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom01">Numero de Documento</label><br>                                                          
                            <input type="text" class="form-control" id="identificacion" name="identificacion" required  placeholder="Numero de documento">
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label for="validationCustom01">Nombres y Apellidos</label>
                            <input type="text" class="form-control" id="nombresApellidos" name="nombresApellidos" required placeholder="Nombre completo">
                        </div>                                
                    </div>
                    <div class="col-5">
                        <div class="form-group">
                            <label for="validationCustom04">Correo electrónico</label>
                            <input type="email" class="form-control" id="mail" name="mail" required placeholder="email@areandina.edu.co">
                        </div>
                    </div>
                    
                </div>
                <div class="row ">
                     <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Password</label>
                            <input type="password" class="form-control" id="pass" name="pass" required placeholder="*********">
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Número de contacto</label>
                            <input type="tel" size="10" class="form-control" id="telefono" name="telefono" required placeholder="Ej: 3201111111">
                        </div>    
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Tipo de usuario</label>
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
                   
                </div>
                <div class="row">
                     <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Semestre</label>
                            <select class="custom-select" id="semestre" name="semestre" required>
                                <option selected disabled>Seleccione...</option>
                                <%= mf.getListaSemestres() %>
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                             <label for="validationCustom05">Seleccione la sede o campus</label>
                            <select class="custom-select" id="idcampus" name="idcampus" >
                                <option selected disabled value="">Seleccione la sede o campus</option>
                                <% MuestraCampus mc = new MuestraCampus(); %>
                                <%= mc.getNombreCampus() %>
                            </select>                                                
                        </div>
                    </div>
                    <div class="col-3">        
                        <div class="form-group">
                            <label for="validationCustom06">Seleccione Facultad</label>
                            <select class="custom-select" id="idfacultad" name="idfacultad" >
                                <option selected disabled value="">Seleccione la facultad</option>  
                            </select>                                                
                        </div>
                    </div>
                    <div class="col-3">          
                        <div class="form-group">
                            <label for="validationCustom07">Seleccione Programa</label>
                            <select class="custom-select" id="idprograma" name="idprograma" >
                                <option selected disabled value="">Seleccione el programa</option>  
                            </select>                                                
                        </div>
                    </div>    
                </div>
                            <hr>
                <div class="d-flex align-items-end flex-column bd-highlight mb-3">                            
                    <button class="btn btn-primary" type="submit" id="btnformularioCrear" name="btnformularioCrear" value="1">Guardar</button>
                </div>
            </form>
           
           
        </div> 
</div>
    </div>
              
  
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
<div class="card text-center" style="margin-top: 13%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%>  
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
                                $('select[name=idfacultad]').append("</option><option value="+codigo+">"+nombre+"</option>");    
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
    <script>
            window.addEventListener('load', function (){
    
            document.getElementById('btnformularioCrear').addEventListener('click', function (){
            var idcampus = document.getElementById('idcampus').value;  
            var idfacultad = document.getElementById('idfacultad').value;
            var idprograma = document.getElementById('idprograma').value;
            var nombremateria =  document.getElementById('nombreMateria').value;
                        
            var confirmacion = false;
         
            if(idcampus.length > 0 && idfacultad.length > 0 && idprograma.length > 0 && nombremateria.length > 0 ){
             confirmacion = true;
            }
         
            if(confirmacion){
             Swal.fire(
                    'Registro de Usuario',
                    'Se ha Agregrado un Usuario',
                    'success'
                );
            //alert('La materia fué creada con exito.' + idcampus + " - " + idfacultad + " - " + idprograma + " - " + idprograma + ", " + nombremateria);
            
            document.getElementById('formularioUsuarios').submit();             
                }else{
                            alert('Por favor diligencie todos los campos');
                        }
                    }
                    );
                }
            );
        </script> 
    
    </body>
</html>

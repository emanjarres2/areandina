<%-- 
    Document   : CrearMonitores
    Created on : 8/08/2020, 02:36:17 PM
    Author     : Administrador
--%>

<%@page import="Controller.MuestraCampus"%>
<%@page import="Controller.MuestraListas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  session="true"%>
<!DOCTYPE html>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("UsuarioLogeado");
    if(usuario.equals(" ")){
        response.sendRedirect("index.jsp");
    }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGMAA | Registro de Monitores</title>
        <link rel="icon" href="../public/img/favicon.ico">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
    <div class="card-body" id="body_administrador">
        <div class="card text-center">
            <h1>Registro de Monitores</h1>
        </div>       
        <div class="container" style="margin-top: 1%;">            
            <form action="../CrearMonitores?btnformularioCrear=1" method="post" id="formularioMonitores" name="formularioMonitores" novalidate>
                <div class="row text-center">
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom01">Documento</label><br>                                                          
                            <input type="text" class="form-control" id="identificacion" name="identificacion" placeholder="Numero de documento"  required >
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group">
                            <label for="validationCustom01">Nombres Completo</label>
                            <input type="text" class="form-control" id="nombresApellidos" name="nombresApellidos" placeholder="Nombre Completo" required>
                        </div>                                
                    </div>
                    <div class="col-5">
                        <div class="form-group">
                            <label for="validationCustom04">Correo electrónico</label>
                            <input type="email" class="form-control" id="mail" name="mail" required placeholder="email@areandina.edu.co">
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
                            </select>
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="form-group">
                            <label for="validationCustom04">Semestre</label>
                            <select class="custom-select" id="semestre" name="semestre" required>
                                <option selected disabled>Seleccione...</option>                                
                                <%= mf.getListaSemestres() %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <div class="form-group">
                            <select class="custom-select" id="idcampus" name="idcampus" >
                                <option selected disabled value="">Seleccione la sede o campus</option>
                                <% MuestraCampus mc = new MuestraCampus(); %>
                                <%= mc.getNombreCampus() %>
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
                </div>            
                <div class="d-flex align-items-end flex-column bd-highlight mb-3">                            
                    <button class="btn btn-primary" type="submit" id="btnformularioCrear" name="btnformularioCrear">Guardar</button>
                </div>
            </form>
        </div>       
        
    </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center" style="margin-top: 15%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%>
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
 <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
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
                        
                        if(datos === ""){
                           $('select[name=idfacultad]').append('<option>La sede no tiene facultades</option>');
                        }else{
                            var vacio ="Seleccione";
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
                    url: '../SelecionarPrograma',
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
                        
                        if(datos === ""){
                           $('select[name=idprograma]').append('<option>La sede no tiene facultades</option>');
                        }else{
                            var vacio = "Seleccione";
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
    
            document.getElementById('btnformularioCrearOPE').addEventListener('click', function (){
            var id = document.getElementById('identificacion').value;  
            var nombre = document.getElementById('nombresApellidos').value;
            var mail = document.getElementById('mail').value;
            var telefono=  document.getElementById('telefono').value;
            var tipo=  document.getElementById('tipo').value;
            var modalidad=  document.getElementById('nombreModalidad').value;
            var semestre=  document.getElementById('semestre').value;
            var campus=  document.getElementById('idcampus').value;
            var facultad=  document.getElementById('idfacultad').value;
            var programa=  document.getElementById('idprograma').value;
                        
            var confirmacion = false;
         
            if(id.length > 0 && nombre.length > 0 && mail.length > 0 && telefono.length > 0 && tipo.length > 0 
                    && modalidad.length > 0 && semestre.length > 0 && campus.length > 0 && facultad.length > 0
                    && programa.length > 0){
             confirmacion = true;
            }
         
            if(confirmacion){
             Swal.fire(
                    'Registro de Usuario',
                    'Se ha Agregrado un Usuario',
                    'success'
                );
            //alert('El monitor fue creado con exito.');
            
            document.getElementById('formularioMonitores').submit();             
                }else{
                    alert('Por favor diligencie los campos.');
                    }
            }
            );
            }
            );
        </script>
    </body>
</html>

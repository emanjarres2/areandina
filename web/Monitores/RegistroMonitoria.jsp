<%-- 
    Document   : RegistroMonitoria
    Created on : 19/08/2020, 01:07:14 PM
    Author     : emanjarres
--%>

<%@page import="Controller.MuestraCampus"%>
<%@page import="Controller.MuestraListas"%>
<%@page import="Modelo.GestionesEstudiantes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("Usuario");
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
        <title>SIGMAA | Registro de Casos de Monitoria</title>
        <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
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
    <%--Inicio del cuerpo de la página --%>  
    <div class="container" style="margin-top:1%;">
        <div class="card">
        <div class="card-header text-white bg-success mb-3" >
         <i class="fas fa-users fa-2x fa-lg" style="float:left;"> </i> <h3 style="margin-left: 1.5em;">Registro de Tutorias</h3> 
        </div>
        <div class="card-body">
            <form action="../guardarResultados?btnGuardar=guardar" method="POST" enctype="multipart/form-data" class="form-horizontal" >
            <hr>          
            <div class="row">
                <div class="col-4">
                <label for="caso">Estudiante:</label> 
                    <select name="estudiante" id="estudiante" class="form-control">
                        <option selected >Seleccione......</option>  
                        <% GestionesEstudiantes ge = new GestionesEstudiantes();%>
                        <%= ge.getListaEstudiantes() %>                    
                    </select> 
                </div>
                <div class="col-4">
                    <label for="ape">Fecha de Atencion</label>
                    <input type="date" id="fecha" name="fecha" class="form-control" >
                </div>
                <div class="col-4">
                    <label for="m">Factor Asociado</label>
                <select name="factor" id="factor" class="form-control">
                        <option selected >Seleccione......</option>
                        <% MuestraListas gf = new MuestraListas();%>
                        <%= gf.getListaFactores() %>
                    </select> 
                </div>                                    
            </div>
            <div class="row">
                <div class="col-4">
                    <label for="usu">Tipo de Monitoria</label>
                    <select name="monitoria" id="monitoria" class="form-control">
                        <option selected>Seleccione......</option>                       
                       <%= gf.getListaTipoMonitor() %>                       
                    </select> 
                </div>
                <div class="col-2">
                    <label for="pass">Sede</label>
                    <select name="sede" id="sede" class="form-control">
                        <option selected>Seleccione......</option> 
                        <% MuestraCampus mc = new MuestraCampus(); %>
                        <%= mc.getNombreCampus() %>
                    </select> 
                </div>
                <div class="col-6">
                    <label for="pass">Facultad</label>
                    <select name="facultad" id="facultad" class="form-control">
                        <option selected>Seleccione......</option>                        
                    </select> 
                </div>    
            </div>        
            <div class="row">
                <div class="col-6">
                    <label for="pass">Programa</label>
                    <select name="programa" id="programa" class="form-control">
                        <option selected>Seleccione......</option>                        
                    </select> 
                </div>
                <div class="col-6">
                    <label for="pass">Materia</label>
                    <select name="materia" id="materia" class="form-control">
                        <option selected>Seleccione......</option>                        
                    </select> 
                </div>
            </div>            
            <div class="row">
                <div class="col" style="margin-top:1%;">
                    <textarea name="texto" id="texto" cols="30" rows="10" class="form-control">
                    </textarea>
                </div>
                <div class="col-4">
                    <h4>Remisión por parte Monitor a la OPE</h4>
                    <p align="justify">Este opción es para que en dado caso el Monitor puede realizar una remisión a la Oficina de Orientación y Permanencia Estudiantil</p>
                    <label for="remision">Remisión a OPE</label>
                    <select name="remision" id="remision" class="form-control">
                        <option selected>Seleccione......</option>
                        <%= gf.getListaRemisiones() %>
                    </select>   
                </div>
            </div>
            <div class="row">
                <label for="remision">Tipo de Evidencia</label>        
            </div>        
            <div class="row">
                <div class="col-5"style="margin-top:1%;">                    
                    <select name="evidencias" id="evidencias" class="form-control">                        
                        <option selected>Seleccione......</option>
                        <option value="foto">Fotografia</option>    
                        <option value="captura">Captura de pantalla</option>    
                        <option value="whatsapp">Whatsapp</option>    
                        <option value="correo">Correo electrónico</option>
                        <option value="sesion">Sesión en linea</option>
                    </select>
                </div>
                <br><br>
                <div class="col-5"style="margin-top:1%;">              
                    <input type="file" name="archivo" id="archivo" enctype="multipart/form-data" class="form-control-file">
                </div>              
             </div> 
            <div class="row" style="margin-top: 1%;">
                <div class="col">
                    <button type="submit" class="btn btn-success btn-block" id="btnGuardar"  >Registrar Monitoria</button>
                </div>
            </div>
          </form>
        </div><%-- Fin de card body --%>
        </div><%-- Fin de card --%>
    </div><%-- Fin de container --%>               
                    
<%-- Fin del body de la página --%>                    
<%-- Píe de la página --%>            
        <div class="card text-center"style="margin-top:1%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin Píe de la página --%>  

        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <%-- Script para la lista de facultades --%> 
        <script type="text/javascript">         
        $(document).ready(function(){
            $('select[name=sede]').on('change', function(){
                $.ajax({
                    type: 'GET',
                    url: '../SeleccionarFacultad',
                    data: 'codigocampus='+$('select[name=sede]').val(),
                    statusCod:{
                        404: function(){
                            alert('Pagina no enocntrada');
                        },
                        500: function(){
                            alert('Error de servidor');
                        }
                    },
                    success: function(datos){
                        $('select[name=facultad] option').remove();
                        var pegados = datos.split(":");
                        
                        if(datos === ""){
                           $('select[name=facultad]').append('<option>La sede no tiene facultades</option>');
                        }else{
                            var vacio = "Seleccione";
                            for(var i = 0; i < pegados.length-1; i++){
                                var codigo = pegados[i].split("-")[0];
                                var nombre = pegados[i].split("-")[1];
                                if(i>0){
                                $('select[name=facultad]').append("<option value="+codigo+">"+nombre+"</option>");    
                                }else{
                                $('select[name=facultad]').append("<option selected>"+vacio+"</option><option value="+codigo+">"+nombre+"</option>");    
                                }
                            } 
                        }                        
                    }
                });                
            });
        });
        </script>
        <%-- Script para la lista de programas--%>
        <script type="text/javascript">        
        $(document).ready(function(){
            $('select[name=facultad]').on('change', function(){
                $.ajax({
                    type: 'GET',
                    url: '../SeleccionarPrograma',
                    data: 'codigofacultad='+$('select[name=facultad]').val(),
                    statusCod:{
                        404: function(){
                            alert('Pagina no enocntrada');
                        },
                        500: function(){
                            alert('Error de servidor');
                        }
                    },
                    success: function(datos){
                        $('select[name=programa] option').remove();
                        var pegados = datos.split(":");
                        
                        if(datos === ""){
                           $('select[name=programa]').append('<option>La facultad no tiene programas</option>');
                        }else{
                            var vacio = "Seleccione";
                            for(var i = 0; i < pegados.length-1; i++){
                                var codigo = pegados[i].split("-")[0];
                                var nombre = pegados[i].split("-")[1];
                                var modalidad = pegados[i].split("-")[2];
                                if(i>0){
                                $('select[name=programa]').append("<option value="+codigo+">"+nombre+" - "+modalidad+"</option>");  
                                }else{
                                $('select[name=programa]').append("<option selected>"+vacio+"</option><option value="+codigo+">"+nombre+" - "+modalidad+"</option>");    
                                }                                
                            } 
                        }                        
                    }
                });                 
            });
        });               
        </script>
        <%-- Script para la lista de materias--%>
        <script type="text/javascript">        
        $(document).ready(function(){
            $('select[name=programa]').on('change', function(){
                $.ajax({
                    type: 'GET',
                    url: '../seleccionaMaterias',
                    data: 'codigoprograma='+$('select[name=programa]').val(),
                    statusCod:{
                        404: function(){
                            alert('Pagina no enocntrada');
                        },
                        500: function(){
                            alert('Error de servidor');
                        }
                    },
                    success: function(datos){
                        $('select[name=materia] option').remove();
                        var pegados = datos.split(":");
                        
                        if(datos === ""){
                           $('select[name=materia]').append('<option>El programa no tiene materias</option>');
                        }else{
                            var vacio = "Seleccione";
                            for(var i = 0; i < pegados.length-1; i++){
                                var codigo = pegados[i].split("-")[0];
                                var nombre = pegados[i].split("-")[1];                                
                                if(i>0){
                                $('select[name=v]').append("<option value="+codigo+">"+nombre+"</option>");  
                                }else{
                                $('select[name=materia]').append("<option selected>"+vacio+"</option><option value="+codigo+">"+nombre+"</option>");    
                                }                                
                            } 
                        }                        
                    }
                });                 
            });
        });               
        </script>
        
    </body>
</html>

<%-- 
    Document   : CrearMaterias
    Created on : 26/07/2020, 08:47:39 AM
    Author     : emanjarres
--%>

<%@page import="Controller.MuestraCampus"%>
<%@page import="java.awt.event.ItemEvent"%>
<%@page import="Controller.MuestraFacultades"%>
<%@page import="Clases.FacultadCampus"%>
<%@page import="Clases.Campus"%>
<%@page import="Modelo.GestionesFacultades"%>
<%@page import="Modelo.GestionesCampus"%>
<%@page import="Modelo.GestionesProgramas"%>
<%@page  session="true"%>
<%
    HttpSession objetoSession = request.getSession();
    String usuario = (String)objetoSession.getAttribute("UsuarioLogeado");
    if(usuario.equals(" ")){
        response.sendRedirect("index.jsp");
    }  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGMAA |Registro de Materias</title>
        <link rel="icon" href="../public/img/favicon.ico">
        <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
         
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

<%-- Cuerpo de la página --%>
    <div class="card-body" id="body_administrador">
        <div class="card text-center">
            <h1>Crear materias</h1>
        </div>       
        
        <div class="container" style="margin-top: 3%;">
            <div class="row justify-content-md-center">
                <div class="col-sm-4">
                            
                    <form action="../Materias"  method="post" id="formularioMaterias" name="formularioMaterias" novalidate>
                        
                        <div class="form-group">
                            <select class="custom-select" id="idcampus" name="idcampus" >
                                <option selected disabled value="">Seleccione la sede o campus</option>
                                <% MuestraCampus mc = new MuestraCampus(); %>
                                <%= mc.getNombreCampus() %>
                            </select>                                                
                        </div>
                        
                        <div class="form-group">
                            <select class="custom-select" id="idfacultad" name="idfacultad" >
                                <option selected disabled value="">Seleccione la facultad</option>  
                            </select>                                                
                        </div>
                            
                        <div class="form-group">                            
                            <select class="custom-select" id="idprograma" name="idprograma" >
                                <option selected disabled >Seleccione el programa</option>                                 
                            </select>                            
                        </div>
                            
                        <div class="form-group">
                            <label for="validationCustom01">Digite el nombre de la materia</label>
                            <input type="text" class="form-control" id="nombreMateria" name="nombreMateria" required>
                        </div>
                            
                        <button class="btn btn-primary" type="submit" id="btnformularioCrear">Guardar</button>
                    </form>  
                </div>
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

 <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
 <script src="../public/js/bootstrap.min.js" type="text/javascript"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
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
                        $('select[name=idprograma] option').remove();
                        var pegados = datos.split(":");
                        
                        if(datos === ""){
                           $('select[name=idfacultad]').append('<option>La sede no tiene facultades</option>');
                        }else{
                            var vacio = "Seleccione";
                            
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
                        
                        if(datos === ""){
                           $('select[name=idprograma]').append('<option>La facultad no tiene programas</option>');
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
                    'Nuevo Registro',
                    'Se ha Agregrado una Nueva Materia',
                    'success'
                );
            //alert("Registro extioso");
            //alert('La materia fué creada con exito.' + idcampus + " - " + idfacultad + " - " + idprograma + " - " + idprograma + ", " + nombremateria);
            
            document.getElementById('formularioMaterias').submit();             
                }else{
                            Swal.fire(
                            'Error',
                            'Por favor diligencie todos los campos',
                            'error'
                                  );
                        }
                    }
                    );
                }
            );
        </script> 
    </body>
</html>

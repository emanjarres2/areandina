<%-- 
    Document   : CrearProgramas
    Created on : 28/07/2020, 04:53:25 PM
    Author     : emanjarres
--%>
<%@page import="Controller.MuestraCampus"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGMAA |Registro de Programas</title>
        <link rel="icon" href="../public/img/favicon.ico">
        <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css" rel="stylesheet">
         
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
            <h1>Crear programas académicos</h1>
        </div>       
        
        <div class="container" style="margin-top: 2%;">
            <div class="row justify-content-md-center">
                <div class="col-sm-4">
                            
                    <form action="../CrearProgramas" method="post" id="formularioProgramas" name="formularioProgramas" novalidate>
                        
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
                            <label for="validationCustom01">Digite el nombre del programa</label>
                            <input type="text" class="form-control" id="nombrePrograma" name="nombrePrograma" required>
                        </div>
                            
                        <div class="form-group">
                            <select class="custom-select" id="nombreModalidad" name="nombreModalidad" required>
                                <option selected disabled>Seleccione la la modalidad del programa</option>
                                <option value="Presencial">Presencial</option>
                                <option value="Virtual">Virtual</option>
                                <option value="Distancia">Distancia</option>
                            </select>                                                
                        </div> 
                            
                        <button class="btn btn-primary btn-block" type="button" id="btnformularioCrear">Guardar</button>
                    </form>  
                </div>
            </div>
        </div>       
        
    </div>
<%-- Fin del cuerpo de la página --%>  
            
<%-- Píe de la página --%>            
        <div class="card text-center" style="margin-top: 14%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%-- Fin del píe de la página --%> 
<script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
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
                        
                        if(datos == ""){
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
                
            })
        });
               
    </script>
    <script>
            window.addEventListener('load', function (){
    
            document.getElementById('btnformularioCrear').addEventListener('click', function (){
            var idcampus = document.getElementById('idcampus').value;  
            var idfacultad = document.getElementById('idfacultad').value;
            var nombreprograma =  document.getElementById('nombrePrograma').value;
            var nombremodalidad = document.getElementById('nombreModalidad').value;
                        
            var confirmacion = false;
         
            if(idcampus.length > 0 && idfacultad.length > 0 && nombreprograma.length > 0 && nombremodalidad.length > 0 ){
             confirmacion = true;
            }
         
            if(confirmacion){
             Swal.fire(
                    'Nuevo Programa',
                    'Se ha Agregrado una Nuevo Programa',
                    'success'
                );
            
            document.getElementById('formularioProgramas').submit();             
                }else{
                            
                       Swal.fire(
                    'Error',
                    'Por favor Diligencie todos los campos',
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

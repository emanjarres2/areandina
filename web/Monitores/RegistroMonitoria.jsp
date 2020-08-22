<%-- 
    Document   : RegistroMonitoria
    Created on : 19/08/2020, 01:07:14 PM
    Author     : emanjarres
--%>

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
        <title>SIGMAA |Registro de Casos de Monitoria</title>
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
                                    <a class="nav-link" href="AdministracionOPE.jsp">Inicio<span class="sr-only">(current)</span></a>
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
     <div class="container" style="margin-top:4%;">
      <div class="card">
        <div class="card-header text-white bg-success mb-3" >
         <i class="fas fa-users fa-2x fa-lg" style="float:left;"> </i> <h3 style="margin-left: 1.5em;"> Monitoria Pendientes</h3> 
        </div>
        <div class="card-body">
          <form action="" class="form-horizontal">
          <hr>
          
            <div class="row">
            <div class="col-4">
            <label for="caso">Atencion de Casos de Monitoria:</label> 
                    <select name="caso" id="caso" class="form-control">
                        <option value="0">Seleccione Estudiante</option>
                        <option value="1">Maria Rojas</option>
                        <option value="2">Mariana </option>
                        <option value="3">Alejandra</option>
                    </select> 
              </div>
              <div class="col-4">
              <label for="ape">Fecha de Registro Monitoria</label>
              <input type="date" id="fecha" name="fecha" class="form-control" >
              </div>
              <div class="col-4">
              <label for="m">Factor Asociado</label>
              <select name="caso" id="caso" class="form-control">
                        <option value="0">Seleccione Factor</option>
                        <option value="1">Laboral</option>
                        <option value="2">Academico </option>
                        <option value="3">Salud</option>
                    </select> 
              </div>
              <div class="col-4">
              <label for="usu">Tipo de Monitoria de reaizada</label>
              <select name="caso" id="caso" class="form-control">
                        <option value="0">Seleccione Tipo de Monitoria</option>
                        <option value="1">Aula</option>
                        <option value="2">Academica </option>
                        <option value="3">Virtual</option>
                    </select> 
              </div>
              <div class="col-4">
              <label for="pass">Monitoria Academica</label>
              <select name="caso" id="caso" class="form-control">
                        <option value="0">Seleccione Materia </option>
                        <option value="1">Forense</option>
                        <option value="2">Matematicas</option>
                        <option value="3">Base de datos</option>
                    </select> 
              </div>
              <div class="col-4">
              <label for="tipo">Otro tipo Monitoria</label>
              <input type="text" name="otro" id="otro" class="form-control" placeholder="Otro tipo de Monitoria">
              </div>
              </div> 
              <div class="row">
                  <div class="col" style="margin-top:1%;">
                    <textarea name="" id="" cols="30" rows="10" class="form-control">

                    </textarea>
                  </div>
                  <div class="col-4">
              <h4>Remisión por parte Monitor a la OPE</h4>
              <p align="justify">Este opción es para que en dado caso el Monitor puede realizar una remisión a la Oficina de Orientación y Permanencia Estudiantil</p>
              <label for="remision">Remisión a OPE</label>
              <select name="remision" id="remision" class="form-control">
                        <option value="0">Psicologia educativa </option>
                        <option value="1">Psicologia Clinica</option>
                        <option value="2">Universidad de familias</option>
                        <option value="3">Centro de empleabilidad</option>
                        <option value="4">Monitor Academico</option>
                        <option value="5">Docente consejero</option>
                    </select>   
            </div>
              </div>
             <div class="row">
               <div class="col-5" style="margin-top: 1%;">
               <select name="evidencias" id="evidencias" class="form-control">
                        <option value="0">Seleccione </option>
                        <option value="1">Fotografia</option>
                        <option value="2">Whappsat</option>
                        <option value="3">Documento</option>
                        
                    </select>
               </div>
             <div class="col-5" style="margin-top: 1%;">
              
                   <input type="file" name="" id="" class="form-control-file">
                  </div>
              
             </div> 

            <div class="row" style="margin-top: 3%;">
            <div class="col">
              <button type="button" class="btn btn-success btn-block" id="btnGuardar"  >Registrar Monitoria</button>
              </div>
            </div>
          </form>
        </div>
      </div>

    </div>               
                    
                    
<%-- Píe de la página --%>            
        <div class="card text-center">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
<%--Fin del encabezado de la página --%>  
        <script src="https://code.jquery.com/jquery-3.5.1.js" ></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>

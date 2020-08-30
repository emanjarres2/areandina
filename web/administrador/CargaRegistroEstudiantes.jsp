<%-- 
    Document   : CargaRegistroEstudiantes
    Created on : 28/08/2020, 04:24:16 PM
    Author     : emanjarres
--%>
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
        <title>SIGMAA |Carga de Registro de Estudiantes</title>
        <link rel="icon" href="../public/img/favicon.ico">
        <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../public/css/Drag-Drop-File-Input-Upload.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/4e46819824.js" crossorigin="anonymous"></script>
    </head>
    <body>
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

 <div class="container" style="margin-top:4%;">
      <div class="card">
        <div class="card-header text-white bg-success mb-3" >
         <i class="fas fa-file-upload fa-2x fa-lg" style="float:left;"> </i> <h3 style="margin-left: 1.5em;"> Carga Registros</h3> 
        </div>
        <div class="card-body">
            <form action="" method="post">
                <div class="form-group files color"><input type="file" multiple="" name="file" enctype="multipart/form-data"></div><button class="btn btn-success btn-lg" type="button" style="margin: 0px;margin-left: 500px;padding-left: 18px;padding-bottom: 9px;">Subir</button> 
            </form>
       
        </div>
      </div>

    </div>
<script src="../public/js/livereload.js" type="text/javascript"></script>
 <div class="card text-center" style="margin-top: 9.3%;">    
            <div class="card-footer text-muted">
                <h3>Sistema de Información y Gestión de Monitoria Académica Andina - SIGMAA</h3>
            </div>
        </div>
    </body>
</html>

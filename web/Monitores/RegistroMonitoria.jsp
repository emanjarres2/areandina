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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

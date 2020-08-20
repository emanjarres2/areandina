<%-- 
    Document   : upload
    Created on : Aug 17, 2020, 12:50:55 PM
    Author     : manjarres
--%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String url="C:\\Users\\manjarres\\Documents\\areandina\\web\\evidencias";
       DiskFileItemFactory factory= new DiskFileItemFactory();
       factory.setSizeThreshold(1024);
       factory.setRepository(new File(url));
       ServletFileUpload upload = new ServletFileUpload(factory);
       try{
       List<FileItem> partes= upload.parseRequest(request);
       for(FileItem items:partes){
           File file = new File(url,items.getName());
           items.write(file);
       }
       out.print("<h2>Archivo correctamente subido</h2>");
       }catch(SQLException e){
           out.print("Exception"+e.getMessage()+"");
       }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%-- 
    Document   : prueba
    Created on : Aug 17, 2020, 11:44:31 AM
    Author     : manjarres
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>archivo</title>
    </head>
    <body>
        <form action="../subirachivo"  method="post"  enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="subir" />
</form>
    </body>
</html>

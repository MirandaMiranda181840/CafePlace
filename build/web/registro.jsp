<%-- 
    Document   : registro
    Created on : 6/12/2019, 09:43:40 PM
    Author     : miran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP con MySQL</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form method="post" action="agregar.jsp">
            Nombre Completo: <br>
            <input type="text" name="txtnombre">
            <br>
            Dirección: <br>
            <input type="text" name="txtdireccion">
            <br>
            Email:  <br>
            <input type="email" name="txtemail" pattern="[a-zA-Z0-9_]+@+[a-zA-Z0-9_]+\W+[a-zA-Z0-9_]{3}">
            <br>
            Usuario:  <br>
            <input type="text" name="txtusuario">
            <br>
            Contraseña:  <br>
            <input type="text" name="txtcontrasena">
            <br>
            Edad: <br>
            <input type="number" name="txtedad">
            <br>
            Nivel: <br>
            <input type="number" name="txtnivel" max="2" min="2">
            <br>
            <br><br>
            <input type="submit" value="Save">
            <input type="submit" value="Delete" formaction="delete.jsp">
            <input type="submit" value="Update" formaction="update.jsp">
            
        </form>
    </body>
</html>

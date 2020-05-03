<%-- 
    Document   : index
    Created on : 27/abr/2020, 21:34:03
    Author     : utilizador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2> Login </h2>
        <form method="POST">
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email"><br>
            <label for="password">Password:</label><br>
            <input type="text" id="password" name="password"><br><br>
            <input type="submit" value="Login" name="login">
            <input type="submit" value="Registar" name="reg">
        </form>          
    </body>
</html>

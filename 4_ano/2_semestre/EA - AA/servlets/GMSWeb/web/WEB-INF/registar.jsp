<%-- 
    Document   : registar
    Created on : 27/abr/2020, 21:34:57
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
        <h1> Registar </h1>
        <form method="POST">
            <label for="name">Name:</label><br>
            <input type="text" id="name" name="name"><br>
            <label for="email">Email:</label><br>
            <input type="text" id="email" name="email"><br>
            <label for="password">Password:</label><br>
            <input type="text" id="password" name="password"><br><br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>

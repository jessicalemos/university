<%-- 
    Document   : register
    Created on : 24/abr/2017, 11:50:43
    Author     : ruicouto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <h1>New User</h1>
        <b>${msg}</b>
        <form method="POST">
            Name: <input type="text" name="name"/><br/>
            Email: <input type="text" name="email"/><br/>
            Password: <input type="password" name="password"/><br/>
            <input type="submit" value="Register"/>
        </form>
    </body>
</html>

<%-- 
    Document   : login
    Created on : 24/abr/2017, 11:58:39
    Author     : ruicouto
--%>

<%@page import="main.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <h1>Login</h1>
        ${msg}
        <% User u = (User) request.getSession().getAttribute("user");
            if(u ==null) { %>
        <form method="POST">
            Email:<input type="text" name="email"/><br/>
            Password:<input type="password" name="password"><br/>
            <input type="submit" value="Login">
        </form>
        <% } else { %>
            <%= u.getName() %> is logged in
        <% } %>
    </body>
</html>

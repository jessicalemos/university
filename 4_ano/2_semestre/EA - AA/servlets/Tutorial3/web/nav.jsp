<%-- 
    Document   : nav
    Created on : 24/abr/2017, 11:51:18
    Author     : ruicouto
--%>

<%@page import="main.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a href="Index">Home</a> | <a href="Register">Register</a> | <a href="Login">Login</a>
<% User u = (User) request.getSession().getAttribute("user");
if(u!=null) { %>
| <a href="MyGames">My games</a>
<% } %>
| <a href="Search?q=">Search</a>
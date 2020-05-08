<%-- 
    Document   : search
    Created on : 24/abr/2017, 13:38:08
    Author     : ruicouto
--%>

<%@page import="main.Game"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <h1>Search</h1>
        <form method="GET">
            <input type="text" name="q"/><input type="submit" value="Search"/>
        </form>
        <br/>
        Search results for "<%=request.getParameter("q")%>":
        <ul>
        <% List<Game> l = (List)request.getAttribute("games");
        if(l!=null) {
            for(Game g : l) {%>
                <li><%=g.getName()%></li> 
            <% }
        } %>
        </ul>
    </body>
</html>

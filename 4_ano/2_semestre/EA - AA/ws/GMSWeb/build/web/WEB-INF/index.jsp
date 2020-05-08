<%-- 
    Document   : index
    Created on : 24/abr/2017, 11:35:18
    Author     : ruicouto
--%>

<%@page import="java.util.List"%>
<%@page import="main.Game"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp"/>
        <h1>Index</h1>
        ${ua}
        <h2>Games</h2>
        
        <table>
            <thead>
                <th>Name</th>
                <th>Description</th>
                <th>Platform</th>
            </thead>
            <tbody>
                <%  List<Game> games = (List) request.getAttribute("games");
                    for(Game g : games) { %>
                        <tr><td><%= g.getName() %></td><td><%= g.getDescription() %></td><td><%= g.getPlatform().getName() %></td></tr>
                <%  } %>
                
                
            </tbody>
        
        </table>
        
        
    </body>
</html>

<%-- 
    Document   : games
    Created on : 27/abr/2020, 21:35:48
    Author     : utilizador
--%>

<%@page import="tutorial2.Game"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style> 
            th {
                text-align: left;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Games</h1>
        
        <table style="width:100%">
            <tr>
              <th>Nome</th>
              <th>Ano</th> 
              <th>Preço</th>
              <th> Descrição </th>
            </tr>
            <% List<Game> games = (List) request.getAttribute("games");
                for(Game g : games) { %>
                    <tr>
                        <td> <%= g.getName() %> </td>
                        <td> <%= g.getYear() %> </td>
                        <td> <%= g.getPrice() %> </td>
                        <td> <%= g.getDescription() %> </td>
                    </tr>
                <% }
            %>
          </table>
          
    </body>
</html>

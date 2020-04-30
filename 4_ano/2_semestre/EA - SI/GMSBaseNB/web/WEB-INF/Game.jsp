<%-- 
    Document   : Game
    Created on : Apr 29, 2020, 9:04:27 PM
    Author     : jessica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Game 1</h3>
        <div class="container">
            <div class="row">
                    <div class="col-sm-6 col-md-4">Year</div>
                    <div class="col-sm-6 col-md-4">${requestScope.game.year}</div>
            </div>
            <div class="row">
                    <div class="col-sm-6 col-md-4">Description</div>
                    <div class="col-sm-6 col-md-4">${requestScope.game.description}</div>
            </div>
        </div>
    </body>
</html>

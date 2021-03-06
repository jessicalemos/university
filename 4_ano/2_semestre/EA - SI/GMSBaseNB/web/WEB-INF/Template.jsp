<%-- 
    Document   : ListGames
    Created on : 10/abr/2017, 14:32:54
    Author     : ruicouto
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <link href="css/bootstrap.css" rel="stylesheet"> 
        <title>JSP Page</title>
    </head>
    <body>
      <div class="container">
       <div class="row">
        <div class="col">
        <h1>App name</h1>
        </div>
      </div> <!-- row -->
      <div class="row bg-light">
        <div class="col-md-4 d-flex align-items-center">
            <c:if test="${requestScope.login=='success'}">
                <div class="col-md-4 d-flex align-items-center">
                    <h6>${requestScope.username}</h6> 
                </div>
            </c:if>
            <c:if test="${requestScope.login!='success'}">
                <a href="" data-toggle="modal" data-target="#modalLoginForm">
                    Login
                </a>
                <jsp:include page="Login.jsp"/>
            </c:if>
        </div>
        <div class="col-md-8">
          <nav class="navbar nav-pills justify-content-end">
                <a class="nav-link active" href="/GMSBaseNB/ListGames?page=1">All Games</a>
                <a class="nav-link" href="/GMSBaseNB/ListGames?action=mygames">
                    My Games
                </a>
                <a class="nav-link" href="addG">Add Games</a>
          </nav>
        </div> <!-- col -->
      </div> <!-- row --> 
      <div class="row">
        <div class="col-sm-8">
             <c:choose>
                <c:when test="${requestScope.template=='MyGames'}">
                    <jsp:include page="MyGames.jsp"/>
                </c:when>
                <c:when test="${requestScope.template=='ListGames'}">
                    <jsp:include page="ListGames.jsp"/>
                </c:when>
                <c:when test="${requestScope.template=='Game'}">
                    <jsp:include page="Game.jsp"/>
                </c:when>
            </c:choose>     
        </div> <!-- col -->
        <div class="col-sm-4">
            <c:if test="${requestScope.template=='ListGames' || requestScope.template=='MyGames'}"> 
                <form>
                    <fieldset>
                        <legend>Filter</legend>
                        <select class="form-control" >
                          <option>year</option>
                        </select>
                        <select class="form-control" >
                          <option>platform</option>
                        </select>
                    </fieldset>
                </form>
            </c:if> 
        </div> <!-- col -->
      </div> <!-- row -->
      <div class="row">
        <div class="col" >
          <p class="text-center">Footer</p>
        </div>
      </div> <!-- row -->
    </div><!-- /.container -->

    <!-- Bootstrap core JavaScript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>

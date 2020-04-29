<%-- 
    Document   : ListGames
    Created on : 10/abr/2017, 14:32:54
    Author     : ruicouto
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
          <table class="table table-striped table-bordered table-sm">

              <thead>
              <tr><th>Games</th><th class="extras">Year</th><th>Platform</th></tr>
            </thead>
            <tbody>
                <c:forEach var="g" items="${requestScope.games}">
                
                <tr><td> ${g.name}</td><td class="extras">${g.year}</td><td>platform?</td></tr>
            </c:forEach> 
            </tbody>
          </table>
          <div class="d-flex justify-content-end">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="/GMSBaseNB/ListGames?page=<c:set var="p" value="${param.page}"/>${Integer.parseInt(p)-1}">Previous</a></li>
              <li class="page-item"><a class="page-link" href="/GMSBaseNB/ListGames?page=1">1</a></li>
              <li class="page-item"><a class="page-link" href="/GMSBaseNB/ListGames?page=2">2</a></li>
              <li class="page-item"><a class="page-link" href="/GMSBaseNB/ListGames?page=3">3</a></li>
              <li class="page-item"><a class="page-link" href="/GMSBaseNB/ListGames?page=<c:set var="p" value="${param.page}"/>${Integer.parseInt(p)+1}">Next</a></li>
            </ul>
              
          </div>
        
</html>
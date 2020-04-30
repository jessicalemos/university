<%-- 
    Document   : MyGames
    Created on : Apr 29, 2020, 7:05:06 PM
    Author     : jessica
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
            <c:forEach var="g" items="${requestScope.mygames}">
                <tr><td><a href='/GMSBaseNB/ListGames?mygame=${g.name}'> ${g.name} </a></td><td class="extras">${g.year}</td><td>platform?</td></tr>
            </c:forEach> 
        </tbody>
    </table> 
</html>

<%-- 
    Document   : Login
    Created on : Apr 30, 2020, 11:59:37 AM
    Author     : jessica
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title w-100 font-weight-bold">Login</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body mx-3">
                            <form method="POST">
                                <input type="text" name="username" class="form-control validate">
                                <label data-error="wrong" data-success="right" for="defaultForm-email">Username</label>
                                <input type="password" name="password" class="form-control validate">
                                <label data-error="wrong" data-success="right" for="defaultForm-pass">Password</label>
                                <br/>
                                <input class="btn btn-default" type="submit" value="Login">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>

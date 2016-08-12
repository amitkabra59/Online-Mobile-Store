<%-- 
    Document   : logout
    Created on : 29 Jun, 2016, 10:59:23 AM
    Author     : amitkabra59
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <% 
        session =request.getSession();
        session.invalidate();
        response.sendRedirect("index.html"); %>
    </body>
</html>

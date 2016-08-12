<%-- 
    Document   : add_products
    Created on : 1 Jul, 2016, 7:23:48 PM
    Author     : amitkabra59
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        <form method="post" action="imgcode.jsp">
            
            Product-id: <input type="text" name="pid"/><br>
            IMAGE <input type="file" name="img" /><br>
            Product name: <input type="text" name="name"/><br>
            Category: <select name="category">
                <option>ANDROID</option>
                <option>IOS</option>
            </select>
           Brand: <input type="text" name="brand"/><br>
            <button name="sub">submit</button>
            
        </form>
    </body>
</html>

<%-- 
    Document   : add_img
    Created on : 5 Jul, 2016, 11:24:06 AM
    Author     : amitkabra59
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
          <%
                    
             Connection con = null;
             PreparedStatement ps=null;          
             OutputStream img;
             
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                        }
                        catch(Exception e)
                        {
                            System.out.println(e);
                        }
                      try{
                         con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online_mobile_system","root","root");   
                         
                         ps=con.prepareStatement("select image from product where product_id=");
                      
                         ResultSet rs=ps.executeQuery();
                         
                         if(rs.next()){
                          
                          byte barray[] = rs.getBytes(1);
                          response.setContentType("image/jpg");
                          img=response.getOutputStream();
                          img.write(barray);
                          img.flush();
                          img.close();
                         }
                         
                         
                         
                      } 
                         catch(Exception e){
                         e.printStackTrace();
                         }
   %>
    </body>
</html>

<%-- 
    Document   : add_img
    Created on : 5 Jul, 2016, 11:24:06 AM
    Author     : amitkabra59
--%>

<%@page import="java.sql.Blob"%>
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
        <title>JSP Page</title>
    </head>
    <body>
          <% 
             session=request.getSession(false);
             String pid= (String)session.getAttribute("id");
             Connection con = null;
             PreparedStatement ps=null;          
             OutputStream img;
             Blob image = null;
             byte[ ] imgData = null ;

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
                            
                           
                         
                         ps=con.prepareStatement("select image from pro_final where pid= ?");
                         ps.setString(1,pid);
                         ResultSet rs=ps.executeQuery();
                         
                         if(rs.next()){
                         image = rs.getBlob(1);

                         imgData = image.getBytes(1,(int)image.length());
                         }
                         else {

out.println("Display Blob Example");

out.println("image not found for given id>");

return;

}

// display the image

response.setContentType("image/jpg");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();
                         
                      } 
                         catch(Exception e){
                         e.printStackTrace();
                         }
   %>
    </body>
</html>

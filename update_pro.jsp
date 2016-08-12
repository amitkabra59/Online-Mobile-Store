<%-- 
    Document   : update_pro
    Created on : 1 Jul, 2016, 8:19:27 PM
    Author     : amitkabra59
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Update</title>
        <% 
          
               if("POST".equalsIgnoreCase(request.getMethod()))
                {
                 
                     session=request.getSession();
                     String session1= (String)session.getAttribute("email");
                
                     String newnum=request.getParameter("mobile");
                     String add=request.getParameter("add");
                     
                     if(!(newnum.isEmpty()) && (!(add.isEmpty()))){
                    
                        Connection con=null;
                        
                        PreparedStatement ps;
                        ResultSet rs;
                        String query,sql;
                        
                        
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                       
                            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online_mobile_system","root","root"); 
                            
                            sql="update registration set phone ='"+newnum+"', address='"+add+"' where email='"+session1+"';";
                            Statement st=con.createStatement();
                            st.executeUpdate(sql);
                           
                            out.print("Update Successfull");
                            response.sendRedirect("profile.jsp");
                             }
                        catch(Exception e){
                        e.printStackTrace();
                        
               }
                } 
                }
       
           
        %>

    </head>
    <body>
                <form name="myform" action="update_pro.jsp" method="post"/>
        <input type="text" name="mobile" placeholder="Change Mobile Number" /><br>
        <input type="text" name="add" placeholder="Change Address"/><br>
        <button name="updt"> update </button></form>
    </body>
</html>

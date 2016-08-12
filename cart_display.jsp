<%-- 
    Document   : cart_display
    Created on : 6 Jul, 2016, 12:38:45 AM
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
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>CART DISPLAY</title>

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    
    <![endif]-->
    <link href="css/profile.css" rel="stylesheet"/>
    </head>
    <body>
        <% 
        session=request.getSession(false);
        String session1=(String)session.getAttribute("email");
        String pid=(String)session.getAttribute("pid");
        out.print(pid);
       
        out.print(session1);
        if(session1!=null){
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                     
                        String query,sql;
                    try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                        }
                        catch(Exception e)
                        {
                            System.out.println(e);
                         }
                    try
                        {
                            con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online_mobile_system","root","root"); 
                             
                            query="select * from pro_final where pid=?;";
                            ps = con.prepareStatement(query);
                            ps.setString(1, pid);
                            
                           
                            rs=ps.executeQuery();
                            
                            rs.next();
                            
                            String id=rs.getString(1);
                            String mname=rs.getString(3);
                            String brand=rs.getString(4);
                            String price=rs.getString(6);
                            
                    %>
                    <div class="table-title">
                        <h3 align="center">Cart</h3>
                        <table class="table-fill">

                   
                        <tbody class="table-hover">
                            <tr>
                                <td class="text-left">EMAIL</td>
                                <td class="text-left"><%=session1 %></td>
                            </tr>
                            <tr>
                                <td class="text-left">Product ID</td>
                                <td class="text-left"><%=rs.getString(1) %></td></tr>
                            <tr>
                                <td class="text-left">Model Name</td>
                                <td class="text-left"><%=rs.getString(3) %></td></tr>
                            <tr> <td class="text-left">Brand</td>
                                <td class="text-left"><%=rs.getString(4) %></td> </tr>
                            <tr><td class="text-left">Price</td>
                                <td class="text-left">Rs.<%=rs.getString(6) %></td></tr>
                            <tr><td class="text-left">
                                Shipping
                                </td>
                                <td class="text-left">Rs.0</td> </tr>
                            <tr><td class="text-left"> Total</td>
                                <td class="text-left">Rs.<%=rs.getString(6) %></td></tr>
                            
                        </tbody>
                    </table>
                    </div><%
                        
                        
                                       
                        }

                        catch(Exception e){
                        e.printStackTrace();
                    }}
                        
        %>
   
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
    
</html>


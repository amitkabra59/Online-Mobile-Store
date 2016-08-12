<%-- 
    Document   : profile
    Created on : 1 Jul, 2016, 1:40:18 PM
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
    <title>Profile page</title>

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
        String session1=(String)session.getAttribute("email");
        out.print(session1);
        if(session1!=null){
                        Connection con = null;
                        PreparedStatement ps;
                        ResultSet rs;
                     
                        String query;
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
                             
                            query="select * from registration where email='"+session1+"';";
                            
                            Statement st = con.createStatement();
                            rs=st.executeQuery(query);
                            rs.next();
                           
                            
        
                    %>
                    <div class="table-title">
                        <h3 align="center">User profile</h3>
                        <table class="table-fill">

                   
                        <tbody class="table-hover">
                            <tr>
                                <td class="text-left">EMAIL</td>
                                <td class="text-left"><%=rs.getString(1) %></td></tr>
                            <tr>
                                <td class="text-left">USERNAME</td>
                                <td class="text-left"><%=rs.getString(2) %></td></tr>
                            <tr> <td class="text-left">NAME</td>
                                <td class="text-left"><%=rs.getString(3) %></td> </tr>
                            <tr><td class="text-left">GENDER</td>
                                <td class="text-left"><%=rs.getString(5) %></td></tr>
                            <tr><td class="text-left">
                                Date Of Birth
                                </td>
                                <td class="text-left"><%=rs.getString(6) %></td> </tr>
                            <tr><td class="text-left"> PHONE NUMBER</td>
                                <td class="text-left"><%=rs.getString(7) %></td></tr>
                            <tr><td class="text-left">ADDRESS</td>
                                <td class="text-left"><%=rs.getString(8) %></td></tr>
                            <tr><td class="text-left">PINCODE</td>
                                <td class="text-left"><%=rs.getString(9) %></td></tr>
                            
                        </tbody>
                    </table>
                    </div>
                    <% }
                        catch(Exception e){
                        e.printStackTrace();
                    }}
                        
        %>
    <center>
        <form action="update_pro.jsp">
        <input type="submit" value="update"/>
        </form>
    </center>
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
    
</html>

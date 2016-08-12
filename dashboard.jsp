<%-- 
    Document   : dashboard
    Created on : 29 Jun, 2016, 9:19:43 AM
    Author     : amitkabra59
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    
    <![endif]-->

        <title>Dashboard</title>
        
    </head>
    <body> 
        
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- logo -->
                <div class="nav-header">
                    <a href="#" class="navbar-brand">ONLINEMOBILESTORE</a>
                    
                </div>
                <!-- Menu items -->
                <div>
                    
                    <ul class="nav navbar-nav">
                        <li ><a href="imgviewcode.jsp">HOME</a></li>
                        <li><a href="#">CART</a></li>
                        <li><a href="#">SUBMIT A FREE AD</a></li>
                        
                   
                    <!-- Drop down menu -->
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Profile
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="#">Settings</a></li>
                        <li><a href="#">About us</a></li>
                        </ul>
                    </li>
                    </ul>
                    <!-- right side nav menu-->
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li>  <a href="logout.jsp">LOGOUT</a></li>
                    
                    </ul>
                    
                    
                    
                    <!-- Search button-->
                    
                    
                    
                    <div class="col-sm-3 col-md-3 pull-right">    
                       <form class="navbar-form" role="search" action="search.jsp">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                            </div>
                        </form>
                    </div>
                    
                    
        
                </div>
                
            </div>
        </nav> 
         
        <% 
        session=request.getSession(false);
        
        if((session.getAttribute("email"))!=null){
        try{
        Class.forName("com.mysql.jdbc.Driver");  
             
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_mobile_system","root","root");  
            
            Statement stmt=con.createStatement();
            String s="select * from registration where email=?;";
            PreparedStatement ps= con.prepareStatement(s);
            ps.setString(1,session.getAttribute("em").toString());
            
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
            out.println("Welcome"+rs.getString("name"));
            out.println("<br><br> Session created");
            
            }
            
        }
        catch(Exception e){
        e.printStackTrace();
        }
        }
        
        %>
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
        
</html>

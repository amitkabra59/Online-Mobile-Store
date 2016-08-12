<%-- 
    Document   : add_to_cart
    Created on : 5 Jul, 2016, 5:02:27 PM
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
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    
    <![endif]-->
    <link href="css/login.css" rel="stylesheet" />
        <title>CART</title>
       <%
        if("POST".equalsIgnoreCase(request.getMethod()))
                {
                 if(request.getParameter("login")!=null){
                     session=request.getSession(false);
                     String session1= (String)session.getAttribute("email");
                     
                     String id=(String)session.getAttribute("pid");
                
                     String newnum=request.getParameter("phone");
                     String add=request.getParameter("address");
                     
                     if(!(newnum.isEmpty()) && (!(add.isEmpty()))){
                    
                         
                     
                        ResultSet rs;
                        String sql;
                        
                        
                        try
                        {
                            Class.forName("com.mysql.jdbc.Driver");
                       
                            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online_mobile_system","root","root"); 
                            
                            sql="update registration set phone ='"+newnum+"', address='"+add+"' where email='"+session1+"';";
                            Statement st=con.createStatement();
                            st.executeUpdate(sql);
                           
                            out.print("Update Successfull");
                            
                             }
                        catch(Exception e){
                        e.printStackTrace();
                        }
               }
                 } 
                }
        
       %>
        
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
                       <form class="navbar-form" role="search" action="">
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
        <div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Update</h1>
            <div class="account-wall">
                
                <form name="myform" action="cart_display.jsp" method="post">
         
                        <input type="text" name="phone" id="phone" class="form-control" placeholder="Mobile Number" required autofocus/>
                       
                        <br>   <input type="text" name="address" id="address" class="form-control" placeholder="Address" required/>
                        <br>
                        <br>  <button class="btn btn-lg btn-primary btn-block" name ="login" type="submit">
                    Update</button>

        </form>
                
    </div>
           
        </div>
    </div> <form action="cart_display.jsp">
                     <button class="btn btn-lg btn-primary btn-block" name ="gtc" type="submit">
                    Go to cart</button>
                </form>
</div>        
        
                
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    
    
    </body>
</html>

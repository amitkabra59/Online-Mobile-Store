
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Submit an AD</title>

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    
    <![endif]-->
    
        <link href="css/registration.css" rel="stylesheet"> 
        
      <%   if("POST".equalsIgnoreCase(request.getMethod()))
          {
            if(request.getParameter("register")!=null)
            {
            String email=request.getParameter("email");
            String username=request.getParameter("username");
            String name=request.getParameter("name");
            String password=request.getParameter("pwd");
            String sex=request.getParameter("gender");
            String dob=request.getParameter("dob");
            String phone=request.getParameter("phno");
            String address=request.getParameter("address");
            String pincode=request.getParameter("pincode");
            
            out.print("Connected to db");
                
                if((!email.isEmpty()) && (!username.isEmpty()) && (!name.isEmpty()) && (!password.isEmpty()) 
                && (!sex.isEmpty())&& (!dob.isEmpty())&& (!phone.isEmpty())&& (!address.isEmpty()) && (!pincode.isEmpty()))
                {
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
                            
                            sql="select * from registration where email=?";
                            ps=con.prepareStatement(sql);
                            ps.setString(1,email);
                            
                           
                            
                            rs=ps.executeQuery();
                            out.print("Here");
                             if(rs.next()){
                             out.print("<div class=\"container\" align=\"center\"><div class=\"well  \"><font size=\"4\">User already exists</font></div></div>");
                             }
                             else {
                            query = "insert into registration values(?,?,?,?,?,?,?,?,?)";
                            ps = con.prepareStatement(query);
                            ps.setString(1,email);
                            ps.setString(2,username);
                            ps.setString(3,name);
                            ps.setString(4,password);
                            ps.setString(5,sex);
                            ps.setString(6,dob);
                            ps.setString(7,phone);
                            ps.setString(8,address);
                            ps.setString(9,pincode);
                            
                            ps.executeUpdate();
                            
                            session = request.getSession();
                            session.setAttribute("email", email);
                            response.sendRedirect("login.html");
                             
                            }
                             
                            
                             
                             
                        }
                        catch(SQLException e)
                        {
                            System.out.println(e);
                        }
                    }
                }
            }

        
        %>
 
        
        
    </head>
    <body bgcolor="blue">
       <div class="container">
        <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Submit an AD</h1>
            <div class="account-wall">
                <img class="profile-img" src="images/deepika.jpg"
                    alt="">
            
 <form name="myform" action="admin_seller-ad-table.jsp" method="post">
               

 
 <input type="text" name="title" id="title" class="form-control" placeholder="title" required/>
                       
 <br>
 <select name="category" class="form-control" required>
     <option>ANDROID</option>
     <option>IOS</option>
</select>
 <br> 
 <input type="text" name="desc"  class="form-control" placeholder=" Description" required/>
 <br> 
  <label class="form-control">Upload image</label><input type="file" name="img" id="img" required/> <br>

 <input type="text" name="name" class="form-control"  placeholder=" Name"/><br>
 
 <input type="text" name="phno" id="phno" class="form-control" placeholder="Mobile Number" required/>
 <br>
 <input type="text" name="city" id="city" class="form-control" placeholder="City" required/>
 <br> 
 
 
         <button class="btn btn-lg btn-primary btn-block" name ="register" type="submit">
                    Submit</button>
                
            
        
                </form>
            </div>
           
        </div>
    </div>
</div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

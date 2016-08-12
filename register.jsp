
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
    <title>Registration</title>

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
 
        
        
        <script>
            
           function validate() {

            if (myform.email.value === "" && myform.username.value === "" && myform.pwd.value === "" &&
                        myform.name.value === "" && document.myform["address"].value === "" && myform.pincode.value==="" && 
                        myform.phno.value==="" && myform.dob.value==="") {
                    alert("Please provide all details correctly");
                } 
                
                else {
                    if (myform.email.value === "") {
                        alert("Please provide email");
                        document.myform.email.focus();
                    }

                    if (myform.username.value === "")
                    {
                        alert("Please provide Name");
                        document.myform.password.focus();
                    }

                    if (myform.pwd.value === "")
                    {
                        alert("Please enter the password!");
                        document.myform.password.focus();
                    }
                    if (myform.name.value === "")
                    {
                        alert("Please re-enter the password!");
                        document.myform.pwd.focus();
                    }

                    if (document.myform["address"].value === "") {
                        alert("Enter the address");
                        document.myform.address.focus();
                    }

                } 
            }
        </script>
    </head>
    <body bgcolor="blue">
       <div class="container">
        <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign up to continue</h1>
            <div class="account-wall">
                <img class="profile-img" src="images/deepika.jpg"
                    alt="">
            
 <form name="myform" action="register.jsp" method="post" onsubmit="validate()">
               

 <input type="email" name="email" id="email" class="form-control" placeholder="Email" required autofocus/>
                       
 <br>
 <input type="text" name="username" id="username" class="form-control" placeholder="Username" required/>
                       
 <br>
 <input type="text" name="name" id="name" class="form-control" placeholder="Name" required/>
 <br>
 <input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password" required/>
 <br>
 <select name="gender" class="form-control" required>
     <option value="male">Male</option>
     <option value="female">Female</option>
</select>
 <br> 
 <input type="text" name="dob" value="" class="form-control" placeholder=" DOB: YYYY-MM-DD" required/>
 <br> 
 <input type="text" name="phno" id="phno" class="form-control" placeholder="Mobile Number" required/>
 <br>
 <textarea name="address" rows="4" cols="35" class="form-control" placeholder="Address" required></textarea> 
 <br> 
 <input type="text" name="pincode" id="pincode" class="form-control" placeholder="Pincode" required/> <br>
 <input type="reset" value="reset"/><br>
 
         <button class="btn btn-lg btn-primary btn-block" name ="register" type="submit">
                    Sign up</button>
                
            
        <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                </form>
            </div>
            <a href="login1.jsp" class="text-center new-account">Login </a><br><br>
        </div>
    </div>
</div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>

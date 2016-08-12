<%-- 
    Document   : product
    Created on : 4 Jul, 2016, 2:06:18 PM
    Author     : amitkabra59
--%>

<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    
    <![endif]-->
        
<title>Product details</title><!--
<style type="text/css">
.name {
	font-weight: bold;
	font-size: 36px;
}
.gnrl {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.center1 {
	text-align: center;
}
.center1 table {
	font-family: Arial, Helvetica, sans-serif;
	font-size: x-large;
	font-weight: bold;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-weight: normal;
}
normal {
	font-family: Arial, Helvetica, sans-serif;
}
.right {
	text-align: right;
}
.norm {
	font-family: Arial, Helvetica, sans-serif;
}
</style>-->
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
                                <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term"/>
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                                    </div>
                            </div>
                        </form>
                    </div>
                    
                    
        
                </div>
                
            </div>
    </nav> <center>
    <form action="cart_display.jsp" method="post">
        <input type="submit" value="ADD TO CART" />
    </form></center> <br/>
    <div class="container">

  <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.sql.DriverManager.*" %>
  <%
                
                String pid=request.getParameter("id");
                session=request.getSession(false);
                String session1= (String)session.getAttribute("email");
		String hname="Grand";
		PreparedStatement ps;
        Connection con;
        ResultSet rs= null;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_mobile_system","root","root");
		 
		 
    ps=con.prepareStatement("select * from mobile_product where pid=?;");
		 ps.setString(1,pid);
                 
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
                 session=request.getSession();
                 session.setAttribute("pid",rs.getString(1));
		 %>
                 
    <table width="466" border="0" class="table table-striped">
      <tr>
        <td width="179" class="center1">Model Name :</td>
        <td width="277" class="normal"><%=rs.getString(2)%></td>
      </tr>
      <tr>
        <td class="center1">Brand :</td>
        <td><%=rs.getString(3)%></td>
      </tr>
      <tr>
        <td class="center1">Price :</td>
        <td><%=rs.getString(4)%><% out.print(" Rs");%></td>
      </tr>
      <%}%>
    </table>
<p class="gnrl">GENERAL FEATURES</p>
<% 
rs.close();
ps=con.prepareStatement("select * from gen_feature where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
		 %>
         <%
          while(rs.next())
		 {
		 %>
         <table width="630" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td class="norm">SIM Type</td>
    <td><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Touch Screen</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Keypad</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from gen_feature where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
PLATFORM</p>
<table width="629" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="127" class="norm">OS</td>
    <td width="492"><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">Java</td>
    <td><%=rs.getString(6)%></td>
  </tr>
  <tr>
    <td class="norm">Processor</td>
    <td><%=rs.getString(7)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from display where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
DISPLAY</p>
<table width="629" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="127" class="norm">Type</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Size</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Resolution</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Colors</td>
    <td><%=rs.getString(5)%></td>
  </tr>
</table>
<p class="gnrl">
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from camera where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
CAMERA</p>
         <table width="628" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="126" class="norm">Primary</td>
    <td width="492"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Secondary</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Flash</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">Video Recording</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">Other Features</td>
    <td><%=rs.getString(6)%></td>
  </tr>
</table>
<p>
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from dimension where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">DIMENSION</span> </p><table width="627" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="125" class="norm">Size </td>
    <td width="486"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Weight</td>
    <td><%=rs.getString(3)%></td>
  </tr>
</table>
  <%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from battery where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">BATTERY</span> </p><table width="627" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="126" class="norm">Type</td>
    <td width="485"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Capacity</td>
    <td><%=rs.getString(3)%></td>
  </tr>
</table>
  <%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from mem_storage where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">MEMORY AND STORAGE</span> </p>
<table width="627" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="125" class="norm">Internal</td>
    <td width="486"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">RAM</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Expandable</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<p>
  <%}%>
  <% 
rs.close();
ps=con.prepareStatement("select * from int_conn where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
  <span class="gnrl">INTERNET AND CONNECTIVITY</span> 
</p>

<table width="627" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="127" class="norm">GPRS</td>
    <td width="484"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">EDGE</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">3G</td>
    <td><%=rs.getString(4)%></td>
  </tr>
  <tr>
    <td class="norm">4G</td>
    <td><%=rs.getString(5)%></td>
  </tr>
  <tr>
    <td class="norm">WIFI</td>
    <td><%=rs.getString(6)%></td>
  </tr>
  <tr>
    <td class="norm">USB Connectivity</td>
    <td><%=rs.getString(7)%></td>
  </tr>
  <tr>
    <td class="norm">Tethering</td>
    <td><%=rs.getString(8)%></td>
  </tr>
  <tr>
    <td class="norm">Navigation </td>
    <td><%=rs.getString(9)%></td>
  </tr>
  <tr>
    <td class="norm">Bluetooth</td>
    <td><%=rs.getString(10)%></td>
  </tr>
  <tr>
    <td class="norm">Audio Jack</td>
    <td><%=rs.getString(11)%></td>
  </tr>
  <tr>
      <td class="norm">DLNA</td>
      <td><%=rs.getString(12)%></td>
  </tr>
</table>
<%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from mmedia where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">MULTIMEDIA</span> </p>
<table width="627" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="127" class="norm">Music Player</td>
    <td width="484"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Video Player</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">FM</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<%}%>
<p>
  <% 
rs.close();
ps=con.prepareStatement("select * from others where pid=?");
		 ps.setString(1,pid);
		 rs=ps.executeQuery();
          while(rs.next())
		 {
		 %>
<span class="gnrl">OTHERS</span> </p>
<table width="627" border="1" cellspacing="0" class="table table-striped">
  <tr>
    <td width="141" class="norm">SAR value</td>
    <td width="476"><%=rs.getString(2)%></td>
  </tr>
  <tr>
    <td class="norm">Sensors</td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <tr>
    <td class="norm">Additional Features</td>
    <td><%=rs.getString(4)%></td>
  </tr>
</table>
<%}%>
    </div>


    




<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>




</body>
</html>

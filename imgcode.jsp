<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%               
                       
                        
                        session=request.getSession(false);
                        session.getAttribute("email");
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
                        
                        con =DriverManager.getConnection("jdbc:mysql://localhost:3306/online_mobile_system","root","root"); 
                            
                        String pid=request.getParameter("pid");
                        String name=request.getParameter("name");
                        String category=request.getParameter("category");
                        String brand=request.getParameter("brand");
                        
                        String img=request.getParameter("img");
                        
             
                        String path1="/home/amitkabra59/NetBeansProjects/Online_Mobile_Store/web/images/"+img; 
                   
             
             
             ps=con.prepareStatement("insert into pro_final values(?,?,?,?,?)");
             
             ps.setString(1,pid);
             ps.setString(3,name);
             ps.setString(4, brand);
             ps.setString(5,category);
             
             
       
             
             
           File f=new File(path1);
           int s=(int)f.length();
           FileInputStream fis=new FileInputStream(f);
           ps.setBinaryStream(2,fis,s);
   
           
             int k=ps.executeUpdate();
             if(k!=0)
             {
                 out.println("inserted sucessfully");
             }
             %>
             
             
                            
                            
    </body>
</html>

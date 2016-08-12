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
                            
                        String title=request.getParameter("title");
                        String category=request.getParameter("category");
                        String desc=request.getParameter("desc");
                        String img=request.getParameter("img");
                       
                        String name=request.getParameter("name");
                        String phno=request.getParameter("phno");
                        String city=request.getParameter("city");
                        
           
             
                        String path1="/home/amitkabra59/NetBeansProjects/Online_Mobile_Store/web/images/"+img; 
                   
             
             
             ps=con.prepareStatement("insert into seller values(?,?,?,?,?,?,?)");
             
             ps.setString(1,title);
             ps.setString(2,category);
             ps.setString(3, category);
       
             ps.setString(5,name);
             ps.setString(6,phno);
             ps.setString(7,city);
            
             
       
             
             
           File f=new File(path1);
           int s=(int)f.length();
           FileInputStream fis=new FileInputStream(f);
           ps.setBinaryStream(4,fis,s);
          
           
             int k=ps.executeUpdate();
             if(k!=0)
             {
                 out.println("inserted sucessfully");
             }
             %>
             
             
                            
                            
    </body>
</html>

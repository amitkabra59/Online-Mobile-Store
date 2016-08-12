<%@include file="adminhome.jsp" %>
<%@include file="connect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citizen Registration details</title>
    </head>
    <center>
    <body>
        <h1>Citizen Registration details</h1>
            <table border="2">
                <tr>
              <th>Citizen Id</th>
            <th>CName</th>
            <th>Gender</th>
            <th>DOB</th>
            <th>Email Id</th>
            <th>Ph no</th>
            <th>Address</th>
          <th>Qualification</th>
          <th>password</th>
            <th>status</th>
                <th>photo</th>
                </tr>
                <%
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from CITIZENREG");
            while(rs.next())
            {
              String name=rs.getString(1);
              InputStream is=rs.getBinaryStream(11);
              FileOutputStream fos=new FileOutputStream("E:/CCS/citizen card system/web/images/"+name+".jpg");
              int k;
              while((k=is.read())!=-1)
                  fos.write(k);
                %>
            <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td> 
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
            <td><%=rs.getString(9)%></td>
            <td><%=rs.getString(10)%></td>
            <td><img src="images/<%=name%>.jpg" height="90" width="70"/></td>
             <%if(rs.getString(10).equals("pending"))
                           {%>
            <td><a href="citizen status.jsp?id=<%=rs.getString(1)%>">generate status</a></td>  
            <%}
             else{%>
              <td><a href="delcitizen.jsp?id=<%=rs.getString(1)%>">delete</a></td> 
            
            </tr>
            <%
                 fos.close();
            }}
            %>
        </table>
    </body>
</center>
</html>

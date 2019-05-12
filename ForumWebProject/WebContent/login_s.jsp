<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

  String uemail=request.getParameter("uemail");
  String upass=request.getParameter("upass");
    
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webforum","root", "1234");
        Statement st=con.createStatement();
        String sql="select * from user where useremail="+'"'+uemail+'"'+"and userpass="+'"'+upass+'"';
       	
        out.println(sql);
       
        ResultSet rs=st.executeQuery(sql);
        if(rs.next())
        {
        	if(rs.getString(2).equals(uemail))
        	{
        			session.setAttribute("islogin","true");
                    session.setAttribute("uname",rs.getString(2));
                    session.setAttribute("uemail",uemail);
                    response.sendRedirect("profile.jsp");
        	}
        }
        else
        {
			session.setAttribute("message"," User email id is not registered .Try login again ");
			response.sendRedirect("login.jsp");
        }
    }
    catch(Exception e)
    {
        out.println("exception occurred"+"<br>"+e); 
    }

%>

</body>
</html>
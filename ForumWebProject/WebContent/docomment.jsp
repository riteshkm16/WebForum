<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	PROFILE HELLO
	!!!!
	<br>
	<a href="allpost.jsp">All Post </a>
	<a href="addpost.jsp">Add Post </a>
	<a href="logout.jsp">Logout </a>
	<br>
	<%
		try {
			String isLogin = session.getAttribute("islogin").toString();
			String uemail = session.getAttribute("uemail").toString();
			if (isLogin.equals("true")) {
			} else {
				session.setAttribute("message", "PLEASE LOGIN FIRST !!");
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("login.jsp");
		}
	%>


	<%
		String userId = session.getAttribute("uemail").toString();
		String postId = session.getAttribute("postid").toString();
		
		String commentpostid = postId;
		String commentcontent = request.getParameter("commentcontent");
		String commentdate = new Date().toString();
		String commentby = userId;

		out.println("-->" + commentcontent + " " + commentdate + " " + commentdate + " " + commentby);

		//String sql=;(1,"test title","test content kj jkj kjj kjj","25-21-58","general","test@test.com")
		String sql = "insert into comment(commentpostid,commentcontent,commentdate,commentby) values('"
				+ commentpostid + "','" + commentcontent + "','" + commentdate + "','" + commentby
				+ "'   )";
		out.println(sql);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webforum", "root", "1234");
			Statement st = con.createStatement();
			int i = st.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
			out.println("exception occurred" + "<br>" + e);
		}
		response.sendRedirect("viewpost.jsp?postid="+postId);
	%>
</body>
</html>
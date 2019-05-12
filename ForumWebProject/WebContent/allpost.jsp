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

<link rel="stylesheet" type="text/css" href="allpage.css">


</head>
<body>




	<div class="nav-bar">
		<div class="logo">WEB FORUM</div>
		<div class="nav-bar-option">
			<a href="profile.jsp">HOME</a>
		</div>
		<div class="nav-bar-option">
			<a href="allpost.jsp">All Post </a>
		</div>
		<div class="nav-bar-option">
			<a href="addpost.jsp">Add Post </a>
		</div>
		<div class="nav-bar-option">
			<a href="logout.jsp">Logout </a>
		</div>
	</div>

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
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webforum", "root", "1234");
			Statement st = con.createStatement();
			String sql = "select * from post";
			//out.println(sql);

			ResultSet rs = st.executeQuery(sql);
	
	
	%>
	
	<h4 align="center">ALL POST</h4>
	<h6 align="center">Click on the post title to view the post !</h6>
	
	<div>
		<div class="allpost-div">
			<table class="table table-striped">
				<tr class="allpost-tr">
					<td class="allpost-td1">POST ID</td>
					<td class="allpost-td2">POST TITLE</td>
				</tr>

				<%
		///			session.setAttribute("postid", 1);
						while (rs.next()) {
							
							%>
							<tr class="allpost-tr"><td class="allpost-td1">
							<%
							String ll=rs.getString(1);
							out.print(rs.getString(1));
							%></td class="allpost-td2"><td >
							<a href='viewpost.jsp?postid=<%out.println(ll);%>'><%=rs.getString(2) %></a>
							</td><tr><%
					}
				%>
			</table>

		</div>
	</div>
	<%
		} 
		catch (Exception e) 
		{
			out.println("errror occurred" + e);
		}
	%>
	
</body>
</html>
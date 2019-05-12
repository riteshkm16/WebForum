<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
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
<br>
<h5 align="center">
Click on All Post to see all the post
</h5>
<h5 align="center">
Click on Add Post to see add your post
</h5>


</body>
</html>
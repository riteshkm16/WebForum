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
	out.println("<br><br>");
	%>



	<form action="addpost_s.jsp" method="post">
		<table>
			<tr>
				<td>Post  Title</td>
				<td>
				<textarea rows="1" cols="100"name="posttitle" required=""></textarea>
				</td>
			</tr>
			<tr>
				<td>Post  content</td>
				<td>
				<textarea rows="4" cols="100"name="postcontent" required=""></textarea>
				</td>
			</tr>
			<tr>
				<td>Post  Category</td>
				<td>
				<textarea rows="1" cols="100"name="posttitle"></textarea>
				</td>
			</tr>
			
			
			
		</table>
		<input type="submit" value="ADD POST">
	</form>



</body>
</html>
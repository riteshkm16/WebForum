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
<title>view post</title>

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




	<%
		out.println("<br><br>");
		try {
			String postid = request.getParameter("postid").toString();

			//out.println("post id is :"+postid);
			session.setAttribute("postid", postid);

			//out.println(session.getAttribute("postid"));

			//out.println(postid);

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webforum", "root", "1234");
			Statement st = con.createStatement();
			String sql = "select * from post where postid =" + postid;
			//     out.println(sql);

			ResultSet rs = st.executeQuery(sql);
	%>



	<%
		while (rs.next()) {
	%>
	<div class="post-div">
		<div class="post-title">
			<%
				out.print(rs.getString(2));
			%>
		</div>
		<%
			
		%><div class="post-content">

			<%
				out.print(rs.getString(3));
			%>
		</div>
		<%
			
		%><div class="post-by">
			Post by:
			<%
			out.print(rs.getString(6));
		%>
		</div>
		<%
			
		%><div class="post-time">
			<%
				out.print(rs.getString(4));
			%>
		</div>

	</div>
	<h5>Comments</h5>
	<%
		}

			sql = "select * from comment where commentpostid =" + postid;
			rs = st.executeQuery(sql);

			while (rs.next()) {
	%>
	<div class="all-comment-div">

		<div class="comment-div">

			<div class="comment-content">
				<%
					out.println(rs.getString(3));
				%>
			</div>

			<div class="comment-by">
				<%
					out.println("comment by : " + rs.getString(5));
				%>

			</div>
			<div class="comment-date">
				<%
					out.println(rs.getString(4));
				%>

			</div>

		</div>


	</div>
	<%
		}
	%>


	<br>


		<div class="docomment-div">
		
		<h5>Comment : </h5>
	<form action="docomment.jsp" method="post">
		
		<table>
			<tr>
				<td class="comment-td"><textarea rows="4" cols="100"name="commentcontent" required=""></textarea></td>
			</tr>
			<tr>
				<td class="comment-td"><input type="submit" value="Comment"></td>
			</tr>
		</table>
	</form>
	
	
		</div>
	
	
	<%
		} catch (Exception e) {
			out.println("errror occurred" + e);
			e.printStackTrace();
		}
	%>
</body>
</html>
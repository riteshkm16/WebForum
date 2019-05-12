<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="allpage.css">


</head>
<body>	<div class="nav-bar">
		<div class="logo">WEB FORUM</div>
	</div>


	<%
		String message;
		message = (String) session.getAttribute("message");
		out.println(message);
	%>
	<form action="login_s.jsp" method="post">
		<p align="center">
			<font color="red"> </font>
		</p>
		<table class="table table" align="center">
			<tr>
				<td>EMAIL</td>
				<td><INPUT type="text" name="uemail" class="form-control"
					placeholder="email@email.com" required=""></td>
			</tr>
			<tr>
				<td>PASSWORD</td>
				<td><input type="password" name="upass" class="form-control"
					placeholder="*******" required=""></td>
			</tr>
			<tr>
				<td></td>
				<td>
				
		<input type="submit" class="form-control btn-info btn-lg"
			value="LOGIN"> 
				</td>
			</tr>
			
			<tr>
			</tr>
		</table><br> <br> <br>
	</form>
</body>
</html>
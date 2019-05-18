<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>User Register Form</h1>
<form action="userdetails.jsp" method="post">
			<table style="with: 50%">
				<tr>
					<td>email</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td>password</td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td>nick</td>
					<td><input type="text" name="nick" /></td>
				</tr>
					<tr>
					<td>date of birth</td>
					<td><input type="text" name="dot" /></td>
				</tr>
				<tr>
					<td>country</td>
					<td><input type="text" name="country" /></td>
				</tr>
				<tr>
					<td>skill</td>
					<td><input type="text" name="skill" /></td>
				</tr></table>
			<input type="submit" value="Submit" /></form>
</body>
</html>
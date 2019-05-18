<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.exerc.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="user"
		class="com.exerc.User" />

	<jsp:setProperty property="*" name="user" />

	<%
		UserDao userDao = new UserDao();
		int status = userDao.registerUser(user);
		if (status > 0) {
			out.print("You are successfully registered");
			Thread.sleep(2000); 
			String redirectURL = "login.jsp";
			response.sendRedirect(redirectURL);
		}
	%>
</body>
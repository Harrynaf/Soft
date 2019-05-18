<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.exerc.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript"></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="login" class="com.exerc.LoginBean" />

	<jsp:setProperty property="*" name="login" />
	<%
		LoginDao loginDao = new LoginDao();
			boolean status = loginDao.validate(login);
			if (status) {
				 String name = request.getParameter( "username" );
				 session.setAttribute( "Name",name );
				 String redirectURL = "homepage.jsp";
				 response.sendRedirect(redirectURL);
			}
			else{
				String redirectURL = "login.jsp";
			    response.sendRedirect(redirectURL);
			}
	%>
</body>
</html>
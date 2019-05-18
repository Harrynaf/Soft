<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.exerc.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

    String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:8889/";
	String dbName = "mysql_database";
	String userId = "root";
	String password = "root";
	
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="multi"
		class="com.exerc.Multi" />

	<jsp:setProperty property="*" name="multi" />

	<%
		MultiDao multiDao = new MultiDao();
		int status = multiDao.registerMulti(multi);
		if (status > 0) {
			String redirectURL = "successpost.jsp";
	         response.sendRedirect(redirectURL);
			Thread.sleep(2000); 
		}
	%>
</body>
</html>
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

	<jsp:useBean id="task"
		class="com.exerc.Task" />

	<jsp:setProperty property="*" name="task" />

	<%
		TaskDao taskDao = new TaskDao();
		int status = taskDao.registerTask(task);
		if (status > 0) {
			String redirectURL = "successpost.jsp";
	         response.sendRedirect(redirectURL);
			Thread.sleep(2000); 
		}
	%>
</body>
</html>
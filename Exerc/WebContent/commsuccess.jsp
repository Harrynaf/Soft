<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>

<%
    session.setAttribute("commfeedtaskrefresh",session.getAttribute("commfeedtask"));
    String id = request.getParameter("userId");
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:8889/";
	String dbName = "mysql_database";
	String userId = "root";
	String password = "root";
	PreparedStatement ps = null;
	
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		if (session.getAttribute("Name").equals(session.getAttribute("checkemp")))
		{String sql ="INSERT INTO CommDB (text,taskid) VALUES ((concat(COALESCE(text, ''), 'Employer Wrote:"+request.getParameter("message")+"')),'"+session.getAttribute("commfeedtask")+"') ;";
		ps = connection.prepareStatement(sql);
		ps.executeUpdate();}
		else{String sql ="INSERT INTO CommDB (text,taskid) VALUES ((concat(COALESCE(text, ''), 'Employee Wrote:"+request.getParameter("message")+"')),'"+session.getAttribute("commfeedtask")+"') ;";
		ps = connection.prepareStatement(sql);
		ps.executeUpdate();}
	} catch (Exception e) {
		e.printStackTrace();
	}
	String redirectURL = "commapply.jsp";
    response.sendRedirect(redirectURL);
%>

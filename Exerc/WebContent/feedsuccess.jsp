<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.PreparedStatement"%>

<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:8889/";
	String dbName = "mysql_database";
	String userId = "root";
	String password = "root";
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	PreparedStatement ps2 = null;
	double avgrating = 0 ;	
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
		{String sql ="UPDATE TaskDB SET feedback = concat(COALESCE(feedback, 'CHAR(13)'), 'Employer "+session.getAttribute("Name")+" gave feedback:"+request.getParameter("feedback")+"\n'),feedbackedbyemployer = 1 WHERE id='"+session.getAttribute("commfeedtask")+"' ;";
		ps = connection.prepareStatement(sql);
		ps.executeUpdate();
		String sql1 ="UPDATE UserDB SET ratingscount = ratingscount + 1 , rating = rating + '"+request.getParameter("rating")+"' WHERE email='"+session.getAttribute("col3")+"' ;";
		ps1 = connection.prepareStatement(sql1);
		ps1.executeUpdate();
		String sql2 ="SELECT * FROM UserDB WHERE email = '"+session.getAttribute("col3")+"'";
		resultSet = statement.executeQuery(sql2);
		while(resultSet.next()){		
		avgrating=Integer.valueOf(resultSet.getString("rating"))/Integer.valueOf(resultSet.getString("ratingscount"));}
		String sql3 ="UPDATE UserDB SET avgrating = '"+avgrating+"' WHERE email='"+session.getAttribute("col3")+"' ;";
		ps2 = connection.prepareStatement(sql3);
		ps2.executeUpdate();
		}
		else{String sql ="UPDATE TaskDB SET feedback = concat(COALESCE(feedback, 'CHAR(13)'), 'Employee "+session.getAttribute("col3")+" gave feedback:"+request.getParameter("feedback")+"\n'),feedbacked = 1 WHERE id='"+session.getAttribute("commfeedtask")+"' AND assignedto='"+session.getAttribute("col3")+"';";
		ps = connection.prepareStatement(sql);
		ps.executeUpdate();
		sql ="UPDATE TaskDB SET feedback = concat(COALESCE(feedback, 'CHAR(13)'), 'Employee "+session.getAttribute("col3")+" gave feedback:"+request.getParameter("feedback")+"\n'),feedbacked1 = 1 WHERE id='"+session.getAttribute("commfeedtask")+"' AND assignedto1='"+session.getAttribute("col3")+"';";
		ps = connection.prepareStatement(sql);
		ps.executeUpdate();
		sql ="UPDATE TaskDB SET feedback = concat(COALESCE(feedback, 'CHAR(13)'), 'Employee "+session.getAttribute("col3")+" gave feedback:"+request.getParameter("feedback")+"\n'),feedbacked2 = 1 WHERE id='"+session.getAttribute("commfeedtask")+"' AND assignedto2='"+session.getAttribute("col3")+"';";
		ps = connection.prepareStatement(sql);
		ps.executeUpdate();
		String sql1 ="UPDATE UserDB SET ratingscount = ratingscount + 1 , rating = rating + '"+request.getParameter("rating")+"' WHERE email='"+session.getAttribute("checkemp")+"' ;";
		ps1 = connection.prepareStatement(sql1);
		ps1.executeUpdate();
		String sql2 ="SELECT * FROM UserDB WHERE email = '"+session.getAttribute("checkemp")+"'";
		resultSet = statement.executeQuery(sql2);
		while(resultSet.next()){	
		avgrating=Integer.valueOf(resultSet.getString("rating"))/Integer.valueOf(resultSet.getString("ratingscount"));}
		String sql3 ="UPDATE UserDB SET avgrating = '"+avgrating+"' WHERE email='"+session.getAttribute("checkemp")+"' ;";
		ps2 = connection.prepareStatement(sql3);
		ps2.executeUpdate();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	String redirectURL = "feedbackpend.jsp";
    response.sendRedirect(redirectURL);
%>

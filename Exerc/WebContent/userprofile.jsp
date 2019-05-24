
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

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
	String usersname = new String();
%>
<html> 
<head> 
<link rel="stylesheet" type="text/css" href="homepage.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<h1 style="color:white;">User profile</h1>
<body>
    <div id="container">
        <div id="center">
        <h2 align="center"><font><strong><%=request.getParameter("user")%>'s Credentials</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" style="width:100%">
<tr>

</tr>
	<tr bgcolor="#3399ff">
		<td><b>Email</b></td>
		<td><b>Nickname</b></td>
		<td><b>Date of Birth</b></td>
		<td><b>Country</b></td>
		<td><b>Skills & Past experience</b></td>
		<td><b>Rating</b></td>
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM UserDB WHERE email = '"+request.getParameter("user")+"' OR nick = '"+request.getParameter("user")+"' ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){usersname = resultSet.getString("email");
	%>  
		<tr bgcolor="#cce6ff">
			
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("nick") %></td>
			<td><%=resultSet.getString("dot") %></td>
			<td><%=resultSet.getString("country") %></td>
			<td><%=resultSet.getString("skill") %></td>
			<td><%=resultSet.getString("avgrating") %><img src="star.png" alt="Star" height="42" width="42"></td>
			
		</tr>
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
<div id="tbody">
<table align="center" cellpadding="5" cellspacing="5" border="1" style="width:100%">
<tr>

</tr>
	<tr bgcolor="#3399ff">
		<td><b>Task No</b></td>
		<td><b>Skill he/she worked for</b></td>
		<td><b>His/Her payment</b></td>
		<td><b>Feedback</b></td>
		<td><b>Description of past task</b></td>
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM TaskDB WHERE assignedto = '"+usersname+"' AND feedback IS NOT NULL";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#cce6ff">	
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("skillneed") %></td>
			<td><%=resultSet.getString("payment") %></td>
			<td><%=resultSet.getString("feedback") %></td>
			<td><%=resultSet.getString("description") %></td>		
		</tr>
		            
	<%		
		}
		sql ="SELECT * FROM TaskDB WHERE assignedto1 = '"+usersname+"'  AND feedback IS NOT NULL ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#cce6ff">	
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("skillneed1") %></td>
			<td><%=resultSet.getString("payment1") %></td>
			<td><%=resultSet.getString("feedback") %></td>		
			<td><%=resultSet.getString("description") %></td>	
		</tr>
		            
	<%		
		}
		sql ="SELECT * FROM TaskDB WHERE assignedto2 = '"+usersname+"'  AND feedback IS NOT NULL ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#cce6ff">	
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("skillneed2") %></td>
			<td><%=resultSet.getString("payment2") %></td>
			<td><%=resultSet.getString("feedback") %></td>	
			<td><%=resultSet.getString("description") %></td>	
		</tr>
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</div>
</div>
        </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
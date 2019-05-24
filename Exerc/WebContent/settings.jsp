
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
%>
<html> 
<head> 
<link rel="stylesheet" type="text/css" href="homepage.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<h1 style="color:white;">Settings & my information</h1>
<body>
    <div id="container">
        <div id="center">
           <a href="index.jsp">Logout</a>
        </div>
        <div id="lower">
        <h2 align="center"><font><strong>My credentials</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
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
		String sql ="SELECT * FROM UserDB WHERE email = '"+session.getAttribute( "Name")+"'";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
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
</div>
        </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
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
<html> 
<head> 
<link rel="stylesheet" type="text/css" href="homepage.css" media="screen" />
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<h1 style="color:white;">Feedback History</h1>
<body>
    <div id="container">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">As an employee</a></li>
    <li><a data-toggle="tab" href="#menu1">As an employer</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>As an employee</h3>
       <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
	<tr bgcolor="#3399ff">
		<td><b>Task No</b></td>
		<td><b>Skill</b></td>
		<td><b>Payment in euro</b></td>
		<td><b>Description</b></td>
		<td><b>Feedback</b></td>
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM TaskDB WHERE assignedto = '"+session.getAttribute( "Name")+"' AND feedback IS NOT NULL";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#cce6ff">
			
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("skillneed") %></td>
			<td><%=resultSet.getString("payment") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><%=resultSet.getString("feedback") %></td>
			
		</tr>
		            
	<%		
		}
		sql ="SELECT * FROM TaskDB WHERE assignedto1 = '"+session.getAttribute( "Name")+"' AND feedback IS NOT NULL";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#cce6ff">
			
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("skillneed1") %></td>
			<td><%=resultSet.getString("payment1") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><%=resultSet.getString("feedback") %></td>
			
		</tr>
		            
	<%		
		}
		sql ="SELECT * FROM TaskDB WHERE assignedto2 = '"+session.getAttribute( "Name")+"' AND feedback IS NOT NULL";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#cce6ff">
			
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("skillneed2") %></td>
			<td><%=resultSet.getString("payment2") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><%=resultSet.getString("feedback") %></td>
			
		</tr>
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>As an employer</h3>
       <table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
	<tr bgcolor="#3399ff">
		<td><b>Task No</b></td>
		<td><b>Skill</b></td>
		<td><b>Payment in euro</b></td>
		<td><b>Description</b></td>
		<td><b>Feedback</b></td>
	</tr>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM TaskDB WHERE email = '"+session.getAttribute( "Name")+"' AND feedback IS NOT NULL";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr bgcolor="#cce6ff">
			
			<td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("skillneed") %></td>
			<td><%=resultSet.getString("payment") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><%=resultSet.getString("feedback") %></td>
			
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
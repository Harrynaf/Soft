<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    session.setAttribute("commfeedtaskrefresh","");
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
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<h1 style="color:white;">Communication</h1>
<body>
    <div id="container">
          <form action="commapply.jsp" method="post">
            <input type = "hidden" name="taskid" id="taskid">
            <input type = "hidden" name="checkemp" id="checkemp">
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">With my employer</a></li>
    <li><a data-toggle="tab" href="#menu1">With my employees</a></li>
      <li><a data-toggle="tab" href="#menu2">I'm in a Multi-assignment</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>With my employer</h3>
  <div id="tbody">
<table class="table" align="center" cellpadding="5" cellspacing="5" border="1">
<thead>

	<tr bgcolor="#3399ff">
	    <td><b>Task No</b></td>
		<td><b>Employer's Email</b></td>
		<td><b>Employee's Email</b></td>	
		<td><b>Skill</b></td>
		<td><b>Payment in euro</b></td>
		<td><b>Description</b></td>
		<td><b>Message</b></td>
	</tr>
	</thead>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM TaskDB where active = 1 and done = 0 and assignedto ='"+session.getAttribute("Name")+"' ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("assignedto") %></td>
			<td><%=resultSet.getString("skillneed") %></td>
			<td><%=resultSet.getString("payment") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><button type="submit" class="registerbtn">Message</button></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}%>
</table>
</div>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3>With my employees</h3>
  <div id="tbody">
<table class="table" align="center" cellpadding="5" cellspacing="5" border="1">
<thead>

	<tr bgcolor="#3399ff">
	    <td><b>Task No</b></td>
	    <td><b>Employer's Email</b></td>
		<td><b>Employee's Email</b></td>
		<td><b>Skill</b></td>
		<td><b>Payment in euro</b></td>
		<td><b>Description</b></td>
		<td><b>Message</b></td>
	</tr>
	</thead>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM TaskDB where active = 1 and done = 0 and email ='"+session.getAttribute("Name")+"' ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("id") %></td>
		    <td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("assignedto") %></td>
			<td><%=resultSet.getString("skillneed") %></td>
			<td><%=resultSet.getString("payment") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><button type="submit" class="registerbtn">Message</button></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}%>
</table>
</div>
    </div>
      <div id="menu2" class="tab-pane fade">
      <h3>With my multi-assignments colleagues</h3>
  <div id="tbody">
<table class="table" align="center" cellpadding="5" cellspacing="5" border="1">
<thead>

	<tr bgcolor="#3399ff">
	    <td><b>Task No</b></td>
		<td><b>Employer's Email</b></td>
		<td><b>Employee's Email</b></td>
		<td><b>Skill</b></td>
		<td><b>Payment in euro</b></td>
		<td><b>Description</b></td>
		<td><b>Message</b></td>
	</tr>
	</thead>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM TaskDB where active = 1 and done = 0 and assignedto ='"+session.getAttribute("Name")+"'";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("assignedto") %></td>
			<td><%=resultSet.getString("skillneed") %></td>
			<td><%=resultSet.getString("payment") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><button type="submit" class="registerbtn">Message</button></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}%>
</table>
</div>
    </div>
    </div>
    <script src="jquery.min.js"></script>
    <script>
    $('.table tbody').on('click','.registerbtn',function(){
        var currow = $(this).closest('tr');
        var col1 = currow.find('td:eq(0)').html();
        var col2 = currow.find('td:eq(1)').html();
        document.getElementById("checkemp").value = col2;
        var result = col1;
        document.getElementById("taskid").value = result;
    })
    </script>
    </form>
  </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
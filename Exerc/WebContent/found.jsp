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
<script type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="homepage.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<body>
    <div id="container">
        <div id="center">
        <h2 align="center"><font><strong>Search Results</strong></font></h2>
        <form action="applysuccess.jsp" method="post">
            <input type = "hidden" name="taskid" id="taskid">
            <input type = "hidden" name="skillneed" id="skillneed">
  <div id="tbody">
<table class="table" align="center" cellpadding="5" cellspacing="5" border="1">
<thead>

	<tr bgcolor="#3399ff">
	    <td><b>Task No</b></td>
		<td><b>EmployerEmail</b></td>
		<td><b>Skill</b></td>
		<td><b>Payment in euro</b></td>
		<td><b>Description</b></td>
		<td><b>Apply for task</b></td>
	</tr>
	</thead>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String task = request.getParameter("task");
		String sql ="SELECT * FROM TaskDB WHERE active = 0 and done = 0 and skillneed like '"+task+"' and email != '"+session.getAttribute("Name")+"' ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("skillneed") %></td>
			<td><%=resultSet.getString("payment") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><button type="submit" class="registerbtn">Apply</button></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
		String sql1 ="SELECT * FROM TaskDB WHERE active1 = 0 and done = 0 and skillneed1 like '"+task+"' and email != '"+session.getAttribute("Name")+"' ";
		resultSet = statement.executeQuery(sql1);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("skillneed1") %></td>
			<td><%=resultSet.getString("payment1") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><button type="submit" class="registerbtn">Apply</button></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
		String sql2 ="SELECT * FROM TaskDB WHERE active1 = 0 and done = 0 and skillneed2 like '"+task+"' and email != '"+session.getAttribute("Name")+"' ";
		resultSet = statement.executeQuery(sql2);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("skillneed2") %></td>
			<td><%=resultSet.getString("payment2") %></td>
			<td><%=resultSet.getString("description") %></td>
			<td><button type="submit" class="registerbtn">Apply</button></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
	} catch (Exception e) {
		e.printStackTrace();
	}%>
<script src="jquery.min.js"></script>
    <script>
    $('.table tbody').on('click','.registerbtn',function(){
        var currow = $(this).closest('tr');
        var col1 = currow.find('td:eq(0)').html();
        var col3 = currow.find('td:eq(2)').html();
        var result = col1;
        document.getElementById("taskid").value = result;
        document.getElementById("skillneed").value = col3;
    })
    </script>
</table>
</div>
</form>
</div>
        </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
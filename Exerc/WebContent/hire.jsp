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
	String[] parts = new String[50];
	session.setAttribute("taskforhire",request.getParameter("taskid"));
	session.setAttribute("candidateskill",request.getParameter("candidateskill"));
%>
<html> 
<head> 
<script type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="homepage.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<h1>My Uber Task Home</h1>
<body>
    <div id="container">
        <div id="center">
        <h2 align="center" style="background-color:gold;"><font><strong>Hire</strong></font></h2>
        <form action="hiresuccess.jsp" method="post">
            <input type = "hidden" name="taskid" id="taskid">
            <input type = "hidden" name="candidate" id="candidate">
  <div id="tbody">
<table class="table" align="center" cellpadding="5" cellspacing="5" border="1">
<thead>

	<tr bgcolor="#3399ff">
	    <td><b>Candidate</b></td>
	    <td><b>For skill</b></td>
	    <td><b>CandidateEmail</b></td>
		<td><b>Rating</b></td>
		<td><b>Date of birth</b></td>
		<td><b>Country</b></td>
		<td><b>Skills</b></td>
		<td><b>Hire</b></td>
	</tr>
	</thead>
   <%

	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM TaskDB where id= '"+request.getParameter("taskid")+"' and skillneed= '"+request.getParameter("candidateskill")+"' ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){parts = resultSet.getString("candidates").split("%");}
		String sql1 ="SELECT * FROM TaskDB where id= '"+request.getParameter("taskid")+"' and skillneed1= '"+request.getParameter("candidateskill")+"' ";
		resultSet = statement.executeQuery(sql1);
		while(resultSet.next()){parts = resultSet.getString("candidates1").split("%");}
		String sql2 ="SELECT * FROM TaskDB where id= '"+request.getParameter("taskid")+"' and skillneed2= '"+request.getParameter("candidateskill")+"' ";
		resultSet = statement.executeQuery(sql2);
		while(resultSet.next()){parts = resultSet.getString("candidates2").split("%");}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
   
   for(int i = 0; i < parts.length; i++) {
      
   
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM UserDB where email= '"+parts[i]+"'";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("nick") %></td>
		    <td><%=request.getParameter("candidateskill") %></td>
		    <td><%=resultSet.getString("email") %></td>
			<td><%=resultSet.getString("rating") %><img src="star.png" alt="Star" height="42" width="42"></td>
			<td><%=resultSet.getString("dot") %></td>
			<td><%=resultSet.getString("country") %></td>
			<td><%=resultSet.getString("skill") %></td>
			<td><button type="submit" class="registerbtn">Hire this person</button></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}%>
<script src="jquery.min.js"></script>
    <script>
    $('.table tbody').on('click','.registerbtn',function(){
        var currow = $(this).closest('tr');
        var col3 = currow.find('td:eq(2)').html();
        var result = col3;
        document.getElementById("candidate").value = result;
        System.out.println(<%=request.getParameter("taskid")%>);
        document.getElementById("taskid").value = <%=request.getParameter("taskid")%>;
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
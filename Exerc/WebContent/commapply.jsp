<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%session.setAttribute("commfeedtask",request.getParameter("taskid"));
 session.setAttribute("checkemp",request.getParameter("checkemp"));
 System.out.println(request.getParameter("taskid"));
 System.out.println(request.getParameter("checkemp"));
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
	ResultSet resultSet = null;%>
<html> 
<head> 
<link rel="stylesheet" type="text/css" href="post.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<h1><a style="text-decoration:none;color:black;background-color: gold;">Messaging</a></h1>
<body>
    <div class="container">
    
      <div id="tbody">
<table class="table" align="center" cellpadding="5" cellspacing="5" border="1" style="width:100%">
<thead>

	<tr bgcolor="#3399ff">
	    <td><b>Message No</b></td>
	    <td><b>Message</b></td>
	</tr>
	</thead>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM CommDB where taskid ='"+session.getAttribute("commfeedtask")+"' OR taskid ='"+session.getAttribute("commfeedtaskrefresh")+"' ";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>             
		    <tbody>
		    <tr bgcolor="#cce6ff">
		    <td><%=resultSet.getString("id") %></td>
			<td><%=resultSet.getString("text") %></td>
		</tr>
		</tbody>
		
		            
	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}%>
</table>
</div>
    
  <form action="commsuccess.jsp" method="post">
  <div class="row">
    <div class="col-25">
      <label for="subject">Message</label>
    </div>
    <div class="col-75">
      <textarea id="message" name="message" placeholder="Write something.." style="height:200px"></textarea>
    </div>
  </div>
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
</div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
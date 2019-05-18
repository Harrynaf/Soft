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
		String sql ="UPDATE TaskDB SET done = 1 WHERE id='"+request.getParameter("taskid")+"' ;";
		ps = connection.prepareStatement(sql);
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>
<html> 
<head> 
<script type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="main.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<body>
    <div id="container">
      <h1>Payment Proof of Concept</h1>
        <div id="center">
           <a href="homepage.jsp" style="color:black;background-color:gold;font-size:20px;">Pay with Paypal</a>
           <a href="homepage.jsp" style="color:black;background-color:gold;font-size:20px;">Pay with wire transfer</a>
           <a href="homepage.jsp" style="color:black;background-color:gold;font-size:20px;">Pay with credit</a>
           <h1 style="color:black;font-size:20px;padding-top:25px;">Proof of Concept:Would redirect to Paypal payment url/Wire tranfer payment url/ Credit card payment url</h1>
            <h1 style="color:black;font-size:20px;padding-top:25px;">Task with task id = <%=request.getParameter("taskid")%> updated to done in database.</h1>
        </div>
        <div id="lower">
             <a style="font-size:40px;" href="homepage.jsp">Go to my homepage</a>
            </div>
        </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
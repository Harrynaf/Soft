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
	String nickname = new String();
	
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
		String sql ="SELECT nick FROM UserDB WHERE email='"+session.getAttribute("Name")+"' ;";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			nickname = resultSet.getString("nick");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html> 
<head> 
<link rel="stylesheet" type="text/css" href="homepage.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<h1 style="color:white;">My Uber Task Home</h1>
<h1 style="color:gold;">Hello <%=nickname%></h1>
<body>
    <div id="container">
        <div id="center">
           <a href="feedback.jsp">feedback</a>
           <a href="comm.jsp">communication</a>
            <a href="settings.jsp">settings</a>
        </div>
        <div id="lower">
             <a href="main.jsp">Find task/Post a task</a>
             <a href="mytasks.jsp">My tasks & Posted tasks</a>
            </div>
        </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
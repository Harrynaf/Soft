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
	session.setAttribute("uploadtaskid",request.getParameter("taskid"));
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
        <h2 align="center"><font><strong>Upload file for remote task with Task id= <%=request.getParameter("taskid") %></strong></font></h2>
       <h3>File Upload:</h3>
     <h1 style="font-size:30px;background-color:gold;">Select a file to upload:</h1>
      <form action = "UploadFile.jsp" method = "post"
         enctype = "multipart/form-data">
         <input type = "file" name = "file" size = "80"/>
         <br />
         <input type = "submit" value = "Upload File" style="font-size:30px;background-color:gold;" />
      </form>
</div>
        </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
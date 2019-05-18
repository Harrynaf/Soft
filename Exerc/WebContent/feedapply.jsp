<%session.setAttribute("commfeedtask",request.getParameter("taskid"));
 session.setAttribute("checkemp",request.getParameter("checkemp"));
 session.setAttribute("col3",request.getParameter("col3"));
%>
<html> 
<head> 
<link rel="stylesheet" type="text/css" href="post.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<h1><a style="text-decoration:none;color:black;background-color: gold;">Write Feedback</a></h1>
<body>
    <div class="container">
  <form action="feedsuccess.jsp" method="post">
  <div class="row">
    <div class="col-25">
      <label for="subject">Feedback</label>
    </div>
    <div class="col-75">
      <textarea id="feedback" name="feedback" placeholder="Write something.." style="height:200px"></textarea>
    </div>
  </div>
      <div class="row">
    <div class="col-25">
      <label for="fname">Rating(1-10)</label>
    </div>
    <div class="col-75">
      <<input type="number" name="rating" min="1" max="10" style="width:50px">
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
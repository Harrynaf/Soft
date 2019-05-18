<html> 
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="js/jquery.czMore.js"></script>

<head> 
<link rel="stylesheet" type="text/css" href="post.css" media="screen" />
<title>Uber Task</title>
<h1><a href="homepage.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>
<h1 style="color:white;">Multi-Assignment</h1>
<body>
    <div class="container">
  <form action="/action_page.php">
  <div class="row">
    <div class="col-25">
      <label for="fname">Skill needed</label>
    </div>
    <h1><a style="text-align: left;font-size:25px;">Website engineer</a></h1>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Payment</label>
    </div>
    <div class="col-75">
      <input type="text" id="fname" name="firstname" placeholder="in euro">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Skill needed</label>
    </div>
     <h1><a style="text-align: left;font-size:25px;">Website designer</a></h1>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Payment</label>
    </div>
    <div class="col-75">
      <input type="text" id="fname" name="firstname" placeholder="in euro">
    </div>
  </div>   
  <div class="row">
    <div class="col-25">
      <label for="subject">Description</label>
    </div>
    <div class="col-75">
      <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>
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
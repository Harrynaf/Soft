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
  <form action="multidetails.jsp">
  <input type = "hidden" name="email" id="email">
  <input type = "hidden" name="remote" id="remote">
  <input type = "hidden" name="multtype" id="multtype">
  <script> 
  document.getElementById("email").value = "<%=session.getAttribute("Name")%>";
  document.getElementById("remote").value = false;
  document.getElementById("multtype").value = 0;
			        </script>  
  <div class="row">
    <div class="col-25">
      <label for="fname">Skill needed</label>
    </div>
    <div class="col-75">
      <input type="text" id="skillneed" name="skillneed" placeholder="i.e. electrician">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Payment</label>
    </div>
    <div class="col-75">
      <input type="text" id="payment" name="payment" placeholder="in euro">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Skill needed</label>
    </div>
    <div class="col-75">
      <input type="text" id="skillneed1" name="skillneed1" placeholder="i.e. construction worker">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Payment</label>
    </div>
    <div class="col-75">
      <input type="text" id="payment1" name="payment1" placeholder="in euro">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Skill needed</label>
    </div>
    <div class="col-75">
      <input type="text" id="skillneed2" name="skillneed2" placeholder="i.e. engineer">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="fname">Payment</label>
    </div>
    <div class="col-75">
      <input type="text" id="payment2" name="payment2" placeholder="in euro">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="subject">Description</label>
    </div>
    <div class="col-75">
      <textarea id="description" name="description" placeholder="Write something.." style="height:200px"></textarea>
    </div>
  </div>
  <div class="row">
  <input type="checkbox"> Is it a remote job.
    <input type="submit" value="Submit">
  </div>
  </form>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
            if($(this).prop("checked") == true){
            	document.getElementById("remote").value = true;
            }
            else if($(this).prop("checked") == false){
            	document.getElementById("remote").value = false;
            }
        });
    });
</script>
   <a style="font-size=10px;background-color:red;">HOT PICKS</a> <br></br>
        <a href="multi-assignment2.jsp" style="text-decoration:none;color:black;background-color: gold;font-size: 50px;">Construction</a>
        <a href="multi-assignment1.jsp" style="text-decoration:none;color:black;background-color: gold;font-size: 50px;">House renovation</a>
        <a href="multi-assignment3.jsp" style="text-decoration:none;color:black;background-color: gold;font-size: 50px;">Website Creation</a>
</div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
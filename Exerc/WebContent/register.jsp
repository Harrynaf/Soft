<html> 
<head> 
<link rel="stylesheet" type="text/css" href="home.css" media="screen" />
<title>Uber Task</title>
<h1><a href="index.jsp" style="text-decoration:none;color:black;background-color: skyblue;">Uber Task</a></h1>
</head>

<body>
    <div id="container">
    <form action="userdetails.jsp" method="post">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    <ul>
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="pass"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>

      
    <label for="nick"><b>Nickname</b></label>
    <input type="text" placeholder="Nickname" name="nick" required>
      
    <label for="dot"><b>Date of birth</b></label>
    <input type="text" placeholder="dd/mm/yyyy" name="dot" required>
      
    <label for="country"><b>Country</b></label>
    <input type="text" placeholder="Country" name="country" required>
      
    <label for="skill"><b>Skills</b></label>
    <input type="text" placeholder="skills1,skill2,..." name="skill" required>
      </ul>
    <hr>
    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
  </div>
</form>
        </div>
</body>
<footer class="page-footer font-small blue">
  <div class="footer-copyright text-center py-3">2019 Copyright.
  </div>
</footer>
</html>
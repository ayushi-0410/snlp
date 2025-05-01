<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!-- Coding by CodingNepal | www.codingnepalweb.com-->
<html lang="en" dir="ltr">
  <head>
    <meta charset="ISO-8859-1">
    <title>SNLP Login</title>
    <link rel="stylesheet" href="D:\CDAC\src\main\webapp\resources\style.css">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
      <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
   </head>
      <style>
   	/* Google Font Link */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins" , sans-serif;
}
.loginSection{
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background-image: url('${pageContext.request.contextPath}/resources/images/dlv.png');
  background-size: cover; /* This ensures the image covers the entire background */
  background-repeat: no-repeat;
  padding: 30px;
}
.container{
  position: relative;
  height:max-content;
  max-width: 850px;
  width: 100%;
  background: #fff;
  padding: 40px 30px;
  box-shadow: 0 1px 7px #eee;
  perspective: 2700px;
}
.container .cover{
  position: absolute;
  top: 0;
  left: 50%;
  height: 100%;
  width: 50%;
  z-index: 98;
  transition: all 1s ease;
  transform-origin: left;
  transform-style: preserve-3d;
}
.container #flip:checked ~ .cover{
  transform: rotateY(-180deg);
}

 .container .cover .front,
 .container .cover .back{
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background: #ded8a6;
}
.cover .back{
  transform: rotateY(180deg);
  backface-visibility: hidden;
}
.container .cover::before,
.container .cover::after{
  content: '';
  position: absolute;
  height: 100%;
  width: 100%;
  background: #a1aae3;
  opacity: 0.5;
  z-index: 12;
}
.container .cover::after{
  opacity: 0.3;
  transform: rotateY(180deg);
  backface-visibility: hidden;
}
.container .cover img{
  position: absolute;
  height: 100%;
  width: 100%;
  object-fit: cover;
  z-index: 12;
}

.container .cover .text{
  position: absolute;
  z-index: 130;
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  
   transition: transform 1s ease; /* Add smooth transition */
  transform: rotateY(0deg); /* Ensure the text does not rotate initially */
}
.container #flip:checked ~ .cover .text{
 transform: rotateY(180deg) !important;
}
.cover .text .text-1,
.cover .text .text-2{
  font-size: 26px;
  font-weight: 600;
  color: #0a2e45;
  text-align: center;
}
.cover .text .text-2{
  font-size: 15px;
  font-weight: 500;
}
.container .forms{
  height: 100%;
  width: 100%;
  background: #fff;
}
.container .form-content{
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.form-content .login-form,
.form-content .signup-form{
  width: calc(100% / 2 - 25px);
}
.forms .form-content .title{
  position: relative;
  font-size: 24px;
  font-weight: 500;
  color: #333;
}
.forms .form-content .title:before{
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 25px;
  background: #040436fa;
}
.forms .signup-form  .title:before{
  width: 20px;
}
.forms .form-content .input-boxes{
  margin-top: 30px;
}
.forms .form-content .input-box{
  display: flex;
  align-items: center;
  height: 50px;
  width: 100%;
  margin: 10px 0;
  position: relative;
}
.form-content .input-box input{
  height: 100%;
  width: 100%;
  outline: none;
  border: none;
  padding: 0 30px;
  font-size: 16px;
  font-weight: 500;
  border-bottom: 2px solid rgba(0,0,0,0.2);
  transition: all 0.3s ease;
}
.form-content .input-box input:focus,
.form-content .input-box input:valid{
  border-color: none;
}
.form-content .input-box i{
  position: absolute;
  color: #040436fa;
  font-size: 17px;
}
.forms .form-content .text{
  font-size: 14px;
  font-weight: 500;
  color: #333;
}
.forms .form-content .text a{
  text-decoration: none;
}
.forms .form-content .text a:hover{
  text-decoration: underline;
}
.forms .form-content .button{
  color: #fff;
  margin-top: 40px;
}
.forms .form-content .button input{
  color: #fff;
  background: #040436fa;
  border-radius: 6px;
  padding: 0;
  cursor: pointer;
  transition: all 0.4s ease;
}
.forms .form-content .button input:hover{
  background: #5b13b9;
}
.forms .form-content label{
  color: #2a2de8;
  cursor: pointer;
}
.forms .form-content label:hover{
  text-decoration: underline;
}
.forms .form-content .login-text,
.forms .form-content .sign-up-text{
  text-align: center;
  margin-top: 25px;
}
.container #flip{
  display: none;
}
@media (max-width: 730px) {
  .container .cover{
    display: none;
  }
  .form-content .login-form,
  .form-content .signup-form{
    width: 100%;
  }
  .form-content .signup-form{
    display: none;
  }
  .container #flip:checked ~ .forms .signup-form{
    display: block;
  }
  .container #flip:checked ~ .forms .login-form{
    display: none;
  }
}
   </style>
   
   <style>
           	.footer-bottom {
    background-color: #e9eff4;
    min-height: 30px;
    width: 100%;
    position: fixed;
    bottom: 0;
}
.copyright {
    color: #fff;
    line-height: 30px;
    min-height: 30px;
    padding: 7px 0;
}
.design {
    color: #fff;
    line-height: 30px;
    min-height: 30px;
    padding:  0;
    text-align: center;
}
.design p {
    color: black;
    font-size: 13px;
}

        </style>
<body>

	

	<c:url value="/login" var="loginUrl" />

<section id="header">
	
     
        
       
        
        <div class="topnav" id="myTopnav" style="background:white;    position: fixed;
			    width: -webkit-fill-available;
			    z-index: 99;">
            <div class="main_nav">
				
				<img src="${pageContext.request.contextPath}/resources/images/cdac-logo.png">
            </div>
        </div>
	

</section>

<section class="loginSection">
  <div class="container">
    <input type="checkbox" id="flip">
    <div class="cover">
      <div class="front" style="background:#ffd600">
      
        <div class="text">
        
          <span class="text-1">Welcome to our website! </span>
          <span class="text-2">Speech and Natural Language Processing (SNLP) <br> CDAC, Noida</span>
        </div>
      </div>
      <div class="back" style="background:#ffd600">
        <!--<img class="backImg" src="images/backImg.jpg" alt="">-->
        <!-- <div class="text">
          <span class="text-1">Complete miles of journey <br> with one step</span>
          <span class="text-2">Let's get started</span>
        </div> -->
      </div>
    </div>
    <div class="forms">
        <div class="form-content">
          <div class="login-form">
            <div class="title">Login</div>
            
                  <c:if test="${not empty error}">
		<div class="error" style="width: 50%;">${error}</div>
	</c:if>
	<c:if test="${not empty msg}">
		<div class="msg" style="width: 50%;">${msg}</div>
	</c:if>
            
            
          <form action="<c:url value='/login' />" method="POST">
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" id="email" name="email" placeholder="Enter your email" required>
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
              </div>
              <div class="text"><a href="#">Forgot password?</a></div>
              <div class="text"><a href="${pageContext.request.contextPath}/logInAsGuest">Login as guest</a></div>
              <div class="button input-box">
                <input type="submit" value="Login">
              </div>
              <div class="text sign-up-text">Don't have an account? <label for="flip">Signup now</label></div>
            </div>
            
            <input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			
            
        </form>
      </div>
        <div class="signup-form">
          <div class="title">Signup</div>
        <form action="${pageContext.request.contextPath}/signUp" method="post" onsubmit="return validateForm()">
        
        
            <div class="input-boxes">
              <div class="input-box">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Enter your name" name="name" id="name" required>
              </div>
              <div class="input-box">
                <i class="fas fa-envelope"></i>
                <input type="text" placeholder="Enter your email" name="email" id="email" required>
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Enter your password" id="password" name="password" required>
              </div>
              <div class="input-box">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Confirm password" id="cpassword" name="cpassword" required>
              </div>
              <div class="button input-box">
                <input type="submit" value="Sign Up">
              </div>
              <div class="text sign-up-text">Already have an account? <label for="flip">Login now</label></div>
            </div>
      </form>
    </div>
    </div>
    </div>
  </div>
  </section>
  
  <section id="footer">
  	 <div class="footer-bottom">

	<div class="container" style="max-width: -webkit-fill-available;padding:0;box-shadow:none"> 

		<div class="row">
<!-- 
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

				<div class="copyright">

					© 2015, Webenlance, All rights reserved

				</div>

			</div> -->

			<div class="col-xs-12">

				<div class="design">

					 <p style="margin-bottom:0;">Website Content Managed by SNLP. Designed and Developed by Centre for Development of Advanced Computing ( CDAC )</p>

				</div>

			</div>

		</div>

	</div>

</div>
  </section>
</body>

<script>


function validateForm() {
    // Get form values
   const signupForm = document.querySelector(".signup-form");
    const name = signupForm.querySelector("#name").value.trim();
    const email = signupForm.querySelector("#email").value.trim();
    const password = signupForm.querySelector("#password").value;
    const cpassword = signupForm.querySelector("#cpassword").value;
    
    if (name === "") {
        alert("Please enter your name");
        return false;
    }

    // Disallow metacharacters in name (like < > & / \ " ')
    const metaCharRegex = /^[a-zA-Z0-9 _-]+$/;
    if (!metaCharRegex.test(name)) {
        alert("Name can only contain letters, numbers, spaces, underscores, and hyphens. Special characters like < > & are not allowed.");
        return false;
    }

    // Email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert("Please enter a valid email address");
        return false;
    }
 // Disallow metacharacters in email
    const emailMetaCharRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailMetaCharRegex.test(email)) {
        alert("Email contains invalid characters. Only standard email format is allowed.");
        return false;
    }

    // Password length validation
    if (password.length < 8) {
        alert("Password must be at least 8 characters long");
        return false;
    }
	if(isNot != "Password_"){
		console.log("okay you re here. and idk what am i doing atp")
	}
    // Password strength validation
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    if (!passwordRegex.test(password)) {
        alert("Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character");
        return false;
    }
    // Password matching validation
    if (password !== cpassword) {
        alert("Passwords do not match");
        return false;
    }
    
    return true;
}
</script>
</html>

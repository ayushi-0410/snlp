<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>SNLP</title>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/typicons/2.0.8/typicons.min.css'>
        <%-- <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/> --%>
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css"/>
       
        <link id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/dark-theme.css">
        
        <link href="${pageContext.request.contextPath}/resources/css/1style.css" rel="stylesheet" type="text/css"/>
       


      <%--   <link href="${pageContext.request.contextPath}/resources/css/bootstrap3.min.css" rel="stylesheet" id="bootstrap-css"> --%>
        <%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
        <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
        <!------ Include the above in your HEAD tag ---------->
		<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" >
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
        <link rel="stylesheet" href="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.css" />
        <script src="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" integrity="sha512-u3fPA7V8qQmhBPNT5quvaXVa1mnnLSXUep5PS1qo5NRzHwG19aHmNJnj1Q8hpA/nBWZtZD4r4AX6YOt5ynLN2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     
		<!-- Doc css -->
		<!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
		 <script src="${pageContext.request.contextPath}/resources/jsScript/bootstrap.bundle.min.js" type="text/javascript"></script>
		 <script src="${pageContext.request.contextPath}/resources/jsScript/validate.js" type="text/javascript"></script>
		 <script src="${pageContext.request.contextPath}/resources/jsScript/aos.js" type="text/javascript"></script>
		 <script src="${pageContext.request.contextPath}/resources/jsScript/glightbox.min.js" type="text/javascript"></script>
		 <script src="${pageContext.request.contextPath}/resources/jsScript/purecounter_vanilla.js" type="text/javascript"></script>
		  <script src="${pageContext.request.contextPath}/resources/jsScript/swiper-bundle.min.js" type="text/javascript"></script>
		   <script src="${pageContext.request.contextPath}/resources/jsScript/bootstrap.min.js" type="text/javascript"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>


    <style>
    .servicesCards{
    background: #ffffffb5;
    height: 23vh;
    width: 80%;
    margin: auto;
    border-radius: 36px;
    color: black;
    font-size: 15px;
    padding: 20px;
    text-align: left;
    }
    h1, h3{
    	color: white;
    }
	@media (max-width: 576px) {
  /* Styles for phones */
  .top-nav{
  	height: 0px;
  }
  
  #skills{
  	padding: 0 0 145px 0;
  }
  
  #servicesFirstRow{
  	width:100%;
  	height: 10%;
  }
  
  #portRow{
  	overflow:auto;
  }
  
  #optionsHome{
  	display:none;
  }
  #cdac-logo{
  	width:100%;
  }
}
@media (max-width: 768px) {
  /* Styles for phones */
  .top-nav{
  	height: 0px;
  }
  
  #skills{
  	padding: 0 0 145px 0;
  }
  
  #servicesFirstRow{
  	width:100%;
  	height: 10%;
  }
  
  #portRow{
  	overflow:auto;
  }
  
  #optionsHome{
  	display:none;
  }
   html {
      width: -webkit-fill-available;
    }
     #cdac-logo{
  	width:100% !important;
  }
}
@media (max-width: 981px) {
  /* Styles for phones */
  #cdac-logo{
  	width:39%;
  }
   html {
      width: -webkit-fill-available;
    }
}
@media (max-width: 927px) {
  /* Styles for phones */
  #cdac-logo{
  	width:29%;
  }
   html {
      width: -webkit-fill-available;
    }
}
.carousel {
  position: relative;
  width: 100%;
  max-width: 100%;
  overflow: hidden;
}

.carousel-item {
  position: absolute;
  width: 100%;
  opacity: 0; /* Hidden initially */
  transition: opacity 1s ease-in-out; /* Smooth fade effect */
}

.carousel-item.active {
  opacity: 1; /* Visible when active */
  position: relative;
}


.carousel img {
  width: 100%;
  height: auto;
  display: block;
}

.carousel .container {
 /*  position: absolute;
  bottom: 20%;
  left: 10%; */
  position:absolute;
  bottom:-400px;
  color: #fff;
}

.carousel-control-prev,
.carousel-control-next {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  border: none;
  font-size: 2rem;
  cursor: pointer;
  z-index: 10;
}

.carousel-control-prev {
  left: 10px;
}

.carousel-control-next {
  right: 10px;
}
.color-change{
	color: blue;
	font-size:29px;
}
p{
	color:black;
}
.row{
	margin-left: 0;
	margin-right: 0;
}	
</style>
    <body>
<!-- Top Navigation Bar -->
<section id="header"> 

  <div  class="navbar navbar-inverse navbar-fixed-top top-nav" style="display:flex; background: #ffffff;height:17px; padding: 0 3%; border:none !important">
  <!-- <select id="themeSelector" onchange="applyTheme()">
  <option value="Dark">Dark</option>
  <option value="Light">Light</option>
</select> -->
				<img id="cdac-logo" src="${pageContext.request.contextPath}/resources/images/cdac-logo.png">
    <div class="container" style="margin-right:0">
     <ul id="optionsHome" class="navbar-nav ml-auto" style="margin-top: 1%;list-style-type: none;
    padding: inherit;float:inline-end; font-size:21px">
      <li class="nav-item " style="font-color:black">
        <a class="" href="#"  onclick="scrollToTop(); return false;">
        <i class="fa fa-home" aria-hidden="false"></i>Home </a>
      </li>
     <!--  <li class="nav-item">
        <a class="nav-link" href="#about">About</a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="#skills" onclick="setActiveLink(this)">
          <i class="fa fa-gears" style="font-size: x-large;"></i>Services
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#portfolio" onclick="setActiveLink(this)"><i class="fa-solid fa-user-group"></i>Our Team</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#contact" onclick="setActiveLink(this)"><i class="fa fa-envelope" aria-hidden="true"></i>Contact</a>
      </li>
      
      <li>
      	<a href="${pageContext.request.contextPath}/logout"><button title="Logout" class="btn-primary btn" id="logout"
							style="padding: 3px 3px 4px 6px;">
							 <img
								src="${pageContext.request.contextPath}/resources/images/logout.png"
								style="width: 19px">
						</button></a>
      </li>
      
    </ul>
    </div>
  </div></section>

  <!-- Content -->
  <section id="hero" class="hero section" style="margin-top:-1%;height:58vh">
<div id="hero-carousel" class="carousel">
  <div class="carousel-item active">
    <img src="${pageContext.request.contextPath}/resources/images/dlv2.png" alt="">
    <div class="container">
      <h2>Welcome to SNLP</h2>
      <p>Speech and Natural Language Processing (SNLP) is a multidisciplinary field at the
                       intersection of computer science, linguistics, and artificial intelligence. It encompasses the study and development of algorithms,
                     
                      models, and systems that enable computers to understand, interpret, and generate human language in both spoken and written forms.</p>
 
    </div>
  </div>

  <div class="carousel-item">
    <img src="${pageContext.request.contextPath}/resources/images/nlp5.jpg" alt="">
    <div class="container">
      <h2>Our Goals</h2>
     <div style="display: flex;
    align-items: center;
    flex-direction: column;"> <div class="vision-box" >
                                                    <p class="color-change" style="font-size:16px">Distributed Leadership across the organization at various levels.</p>
                                                    <div class="side-color4 side-color"></div>
                                                </div>
                                                <div class="vision-box"  >
                                                    <p class="color-change">Strive to continuously improve our processes and quality.</p>
                                                    <div class="side-color5 side-color"></div>
                                                </div>
                                                <div class="vision-box" >
                                                    <p class="color-change"style="font-size:16px">Address the needs of the society through user centric initiatives..</p>
                                                    <p class="color-change"style="font-size:16px"></p>
                                                    <div class="side-color6 side-color"></div>
                                                </div>

                           </div>
    </div>
  </div>

  <div class="carousel-item">
    <img src="${pageContext.request.contextPath}/resources/images/nlp6.jpg" alt="">
    <div class="container">
      <h2>Our Clients</h2>
     <div style="display: flex;
    align-items: center;
    flex-direction: row;"><div class="vision-box" style="height:7vh;">
                            <p class="color-change" style="color:black">Department of Science and Technology</p>
                            <div class="side-col"></div>
                        </div>
                        <div class="vision-box" style="height:7vh;">
                            <p class="color-change" style="color:black">   Parliament of India</p>
                            <div class="side-col2 side-col"></div>
                        </div>
                        <div class="vision-box" style="height:7vh;">
                            <p class="color-change" style="color:black">  National Railway Museum</p>
                            <div class="side-col3 side-col"></div>
                        </div>
                          <div class="vision-box" style="height:7vh;">
                            <p class="color-change" style="color:black">Central Forensic Science Laboratory</p>
                            <div class="side-col4 side-col"></div>
                        </div>
                       </div>
    
    </div>
  </div>

  <button class="carousel-control-prev" id="prev-btn">&#9664;</button>
  <button class="carousel-control-next" id="next-btn">&#9654;</button>
</div>
    </section><!-- /Hero Section -->
    
    <%-- <div class="content" style="width: auto;margin-top:2%;padding:0">
    <div class="row" style="display: flex; width: 100%; padding: 0; margin: 0;justify-content:center">
        <!-- Slideshow container -->
         <div class="slideshow-container" style="width: 100%;margin-top:2%;height:fit-content !important">
            <!-- Full-width images with number and caption text -->
            <div class="mySlides fade" >
                <div class="numbertext">1 / 3</div>
                <img src="${pageContext.request.contextPath}/resources/images/background_snlp.png" style="width: 100%;">
                <div class="text">Caption Text</div>
            </div>
            <div class="mySlides fade">
                <div class="numbertext">2 / 3</div>
                <img src="${pageContext.request.contextPath}/resources/images/background_snlp.png" style="width: 100%;">
                <div class="text">Caption Two</div>
            </div>
            <div class="mySlides fade">
                <div class="numbertext">3 / 3</div>
                <img src="${pageContext.request.contextPath}/resources/images/background_snlp.png" style="width: 100%;">
                <div class="text">Caption Three</div>
            </div>
            <!-- Next and previous buttons -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
            <div style="text-align: center;">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>
        </div> 
        
        
        
        <div class="image-container">
        	<img alt="" src="${pageContext.request.contextPath}/resources/images/SNLP2.jpg" width="100%">
        </div>
        
        
        
    </div>
</div> --%>







       <%--  <header id="header"  class="header" style="background-image: linear-gradient(to bottom right, #9a9af6, #07153f); ">
            
        
      <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #010a22; position: fixed; top: 50px; width: 100%; z-index: 100;">
  <a class="navbar-brand" href="#" style="padding:0"><img src="${pageContext.request.contextPath}/resources/images/logo0.png" style="width:38%; margin-top:7px"></a>
  <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> -->
 
  <div class="collapse navbar-collapse navbar-right" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto" style="margin-top: 4%;
    padding: inherit;">
      <li class="nav-item active">
        <a class="nav-link" href="#header">Home <span class="sr-only">(current)</span></a>
      </li>
     <!--  <li class="nav-item">
        <a class="nav-link" href="#about">About</a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="#skills" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Services
        </a>
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div> -->
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#portfolio">Our Team</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#contact">Contact</a>
      </li>
      
    </ul>
  
  </div>
</nav>

            <div class="container-fluid" >
                <div class="row" style="">
                    <div class="col-md-6" style="">
                        <div class="title" style="width:fit-content">
                            <!--<div><span class="typcn typcn-heart-outline icon heading"></span></div>-->
                            <div class="smallsep heading"></div>
                            <h1 class="heading" style="background-color: black;width: fit-content;">🅢🅝🅛🅟<br></h1>
                            <div class="smallsep heading"></div>Speech and Natural Language Processing
                            <!--<h2 class="heading">Lorem ipsum dolor sit amet</h2>-->

                        </div>
                        
                    </div>
                    <div class="col-md-6" style="display: flex;
    flex-direction: column;">
                     <div class="col-md-12" style="margin-top:15%; flex:0 0 auto; padding:6%"><h1>About</h1> 
                     
                   <p style="color:white; font-size:14px">  Centre for Development of Advanced Computing (C-DAC) is the premier R&D organization of the Ministry of Electronics and 
                     Information Technology (MeitY) for carrying out R&D in IT, Electronics and associated areas. 
                     Different areas of C-DAC, had originated at different times, many of which came out as a result of
                      identification of opportunities.<br> <br>Speech and Natural Language Processing (SNLP) is a multidisciplinary field at the
                       intersection of computer science, linguistics, and artificial intelligence. It encompasses the study and development of algorithms,
                     
                      models, and systems that enable computers to understand, interpret, and generate human language in both spoken and written forms.</p></div>
                     <div class="col-md-12" style="flex:0 0 auto; padding:6%;margin-top:1%">
                        <div class="vision-heading">
                            <h3 style="text-align: center;color:white">Our Services</h3>
                        </div>
					<div class="grid-container1">
                       <a class="card" href="${pageContext.request.contextPath}/Main2"> <div class="vision-box" >
                            <p class="color-change">Speech Processing</p>
                            <div class="side-color"style="background-color:#d85327"> </div>
                        </div></a>
                        
                        <a class="card" href="${pageContext.request.contextPath}/Main2"><div class="vision-box" >
                            <p class="color-change">Text Processing</p>
                            <div class="side-color2 side-color" style="background-color:#d85327"></div>
                        </div></a>
                        <a class="card" href="${pageContext.request.contextPath}/Main2">
                        <div class="vision-box" >
                            <p class="color-change">Image Processing</p>
                            <div class="side-color3 side-color" style="background-color: #d85327"></div>
                        </div></a>
                        <a class="card" href="${pageContext.request.contextPath}/Main2">
                        <div class="vision-box" >
                            <p class="color-change">Other Applications</p>
                            <div class="side-color3 side-color" style="background-color: #d85327"></div>
                        </div>      </a>         
</div>
</div>
                    
                    
                    </div>
                </div>
            </div>

          <!--   <a class="smoothscroll" href="#about">
                <div class="mouse">
                    <div class="wheel"></div>
                </div>
            </a> 

            partial

            <a class="smoothscroll" href="#about">
                <div class="scroll-down"></div>
            </a> -->
        </header> --%>

        <!-- About Section
        –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

        <!-- <section id="about">
            <div class="container">
                <div class="row">
                    <h1 style=" ">About SNLP</h1>

                    <p></p>
                    <div class="block"></div>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-12 eqal-height">
                            <div class="vision-heading">
                                <h3 style="text-align: center;">Mission </h3>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Innovation and pursuit of excellence in 'Applications', 'Research' and 'Technology' (ART).</p>
                                <div class="side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Expand the frontiers of Electronics and Information Technology.</p>
                                <div class="side-color2 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Evolve technology solutions - architectures, systems and standards for nationally important problems. </p>
                                <div class="side-color3 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Achieve rapid and effective spread of knowledge by overcoming language barriers through application of technologies.</p>
                                <div class="side-color4 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                                               <p class="color-change">Share experience and know-how to help build advanced competence in the areas of Electronics and Information Technology.</p>
                                <p class="color-change">Bring benefits of Electronics and Information Technology to society.</p>
                                <div class="side-color5 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Utilize the Intellectual Property generated by converting it to business opportunity.</p>
                                <p class="color-change"></p>
                                <div class="side-color6 side-color"></div>
                            </div>

                        </div> 
                        <div class="col-md-6 col-12 eqal-height">
                            <div class="vision-heading">
                                <h3 style="text-align: center;">Our Goal</h3>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Integrity, transparency and openness in all our actions.</p>
                                <div class="side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Expand the frontiers of Electronics and Information Technology.</p>
                                <div class="side-color2 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Working with and through the 'Teams' is our way of life.</p>
                                <div class="side-color3 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Distributed Leadership across the organization at various levels.</p>
                                <div class="side-color4 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Strive to continuously improve our processes and quality.</p>
                                <div class="side-color5 side-color"></div>
                            </div>
                            <div class="vision-box" >
                                <p class="color-change">Address the needs of the society through user centric initiatives..</p>
                                <p class="color-change"></p>
                                <div class="side-color6 side-color"></div>
                            </div>
                        </div>
                    </div> 
                    <div class="col-md-12 col-12 eqal-height">
                        <div class="vision-heading">
                            <h3 style="text-align: center;">Our Clients</h3>
                        </div>

                        <div class="vision-box" >
                            <p class="color-change">Department of Science and Technology</p>
                            <div class="side-color"></div>
                        </div>
                        <div class="vision-box" >
                            <p class="color-change">   Parliament of India</p>
                            <div class="side-color2 side-color"></div>
                        </div>
                        <div class="vision-box" >
                            <p class="color-change">  National Railway Museum</p>
                            <div class="side-color3 side-color"></div>
                        </div>
                                               <div class="vision-box" >
                                                    <p class="color-change">Distributed Leadership across the organization at various levels.</p>
                                                    <div class="side-color4 side-color"></div>
                                                </div>
                                                <div class="vision-box" >
                                                    <p class="color-change">Strive to continuously improve our processes and quality.</p>
                                                    <div class="side-color5 side-color"></div>
                                                </div>
                                                <div class="vision-box" >
                                                    <p class="color-change">Address the needs of the society through user centric initiatives..</p>
                                                    <p class="color-change"></p>
                                                    <div class="side-color6 side-color"></div>
                                                </div>


                    </div>



                </div>

            </div>
        </section> -->





 <!-- Skills Section
        –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

<section id="skills" style=" padding:0">
		<div class="container-fluid">
		<div class="row" style=" color: #002b51;" >
			<h1 style="text-align: center; color: black; font-size:26px">Services</h1>
			<div class="block" style="margin: auto"></div>
</div>
			<!-- partial:index.partial.html -->
			<!--                <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">-->

			<section class="hero-section" style="padding:0">  <!-- style="background: black"> -->
				<div class="row">
					<a class="card" href="${pageContext.request.contextPath}/Main2#spchpp" style="text-decoration: none;">
					<div class="col-sm-3" id="servicesFirstRow"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/Speech Technology.jpg');">
						
							<!--<img src="Images/Services-image/Screenshot (42).png" alt=""/>-->
							<div class="card__background"></div>
							<div class="card__content">
								<!--<p class="card__category">Category</p>-->
								<h3 class="card__heading">Speech Processing</h3>
								
							</div>
						<!-- <div class="servicesCards">
							<ul><li>ASR</li>
							<li>Text to Speech</li>
							<li>Speech to Speech</li>
							<li>Live ASR </li>
							</ul>
						</div> -->
					</div></a>
						<a class="card" href="${pageContext.request.contextPath}/Main2#textpp">
							<!--  <img src="" alt=""/> -->
							<div class="col-sm-3" id="servicesFirstRow"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/textProcessing.jpg')">
					
							<div class="card__background"></div>
							<div class="card__content">
								<!--<p class="card__category">Category</p>-->
								<h3 class="card__heading">Text Processing</h3>
							</div>
						<!-- <div class="servicesCards">
							<ul><li>Transliteration</li>
							<li>Machine Translation</li>
							</ul>
						</div> -->
					</div></a>
						<a class="card" href="${pageContext.request.contextPath}/Main2#imgpp">
<div class="col-sm-3" id="servicesFirstRow"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/imageProcessing1.jpg')">
					
							<div class="card__background"></div>
							<div class="card__content">
								<!--<p class="card__category">Category</p>-->
								<h3 class="card__heading">Image Processing</h3>
							</div>
						<!-- <div class="servicesCards">
							<ul><li>OCR</li>
							<li>Image Translation</li>
							</ul>
						</div> -->
					</div></a>
					
					<%-- <a class="card"
							href="${pageContext.request.contextPath}/Main2#pdf">
							
								<div class="col-sm-3" id="servicesFirstRow"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/Frame 1.png')">
						
							<div class="card__background"></div>
							<div class="card__content">
								<!--<p class="card__category">Category</p>-->
								<h3 class="card__heading">PDF</h3>
							</div>
							<!-- <div class="servicesCards">
							<ul><li>PDF to Images</li>
							<li>Images to PDF</li>
							</ul>
						</div> -->
										</div>	</a> --%>
										
								
								
				<a class="card"
							href="${pageContext.request.contextPath}/Main2#othprod">
							
								<div class="col-sm-3" id="servicesFirstRow"
						style="background-image: url('${pageContext.request.contextPath}/resources/images/otherstech.jpeg')">
						
							<div class="card__background"></div>
							<div class="card__content">
								<!--<p class="card__category">Category</p>-->
								<h3 class="card__heading">Other Applications</h3>
							</div>
							<!-- <div class="servicesCards">
							<ul><li>ChatBot Query</li>
							<li>Krishi Mantrana</li>
							<li>Krishi Mantrana Mobile </li>
							<li>Rail Heritage</li>
							<li>SSTP</li>
							<li>Multilingual Morph Builder</li>
							</ul>
							</div> -->
										</div>	</a>
										
				</div>
				
			</section>
		</div>
	</section>






       <!-- Team Section
        –––––––––––––––––––––––––––––––––––––––––––––––––– -->

	<section id="portfolio" class="long-div"
		style="background: #ffffff; margin-top:2%"><!-- #082D43 -->
		<div class="container-fluid"  style="padding: 0 6%; 
            background-image: url('${pageContext.request.contextPath}/resources/images/idk2avif.avif'); 
            background-repeat: no-repeat; 
            background-size: cover; 
            background-position: center;">
			<div class="row" style="margin-bottom:2%; color: aliceblue;" >
				<h3 style="text-align: center;">Meet the Team</h3>
				<div class="block" style="margin: auto;"></div>
				<!--<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>-->
			</div>
			<div class="row" id="portRow" style="text-align: center; height:56vh">
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Karunesh-Arora-2.jpg"
						width="220" height="220" alt="" />
					<h4>Karunesh Arora</h4>
					<p>Senior Director</p>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->

 --%><div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/Karunesh-Arora-2.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Karunesh Arora</h2>
    </div>
</div>
<div class="designation">
    Scientist G
</div>
				</div>

				<div class="col-sm-2" id="portfolioDiv">
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/SUNITA.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Sunita Arora</h2>
    </div>
</div>
<div class="designation">
    Scientist F
</div>
</div>
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Bhupendra.jpg"
						width="220" height="220" alt="" />

					<h4>Bhupendra kumar</h4>
					<p>Joint Director</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/Bhupendra.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Bhupendra kumar</h2>
    </div>
</div>
<div class="designation">
    Scientist E
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->



				</div>

				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/SAHU.jpg"
						width="220" height="220" alt="" />
					<h4>B. K . Sahu</h4>
					<p>Principal Technical Officer</p> --%>
					
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/SAHU.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>B. K. Sahu</h2>
    </div>
</div>
<div class="designation">
    Scientist D
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->



				</div>


			

				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Mukund.jpeg"
						width="220" height="220" alt="" />
					<h4>Mukund Kr. Roy</h4>
					<p>Principal Technical Officer</p> --%>
					
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/Mukund.jpeg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Mukund Kr. Roy</h2>
    </div>
</div>
<div class="designation">
    Scientist D
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->
				</div>

				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Deepak_Kumar_Arya.jpg"
						width="220" height="220" alt="" />
					<h4>Deepak Kr. Arya</h4>
					<p>Principal Technical Officer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/Deepak_Kumar_Arya.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Deepak Kr. Arya</h2>
    </div>
</div>
<div class="designation">
  Scientist D
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->



				</div>
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/babita.jpg"
						width="220" height="220" alt="" />
					<h4>Babita</h4>
					<p>Principal Technical Officer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/babita.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Babita</h2>
    </div>
</div>
<div class="designation">
 Scientist D
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->



				</div>

				<%-- <div class="col-sm-2" id="portfolioDiv">
					<img
						src="${pageContext.request.contextPath}/resources/images/rishvh.jpeg"
						width="220" height="220" alt="" />
					<h4>Rishvh Malik</h4>
					<p>Senior Project Engineer</p>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/rishvh.jpeg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Rishav Mallick</h2>
    </div>
</div>
<div class="designation">
    Senior Project Engineer
</div>
				</div> --%>

			
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/CM.png"
						width="220" height="220" alt="" />
					<h4>Chandra Mohan</h4>
					<p>Punjabi Language Translator</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/CM.png"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Chander Mohan</h2>
    </div>
</div>
<div class="designation">
   Project Assistant
</div>
				</div>

				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Naveen.jpg"
						width="220" height="220" alt="" />
					<h4>Naveen Chandra</h4>
					<p>Punjabi Language Translator</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/Naveen.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Navin Chandra</h2>
    </div>
</div>
<div class="designation">
    Project Support Staff
</div>
				</div>

				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/P.k.jpg"
						width="220" height="220" alt="" />
					<h4>Pramod kumar</h4>
					<p>Punjabi Language Translator</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/P.k.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Pramod kumar</h2>
    </div>
</div>
<div class="designation">
    Project Support Staff
</div>
				</div>

				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/ANU.jpg"
						width="220" height="220" alt="" />
					<h4>Anuradha</h4>
					<p>Project Engineer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/ANU.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Anuradha</h2>
    </div>
</div>
<div class="designation">
    Project Engineer
</div>
				</div>
			

				<div class="col-sm-2" id="portfolioDiv" style="">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Priya Darshan.jpeg"
						width="220" height="220" alt="" />
					<h4>Priyadarshan</h4>
					<p>Project Engineer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/Priya Darshan.jpeg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Priyadarshan</h2>
    </div>
</div>
<div class="designation">
Project Engineer
</div>
				</div>

				
				
				
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/babita.jpg"
						width="220" height="220" alt="" />
					<h4>Babita</h4>
					<p>Principal Technical Officer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/rishabh.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Rishabh Singh</h2>
    </div>
</div>
<div class="designation">
 Project Engineer
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->



				</div>
				
				
				
			
				
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/babita.jpg"
						width="220" height="220" alt="" />
					<h4>Babita</h4>
					<p>Principal Technical Officer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/f_emp.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Vaishnavi</h2>
    </div>
</div>
<div class="designation">
 Project Engineer
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->



				</div>
				
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/babita.jpg"
						width="220" height="220" alt="" />
					<h4>Babita</h4>
					<p>Principal Technical Officer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/f_emp.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Ayushi</h2>
    </div>
</div>
<div class="designation">
 Project Engineer
</div>
					<!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>-->



				</div>
				
	
	
	<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/babita.jpg"
						width="220" height="220" alt="" />
					<h4>Babita</h4>
					<p>Principal Technical Officer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/m_emp.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Vipin</h2>
    </div>
</div>
<div class="designation">
 Project Engineer
</div>
					
	</div>
	
	<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Deepam.jpg"
						width="220" height="220" alt="" />
					<h4>Deepam</h4>
					<p>Project Engineer</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/f_emp.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Harshita</h2>
    </div>
</div>
<div class="designation">
    Project Engineer
</div>
				</div>
				
	
	<div class="col-sm-2" id="portfolioDiv">
					
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/m_emp.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Shomesh</h2>
    </div>
</div>
<div class="designation">
 Project Engineer
</div>
					
	</div>
	
	<div class="col-sm-2" id="portfolioDiv">
					
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/f_emp.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Poorva</h2>
    </div>
</div>
<div class="designation">
 Project Associate
</div>
					
	</div>
	<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/dillip.jpeg"
						width="220" height="220" alt="" />
					<h4>Dillip Mohanty</h4>
					<p>Odiya Language Translator</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/dillip.jpeg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Dillip Mohanty</h2>
    </div>
</div>
<div class="designation">
    Odiya Language Translator
</div>

				</div>
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/dillip.jpeg"
						width="220" height="220" alt="" />
					<h4>Dillip Mohanty</h4>
					<p>Odiya Language Translator</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/m_emp.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Prakash</h2>
    </div>
</div>
<div class="designation">
    Odiya Language Translator
</div>

				</div>
				<div class="col-sm-2" id="portfolioDiv">
					<%-- <img
						src="${pageContext.request.contextPath}/resources/images/Lalita.jpg"
						width="220" height="220" alt="" />
					<h4>Lalita</h4>
					<p>Language Translator</p> --%>
					<div class="employee-card">
    <div class="circle">
        <img src="${pageContext.request.contextPath}/resources/images/Lalita.jpg"
						width="220" height="220" alt="" />
    </div>
    <div class="info-box">
        <h2>Lalita</h2>
    </div>
</div>
<div class="designation">
   Language Translator
</div>
				</div>
				
				
				
			</div>

		</div>
	</section>

        


        <!-------------------------------------------------------------------- Contact Section  ––––––––––––––––––––––––––––––––––––-----–––––––––––––– -->  

       <section id="contact" style="
    background: #ffffff;">
		<div class="container">

			<h1 style="text-align: center;
    background: #000000f2;
    color: aliceblue;
    border-radius: 50px; font-size:23px; padding:2px">Contact Us</h1>
			<div class="block" style="margin: auto;margin-bottom:2%"></div>
			<div class="row" style="margin-left:0px;" >
				<div class="col-md-6 col-12 eqal-height">
					<div class="row">
						<div class="six columns">
						<input type="text" name="fake_name" style="display:none" autocomplete="off" />
						 <input placeholder="Name" autocomplete="off"
								name="user_name" type="text" maxlength="30" id="name" tabindex="18"
								oncopy="" onpaste=""
								class="textBox u-full-width">
						</div>
						<div class="six columns">
							<input placeholder= "Mobile Number" autocomplete="off"
								name="mobile" type="number" maxlength="10" id="mobile"
								tabindex="5" oncopy="return false" onpaste="return false"
								class="textBox u-full-width" >
						</div>
					</div>
					<div class="row mt-3" style="margin-top:3%">
						<div class="twelve columns">
							 
							<input autocomplete="off" placeholder = "Email" name="userEmail" type="email" id="userEmail" 
							tabindex="18" oncopy="return false" 
							onpaste="return false" class="textBox u-full-width" onkeypress="">
						</div>
					</div>
					<div class="row mt-3">
						<label for="exampleMessage" style="margin-top: 7px;">Please
							select your domain : &nbsp;</label><br> <select name="language" style="width: 100%"
							id="domain">
							<option value="Machine Learning" selected>Machine
								Learning</option>
							<option value="Image Processing">Image Processing</option>
							<option value="Speech Technology">Speech Technology</option>
							<option value="Others">Others Application</option>
						</select><br>

					</div><br>
					<div class="row mt-3">
						
						<textarea placeholder ="Message/Feedback" class="u-full-width" id="message" required></textarea>
						<input class="button-primary mt-3" type="submit"
							onclick="submitFeedback()" value="Submit">
					</div>
				</div>

				<div class="col-md-6 pb-5 aos-init aos-animate"
					data-aos="fade-right" data-aos-delay="200">
					<div class="col-md-12">
						<div class="card-header fs-5">
							<!--<strong>OFFICE</strong>-->
						</div>
						<div class="card-body row">
							<div class="col-12">
								<h4>
									<strong>Centre for Development of Advanced Computing</strong>
								</h4>
								Anusandhan Bhawan,<br> C-56/1, Sector-62,<br> Noida -
								201307<br> Uttar Pradesh (India)<br> Phone:
								+91-120-2210800<br> Email: snlp-noida@cdac.in
								<br><br>
								<p class="mt-3">
									<iframe
										src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3502.4646410284795!2d77.36086155074693!3d28.615833282338098!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390ce3fe46d746c5%3A0xd244f3b1a4280b14!2sCentre%20for%20Development%20of%20Advanced%20Computing!5e0!3m2!1sen!2sin!4v1663578809251!5m2!1sen!2sin"
										width="98%" class="shadow border boder-white"
										allowfullscreen="" loading="lazy"
										referrerpolicy="no-referrer-when-downgrade"></iframe>
								</p>
							</div>
							<!--                                        <div class="col-6">
                                                                            <h6><strong>Academic Block</strong></h6>
                                                                            C-DAC, Noida : B-30, Sector-62,<br>	Institution Area,<br> 
                                                                            Noida - 201307<br>
                                                                            Uttar Pradesh (India)<br>
                                                                            Phone: +91-120-2210800
                                                                            <p class="mt-3"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3502.4646410284795!2d77.36086155074693!3d28.615833282338098!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390ce3fe46d746c5%3A0xd244f3b1a4280b14!2sCentre%20for%20Development%20of%20Advanced%20Computing!5e0!3m2!1sen!2sin!4v1663579000252!5m2!1sen!2sin" width="98%" class="shadow border boder-white" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
                                                                        </div>-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



        <!--------------------------------------------------------- Contact Section END  –––––––––––––––––––––––––––––––––––––––––––––––––– -->  


        <!---------------------------------------- Footer Section –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

       
        <!---------------------------------------- Footer Section –––––––––––––––––––––––––––––––––––––––––––––––––– -->  






        <!-- partial -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js'></script>
        <script src="${pageContext.request.contextPath}/resources/js/script.js" type="text/javascript"></script>
		
		
		<script>
  // Prevent special characters in the name field
  function noSpecial(event) {
    const char = String.fromCharCode(event.which);
    const allowed = /^[a-zA-Z0-9 ]$/;
    if (!allowed.test(char)) {
      event.preventDefault();
    }
  }

  // Allow only numeric input for mobile field
  function isInputNumber(event) {
    const char = String.fromCharCode(event.which);
    if (!/^\d$/.test(char)) {
      event.preventDefault();
    }
  }

  // Basic check to ensure mobile number is 10 digits
  function check() {
    const mobileInput = document.getElementById("mobile");
    if (mobileInput.value.length > 10) {
      mobileInput.value = mobileInput.value.slice(0, 10); // Trim to 10 digits
    }
  }
</script>
<script>
document.addEventListener("DOMContentLoaded", () => {
	  const carousel = document.getElementById("hero-carousel");
	  const items = carousel.querySelectorAll(".carousel-item");
	  const prevBtn = document.getElementById("prev-btn");
	  const nextBtn = document.getElementById("next-btn");

	  let currentIndex = 0;

	  // Function to show the current item (image + text) immediately
	  const showItem = (index) => {
	    items.forEach((item, i) => {
	      item.classList.remove("active");
	      if (i === index) {
	        item.classList.add("active");
	      }
	    });
	  };

	  // Navigate to the next slide
	  const nextItem = () => {
	    currentIndex = (currentIndex + 1) % items.length; // Move to next slide
	    showItem(currentIndex);
	  };

	  // Navigate to the previous slide
	  const prevItem = () => {
	    currentIndex = (currentIndex - 1 + items.length) % items.length; // Move to previous slide
	    showItem(currentIndex);
	  };

	  // Event listeners for buttons
	  nextBtn.addEventListener("click", nextItem);
	  prevBtn.addEventListener("click", prevItem);

	  // Auto-slide functionality
	  setInterval(nextItem, 5000); // Change slide every 5 seconds
	});

</script>
<script>
function applyTheme() {
    const selectedTheme = document.getElementById("themeSelector").value; // Get selected theme
    const themeStylesheet = document.getElementById("themeStylesheet"); // Get <link> tag
    
    // Update the href dynamically
    if (selectedTheme === "Dark") {
        themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/dark-theme.css"; // Load dark theme
    } else if (selectedTheme === "Light") {
        themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/light-theme.css"; // Load light theme
    }
}

</script>

<script type="text/javascript">
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 4000); // Change image every 2 seconds
}
</script>
<script>
function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
    setTimeout(function() {
        window.scrollTo({ top: 1, behavior: 'smooth' }); // Adjusts the scroll slightly down after reaching the top
        document.activeElement.blur(); // Removes focus from the clicked link
    }, 500); // Adjust delay as needed
}
</script>
		
	    
        <script>
                                function submit()
                                {

                                    var name = document.getElementById("name").value;
                                    var number = document.getElementById("Mobile").value;
                                    var domain = document.getElementById("domain").value;
                                    var message = document.getElementById("message").value;


                                    if (name == "")
                                    {
                                        Swal.fire("Name Can't not Be Empty");
                                    } else
                                    {
                                        if (number == "")
                                        {
                                            Swal.fire("Phone Number Can't not Be Empty");
                                        } else
                                        {
                                            if (domain == "")
                                            {
                                                Swal.fire("Domain Can't not Be Empty");
                                            } else
                                            {
                                                if (message == "")
                                                {
                                                    Swal.fire("Message Can't not Be Empty");
                                                } else
                                                {

                                                    $.ajax({
                                                        url: 'FeedBack',
                                                        type: 'POST',
                                                        data: {
                                                            name: name,
                                                            number: number,
                                                            domain: domain,
                                                            message: message,
                                                            action: 'updatefeedback'
                                                        },
                                                        success: function (responsetext) {
                                                            Swal.fire('your response has been recorded');
                                                            setTimeout(function () {
                                                                location.reload();
                                                            }, 2000);
                                                        },
                                                        error: function ()
                                                        {

                                                        }

                                                    });

                                                }
                                            }
                                        }
                                    }
                                }
    </script>
        
        
    </body>
</html>
<%@include file="footer.jsp" %>

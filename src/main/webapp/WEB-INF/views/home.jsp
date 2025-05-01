<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>SNLP</title>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/4.2.0/normalize.min.css'>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/typicons/2.0.8/typicons.min.css'>
        <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/1style.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/resources/css/Services.css" rel="stylesheet" type="text/css"/>


        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.css" />
        <script src="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>




    </head>


    <style>


        /*-----------------------------------------------------------------------------vision-------------------------------------------------------------------------------------------------*/
        section#vision {
            background: #ccc;
            padding: 30px;
            background-image: url('../img/dark-bg.png');
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            position: relative;
            background-size: cover;
        }

        section#vision .border-heading-1 {
            background: linear-gradient(90deg, rgba(255, 255, 255, 1) 0%, rgba(3, 141, 167, 1) 100%);
        }


        section#imp-links {
            margin: 30px 0px;
            background: #ccc;
            padding: 50px;
            background-image: url('../img/cbg1.jpg');
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
            position: relative;
            background-size: cover;
        }

        .vision-text {
            margin-bottom: 50px;
        }

        p.visin-subheading {
            color: #fff;
            margin-bottom: 20px;
        }

        .vision-heading h1 {
            color: #fff;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .vision-heading h1 {
            color: #000000;
            text-transform: uppercase;
            margin-bottom: 20px;
            letter-spacing: 4px;
            font-weight: bold;
        }

        .vision-box {
            background-color: #fff;
            -webkit-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
            -moz-box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.3);
            padding: 0px 10px;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            min-height: 70px;
            align-items: center;
            justify-content: center;
            display: flex;
            text-align: center;
            margin-bottom: 10px;
            /*border-radius: 50px;*/
        }

        .side-color {
            position: absolute;
            width: 100%;
            top: 0px;
            background-color: #919bff;
            bottom: 0px;
            left: 0px;
            transform: translateX(0px);
            transition: .5s;
        }

        /*        .side-color1 {
                    background-color: #ffd6a5;
                }*/

        .side-color2 {
            background-color: #7c8bed;
        }

        .side-color3 {
            background-color: #677bdb;
        }

        .side-color4 {
            background-color: #526bca;
        }

        .side-color5 {
            background-color: #3d5ab8;
        }

        .side-color6 {
            background-color: #284aa6;
        }

        .side-color7 {
            background-color: #133a94;
        }

        .side-color8 {
            background-color: #90e0ef;
        }

        .side-color9 {
            background-color: #c6f8ff;
        }

        .side-color10 {
            background-color: #00deec;
        }

        .vision-box:hover .side-color {


            transform: translateX(98%);
        }

        .vision-box:hover .color-change {

            color: #000;
            font-weight: 600;
        }

        .vision-box p {
            letter-spacing: 1px;
            position: relative;
            z-index: 99;
            transition: .5s;
            color: #fff;
        }

        .header{
            background-image: url("Images/Banner/3.png"); /* The image used */
            background-color: #cccccc; /* Used if the image is unavailable */           
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            background-size: cover; /* Resize the background image to cover the entire container */

        }


        .btn-1:hover {
            background: rgb(0,3,255);
            background: linear-gradient(0deg, rgba(0,3,255,1) 0%, rgba(2,126,251,1) 100%);
        }


    </style>

    <body>



        <header id="header"  class="header">
            <div class="main_nav">
                <img src="Images/cdac-logo.png" alt=""/>
                <div class="container">
                    <div class="mobile-toggle"> <span></span> <span></span> <span></span> </div>
                    <nav>

                        <ul>
                            <li><a class="smoothscroll" href="#header">Home</a></li>
                            <li><a class="smoothscroll" href="#about">About</a></li>
                            <li><a class="smoothscroll" href="#skills">Services</a></li>
                            <li><a class="smoothscroll" href="#portfolio">Our Team</a></li>
                            <li><a class="smoothscroll" href="#contact">Contact</a></li>
                            <li><a class="smoothscroll1" href="Admin.jsp" style="color: white">Admin</a></li>
                        </ul>
                    </nav>
                </div>
            </div>







            <div class="container-fluid " >
                <div class="row">
                    <div class="col-md-6">
                        <!-- partial:index.partial.html -->
                        <!--                <h1>Pure CSS Infographics</h1>-->
                        <div class="semicircle-infographic mt-4">
                            <div class="center-circle">
                                <div class="content">
                                    <!--<h2>SNLP</h2>-->
                                    <p>Speech and Natural Language Processing</p>
                                </div>
                            </div>
                            <div class="semi-circle-container">
                                <div class="semi-circle">
                                    <div class="circle-section"></div>
                                    <div class="circle-section"></div>
                                    <div class="circle-section"></div>
                                    <div class="circle-section"></div>
                                </div>
                                <div class="inner-circle-container"   id="sudo">
                                    <!--                        <div class="inner-circle" style="font-size: 12px;" onmouseover="changeColor1()" id="color11" value="black"><a href="Main.jsp" style="color: #000; text-decoration: none;">Machine Translation</a></div>
                                                            <div class="inner-circle" style="font-size: 12px;" onmouseover="changeColor2()" id="color11" value="black"><a href="Main.jsp" style="color: #000; text-decoration: none;">Image Processing</a></div>
                                                            <div class="inner-circle" style="font-size: 12px;" onmouseover="changeColor3()" id="color11" value="black"><a href="Main.jsp" style="color: #000; text-decoration: none;">Speech Technology</a></div>
                                                            <div class="inner-circle" style="font-size: 12px;" onmouseover="changeColor4()" id="color11" value="black"><a href="Main.jsp" style="color: #000; text-decoration: none;">Other Application</a></div>-->

                                    <div class="inner-circle" style="font-size: 150%; text-align: center;"><a href="${pageContext.request.contextPath}/Main2" style="color: #000; text-decoration: none;">Machine Translation</a></div>
                                    <div class="inner-circle" style="font-size: 150%;text-align: center;"><a href="${pageContext.request.contextPath}/Main2" style="color: #000; text-decoration: none;">Image Processing</a></div>
                                    <div class="inner-circle" style="font-size: 150%;text-align: center;"><a href="${pageContext.request.contextPath}/Main2" style="color: #000; text-decoration: none;">Speech Technology</a></div>
                                    <div class="inner-circle" style="font-size: 150%;text-align: center;"><a href="${pageContext.request.contextPath}/Main2" style="color: #000; text-decoration: none;">Other Applications</a></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="title">
                            <!--<div><span class="typcn typcn-heart-outline icon heading"></span></div>-->
                            <div class="smallsep heading"></div>
                            <h1 class="heading" style="background-color: black">🅢🅝🅛🅟</h1>
                            <div class="smallsep heading"></div>
                            <!--<h2 class="heading">Lorem ipsum dolor sit amet</h2>-->

                        </div>
                    </div>
                </div>
            </div>





















            <a class="smoothscroll" href="#about">
                <div class="mouse">
                    <div class="wheel"></div>
                </div>
            </a> 












            <!-- partial -->

            <a class="smoothscroll" href="#about">
                <div class="scroll-down"></div>
            </a>
        </header>

        <!-- About Section
        –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

        <section id="about">
            <div class="container">
                <div class="row">
                    <h1 style="text-align: center;    ">About 𝓢𝓝𝓛𝓟</h1>

                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
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
                                <!--                                <p class="color-change">Share experience and know-how to help build advanced competence in the areas of Electronics and Information Technology.</p>-->
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
                        <!--                        <div class="vision-box" >
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
                                                </div>-->


                    </div>



                </div>

            </div>
        </section>






























        <!-- Team Section
        –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

        <section id="team" style="background-color: #F5F5F5">
            <div class="container">
                <div class="row">
                    <h1>Meet the Team</h1>
                    <div class="block"></div>
                    <!--<p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>-->
                </div>
                <div class="row">
                    <div class="three columns"> <img src="Images/Meet_The_Team/Karunesh-Arora-2.jpg"  width="220" height="220" alt=""/>
                        <h4>Karunesh Arora</h4>
                        <p>Senior Director</p>
                        <!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>--> 


                    </div>

                    <div class="three columns"> <img src="Images/Emp/SUNITA.jpg" width="220" height="220" alt=""/>
                        <h4>Sunita Arora</h4>
                        <p>Associate Director</p>
                    </div>

                    <div class="three columns"> <img src="Images/Meet_The_Team/Bhupendra.jpg" width="220" height="220" alt=""/>

                        <h4>Bhupendra kumar</h4>
                        <p>Joint Director</p>
                        <!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>--> 



                    </div>

                    <div class="three columns"> <img src="Images/Emp/SAHU.jpg" width="220" height="220" alt=""/>
                        <h4>B. K . Sahu </h4>
                        <p>Principal Technical Officer</p>
                        <!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>--> 



                    </div>


                </div>
                <div class="row">

                    <div class="three columns"> <img src="Images/Emp/Mukund.jpeg" width="220" height="220" alt=""/>
                        <h4>Mukund Kr. Roy</h4>
                        <p>Principal Technical Officer</p>
                        <!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>--> 
                    </div>

                    <div class="three columns"> <img src="Images/Emp/Deepak_Kumar_Arya.jpg" width="220" height="220" alt=""/>
                        <h4>Deepak Kr. Arya</h4>
                        <p>Principal Technical Officer</p>
                        <!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>--> 



                    </div>
                    <div class="three columns"> <img src="Images/Emp/babita.jpg" width="220" height="220" alt=""/>
                        <h4>Babita </h4>
                        <p>Principal Technical Officer</p>
                        <!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>--> 



                    </div>

                    <div class="three columns"> <img src="Images/Emp/mohanty.jpeg" width="220" height="220" alt=""/>
                        <h4>Amiya Mohanty</h4>
                        <p>Project Engineer</p>
                        <!--<span class="typcn typcn-social-facebook-circular icon"></span><span class="typcn typcn-social-instagram-circular icon"></span><span class="typcn typcn-social-google-plus-circular icon"></span><span class="typcn typcn-social-linkedin-circular icon"></span>--> 



                    </div>



                </div>
            </div>
        </section>

        <!-- Skills Section
        –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

        <section id="skills" style="background-color: white">
            <div class="container">
                <h1>Services</h1>
                <div class="block"></div>

                <!-- partial:index.partial.html -->
                <!--                <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">-->

                <section class="hero-section">
                    <div class="card-grid">
                        <a class="card" href="Main2.jsp">
                            <!--<img src="Images/Services-image/Screenshot (42).png" alt=""/>-->
                            <div class="card__background" style="background-image: url('Images/Services-image/Screenshot (42).png')"></div>
                            <div class="card__content">
                                <!--<p class="card__category">Category</p>-->
                                <h3 class="card__heading">Meachine Learning</h3>
                            </div>
                        </a>
                        <a class="card" href="Main2.jsp">
                            <img src="" alt=""/>
                            <div class="card__background" style="background-image: url('Images/Services-image/neural_networking.jpg')"></div>
                            <div class="card__content">
                                <!--<p class="card__category">Category</p>-->
                                <h3 class="card__heading">Image Processing</h3>
                            </div>
                        </a>
                        <a class="card" href="Main2.jsp">

                            <div class="card__background" style="background-image: url('Images/Services-image/Speech Technology.jpg')"></div>
                            <div class="card__content">
                                <!--<p class="card__category">Category</p>-->
                                <h3 class="card__heading">Speech Technology</h3>
                            </div>
                            </li>

                            <a class="card" href="Main2.jsp">
                                <div class="card__background" style="background-image: url('Images/Services-image/otherstech.jpeg')"></div>
                                <div class="card__content">
                                    <!--<p class="card__category">Category</p>-->
                                    <h3 class="card__heading">Others Application</h3>
                                </div>
                            </a>
                    </div>
                </section>
                <!-- partial -->




                <!--                                                            <div class="row">
                                                                                <div class="one-third column">
                                                                                    <h3>Design</h3>
                                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum, recusandae, at, labore velit eligendi amet nobis repellat natus.</p>
                                                                                </div>
                                                                                <div class="one-third column">
                                                                                    <h3>Development</h3>
                                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum, recusandae, at, labore velit eligendi amet nobis repellat natus.</p>
                                                                                </div>
                                                                                <div class="one-third column">
                                                                                    <h3>Marketing</h3>
                                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum, recusandae, at, labore velit eligendi amet nobis repellat natus.</p>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="eight columns">
                                                                                    <div class="progressBar">
                                                                                        <h4>HTML5</h4>
                                                                                        <div class="progressBarContainer">
                                                                                            <div class="progressBarValue value-90"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="progressBar">
                                                                                        <h4>CSS3</h4>
                                                                                        <div class="progressBarContainer">
                                                                                            <div class="progressBarValue value-80"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="progressBar">
                                                                                        <h4>Jquery</h4>
                                                                                        <div class="progressBarContainer">
                                                                                            <div class="progressBarValue value-30"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="progressBar">
                                                                                        <h4>WordPress</h4>
                                                                                        <div class="progressBarContainer">
                                                                                            <div class="progressBarValue value-70"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="four columns">
                                                                                    <p>Lorem ipsum dolor sit amet, enim soluta consectetur adipisicing elit. Sit, eius, itaque, porro, beatae impedit officia tenetur reiciendis in quia eum autem. Enim soluta consectetur adipisicing elit.</p>
                                                                                </div>
                                                                            </div>-->
            </div>
        </section>

        <!-- Portfolio Section
        –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

        <section id="portfolio" style="background-color: #F5F5F5">
            <div class="container">
                <h1>Our Team</h1>
                <div class="block"></div>
                <div class="row">
                    <div class="three columns"> <img src="Images/Emp/CM.png" class="image" width="220" height="220" alt="Work One"/>
                        <h4>Chandra Mohan </h4>
                        <p>Punjabi Language Translator</p></div>
                    <div class="three columns"> <img src="Images/Emp/Naveen.jpg" class="image" width="220" height="220" alt="Work Two"/>
                        <h4>Naveen Chandra</h4>
                        <p>Punjabi Language Translator</p></div>
                    <div class="three columns"> <img src="Images/Emp/P.k.jpg" class="image" width="220" height="220" alt="Work Three"/> 
                        <h4>Pramod kumar</h4>
                        <p>Punjabi Language Translator</p></div>
                    <div class="three columns"> <img src="Images/Emp/ANU.jpg" class="image" width="220" height="220" alt="Work Four"/> 
                        <h4>Anuradha </h4>
                        <p>Project Engineer</p>
                    </div>
                </div>
                <div class="row" style="margin-top: 30px;">
                    <div class="three columns"> <img src="Images/Emp/rishvh.jpeg" width="220" height="220" class="image" alt="Work Seven"/>
                        <h4>Rishvh Malik </h4>
                        <p>Senior Project Engineer</p>
                    </div>
                    <div class="three columns"> <img src="Images/Emp/Priya Darshan.jpeg" width="220" height="220" class="image" alt="Work Eight"/>
                        <h4>Priya Darshan </h4>
                        <p>Project Engineer</p>
                    </div>
                    <div class="three columns"> <img src="Images/Emp/Deepam.jpg" width="220" height="220"class="image" alt="Work Five"/> 
                        <h4>Deepam </h4>
                        <p>Project Engineer</p>
                    </div>
                    <div class="three columns"> <img src="Images/Emp/dillip.jpeg" width="220" height="220" class="image" alt="Work Six"/> 
                        <h4>Dillip Mohanty </h4>
                        <p>Odiya Language Translator</p>
                    </div>
                </div>
                <div class="row" style="margin-top: 30px;">
                    <div class="three columns"> <img src="Images/Emp/Lalita.jpg" width="220" height="220" class="image" alt="Work Seven"/>
                        <h4>Lalita</h4>
                        <p>Language Translator</p>
                    </div>
                </div>
            </div>
        </section>

        <!---------------------------------------------------------------- Testimonials Section  –––––––––––––––––––––––––––––––––––––––––––––––––– -->  

<!--        <section id="testimonial">
            <div class="container">
                <div class="quoteLoop">

                    <blockquote class="quote"> <img src="Images/9810.jpg" width="100" height="100" alt=""/>
                        <h5>&nbsp;<br>
                            &rdquo;It has become appallingly obvious that our technology has exceeded our humanity.&rdquo;<br>
                            <small>albert einstein</small></h5>
                    </blockquote>
                    <blockquote class="quote"> <img src="Images/9810.jpg" width="100" height="100" alt=""/>
                        <h5>&nbsp;<br>
                            &ldquo;If you believe in yourself and have dedication and pride - and never quit, you'll be a winner. The price of victory is high but so are the rewards.&rdquo;<br>
                            <small>albert einstein</small></h5>
                    </blockquote>
                </div>
            </div>
        </section>-->
        <!---------------------------------------------------------------- Testimonials Section END   ––––––––––––––––––––––––––––––––––––––––––––––––––-->  




        <!-------------------------------------------------------------------- Contact Section  ––––––––––––––––––––––––––––––––––––-----–––––––––––––– -->  

        <section id="contact">
            <div class="container">

                <h1>Contact Us</h1>
                <div class="block"></div>
                <div class="row">
                    <div class="col-md-6 col-12 eqal-height">
                        <div class="row">
                            <div class="six columns">
                                <label for="exampleRecipientInput">Name</label>
                                <input name="name" type="text" maxlength="30" id="name" tabindex="18" oncopy="return false" onpaste="return false" class="textBox u-full-width" onkeypress="noSpecial(event)">
                            </div>
                            <div class="six columns">
                                <label for="exampleEmailInput">Contact Number</label>
                                <input name="Mobile" type="number" maxlength="10" id="Mobile" tabindex="5" oncopy="return false" onpaste="return false" class="textBox u-full-width" onkeypress="isInputNumber(event)" onkeyup="check(); return false;">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <label for="exampleMessage" style="    margin-top: 7px;">Please select your domain : &nbsp;</label><br>
                            <select name="language" id="domain"> 
                                <option value="Meachine Learning" selected >Meachine Learning</option>
                                <option value="Image Processing">Image Processing</option>
                                <option value="Speech Technology">Speech Technology</option>
                                <option value="Others" >Others Application</option>
                            </select>

                        </div>
                        <div class="row">
                            <label for="exampleMessage">Message/Requirment</label>
                            <textarea class="u-full-width" id="message" required></textarea>
                            <input class="button-primary mt-3" type="submit" onclick="submit()" value="Submit">
                        </div> 
                    </div>

                    <div class="col-md-6 pb-5 aos-init aos-animate" data-aos="fade-right" data-aos-delay="200">
                        <div class="col-md-12">
                            <div class="card-header fs-5">
                                <!--<strong>OFFICE</strong>-->
                            </div>
                            <div class="card-body row">
                                <div class="col-12">
                                    <h4><strong>Centre for Development of Advanced Computing</strong></h4>
                                    Anusandhan Bhawan,<br> C-56/1, Sector-62,<br>
                                    Noida - 201307<br>
                                    Uttar Pradesh (India)<br>
                                    Phone: +91-120-2210800<br><br>
                                    <p class="mt-3"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3502.4646410284795!2d77.36086155074693!3d28.615833282338098!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390ce3fe46d746c5%3A0xd244f3b1a4280b14!2sCentre%20for%20Development%20of%20Advanced%20Computing!5e0!3m2!1sen!2sin!4v1663578809251!5m2!1sen!2sin" width="98%" class="shadow border boder-white" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></p>
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

        <footer>
            <div class="container">
                <div class="eleven columns">
                    <p>Website Content Managed by SNLP. Designed and Developed by Centre for Development of Advanced Computing ( CDAC )</p>

                </div>
                <!--<div class="three columns"> <span class="typcn typcn-social-facebook-circular socialIcons"></span> <span class="typcn typcn-social-instagram-circular socialIcons"></span> <span class="typcn typcn-social-google-plus-circular socialIcons"></span> <span class="typcn typcn-social-linkedin-circular socialIcons"></span> </div>-->
            </div>
        </footer>
        <!---------------------------------------- Footer Section –––––––––––––––––––––––––––––––––––––––––––––––––– -->  






        <!-- partial -->
         <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js'></script>
        <script src="js/script.js" type="text/javascript"></script>


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


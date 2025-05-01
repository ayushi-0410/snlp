<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SNLP</title>

    <!-- Bootstrap 5.3.2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    
    <!-- AOS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        :root {
            --primary-color: #002b51;
            --secondary-color: #007bff;
            --dark-color: #333;
            --light-color: #fff;
        }

        /* Navbar Styles */
        .navbar {
            background: var(--light-color);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 1rem 2rem;
        }

        .navbar-brand img {
            max-height: 50px;
        }

        .nav-link {
            color: var(--dark-color);
            font-weight: 500;
            padding: 0.5rem 1rem;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: var(--secondary-color);
        }

        /* Hero/Carousel Styles */
        .hero {
            position: relative;
            height: 70vh;
            overflow: hidden;
        }

        .carousel-item {
            height: 70vh;
        }

        .carousel-item img {
            object-fit: cover;
            width: 100%;
            height: 100%;
        }

        .carousel-caption {
            background: rgba(0,0,0,0.6);
            padding: 2rem;
            border-radius: 10px;
            max-width: 800px;
            margin: 0 auto;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: 20%;
        }

        /* Services Styles */
        .service-card-link {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .service-card {
            height: 300px;
            background-size: cover;
            background-position: center;
            border-radius: 15px;
            overflow: hidden;
            position: relative;
            transition: transform 0.3s ease;
        }

        .service-card:hover {
            transform: translateY(-10px);
        }

        .service-content {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 1.5rem;
            background: rgba(0,0,0,0.7);
            color: white;
        }

        /* Team Section */
        .team-section {
            padding: 5rem 0;
        }

        .team-member {
            text-align: center;
            margin-bottom: 2rem;
        }

        .member-image {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            margin-bottom: 1rem;
            object-fit: cover;
        }

        .designation {
            color: var(--secondary-color);
            font-size: 0.9rem;
        }

        /* Contact Section */
        .contact-section {
            padding: 5rem 0;
            background: #f8f9fa;
        }

        .contact-form input,
        .contact-form textarea,
        .contact-form select {
            margin-bottom: 1rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .navbar {
                padding: 0.5rem 1rem;
            }

            .hero {
                height: 50vh;
            }
            
            .carousel-item {
                height: 50vh;
            }
            
            .service-card {
                height: 200px;
                margin-bottom: 1rem;
            }

            .team-member {
                margin-bottom: 3rem;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/resources/images/cdac-logo.png" alt="CDAC Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="scrollToTop()">
                            <i class="fa fa-home"></i> Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#services">
                            <i class="fa fa-gears"></i> Services
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#team">
                            <i class="fa-solid fa-user-group"></i> Our Team
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">
                            <i class="fa fa-envelope"></i> Contact
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-sm">
                            <i class="fa fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="hero" class="hero">
        <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2"></button>
            </div>
            
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="${pageContext.request.contextPath}/resources/images/dlv2.png" class="d-block w-100" alt="">
                    <div class="carousel-caption">
                        <h2>Welcome to SNLP</h2>
                        <p>Speech and Natural Language Processing (SNLP) is a multidisciplinary field...</p>
                    </div>
                </div>
                <!-- Other carousel items -->
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
                
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
    </section>

    <!-- Services Section -->
    <section id="services" class="services-section py-5">
        <div class="container">
            <h2 class="text-center mb-5">Our Services</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/Main2#spchpp" class="service-card-link">
                        <div class="service-card" style="background-image: url('${pageContext.request.contextPath}/resources/images/Speech Technology.jpg');">
                            <div class="service-content">
                                <h3>Speech Processing</h3>
                                <p>Advanced speech recognition and synthesis solutions</p>
                            </div>
                        </div>
                    </a>
                </div>
                <!-- Repeat for other services -->
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/Main2#textpp" class="service-card-link">
                        <div class="service-card" style="background-image: url('${pageContext.request.contextPath}/resources/images/textProcessing.jpg');">
                            <div class="service-content">
                                <h3>Text Processing</h3>
                                <p>Advanced text tranlsation and synthesis solutions</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/Main2#imgpp" class="service-card-link">
                        <div class="service-card" style="background-image: url('${pageContext.request.contextPath}/resources/images/imageProcessing1.jpg');">
                            <div class="service-content">
                                <h3>Image Processing</h3>
                                <p>Advanced speech recognition and synthesis solutions</p>
                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/Main2#othprod" class="service-card-link">
                        <div class="service-card" style="background-image: url('${pageContext.request.contextPath}/resources/images/otherstech.jpeg');">
                            <div class="service-content">
                                <h3>Other Services</h3>
                                <p>Advanced speech recognition and synthesis solutions</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Content -->
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
    <!-- Remaining content of the page -->
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
						 <input placeholder="Name"
								name="name" type="text" maxlength="30" id="name" tabindex="18"
								oncopy="return false" onpaste="return false"
								class="textBox u-full-width" onkeypress="noSpecial(event)">
						</div>
						<div class="six columns">
							<input placeholder= "Mobile Number"
								name="mobile" type="number" maxlength="10" id="mobile"
								tabindex="5" oncopy="return false" onpaste="return false"
								class="textBox u-full-width" onkeypress="isInputNumber(event)"
								onkeyup="check(); return false;">
						</div>
					</div>
					<div class="row mt-3" style="margin-top:3%">
						<div class="twelve columns">
							 
							<input placeholder = "Email" name="userEmail" type="email" id="userEmail" tabindex="18" oncopy="return false" onpaste="return false" class="textBox u-full-width" onkeypress="noSpecial(event)">
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



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            // Initialize Bootstrap carousel
            new bootstrap.Carousel(document.querySelector('#heroCarousel'), {
                interval: 5000,
                touch: true
            });
        });
    </script>
</body>
</html>
<%@include file="footer.jsp" %>
``` 

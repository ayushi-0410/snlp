<%-- 
    Document   : text
    Created on : 25 May, 2023, 4:06:27 PM
    Author     : cdac
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Text To Speech</title>
          <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
         <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
      
		<link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
			#overlay {
				position: fixed;
				display: none;
				width: 100%;
				height: 100%;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				background-color: rgba(255, 255, 255, 0.5);
				z-index: 2;
				cursor: pointer;
			}
			.loader {
			 
			  left: 44%;
			  top: 45%;
			}
			
			.topnav {
    overflow: hidden;
    background-color: #7683ff69;
    /*position: fixed;*/
}
</style>
    </head>
    <body style="background-color: #dae8f4;
    background-image: linear-gradient(45deg, #aeabde, #b7dee2);
    background-repeat: no-repeat;
    height: 96vh;">

     <div id="overlay" style="z-index: 1000;">

		<div class="loader" id="loader1">
			<div class="line one"></div>
			<div class="line two"></div>
			<div class="line three"></div>
			<div class="line four"></div>
			<div class="line five"></div>
			<div class="line six"></div>
			<div class="line seven"></div>
			<div class="line eight"></div>
			<div class="line nine"></div>
			<div class="line ten"></div>
			<div class="line elev"></div>
			<div class="line twel"></div>
			<div class="line thir"></div>
			<div class="line fort"></div>
			<div class="line fift"></div>
		</div></div>
            <section>
             
                <div class="container my-5" style="margin-top:1rem !important"> 
                    <div class="row">
                        <div class="col-6 mx-auto" style="width: -webkit-fill-available">
                            <h3  class="text-center text-dark" style="color:#b51717e0 !important">Images to PDF</h3>
                            <div class="card border-0 shadow-lg">
                                <div class="card-body">
									<div>
										<input type ="file" id="imageFiles" multiple="multiple">
									</div>								 
								   <button onclick="convertImgToPdf()">Convert</button>
                                </div>
                                </div>
							<div id="downloadZip"></div>
                                <div class="card-body">

                                </div>
                            </div>
                        </div>
                    </div>
                  
            </section>   
            
            
            
            
    
            
           
            
            
                
    </body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</html>
<%@include file="footer.jsp" %>
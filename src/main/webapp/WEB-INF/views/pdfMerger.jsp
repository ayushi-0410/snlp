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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
      	 <link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
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
    <body class="body_bg" style="background-color: #dae8f4;
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
		
		<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
   <a href="${pageContext.request.contextPath}/audio" target="_blank">Automatic Speech Recognition</a>
<a href="${pageContext.request.contextPath}/text" target="_blank"> Text to Speech</a>
<a href="${pageContext.request.contextPath}/speechTrans" target="_blank"> Speech to Speech</a>
<a href="${pageContext.request.contextPath}/liveStreamingVoice" target="_blank">Real Time ASR</a>
<a href="${pageContext.request.contextPath}/transliteration" target="_blank"  style="background: #eaffe5; color: #0c9110; font-weight: 700;">Transliteration</a>
<a href="${pageContext.request.contextPath}/machTrans" target="_blank">Translation</a>
<a href="${pageContext.request.contextPath}/ocr" target="_blank"> OCR</a>
<a href="${pageContext.request.contextPath}/docTrans" target="_blank"><!-- <i class="bi bi-gear"></i>  -->Image Translation</a>
</div>

<!-- Button to open the sidebar -->
<button class="openbtn" onclick="openNav()">☰</button>
		<label style="color:white">
    <input type="radio" name="theme" value="Light" id="themeSelector" onchange="applyTheme()" checked= "true"> Light
</label>

<!-- Radio button for Dark theme -->
<label style="color:white">
    <input type="radio" name="theme" value="Dark" id="themeSelector" onchange="applyTheme()"> Dark
</label>
           <section>
    <div class="container my-5" style="margin-top: 1rem !important;">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h3 class="text-center" style="color: #ffffffe0 !important;">Image to PDF</h3>
                
                <div class="card border-0 shadow-lg mt-4">
                    <div class="card-body text-center">
                        <div class="form-group mb-4">
                            <label for="pdfFiles" class="form-label" style="color: #003381; font-weight: 500;">Upload Image Files:</label>
                            <input type="file" id="pdfFiles" multiple="multiple" class="form-control" accept="image/*">
                        </div>

                        <button class="btn btn-primary" onclick="pdfMerger()">Convert Images to PDF</button>
                    </div>
                </div>

                <div id="downloadZip" class="card-body mt-4" style="display: none;">
                    <!-- Content for downloading ZIP file will be displayed here -->
                </div>
            </div>
        </div>
    </div>
</section>

            
            
            
    
            
           
            
            
                
    </body>
<script>
    function applyTheme() {
	    // Get the selected radio button's value
	    const selectedTheme = document.querySelector('input[name="theme"]:checked').value;
	    const themeStylesheet = document.getElementById("themeStylesheet"); // Get <link> tag

	    // Update the href dynamically based on the selected theme
	    if (selectedTheme === "Dark") {
	        themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/body-dark.css"; // Load dark theme
	    } else if (selectedTheme === "Light") {
	        themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/body-light.css"; // Load light theme
	    }
	}

    </script>
    <script>
    function openNav() {
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
    }
</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</html>
<%@include file="footer.jsp" %>
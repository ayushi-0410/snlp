<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Audio Recorder</title>
    
    <script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
       
        <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/jsScript/microservices.js" type="text/javascript"></script>
          <link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
          <link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
          <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
        
        /* Adjust main content when sidebar is open */
        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        /* Ensure section takes up the right space */
        section {
            position: relative; /* This keeps the sidebar inside the section */
        }

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
			
		
  .grid-container {
  	visibility:hidden;
    display: grid;
   /*  height: 300px; */ /* or any desired height */
    place-items: top; /* center items horizontally and vertically */
      grid-template-columns: repeat(2, minmax(0, 1fr));
  }
  .grid-container > div {
    width: 85%; /* adjust as needed */
    
    text-align: center; /* center text horizontally */
    margin: 5% auto; /* space between divs and center them vertically */
  }
</style>
</head>
<body class="body_bg" style="height: 96vh;
   
    background-repeat: no-repeat;">
    

<div id="overlay" style="z-index: 1000;">

		<div style="
    left: 40%;
    top: 41%;
    position: absolute;
    display: flex;
">
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
			</div>
			<div id = "addCancelBtn">
			<%-- <button id="cancel-button" style="background: none;border:none;">
			<img src="${pageContext.request.contextPath}/resources/images/crosss.png" style="width: 25px;">
			</button> --%>
			</div>
		</div>
		</div>

<section class="container" style="margin-left:0; margin-top:0">
     <!-- Sidebar -->
<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
   <a href="${pageContext.request.contextPath}/audio" target="_blank">Automatic Speech Recognition</a>
<a href="${pageContext.request.contextPath}/text" target="_blank"> Text to Speech</a>
<a href="${pageContext.request.contextPath}/speechTrans" target="_blank"  style="background: #eaffe5; color: #0c9110; font-weight: 700;"> Speech to Speech</a>
<a href="${pageContext.request.contextPath}/liveStreamingVoice" target="_blank">Real Time ASR</a>
<a href="${pageContext.request.contextPath}/transliteration" target="_blank">Transliteration</a>
<a href="${pageContext.request.contextPath}/machTrans" target="_blank">Translation</a>
<a href="${pageContext.request.contextPath}/ocr" target="_blank"> OCR</a>
<a href="${pageContext.request.contextPath}/docTrans" target="_blank"><i class="bi bi-gear"></i> Image Translation</a>
</div>

<!-- Button to open the sidebar -->
<button class="openbtn" onclick="openNav()">☰</button>
          <!-- Radio button for Light theme -->
<label style="color:white">
    <input type="radio" name="theme" value="Light" id="themeSelector" onchange="applyTheme()" checked= "true"> Light
</label>

<!-- Radio button for Dark theme -->
<label style="color:white">
    <input type="radio" name="theme" value="Dark" id="themeSelector" onchange="applyTheme()"> Dark
</label>

</section>
 <section class="container my-5" style="margin-top:1rem !important">

                <div class="row">
                    <div class="col-6 mx-auto" style="width: 50%">
                        <h3  class="text-center text-dark" style="color:#ffffffe0 !important">Speech To Speech</h3>
                         <!-- <div style="display:flex"><div class="form-group mb-3">
                         <span style="color:#003381; font-weight:500">Choose source language:</span>
                                        <select id="langSrc" class="form-select" style="border:1px solid red; margin-top:4px">
                                            <option value="HI" selected>Hindi</option>
                                            <option value="BN">Bengali</option>
                                            <option value="EN">English</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3"><span style="color:#003381; font-weight:500">Choose destination language:</span>
                                        <select id="langDest" class="form-select" style="border:1px solid red; margin-top:4px">
                                            <option value="HI" selected>Hindi</option>
                                            <option value="BN">Bengali</option>
                                            <option value="EN">English</option>
                                        </select>
                                    </div>
                                    </div> -->
                                    
                                     
					<div class="form-group mb-3">
                         <span style="color:#ffffffe0; font-weight:500">Choose source language:</span>
								
									  <select id="langSrc" class="form-select" style="border:1px solid red; margin-top:4px">
                                            <option value="HI" selected>Hindi</option>
                                            <option value="BN">Bengali</option>
                                            <option value="EN">English</option>
                                        </select></div>
								<div class="form-group mb-3"><span style="color:#ffffffe0; font-weight:500">Choose destination language:</span>	
									 <select id="langDest" class="form-select" style="border:1px solid red; margin-top:4px">
                                            <option value="HI" selected>Hindi</option>
                                            <option value="BN">Bengali</option>
                                            <option value="EN">English</option>
                                        </select>
								</div>
						
							
							
							
                                      <div class="row" style="height:45px">
	                                     <div class="col-sm-8" style="display:flex; gap:5px; margin-bottom:2%">
											<button class="btn-primary btn" id="startRecord" onclick="startRecord()" style="background:green">Start Recording</button>
											<button class="btn-primary btn" id="stopRecord" onclick="stopRecording()" disabled style="background:red">Stop Recording</button>
										</div>
									</div>
                        <div class="card border-0 shadow-lg">
                            <div class="card-body">
                               
                                   
                                    
                                   
									<div id="audioContainer" style=" display:none"></div>
									
									 
									<div class="grid-container" id="textDiv" >
										<div style="margin-top:0; margin-bottom:0"> <h5>Input text</h5>
										<textarea class="form-control" id="result" placeholder="Output ASR text will be shown here.." rows="16" style="margin-top:2%;height:100px;border:1px solid green;"></textarea></div>
										<div style="margin-top:0; margin-bottom:0"> <h5>Output text</h5>
										<textarea class="form-control" id="trans_text" placeholder="Output Translated text will be shown here.." rows="16" style="margin-top:2%;height:100px;border:1px solid green;"></textarea></div>
									</div>
									
									 
                   <div id="outAudioContainer" style="margin-top:2%; display:block"></div>
                          
                               
                                          <!-- <button id="startRecord">Start Recording</button>
									    <button id="stopRecord">Stop Recording</button> -->
									<!--  <div id="audioDiv" style="display:none;"> <div  style="display:flex; flex-direction:column;"> <span style="color:#003381; font-weight:500"> Your audio: </span>
									 <audio id="audioElement" controls style=" margin-bottom:2%"></audio></div></div> -->
									    
									
									   </div>
									   
									  
                        </div>
                    </div>
                </div>
            </section>


	<!-- <script>
	 CKEDITOR.replace('result',{
     	height:100,
     	resize_enabled:true                    	
     });
	 CKEDITOR.instances['result'].container.$.style.border = '1px solid green';
	</script> -->
    
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

</html>

<%@include file="footer.jsp" %>
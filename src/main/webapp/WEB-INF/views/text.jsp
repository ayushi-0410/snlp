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
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
         <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
        
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
.loader:after {
  position: absolute;
  bottom: -52px;
  left:8%;
  
}

.loader {
 left: 47%;
top: 45%;
 width:233px;
 position : static
}
			
			
			
</style>
    </head>
    <body class="body_bg" style="background-color: #dae8f4;
   
    background-repeat: no-repeat;
    height: 96vh;">

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
<a href="${pageContext.request.contextPath}/text" target="_blank"  style="background: #eaffe5; color: #0c9110; font-weight: 700;"> Text to Speech</a>
<a href="${pageContext.request.contextPath}/speechTrans" target="_blank"> Speech to Speech</a>
<a href="${pageContext.request.contextPath}/liveStreamingVoice" target="_blank">Real Time ASR</a>
<a href="${pageContext.request.contextPath}/transliteration" target="_blank">Transliteration</a>
<a href="${pageContext.request.contextPath}/machTrans" target="_blank">Translation</a>
<a href="${pageContext.request.contextPath}/ocr" target="_blank"> OCR</a>
<a href="${pageContext.request.contextPath}/docTrans" target="_blank"><!-- <i class="bi bi-gear"></i> --> Image Translation</a>
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
            <section>
             
                <div class="container my-5" style="margin-top:1rem !important"> 
                    <div class="row">
                        <div class="col-6 mx-auto" style="width:50%">
                            <h3  class="text-center text-dark" style="color:#ffffffe0 !important">Text To Speech</h3>
                            <div class="form-group mb-3 mt-3">
                                        <span style="color:white; font-weight:500">Choose language:</span>
                                        <select id="lang" name="lang" class="form-select" style="border:1px solid red">
                                        	<option value="EN_AIR" id="en-air-female1">EN_AIR</option>
                                            <option value="EN_FEMALE1" id="en-female1">EN_FEMALE1 (Medical domain)</option>
                                            <option value="EN_HI_BN_MIXED" id="EHB-Mixed">EN_HI_BN_MIXED</option>
                                            <option value="EN_HI_MIXED" id="EH-Mixed" selected style="min-height:1rem;">English Hindi Mixed </option>
                                            <option value="HI_FEMALE1" id="female1">HI_FEMALE1</option>
                                            <option value="HI_FEMALE2" id="female2">Hindi Female Voice</option>
                                            <option value="BN_FEMALE2" id="female1-bn">Bengali Female Voice</option>
                                            <option value="PA_MALE1" id="female1-en">Punjabi Male Voice</option>
                                            <option value="OD_FEMALE1" id="female1-od">Oriya Male Voice</option>
                                        
                                        </select>
                            <div class="card border-0 shadow-lg mt-3" style="background:#ffffff73">
                                <div class="card-body">
								
								 <form>

                                        
                                        
                                        
                                            <label for="text" class="mb-3" style="color:#003381; font-weight:500;margin-top:2%">Enter text to be spoken:</label>
                                            <textarea class="form-control" rows="12" id="text" name = "text" style="border:1px solid green; height:28vh"></textarea>
                                            <button class="btn btn-primary mt-3" id="speak" type="button" onclick="speaktextAjax()">Speak</button>
                                             <input type="button" class="btn btn-danger" id="translatebutton" value="Clear"
                                               onclick="clearTranscription();" style="margin-top:16px"/>
                                           <!-- <input type="submit" name="submit" value="submit"> -->
                                        </div>
 
 
                                           		

                                    </form>
								
								
								
								
								
                                   
                                </div>
                                </div>

                                <div class="card-body">
<div id="audioContainer" style="margin-top:2%; display:none"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                  
            </section>   
            
            
            
            
            
            
            
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
  document.addEventListener('DOMContentLoaded', function () {
    const startRecordingButton = document.getElementById('startRecording');
    const stopRecordingButton = document.getElementById('stopRecording');

    // Check for browser compatibility
    if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
      console.error('getUserMedia is not supported');
    }

    let mediaRecorder;
    const audioChunks = [];

    startRecordingButton.addEventListener('click', function () {
      startRecordingButton.disabled = true;
      stopRecordingButton.disabled = false;

      // Request access to the microphone
      navigator.mediaDevices.getUserMedia({ audio: true })
        .then(function (stream) {
          // Create MediaRecorder instance
          mediaRecorder = new MediaRecorder(stream);

          // Event handler for when data is available
          mediaRecorder.ondataavailable = function (e) {
            audioChunks.push(e.data);
          };

          // Event handler for when recording is stopped
          mediaRecorder.onstop = function () {
            // Convert audio chunks to a single Blob
            const audioBlob = new Blob(audioChunks, { type: 'audio/wav' });

            // Convert Blob to base64 string
            const reader = new FileReader();
            reader.readAsDataURL(audioBlob);
            reader.onloadend = function () {
              const base64String = reader.result;
              console.log(base64String); // Base64 string of the recorded audio
              audioChunks.length = 0; // Clear the chunks array for next recording
            };
          };

          // Start recording
          mediaRecorder.start();
        })
        .catch(function (err) {
          console.error('Error accessing microphone:', err);
        });
    });

    stopRecordingButton.addEventListener('click', function () {
      startRecordingButton.disabled = false;
      stopRecordingButton.disabled = true;

      // Stop recording
      if (mediaRecorder && mediaRecorder.state !== 'inactive') {
        mediaRecorder.stop();
      }
    });
  });
  
  function clearTranscription() {
      $("#text").val('');

  }
</script>

            
            
           <script>
    const contextPath = "${pageContext.request.contextPath}";
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
            
                
    </body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

   <!--  <script>

                                                function speaktext() {
                                                    const text_1 = document.getElementById("text");
                                                    
                                                    fetch('http://10.10.10.214:8084/TTS', {
                                                        method: 'POST',
                                                        headers: {
                                                            "Content-Type": "application/json",
                                                        },
                                                        body: JSON.stringify({
                                                            model: 'EN_HI_BN_MIXED',
                                                            text: text_1.value
                                                        })
                                                                // converting response to blobb

                                                                // what is blob
                                                                // A binary large object (BLOB or blob) is a collection of binary data stored as a single entity. Blobs are typically images, audio or other multimedia objects, though sometimes binary executable code is stored as a blob.
                                                    }).then(response => response.blob())

                                                            .then(data => {
                                                                // creating base64url from blob 
                                                                const url = URL.createObjectURL(data)
                                                                // creating audio element with base64 url

                                                                const audio = new Audio(url);
                                                                // playing audio



                                                                audio.play();



                                                                const a = document.createElement('a')

                                                                a.href = url
                                                                a.setAttribute('download', true)
                                                                a.click()
                                                            })
                                                            .catch(error => {
                                                                console.error(error);
                                                            });
                                                }
    </script> -->
</html>
<%@include file="footer.jsp" %>

<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>JSP Page</title>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
         <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>

        <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
		<link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
        .tox-promotion {
    display: none !important;
  }
        
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
			     width: 233px;
    position: static;
			  left: 44%;
			  top: 45%;
			}
	

</style>
    </head>
    <body class ="body_bg" style="background-repeat: no-repeat; height: 96vh;">
         <div id="overlay" style="z-index: 1000;">

		<div style="
    left: 42%;
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
    <a href="${pageContext.request.contextPath}/audio" target = "_blank" style="background: #eaffe5; color: #0c9110; font-weight: 700;"><i class="bi bi-house"></i>Automatic Speech Recognition</a>
    <a href="${pageContext.request.contextPath}/text"><i class="bi bi-mic"></i> Text to Speech</a>
    <a href="${pageContext.request.contextPath}/speechTrans"><i class="bi bi-gear"></i> Speech to Speech</a>
    <a href="${pageContext.request.contextPath}/liveStreamingVoice"><i class="bi bi-mic"></i> Real Time ASR </a>
    <a href="${pageContext.request.contextPath}/transliteration"><i class="bi bi-mic"></i> Transliteration</a>
    <a href="${pageContext.request.contextPath}/machTrans"><i class="bi bi-gear"></i>Translation</a>
    <a href="${pageContext.request.contextPath}/ocr"><i class="bi bi-mic"></i> OCR</a>
    <a href="${pageContext.request.contextPath}/docTrans"><i class="bi bi-gear"></i> Image Translation</a>
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

<!--     
<select id="themeSelector" onchange="applyTheme()">
 <option value="Light">Light</option>
  <option value="Dark">Dark</option>
 
</select> -->
</section>
		
            <section class="container my-5" style="margin-top:1rem !important">
                <div class="row"> 
                    <div class="col-6 mx-auto" style="width:50%">
                        <h3  class="text-center text-dark" style="color:#ffffffe0 !important">Automatic Speech Recognition</h3>
                        <div class="form-group mb-3 mt-2" style="margin-top:1rem !important"><!-- <span style="color:#003381; font-weight:500">Choose service:</span>
                        	 <select id="service" class="form-select"  style="border:1px solid red;">
                        	 <option value="cho" selected>Choose option</option>
                                            <option value="speak">Speak</option>
                                            <option value="upload">Upload file</option>
                                            
                                        </select> -->
                                        
                                        <div style="display:flex; gap:2rem">
                                        	 <label style="color:white">
        <input type="radio" name="service" value="speak" id="speakOption" checked ="true"> Speak
    </label>
    
    <!-- Radio button for Upload file -->
    <label style="color:white">
        <input type="radio" name="service" value="upload" id="uploadOption"> Upload file
    </label>
                                        </div>
                                        </div>
                        
                        <div id="asrDiv" class="card border-0 shadow-lg" style="display:none; background:#ffffff73">
                            <div class="card-body">
                                <form id="asrForm">
                                    <div class="form-group mb-3"><span style="color:#003381; font-weight:500">Choose language:</span>
                                        <select id="lang" name= "lang" class="form-select" style="border:1px solid red;">
                                            <option value="HI" selected>Hindi</option>
                                            <option value="BN">Bengali</option>
                                            <option value="EN">English</option>
                                            <option value="TA">Tamil</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <input type="file" id="audiofileinput" name = "audiofileinput" class="form-control" style="border:1px solid green;">
                                    </div>
                                    <button onclick="convertAudioToTextAjax(this)" type="button" class="btn btn-primary">Convert
                                        <div class="spinner-border spinner-border-sm ms-2 d-none" id="loader" role="status">
                                            <span class="sr-only"></span>
                                        </div>
                                    </button>
	
                                </form>
                            </div>
                            <div class="card-body">
                                <div >
                                    <textarea id="result" name="result"></textarea>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div>
                        <input type="hidden" id="appName" value="snlpProject">
                        </div>
                        
                        <div id="sttDiv" class="card border-0 shadow-lg" style="display:block; background:#ffffff73">
                            <div class="card-body" style="margin-bottom:5%">
                               
                                    <div class="form-group mb-3"><span style="color:#003381; font-weight:500">Choose language:</span>
                                        <select id="lang1" class="form-select" style="border:1px solid red; margin-top:4px">
                                            <option value="HI" selected>Hindi</option>
                                            <option value="BN">Bengali</option>
                                            <option value="EN">English</option>
                                            <option value="TA">Tamil</option>
                                        </select>
                                    </div>
                                     <div class="row"><div class="col-sm-8" style="display:flex; gap:5px; margin-bottom:2%">
									<button class="btn-primary btn" id="startRecord" style="background:green">Start Recording</button>
									<button class="btn-primary btn" id="stopRecord" disabled style="background:red">Stop Recording</button></div>
									</div>
									                                  <!-- <button id="startRecord">Start Recording</button>
									    <button id="stopRecord">Stop Recording</button> -->
									 <div id="audioDiv" style="display:none;"> <div  style="display:flex; flex-direction:column;"> <span style="color:#003381; font-weight:500"> Your audio: </span>
									 <audio id="audioElement" controls style=" margin-bottom:2%"></audio></div></div>
									    
									 <textarea id="resultS"></textarea>
									   </div>
                          
                        </div>
                    </div>
                </div>
            </section>
            
             <!-- <footer>
            <div class="container">
                <div class="eleven columns">
                    <p>Website Content Managed by SNLP. Designed and Developed by Centre for Development of Advanced Computing ( CDAC )</p>

                </div>
                <div class="three columns"> <span class="typcn typcn-social-facebook-circular socialIcons"></span> <span class="typcn typcn-social-instagram-circular socialIcons"></span> <span class="typcn typcn-social-google-plus-circular socialIcons"></span> <span class="typcn typcn-social-linkedin-circular socialIcons"></span> </div>
            </div>
        </footer> -->
            
           </body>
           <script>
    const contextPath = "${pageContext.request.contextPath}";
</script>
   <script>
    tinymce.init({
	    selector: '#result',
	    height: 370
	  });
    </script>
    
     <script>
    tinymce.init({
	    selector: '#resultS',
	    height: 370
	  });
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
    <script>
    function convertAudioToTextAjax() {
    	event.preventDefault();
    	var appName = document.getElementById("appName").value;
    	const fileInput = document.getElementById('audiofileinput');
    	//let base64String = await audioToBase64(file);
    	if (fileInput.files.length === 0) {
    		swal.fire("Please select an audio file.");
    		return;
    	}
    	const file = fileInput.files[0];
    	// Check if the selected file is an audio file
    	if (!file.type.startsWith('audio/')) {
    		swal.fire("Please select an audio file.");
    		return;
    	}
    	var formData = new FormData(document.getElementById("asrForm"));
    	formData.append('appName', appName);
    	console.log(formData);
    	
    	  const styleElement = document.createElement('style');
        document.head.appendChild(styleElement);
        styleElement.sheet.insertRule('.loader:after { content: "Generating text..."; }', 0);
        document.getElementById("overlay").style.display = "block";
        
        const cancelButton = document.createElement('button');
        cancelButton.id = "cancel-button";
        cancelButton.style.background = "none";
        cancelButton.style.border = "1px solid";

        // Create an image element for the button
        const cancelButtonImage = document.createElement('img');
        cancelButtonImage.src = `${pageContext.request.contextPath}/resources/images/crosss.png`;
        cancelButtonImage.style.width = "25px";
        cancelButton.appendChild(cancelButtonImage);
        document.getElementById("addCancelBtn").appendChild(cancelButton);
                
    	const jqXHR = $.ajax({
    		url: 'ajax/automaticSpeechRecognitionDB',
    		type: 'POST',
    		data: formData,
    		async: true,
    		cache: false,
    		contentType: false,
    		processData: false,
       		success: function(response) {
       		 
    			const resultdiv = document.getElementById('result')
    			// resultdiv.value = data.result
    			//CKEDITOR.instances['result'].setData(JSON.parse(JSON.stringify(response))['result']);
    			tinymce.get('resultS').setContent(JSON.parse(JSON.stringify(response))['result']);
    		
    			document.getElementById("overlay").style.display = "none";
    			document.getElementById("addCancelBtn").removeChild(cancelButton);
    		},
    		error: function(xhr, status, error) {
    			if (status === 'abort') {
    				console.log("Request was aborted by the user.");
    			} else {
    				swal.fire("Something went wrong, Please try again");
    			}
    			document.getElementById("overlay").style.display = "none";
    			document.getElementById("addCancelBtn").removeChild(cancelButton);
    		}
    	});
    	// Cancel the operation on button click
                $(cancelButton).click(function () {
                   if (jqXHR) {
    			jqXHR.abort(); // Abort the AJAX request
    			document.getElementById("overlay").style.display = "none"; // Hide the overlay
    			console.log("Operation cancelled");
    			document.getElementById("addCancelBtn").removeChild(cancelButton);
    		}
                });
    }
    </script>
   

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
    crossorigin="anonymous"></script>
    <script>
        async function audioToBase64(audioFile) {
            return new Promise((resolve, reject) => {
                let reader = new FileReader();

                // onerror is catch  (fault data)
                reader.onerror = reject;
                reader.onload = (e) => resolve(e.target.result);
                reader.readAsDataURL(audioFile);
            });
        }

        async function convertAudioToText(ev) {
            const lang = document.getElementById('lang').value;
            const file = document.getElementById('audiofileinput').files[0];
            const loader = document.getElementById("loader")
            loader.classList.remove('d-none')
            ev.setAttribute('disabled', 'true')
            let base64String = await audioToBase64(file);

            fetch('http://10.10.10.214:8082/CallASR', {
                method: 'POST',
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    language: lang,
                    message: base64String
                })
            }).then(response => response.json())
                    .then(data => {
                        console.log(data);
                        const resultdiv = document.getElementById('result')
                        tinymce.get('resultS').setContent(data.result);
                        // resultdiv.value = data.result
                     //   CKEDITOR.instances['result'].setData(data.result)
                   
                        loader.classList.add('d-none')
                        ev.removeAttribute('disabled')
                    })
                    .catch(error => {
                        console.error(error);
                        loader.classList.add('d-none')
                        ev.removeAttribute('disabled')

                    });

        }


    </script>
    	<!-- <script>
	 CKEDITOR.replace('resultS',{
     	height:250,
     	resize_enabled:true                    	
     });
	 CKEDITOR.instances['resultS'].container.$.style.border = '1px solid green';
	</script> -->
    <script>
        let mediaRecorder;
        let chunks = [];
        const startRecordButton = document.getElementById('startRecord');
        const stopRecordButton = document.getElementById('stopRecord');
        const audioElement = document.getElementById('audioElement');
        startRecordButton.addEventListener('click', startRecording);
        stopRecordButton.addEventListener('click', stopRecording);
        //var language = document.getElementById('lang').value; 
        
        
       
    	
    	
      async function startRecording() {
    try {
        // Get user's audio stream
        startRecordButton.disabled = true;
        stopRecordButton.disabled = false;
        
const permission = await navigator.permissions.query({ name: 'microphone' });
        
       
        
        const stream = await navigator.mediaDevices.getUserMedia({ audio: true });

        // Initialize MediaRecorder with the stream
        mediaRecorder = new MediaRecorder(stream);

        // Array to store audio chunks
        var chunks = [];

        // Event handler for when data is available
        mediaRecorder.ondataavailable = function(event) {
            chunks.push(event.data);
        };

        // Event handler for when recording stops
        mediaRecorder.onstop = function() {
            // Create a Blob from the accumulated chunks
            const blob = new Blob(chunks, { type: 'audio/wav' });
            chunks = []; // Clear the chunks array

            // Read the Blob as a data URL
            const reader = new FileReader();
            reader.onload = function(event) {
                // Get the base64-encoded string representing the audio data
                const base64String = event.target.result;

                // Log the base64 string (for debugging)
                console.log(base64String);

                // Extract language selection from dropdown
                var e = document.getElementById("lang1");
                var language = e.options[e.selectedIndex].value.trim();
                
                var appName = document.getElementById("appName").value;

                const styleElement = document.createElement('style');
                document.head.appendChild(styleElement);
                styleElement.sheet.insertRule('.loader:after { content: "Generating text..."; }', 0);
                document.getElementById("overlay").style.display = "block";
                
                const cancelButton = document.createElement('button');
                cancelButton.id = "cancel-button";
                cancelButton.style.background = "none";
              //  cancelButton.style.border = "1px solid";

                // Create an image element for the button
                const cancelButtonImage = document.createElement('img');
                cancelButtonImage.src = `${pageContext.request.contextPath}/resources/images/crosss.png`;
                cancelButtonImage.style.width = "25px";
                cancelButton.appendChild(cancelButtonImage);
                document.getElementById("addCancelBtn").appendChild(cancelButton);
                // AJAX call to server-side ASR endpoint
                $.ajax({
    url: 'ajax/automaticSpeechRecognition',
    type: 'post',
    data: {
        language: language,
        base64String: base64String,
        appName: appName
    },
    success: function(response) {
    	
        // Check if response indicates an error
        if ('hello'.includes('error')) {
            // Show alert with the error message
            swal.fire(response);
        } else {
            // Update the result element with the transcription
            const resultdiv = document.getElementById('resultS');
            //CKEDITOR.instances['resultS'].setData(JSON.parse(JSON.stringify(response))['result']);
            tinymce.get('resultS').setContent(JSON.parse(JSON.stringify(response))['result']);

        }
        // Hide overlay regardless of success or error
        document.getElementById("overlay").style.display = "none";
        document.getElementById("addCancelBtn").removeChild(cancelButton);
    },
    error: function(xhr, status, error) {
        // Handle AJAX error
        console.error('AJAX Error:', error);
        // Show the error message from the server response, if available
        if(xhr.responseText) {
            swal.fire(xhr.responseText);
        } else {
            swal.fire("An error occurred while processing your request. Please try again later.");
        }
        // Hide overlay on error
        document.getElementById("overlay").style.display = "none";
        document.getElementById("addCancelBtn").removeChild(cancelButton);
    }

});
 audioElement.src = base64String;
            };
            // Start reading the Blob as a data URL
            
            reader.readAsDataURL(blob);
        };

        // Start recording
        mediaRecorder.start();
    } catch (error) {
        //Handle errors
        console.error('Error accessing microphone:', error);
        swal.fire('Error accessing microphone. Please make sure it is connected and enabled.');
        stopRecording();
    }
}


        function stopRecording() {
        	startRecordButton.disabled = false;
            stopRecordButton.disabled = true;
    
            mediaRecorder.stop();
            audioDiv.style.display = "block";
            //document.getElementById("audioElement").play();
        }
    </script>
    <script>
 /*    function applyTheme() {
        const selectedTheme = document.getElementById("themeSelector").value; // Get selected theme
        const themeStylesheet = document.getElementById("themeStylesheet"); // Get <link> tag
        
        // Update the href dynamically
        if (selectedTheme === "Dark") {
            themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/body-dark.css"; // Load dark theme
        } else if (selectedTheme === "Light") {
            themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/body-light.css"; // Load light theme
        }
    }

 */
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
    // Function to show/hide divs based on selected radio option
    function toggleServiceDivs() {
        // Get selected value
        var selectedValue = document.querySelector('input[name="service"]:checked').value;
        
        // Hide both divs initially
        document.getElementById("asrDiv").style.display = "none";
        document.getElementById("sttDiv").style.display = "none";
        
        // Show the corresponding div based on the selected radio button
        if (selectedValue === "upload") {
            document.getElementById("asrDiv").style.display = "block";
        } else if (selectedValue === "speak") {
            document.getElementById("sttDiv").style.display = "block";
        }
    }
    
    // Add event listeners to radio buttons
    document.getElementById("speakOption").addEventListener("change", toggleServiceDivs);
    document.getElementById("uploadOption").addEventListener("change", toggleServiceDivs);
</script>
</html>
<%@include file="footer.jsp" %>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>SNLP</title>
         <link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
         <link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
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
			.loader {
			 
			  left: 44%;
			  top: 45%;
			}
		

.highlight {
            background-color: yellow;
        }
        #text-container {
            white-space: pre-wrap; /* Preserve whitespace and line breaks */
        }

</style>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"  crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/onnxruntime-web/dist/ort.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@ricky0123/vad-web@0.0.7/dist/bundle.min.js"></script>
        <script src="https://www.WebRTC-Experiment.com/RecordRTC.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.min.css" rel="stylesheet">

        <link rel="shortcut icon" href="#">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

        <!-- (Optional) Latest compiled and minified JavaScript translation files -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/fontawesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/regular.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/brands.min.css"/>
    </head>
    <body class="body_bg" style="background-color: #dae8f4;
    background-repeat: no-repeat;
    height: 115vh;
    overflow:hidden">
    
    
    
    
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
		
		
<section class="container" style="margin-left:0; margin-top:0">
     <!-- Sidebar -->
<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
    <a href="${pageContext.request.contextPath}/audio" target="_blank">Automatic Speech Recognition</a>
<a href="${pageContext.request.contextPath}/text" target="_blank"> Text to Speech</a>
<a href="${pageContext.request.contextPath}/speechTrans" target="_blank"> Speech to Speech</a>
<a href="${pageContext.request.contextPath}/liveStreamingVoice" target="_blank"  style="background: #eaffe5; color: #0c9110; font-weight: 700;">Real Time ASR</a>
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
		
            <section class="container-fluid my-5" style="margin-top:1rem !important">
                <div class="row"> 
                    <div class="col-12 mx-auto" style="width: -webkit-fill-available">
                        <h3  class="text-center text-dark" style="color:#ffffffe0 !important">Live Streaming Automatic Speech Recognition</h3>
                    </div>
                </div>
                
  <!-- Main Content -->
<div class="container-fluid mt-5 mb-5" id="container1">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <!-- Chief Complaints Section -->
            <div class="container-fluid px-1 px-sm-3 mb-2">
                <div class="row align-items-center hover-shadow bg-white" 
                     style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; padding: 20px;">
                    
                    <div class="col-12 mb-3 input-group">
                        <div class="container-fluid">
                            <div class="row">
                                
                                <!-- Left: Buttons Section -->
                                <div class="col-md-3 text-center">
                                    <div class="controls mt-3">
                                        <button type="button" id="recordButton1" class="btn btn-primary w-100">
                                            <i class="fa fa-microphone" aria-hidden="true"></i> Start Recording
                                        </button>

                                        <div class="row mt-3">
                                            <div class="col-12" style="display:none;">
                                                <select id="model-select" class="selectpicker w-100" data-style="btn-success">
                                                    <option value="EN_HI_MIXED">English Hindi</option>
                                                    <option value="HI_FEMALE2">Hindi Female 1</option>
                                                    <option value="BN_FEMALE2">Hindi Female 2</option>
                                                    <option value="PA_MALE1">PA_MALE1</option>
                                                </select>
                                            </div>

                                            <div class="col-12 mt-3" style="display: flex; gap: 1rem;">
    <button type="button" class="btn btn-primary btn-lg w-100 p-1" id="tts-button">
        <i class="fa-solid fa-play"></i>
    </button>
    
    <button type="button" class="btn btn-primary btn-lg w-100 p-1" id="clear-button"> Clear
    </button>
</div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <audio id="audio-player" style="display: none"></audio>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Right: Textarea Section -->
                                <div class="col-md-9">
                                    <textarea class="form-control mt-3 recognizedText" id="responseContainer1" 
                                              style="height: 200px; min-height: 100px; overflow-y: scroll;"></textarea>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
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
    function openNav() {
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginLeft = "0";
    }
</script>
      <!-- TTS API Calling -->
<!--         <script>
            $(document).ready(function () {
                $('#tts-button').click(function () {
                    const text = $('#responseContainer1').val();
                    const model = $('#model-select').val();

                    if (!text) {
                        alert("Please enter some text.");
                        return;
                    }

                    $.ajax({
                        url: 'http://10.10.10.214:80/tts_service',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            model: model,
                            text: text
                        }),
                        xhrFields: {
                            responseType: 'blob'
                        },
                        success: function (data) {
                            const url = window.URL.createObjectURL(data);
                            const audio = document.getElementById('audio-player');
                            audio.src = url;
                            audio.style.display = 'block';
                            audio.play();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error:", status, error);
                            alert("There was an error processing your request.");
                        }
                    });
                });
            });
        </script> -->
<script>
$(document).ready(function () {
	 let audio = document.getElementById('audio-player');

	 $('#tts-button').click(function () {
	        const text = $('#responseContainer1').val();
	        const model = $('#model-select').val();
	        
	        // If the audio is currently playing, pause it
	        if (!audio.paused) {
	            audio.pause();
	            // Change icon to play
	            document.getElementById(`tts-button`).innerHTML = '<i class="fa-solid fa-play"></i>';
	           // $('#tts-button').removeClass('fa-stop').addClass('fa-play');
	        } else {
	            // If the audio is not playing, check for text and play it
	            if (!text) {
	                alert("Please enter some text.");
	                return;
	            }

	            const styleElement = document.createElement('style');
	        	document.head.appendChild(styleElement);

	        	// Update the content of the pseudo-element
	        	styleElement.sheet.insertRule('.loader:after { content: "Converting to speech..."; }', 0);
	        	document.getElementById("overlay").style.display = "block";
	            $.ajax({
	                url: 'https://uatsnlp.dcservices.in/CDACDictation/ttsaction',
	                method: 'POST',
	                contentType: 'application/json',
	                data: JSON.stringify({
	                    model: model,
	                    text: text
	                }),
	                xhrFields: {
	                    responseType: 'blob'
	                },
	                success: function (data) {
	                    const url = window.URL.createObjectURL(data);
	                    audio.src = url;
	                    audio.play();
	                    document.getElementById(`tts-button`).innerHTML = '<i class="fa-solid fa-stop"></i>';
	                    document.getElementById("overlay").style.display = "none";
	                },
	                error: function (xhr, status, error) {
	                    console.error("Error:", status, error);
	                    document.getElementById("overlay").style.display = "none";
	                    alert("There was an error processing your request.");
	                    
	                }
	            });
	        }
	    });

// Reset icon when audio ends
audio.addEventListener('ended', function() {
	document.getElementById(`tts-button`).innerHTML = '   <i class="fa-solid fa-play"></i>';
  //  $('#tts-button i').removeClass('fa-stop').addClass('fa-play');
});
});
</script>

<script>
$('#clear-button').click(function () {
	document.getElementById("responseContainer1").value = "";
});
</script>

        <script>
            $(document).ready(function () {
                $('#tts-button1').click(function () {
                    const text = $('#responseContainer2').val();
                    const model = $('#model-select1').val();

                    if (!text) {
                        alert("Please enter some text.");
                        return;
                    }

                    $.ajax({
                        url: 'https://uatsnlp.dcservices.in/CDACDictation/ttsaction',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            model: model,
                            text: text
                        }),
                        xhrFields: {
                            responseType: 'blob'
                        },
                        success: function (data) {
                            const url = window.URL.createObjectURL(data);
                            const audio = document.getElementById('audio-player');
                            audio.src = url;
                            audio.style.display = 'block';
                            audio.play();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error:", status, error);
                            alert("There was an error processing your request.");
                        }
                    });
                });
            });
        </script>


        <script>
            document.addEventListener('DOMContentLoaded', async () => {
               
                	
                    const ws = new WebSocket("ws://10.10.10.214/asr_service/stream");
                    let mediaRecorder;
                    let myvad;
                    let audioChunks = [];
                    let isRecording = false;

                    ws.onmessage = event => {
                        const responseContainer = document.getElementById(`responseContainer1`);
                        console.log(`WebSocket message received for responseContainer1:`, event.data);
                        responseContainer.value += event.data + " ";
                    };


                    function blobToBase64(blob) {
                        return new Promise((resolve, reject) => {
                            const reader = new FileReader();
                            reader.readAsDataURL(blob);
                            reader.onload = () => resolve(reader.result.split(',')[1]);
                            reader.onerror = error => reject(error);
                        });
                    }


                    async function startRecording() {
                        try {
                            const stream = await navigator.mediaDevices.getUserMedia({audio: true});
                            mediaRecorder = new MediaRecorder(stream, {mimeType: 'audio/webm'});
                            mediaRecorder.ondataavailable = event => {
                                if (event.data.size > 0) {
                                    audioChunks.push(event.data);
                                }
                            };

                            mediaRecorder.onstart = () => console.log(`Recording started for responseContainer1`);
                            mediaRecorder.onstop = async () => {
                                console.log(`Recording stopped for responseContainer1`);
                                if (audioChunks.length > 0) {
                                    const audioBlob = new Blob(audioChunks, {type: 'audio/webm'});
                                    const b64Audio = await blobToBase64(audioBlob);
                                    ws.send(b64Audio);
                                    audioChunks = [];
                                }
                            };

                            // Initialize VAD
                            myvad = await vad.MicVAD.new({
                                onSpeechStart: () => {
                                    console.log('Speech detected');
                                    if (mediaRecorder.state === 'paused' || mediaRecorder.state === 'inactive') {
                                        mediaRecorder.start();
                                    }
                                },
                                onSpeechEnd: async (audio) => {
                                    console.log('Speech ended');
                                    if (mediaRecorder.state === 'recording') {
                                        mediaRecorder.stop();
                                    }
                                },
                                onVADMisfire: () => {
                                    console.log('VAD misfire');
                                },
                                onVADTimeout: () => {
                                    console.log('VAD timeout');
                                    if (mediaRecorder.state === 'recording') {
                                        mediaRecorder.stop();
                                    }
                                },
                                onError: (e) => {
                                    console.error('VAD error:', e);
                                }
                            });

                            myvad.start();
                        } catch (error) {
                            console.error('Error accessing media devices:', error);
                        }
                    }

                    function stopRecording() {
                        if (mediaRecorder && mediaRecorder.state === 'recording') {
                            mediaRecorder.stop();
                        }
                        if (myvad) {
                            myvad.pause();
                        }
                    }
                    
                    document.getElementById(`recordButton1`).addEventListener('click', async () => {
                        if (!isRecording) {
                            await startRecording();
                            document.getElementById(`recordButton1`).innerHTML = '<i class="fa fa-stop" aria-hidden="true"></i> Stop Recording';
                        } else {
                            stopRecording();
                            document.getElementById(`recordButton1`).innerHTML = '<i class="fa fa-microphone" aria-hidden="true"></i> Start Recording';
                        }
                        isRecording = !isRecording;
                    });

                    ws.onopen = () => console.log(`WebSocket connection opened for responseContainer1`);
                    ws.onclose = () => console.log(`WebSocket connection closed for responseContainer1`);
                
            });
        </script>



	<script>
        function highlightText(){
        	var text = document.getElementById("responseContainer1").value.trim();        	
        	$.ajax({
        		url: 'http://10.226.17.19:41/snowmed_ct_terms_highlighter_services',
        		type: 'post',
        		data: {
        			text: JSON.stringify(text)
        		},
        		success: function(response) {
        			document.getElementById('wordCount').innerHTML = "Word count = "+JSON.parse(JSON.stringify(response))['wordCount'];
        			document.getElementById('text-container').innerHTML = JSON.parse(JSON.stringify(response))['text'];        			
        		}
        });
        }
        
        
        
        function textAveritation() {
        	var text = document.getElementById("responseContainer1").value.trim();
        	$.ajax({
        		url: 'ajax/textAveritation',
        		type: 'post',
        		data: {
        			text: JSON.stringify(text)
        		},
        		success: function(response) {
        			document.getElementById('wordCount1').innerHTML = "Word count = "+JSON.parse(JSON.stringify(response))['wordCount'];
        			document.getElementById('undividedText').innerHTML = JSON.parse(JSON.stringify(response))['text'];        			
        		}
        });
        }
        
        </script>


</body>

</html>
<%@include file="footer.jsp" %>
 

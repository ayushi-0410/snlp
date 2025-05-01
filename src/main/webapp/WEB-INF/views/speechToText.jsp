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
</head>
<body style="background-color: #7683ff69">

<section class="container" style="margin-left:0; margin-top:0">
     <!-- Sidebar -->
<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
    <a href="${pageContext.request.contextPath}/audio" target="_blank">Automatic Speech Recognition</a>
<a href="${pageContext.request.contextPath}/text" target="_blank"> Text to Speech</a>
<a href="${pageContext.request.contextPath}/speechTrans" target="_blank"> Speech to Speech</a>
<a href="${pageContext.request.contextPath}/liveStreamingVoice" target="_blank">Real Time ASR</a>
<a href="${pageContext.request.contextPath}/transliteration" target="_blank">Transliteration</a>
<a href="${pageContext.request.contextPath}/machTrans" target="_blank">Translation</a>
<a href="${pageContext.request.contextPath}/ocr" target="_blank"> OCR</a>
<a href="${pageContext.request.contextPath}/docTrans" target="_blank"><i class="bi bi-gear"></i> Image Translation</a>
</div>

<!-- Button to open the sidebar -->
<button class="openbtn" onclick="openNav()">☰</button>

</section>


 <section class="container my-5">
                <div class="row">
                    <div class="col-6 mx-auto">
                        <h3  class="my-4  text-center text-dark" >Speech To Text</h3>
                        <div class="card border-0 shadow-lg">
                            <div class="card-body">
                               
                                    <div class="form-group mb-3">
                                        <select id="lang" class="form-select">
                                            <option value="HI" selected>Hindi</option>
                                            <option value="BN">Bengali</option>
                                            <option value="EN">English</option>
                                        </select>
                                    </div>
                                     <div class="row"><div class="col-sm-8" style="display:flex; gap:5px; margin-bottom:1%">
                                      <button class="btn-primary btn" id="startRecord">Start Recording</button>
<button class="btn-primary btn" id="stopRecord" disabled>Stop Recording</button></div>
</div>
                                  <!-- <button id="startRecord">Start Recording</button>
    <button id="stopRecord">Stop Recording</button> -->
    <audio id="audioElement" controls style="display:none; margin-bottom:2%"></audio>
    <textarea id="result"></textarea>
   </div>
                            <!-- <div class="card-body">

                                <div>
                                    <textarea id="result"></textarea>
                                </div>
                            </div> -->
                        </div>
                    </div>
                </div>
            </section>


	<script>
	CKEDITOR.replace('result');
	</script>
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
                var e = document.getElementById("lang");
                const language = e.options[e.selectedIndex].value.trim();

                // AJAX call to server-side ASR endpoint
                $.ajax({
                    url: 'ajax/automaticSpeechRecognition',
                    type: 'post',
                    data: {
                        language: language,
                        base64String: base64String
                    },
                    success: function(response) {
                        // Update the result element with the transcription
                        const resultdiv = document.getElementById('result');
                        CKEDITOR.instances['result'].setData(JSON.parse(JSON.stringify(response))['result']);
                    }
                }); audioElement.src = base64String;
            };
            // Start reading the Blob as a data URL
            
            reader.readAsDataURL(blob);
        };

        // Start recording
        mediaRecorder.start();
    } catch (error) {
        //Handle errors
        startRecordButton.disabled = false;
            stopRecordButton.disabled = true;
        console.error('Error accessing microphone:', error);
        alert('Error accessing microphone. Please make sure it is connected and enabled.');
    }
}


        function stopRecording() {
        	startRecordButton.disabled = false;
            stopRecordButton.disabled = true;
    
            mediaRecorder.stop();
            audioElement.style.display = "block";
            //document.getElementById("audioElement").play();
        }
    </script>
</body>
</html>

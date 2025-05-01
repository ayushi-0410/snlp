
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chat Page</title>

        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"  crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.all.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.min.css" rel="stylesheet">



        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

        <!-- (Optional) Latest compiled and minified JavaScript translation files -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
        <link href="${pageContext.request.contextPath}/resources/css/chat-script.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/fontawesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/regular.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/brands.min.css"/>


        <style>

            .topnav {
                background-color: #fff;

            }
            .main_nav img {

            }
            .card {
                border: none;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                background-color: #00000047;
            }
            #pdf-upload-form {
                height: 5%;
                width: 100%;
            }
            #pdf-iframe {
                height: 95%;
                width: 100%;
            }
            #fetch-content-btn {
                margin-top: 10px;
            }


            .chatlist {
                list-style-type: none;
                padding: 0;
            }
            .bot__output {
                background-color: #e9ecef;
                padding: 10px;
                border-radius: 10px;
                margin-bottom: 10px;
            }
            
            .user__output {
                background-color: #e9ecef;
                padding: 10px;
                border-radius: 10px;
                margin-bottom: 10px;
                box-shadow: -1px 1px 2px #666;
    border-top: 4px solid #dd2895;
            }
            .chatbox-area {

                border-top: 1px solid #ced4da;
            }
            .chatbox {
                width: calc(100% - 80px);
                height: 50px;
                border: 1px solid #ced4da;
                border-radius: 5px;
                padding: 10px;
                margin-right: 10px;
            }
            .submit-button {
                background-color: #b8b8b8;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>


        <style>
            .pdf-container, .content-container {

                display: flex;
                flex-direction: column;
                padding: 15px;
                box-sizing: border-box;
                height: calc(100vh - 80px); /* Adjust according to your needs */
            }

            .responsive-iframe {
                flex: 1;
                width: 100%;
                border: none;
                margin-top: 10px;
                min-height: 50%;
            }



            /* Media queries for responsiveness */
            @media (max-width: 767px) {
                .pdf-container, .content-container {
                    width: 100%;
                    border: none;
                }

                .row {
                    flex-direction: column;
                }
            }

            @media (min-width: 768px) {
                .row {
                    display: flex;
                }

                .pdf-container, .content-container {
                    flex: 1;
                }
            }

            /* Additional styles for a better look */
            .container-fluid {
                padding: 0 15px;
            }

            .card {
                margin: 0 auto;
                padding: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border: 1px solid #5a5667;
            }

            textarea {
                width: 100%;
                box-sizing: border-box;
            }

            .chatbox-area {
                display: flex;
                flex-direction: column;
            }

            .chatbox {
                width: 100%;
                height: 100px;
                margin-top: 10px;
            }

            .submit-button {
                margin-top: 5px;
                align-self: flex-end;
            }

            .block--background {
                background-color: #f7f7f7;
                padding: 15px;
                box-sizing: border-box;
            }
        </style>
        <style>
        #loader {
    font-size: 16px;
    color: #555;
    margin-top: 10px;
    text-align: center;
}

li {
    user-select: text; /* Enable text selection */
}        
            /* Chatbot section styling */
            .chatbot-section {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: 100%;
                padding: 15px;
                box-sizing: border-box;

                overflow-y: auto;/* Light background for chatbot section */
            }

            /* Background block styling */
            .block--background {
                background-color: #000;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                display: flex;
                flex-direction: column;
                height: 100%;
                overflow: hidden;
            }

            /* Chatbot overview styling */
            .chatbot__overview {
                flex: 1;
                overflow-y: auto;
                margin-bottom: 15px;
            }

            /* Chat list styling */
            .chatlist {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .bot__output {
                background: #e9e9e9;
                padding: 10px;
                margin-bottom: 5px;
                border-radius: 4px;
            }
            .user__output {
                background: #e9e9e9;
                padding: 10px;
                margin-bottom: 5px;
                border-radius: 4px;
            }

            /* Chatbox area styling */
            .chatbox-area {
                display: flex;
                flex-direction: column;
                justify-content: flex-end;
            }

.bot__output--typing {
    display: inline-flex;
      color: #ccc;
    font-size: 35px;
  	gap: 5px;
    align-self: flex-start;
    will-change: auto;
    height: auto;
    margin-left: 1%;
    margin-top:1%;
}
.bot__output--typing .dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background-color: #ccc;
    animation: bounce-dots 1.5s infinite;
}

.bot__output--typing .dot:nth-child(1) {
    animation-delay: 0s;
}

.bot__output--typing .dot:nth-child(2) {
    animation-delay: 0.2s;
}

.bot__output--typing .dot:nth-child(3) {
    animation-delay: 0.4s;
}

/* Keyframes for the bounce animation */
@keyframes bounce-dots {
    0%, 80%, 100% {
        transform: scale(0);
        opacity: 0.3;
    }
    40% {
        transform: scale(1);
        opacity: 1;
    }
}

            /* Chatbox textarea styling */
            .chatbox {
                width: 100%;
                height: 60px;
                resize: none;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-bottom: 10px;
            }

            /* Submit button styling */
            .submit-button {
                align-self: flex-end;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                height: 100%;
                color: #fff;
                cursor: pointer;
            }



            .block--background {
                padding: 10px;
            }

            .chatbox {
                height: 50px;
            }

            .submit-button {
                width: 100%;
                padding: 10px;
            }

            .navbar {
                background-color: #e3f2fd;
                border-radius: 50px;
                background-image: url("${pageContext.request.contextPath}/resources/images/12345.jpg");
            }

            .chatlist{
                background-image: url("${pageContext.request.contextPath}/resources/images/123.gif");
                background-position: center;
                background-repeat: no-repeat;
            }
            #loader {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1000;
    display: flex;
    justify-content: center;
    align-items: center;
}

.spinner {
    width: 40px;
    height: 40px;
    border: 4px solid #ccc;
    border-top: 4px solid #007bff;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}
            
        </style>

    </head>
    <body style="font-family: Roboto, arial;    background-color: #26252b;    padding: 0;    margin: 0;    width: 100%;    height: 100%;    overflow-y: hidden;">
    <div id="loader" style="display: none;">
    <div class="spinner"></div>
</div>
    
        <div class="app" style=" width: 100%;  height: 90%;  padding: 10px;">
            <nav class="navbar navbar-light">
                <div class="main_nav">
                    <img src="${pageContext.request.contextPath}/resources/images/cdac-logo12.png" alt="">
                </div>
            </nav>
            <div class="workspace" style="display: table;  user-select: none;  width: 100%;  height: 100%">    
                <div class="scene" style="  display: table-cell;  min-width: 265px;  width: 100%;  height: 100%;  padding-left: 5px;  padding-right: 5px;">

                    <section class="container-fluid mt-2 mb-2">
                        <div class="card">
                            <div class="row" >
                                <div class="col-md-6 pdf-container">
                                    <form id="pdf-upload-form">


                                        <input class="form-control" type="file" id="pdf-input" onchange = "pdfInput()" accept="application/pdf" />
                                       <%--  <img src="${pageContext.request.contextPath}/resources/images/321.jpg" alt="" style="margin-left: 20%"> --%>
                                    </form>
                                    <iframe id="pdf-iframe" class="responsive-iframe">


                                    </iframe>
                                    <button id="fetchDataBtn" onclick="" style="display:none" class="btn btn-primary mt-2">Generate 
</button>
                                    <!--<button >Fetch Data</button>-->
                                </div>
                                <div class="col-md-6 content-container">
                                    <div class="row" >
                                        <!-- <div class="col-6">
                                            <div class="row" >
                                                <div class="col-6" style="display:none">

                                                    <select id="model-select" class="selectpicker" data-style="btn-success" data-width="100%">
                                                        <option value="EN_HI_BN_MIXED">English Hindi Bangala Mix</option>
                                                        <option value="EN_HI_MIXED">English Hindi </option>
                                                        <option value="HI_FEMALE1">Hindi Female 1</option>
                                                        <option value="HI_FEMALE2">Hindi Female 1</option>
                                                        <option value="BN_FEMALE2">Hindi Female 2</option>
                                                        <option value="PA_MALE1">PA_MALE1</option>
                                                    </select>
                                                </div>
                                                <div class="col-6"style="padding-left:6%">

                                                    <button  type="button" class="btn btn-primary btn-lg p-1 " id="tts-button"><i class="fa-solid fa-volume-high fa-beat"></i> T T S</button>


                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-12 mt-2 mb-1" >
                                                    <audio id="audio-player" controls style="display:none;"></audio>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-md-6" >
	                                            <div class="row">
	                                             
	                                                <div class="col-6" >
	                                                    <select id="language_pair" class="selectpicker" data-style="btn-success" data-width="100%">
										    <option value="eng_asm">English to Assamese</option>
										    <option value="eng_ben">English to Bengali</option>
										    <option value="eng_brx">English to Bodo</option>
										    <option value="eng_doi">English to Dogri</option>
										    <option value="eng_guj">English to Gujarati</option>
										    <option value="eng_hin">English to Hindi</option>
										    <option value="eng_kok">English to Konkani</option>
										    <option value="eng_kan">English to Kannada</option>
										    <option value="eng_kas">English to Kashmiri</option>
										    <option value="eng_mai">English to Maithili</option>
										    <option value="eng_mal">English to Malayalam</option>
										    <option value="eng_mar">English to Marathi</option>
										    <option value="eng_mni">English to Manipuri</option>
										    <option value="eng_nep">English to Nepali</option>
										    <option value="eng_ori">English to Odia</option>
										    <option value="eng_pan">English to Punjabi</option>
										    <option value="eng_san">English to Sanskrit</option>
										    <option value="eng_sat">English to Santali</option>
										    <option value="eng_snd">English to Sindhi</option>
										    <option value="eng_tam">English to Tamil</option>
										    <option value="eng_tel">English to Telugu</option>
										    <option value="eng_urd">English to Urdu</option>
										</select>

                                                </div>

  
  

                                                <div class="col-3" >
                                                    <button type="button" class="btn btn-primary  btn-lg p-1" id="translate_button">
                                                    <i class="fa fa-language fa-beat" aria-hidden="true"> </i> M T</button>
                                                </div>
                                                 <div class="col-3" >
	                                             <button type = "button" class = "btn btn-primary btn-lg p-1" id = "clearText" onclick= "clearText()">
	                                            Clear</button>
	                                            </div>
                                            </div>
                                            
                                           


                                            <div id="translation_result"></div>
                                        </div>
                                        <div class="col-12" style="display:flex; flex-direction:row">
                                           <div class="col-sm-6">
                                           		<textarea rows="10" id="text-input" name="input-word" class="form-control mt-2" placeholder="Summary" required></textarea>
                                           </div> 
                                             <div class="col-sm-6">
                                           		<textarea rows="10" id="translation_result" class="form-control mt-2" placeholder="Summary Translation"></textarea>
                                           </div> 
                                        </div> -->
                                        
                                       <!-- CLOSE BUTTON CODE -->
                                        <div class="col-sm-12" style="display:none">
                                        	<button type="button" class="btn btn-danger  btn-lg p-1" id="close_button">  
                                        	<i class="fa fa-close fa-beat" style="padding:5px"> </i>Close</button>
                                        	<span style="color:#ffffff5e"> Click on the close button once you end the chat.</span>
                                        </div>

                                    </div>
                                    <div class="row chatbot-section">
                                        <div class="block--background">
                                            <div class="chatbot__overview">
                                      
                                                <ul class="chatlist" id="chat-messages">
                                                    <li class="bot__output bot__output--standard">Hey user, upload a PDF and ask your queries!</li>
                                                    <!-- <li class=" bot__output--typing">...</li> -->
                                                </ul>
                                            </div>
                                            <div class="chatbox-area">
                                                <form action="" id="chatform">
                                                    <textarea placeholder="Talk to me!" class="chatbox" name="chatbox" id="user-input"></textarea>
                                                    <div id="loader" style="display: none;">⏳ Processing...</div>
                                                    <input class="submit-button" id="send-btn" type="submit" value="send">
                                                </form>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
              
    



        
      
        <script>
        const predefinedQuestions = [
             "What were my complaints?",
             "What medicines are prescribed?",
             "What is the things to avoid?",
             "What should be the standard bp and pulse rate?",   
            		 
            /* "total cost?",
               "gst cost?",
            	"date of travel?" */
        ];
        function pdfInput() {
            const input = document.getElementById('pdf-input');
            const file = input.files[0]; // Get the selected file
			const flag = 0;
            if (file) {
            	
            	let fileName = file.name;
                // Remove the .pdf extension if it exists
                if (fileName.toLowerCase().endsWith('.pdf')) {
                    fileName = fileName.slice(0, -4);
                }
//                alert('Selected file===== ' + fileName); // Show the file name without .pdf in an 
                if (file.type === 'application/pdf') {
                    const fileURL = URL.createObjectURL(file);
                    document.getElementById('pdf-iframe').src = fileURL;
                }
                const loader = document.getElementById('loader');
                loader.style.display = 'flex';
                document.getElementById('close_button').click();
                const formData = new FormData();
                formData.append('file', file);

                fetch('http://10.226.80.234:80/process-pdf', {
                    method: 'POST',
                    body: formData,
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                        loader.style.display = 'none';
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Success:', data);
                    loader.style.display = 'none';
                    askPredefinedQuestions();
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Failed to upload PDF.');
                    loader.style.display = 'none';
                });
            } else {
                alert('No file selected. Please choose a PDF file to upload.');
            }
        }
        </script>


        <script>
        function askPredefinedQuestions() {
            let index = 0;

            function askNextQuestion() {
                if (index < predefinedQuestions.length) {
                    const question = predefinedQuestions[index];
                    displayMessage(question, 'user'); 

                    const typingDots = showTypingDots(); 
                    fetchBotResponse(question, typingDots) 
                        .then(() => {
                            index++; 
                            setTimeout(askNextQuestion, 1500); 
                        })
                        .catch(error => {
                            console.error('Error fetching bot response for question:', question, error);
                        });
                }
            }

            askNextQuestion(); // Start the predefined questions loop
        }

        function fetchBotResponse(userInput, typingDots) {
            var data = {
                text: userInput
            };

            return fetch('http://10.226.80.234:80/doc_bot_demo', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            })
            .then(response => response.json())
            .then(data => {
                console.log('Bot response:', data.Doc_bot_Response);

                if (!data.Doc_bot_Response) {
                    displayMessage("Hey! Upload a PDF to start asking queries.", 'bot');
                    typingDots.remove();
                    return;
                }

                displayMessage(data.Doc_bot_Response, 'bot'); // Display bot response
                typingDots.remove();
            })
            .catch(error => {
                displayMessage('Sorry, there was an error processing your request.', 'bot');
                typingDots.remove();
                throw error; // Re-throw error to stop the question loop if needed
            });
        }

        function displayMessage(message, sender) {
            var chatMessages = document.getElementById('chat-messages');
            var messageElement = document.createElement('li');
            messageElement.className = sender === 'user' ? 'user__output' : 'bot__output bot__output--standard';
            
            const escapedMessage = message
            .replace(/&/g, "&amp;")  // Escape &
            .replace(/</g, "&lt;")  // Escape <
            .replace(/>/g, "&gt;")  // Escape >
           
            .replace(/\n/g, '<br>'); // Preserve line breaks

        // Set the escaped and formatted message as HTML
        messageElement.innerHTML = escapedMessage;
            
            chatMessages.appendChild(messageElement);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        function showTypingDots() {
            var chatMessages = document.getElementById('chat-messages');
            var typingElement = document.createElement('li');
            typingElement.className = 'bot__output--typing';

            for (var i = 0; i < 3; i++) {
                var dot = document.createElement('span');
                dot.className = 'dot';
                typingElement.appendChild(dot);
            }

            chatMessages.appendChild(typingElement);
            chatMessages.scrollTop = chatMessages.scrollHeight;

            return typingElement;
        }
        
    
        function sendMessage() {
            var userInput = document.getElementById('user-input').value;
            if (userInput.trim() === '') return;

            
            displayMessage(userInput, 'user');
			//document.getElementById('loader').style.display = "block";
			  var typingDots = showTypingDots();
            
            fetchBotResponse(userInput, typingDots);
            
            document.getElementById('user-input').value = '';
        }
        /*  
        function showTypingDots() {
            var chatMessages = document.getElementById('chat-messages');

            // Create typing dots element
           var typingElement = document.createElement('li');
typingElement.className = 'bot__output--typing'; // Assign class for styling

// Create the bouncing dots
for (var i = 0; i < 3; i++) {
    var dot = document.createElement('span'); // Create each dot
    dot.className = 'dot'; // Add class for individual dot
    typingElement.appendChild(dot); // Append dot to the typing element
}

// Append the typing element to the chat messages
chatMessages.appendChild(typingElement);

            // Scroll to the bottom
            chatMessages.scrollTop = chatMessages.scrollHeight;

            return typingElement; // Return the typing dots element for later removal
        }
       function displayMessage(message, sender) {
	    var chatMessages = document.getElementById('chat-messages');
	   // console.log(chatMessages);  
	    
	    var messageElement = document.createElement('li');
	    messageElement.className = sender === 'user' ? 'user__output' : 'bot__output bot__output--standard';
	    	
	    messageElement.textContent  = message;
	    console.log(message)
	    chatMessages.appendChild(messageElement);
	    //document.getElementById('loader').style.display = "none";
	    //  typingDots.remove();
	    console.log(chatMessages);
	    chatMessages.scrollTop = chatMessages.scrollHeight;
	}
       
       
       
        function fetchBotResponse(userInput, typingDots) { 
            var data = {
                text: userInput
            };

            fetch('http://10.226.80.234:80/doc_bot_demo', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data),
            })
            .then(response => response.json())
            .then(data => {
                console.log(data.Doc_bot_Response);
                
                if(!data.Doc_bot_Response){
                	displayMessage("Hey! Upload a PDF to start asking queries.", 'bot');
                	 typingDots.remove();
                	return;
                }
                displayMessage(data.Doc_bot_Response, 'bot');
                typingDots.remove();
            })
            .catch(error => {
                displayMessage('Sorry, there was an error processing your request.', 'bot');
                typingDots.remove();
                
            });
        }
        */
        document.getElementById('send-btn').addEventListener('click', function (event) {
            event.preventDefault();  
            console.log("send btn clicked");
            sendMessage();
        });

        document.getElementById('user-input').addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
            	console.log("enter clicked");
                event.preventDefault(); 
                sendMessage(); 
            }
        }); 
        
        </script>
        
        <script>
        $(document).ready(function () {
            $('#close_button').click(function () {
        	$.ajax({
        		url: 'http://10.226.80.234:80/close',
        		method: 'POST',
        		success: function (data) {
        			console.log(data)
        			console.log("success");
        			
        			// Clear the chat box and reset it to the default message
                    const chatMessages = document.getElementById('chat-messages');
                    chatMessages.innerHTML = `
                        <li class="bot__output bot__output--standard">
                            Ask your queries!
                        </li>
                    `;
        		},
                error: function (xhr, status, error) {
                    console.error("Error:", status, error);
                    alert("There was an error while closing the chat.");
                }
        	});
            });
        });
        
        </script>
        <!-- TTS API Calling -->
        <script>
            $(document).ready(function () {
                $('#tts-button').click(function () {
                    const text = $('#text-input').val();
                    const model = $('#model-select').val();
                    alert(text);
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
        </script>
        <!-- Machine Translation API Calling -->
        <script>
            $(document).ready(function () {
                $('#translate_button').click(function () {
                	
                    var srcText = $('#text-input').val();
                    var langPair = $('#language_pair').val();

                    if (!srcText) {
                        alert("Please enter text to translate.");
                        return;
                    }
                    $.ajax({
                        url: 'ajax/queryChatBOT',
                        method: "POST",
                        
                        data: {
                            srcText: srcText,
                            lang: langPair
                        },
                        success: function (response) {
                            // Assuming response structure is like:
                            // { "n_best": 1, "pred_score": 0.95, "src": "Hello", "tgt": "नमस्ते" }
                        	var output = response.output;
                        	
                        	document.getElementById("translation_result").value = output;
                          
                        },
                        error: function (xhr, status, error) {
                            if (xhr.status === 400) {
                                alert("Bad Request: Please check your input and try again.");
                            } else {
                                alert("An error occurred: " + error);
                            }
                        }
                    });
                });
            });
        </script>
        <script>
        	function clearText(){
        		//$('#text-input').val() = '';
        		document.getElementById("text-input").value = '';
        		document.getElementById("translation_result").value = '';
        	}
        </script>

    </body>
</html>

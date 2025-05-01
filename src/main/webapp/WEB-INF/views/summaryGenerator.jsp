<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chat Page</title>

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

            /* Chatbox area styling */
            .chatbox-area {
                display: flex;
                flex-direction: column;
                justify-content: flex-end;
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
                background-image: url("Image/12345.jpg");
            }

            .chatlist{
                background-image: url("Image/123.gif");
                background-position: center;
                background-repeat: no-repeat;
            }
        </style>

    </head>
    <body style="font-family: Roboto, arial;    background-color: #26252b;    padding: 0;    margin: 0;    width: 100%;    height: 100%;    overflow-y: hidden;">
        <div class="app" style=" width: 100%;  height: 90%;  padding: 10px;">
            <nav class="navbar navbar-light">
                <div class="main_nav">
                    <img src="Image/cdac-logo.png" alt="">
                </div>
            </nav>
            <div class="workspace" style="display: table;  user-select: none;  width: 100%;  height: 100%">    
                <div class="scene" style="  display: table-cell;  min-width: 265px;  width: 100%;  height: 100%;  padding-left: 5px;  padding-right: 5px;">

                    <section class="container-fluid mt-2 mb-2">
                        <div class="card">
                            <div class="row" >
                                <div class="col-md-6 pdf-container">
                                    <form id="pdf-upload-form">


                                        <input class="form-control" type="file" id="pdf-input" accept="application/pdf" />
                                        <img src="Image/321.jpg" alt="" style="margin-left: 20%">
                                    </form>
                                    <iframe id="pdf-iframe" class="responsive-iframe">


                                    </iframe>
                                    <button id="fetchDataBtn" onclick="" class="btn btn-primary mt-2">Generate Summary</button>
                                    <!--<button >Fetch Data</button>-->
                                </div>
                                <div class="col-md-6 content-container">
                                    <div class="row">
                                        <div class="col-6">
                                            <div class="row">
                                                <div class="col-6" >

                                                    <select id="model-select" class="selectpicker" data-style="btn-success" data-width="100%">
                                                        <!--<option value="EN_HI_BN_MIXED">English Hindi Bangala Mix</option>-->
                                                        <option value="EN_HI_MIXED">English Hindi </option>
                                                        <!--<option value="HI_FEMALE1">Hindi Female 1</option>-->
                                                        <option value="HI_FEMALE2">Hindi Female 1</option>
                                                        <option value="BN_FEMALE2">Hindi Female 2</option>
                                                        <option value="PA_MALE1">PA_MALE1</option>
                                                    </select>
                                                </div>
                                                <div class="col-6">

                                                    <button type="button" class="btn btn-primary btn-lg p-1 " id="tts-button"><i class="fa-solid fa-volume-high fa-beat"></i> T T S</button>


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
                                                    <select id="language_pair" class="selectpicker"  data-style="btn-success" data-width="100%">
                                                        <option value="en-hi">English to Hindi</option>
                                                        <option value="en-od">English to Odia</option>
                                                        <option value="hi-en">Hindi to English</option>
                                                        <option value="hi-pa">Hindi to Punjabi</option>
                                                        <option value="hi-dg">Hindi to Dogri</option>
                                                        <option value="pa-hi">Punjabi to Hindi</option>
                                                        <option value="od-en">Odia to English</option>
                                                    </select>
                                                </div>
                                                <div class="col-6" >
                                                    <button type="button" class="btn btn-primary  btn-lg p-1" id="translate_button"><i class="fa fa-language fa-beat" aria-hidden="true"> </i> M T</button>
                                                </div>
                                            </div>


                                            <div id="translation_result"></div>
                                        </div>
                                        <div class="col-12">
                                            <textarea rows="10" id="text-input" name="input-word" class="form-control mt-2" placeholder="Summary" required></textarea>
                                        </div>

                                    </div>
                                    <div class="row chatbot-section">
                                        <div class="block--background">
                                            <div class="chatbot__overview">
                                                <ul class="chatlist">
                                                    <li class="bot__output bot__output--standard">Hey Rishabh Singh, I'm Stark!</li>
                                                </ul>
                                            </div>
                                            <div class="chatbox-area">
                                                <form action="" id="chatform">
                                                    <textarea placeholder="Talk to me!" class="chatbox" name="chatbox"></textarea>
                                                    <input class="submit-button" type="submit" value="send">
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
        <script src="chat-script.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#fetchDataBtn').click(function () {

                    $.ajax({
                        url: 'http://10.226.29.191:8081/summary_generator_stream',
                        type: 'GET',
                        success: function (response) {

                            alert($('#text-input').val(response));
                            $('#text-input').val(response);
                        },
                        error: function (xhr, status, error) {
                            console.error('Error occurred:', status, error);
                        }
                    });
                });
            });
        </script>





        <link href="chat-script.css" rel="stylesheet" type="text/css"/>

        <script>
            document.getElementById('pdf-input').addEventListener('change', function (event) {
                const file = event.target.files[0];
                if (file) {
                    let fileName = file.name;
                    // Remove the .pdf extension if it exists
                    if (fileName.toLowerCase().endsWith('.pdf')) {
                        fileName = fileName.slice(0, -4);
                    }
//                    alert('Selected file===== ' + fileName); // Show the file name without .pdf in an 
                    if (file.type === 'application/pdf') {
                        const fileURL = URL.createObjectURL(file);
                        document.getElementById('pdf-iframe').src = fileURL;

                        // Create an AJAX call to the URL with the file name
                        const url = `http://10.226.29.191:8081/generate_summary_btn?data="${encodeURIComponent(fileName)}"`;
//                        alert("URL: " + url);

                        fetch(url, {
                            method: 'POST', // Ensure it's GET if you are sending data in the URL
                            headers: {
                                'Content-Type': 'application/json',
                            },
                        })
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('Network response was not ok ' + response.statusText);
                                    }
                                    return response.json();
                                })
                                .then(data => {
                                    console.log('Response from server:', data);
                                    alert("" + data);
                                    // You can process the response data here if needed
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                });
                    } else {
                        alert('Please upload a valid PDF file.');
                    }
                }
            });
        </script>


        <script>
            // Function to send user message and receive bot response
            function sendMessage() {
                var userInput = document.getElementById('user-input').value;
                if (userInput.trim() === '')
                    return;

                // Display user message
                displayMessage(userInput, 'user');

                // Simulate bot response (replace with actual bot logic)
                var botResponse = 'Hello! I am a chatbot.';

                // Display bot response after a short delay
                setTimeout(function () {
                    displayMessage(botResponse, 'bot');
                }, 500);

                // Clear input field
                document.getElementById('user-input').value = '';
            }

            // Function to display messages in the chat interface
            function displayMessage(message, sender) {
                var chatMessages = document.getElementById('chat-messages');
                var messageElement = document.createElement('li');
                messageElement.className = 'bot__output';
                messageElement.innerText = message;
                chatMessages.appendChild(messageElement);

                // Scroll to bottom of chat container
                chatMessages.scrollTop = chatMessages.scrollHeight;
            }

            // Event listener for send button click
            document.getElementById('send-btn').addEventListener('click', function () {
                sendMessage();
            });

            // Event listener for enter key press in input field
            document.getElementById('user-input').addEventListener('keypress', function (event) {
                if (event.key === 'Enter') {
                    sendMessage();
                }
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
                        url: "http://10.10.10.214:80/mt_service",
                        method: "POST",
                        contentType: "application/json",
                        data: JSON.stringify({
                            "src_text": srcText,
                            "lang": langPair
                        }),
                        success: function (response) {
                            // Assuming response structure is like:
                            // { "n_best": 1, "pred_score": 0.95, "src": "Hello", "tgt": "नमस्ते" }
                            $('#translation_result').html('<p>Translated Text: ' + response.tgt + '</p>');
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

    </body>
</html>

let mediaRecorder;
async function startRecord(){
	
        //let chunks = [];
        const startRecordButton = document.getElementById('startRecord');
        const stopRecordButton = document.getElementById('stopRecord');
        const audioElement = document.getElementById('audioElement');
      
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
                var e = document.getElementById("langSrc");
                const language = e.options[e.selectedIndex].value.trim();
			
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
    cancelButtonImage.src = "${pageContext.request.contextPath}/resources/images/crosss.png";
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
                        appName: 'snlpProject'
                    },
                    success: function(response) {
                      //var text= JSON.parse(JSON.stringify(response));
                      
                      var audioElement = document.createElement('audio');
        audioElement.id = 'audioElement';
        audioElement.controls = true;
        audioElement.style.marginBottom = '2%';
        audioElement.src = base64String;

        
                      // Append the audio element to the DOM
                     
        document.getElementById("audioContainer").innerHTML='';
       document.getElementById("audioContainer").innerHTML+='<div class="form-group"><span style="color:#003381; font-weight:500;height:87px">Your Audio:</span>' 
        document.getElementById("audioContainer").style.display = "block";
        document.getElementById("audioContainer").appendChild(audioElement);
                      
                      const resultdiv = document.getElementById('result');
                       
                        
                  //   alert("resp = "+response['result'])
                     resultdiv.innerText = response['result']
                      translate(response['result']);
                      
                    },
                    error: function(xhr, status, error) {
                        // Handle server errors
                        console.error('Error from server:', error);
                        swal.fire('Some error occured ' + (xhr.responseJSON ? xhr.responseJSON.message : error));
                        document.getElementById("overlay").style.display = "none";
                        document.getElementById("addCancelBtn").removeChild(cancelButton);
                    }
                }); /*audioElement.src = base64String;*/
            };
            // Start reading the Blob as a data URL
            
            reader.readAsDataURL(blob);
        };

        // Start recording
        mediaRecorder.start();
    } catch (error) {
        //Handle errors
        console.error('Error accessing microphone:', error);
        alert('Error accessing microphone. Please make sure it is connected and enabled.');
        document.getElementById("addCancelBtn").removeChild(cancelButton);
        stopRecording(mediaRecorder);
    }
}


 function stopRecording() {
	  const startRecordButton = document.getElementById('startRecord');
        const stopRecordButton = document.getElementById('stopRecord');
        	startRecordButton.disabled = false;
            stopRecordButton.disabled = true;
    // Append the audio element to the DOM
    
    var audioElement = document.getElementById("audioContainer")
       audioElement.style.display = "block";

            mediaRecorder.stop();
            
            //document.getElementById("audioElement").play();
        }
        
        
 function translate(text){
	 if(text === ""){
		swal.fire("Text is empty");
		return;
	}
	var langDest = document.getElementById("langDest").value;
	var langSrc = document.getElementById("langSrc").value;
	
	//var languageP = langSrc+"-"+langDest;
	
	var sourceLanguage = langSrc.toLowerCase();
	var destLanguage = langDest.toLowerCase();
	
	if(sourceLanguage == 'hi'){
		sourceLanguage = 'hin'
	}
	if(sourceLanguage == 'en'){
		sourceLanguage = 'eng'
	}
	if(sourceLanguage == 'bn'){
		sourceLanguage = 'ben'
	}
	if(destLanguage == 'en'){
		destLanguage = 'eng'
	}
	if(destLanguage == 'hi'){
		destLanguage = 'hin'
	}
	if(destLanguage == 'bn'){
		destLanguage = 'ben'
	}
	
		
	

	$.ajax({
		url: 'ajax/machineTranslation',
		type: 'post',
    dataType: "json", // Expecting JSON response
    contentType: "application/x-www-form-urlencoded", // Sending form data
    data: {
        src_text: text,
        lang: sourceLanguage + "_" + destLanguage
    },

		success: function(response) {
			console.log("Response:", response);
   
        var output = response.output; 
			document.getElementById("textDiv").style.visibility = 'visible';
		    //var output = response.output;
			console.log("output = " + output)
			  $("#trans_text").val('');
            $("#trans_text").val(output);
      
      //  $("#trans_text").val($("#trans_text").val() + targetText);
			speaktextAjax(destLanguage)
		}
	});
 }
 
 function speaktextAjax(language) {
	var lang = '';
	var text = document.getElementById("trans_text").value;
	
	if(language == 'eng'){
		lang = 'en_hi_mixed'
	}
	if(language == 'hin'){
		lang = 'en_hi_mixed'
	}
	if(language == 'ben'){
		lang = 'bn_female2'
	}



	if (text === "") {
		swal.fire("Text field cannot be empty.");
		return;
	}

	
	$.ajax({
		url: 'ajax/textToSpeach',
		type: 'post',
		data: {
			lang: lang,
			text: text
		},
		success: function(response) {
			var audioElement = document.createElement('audio');
        audioElement.id = 'audioElement2';
        audioElement.controls = true;
        audioElement.style.marginBottom = '2%';
        audioElement.src = 'data:audio/mp3;base64,' + response;

        // Append the audio element to the DOM
        document.getElementById("outAudioContainer").innerHTML='';
       document.getElementById("outAudioContainer").innerHTML+='<div class="form-group mb-3"><span style="color:#003381; font-weight:500">Output Audio:</span>' 
        document.getElementById("outAudioContainer").style.display = "block";
        document.getElementById("outAudioContainer").appendChild(audioElement);
document.getElementById("overlay").style.display = "none";


        // Play the audio
     //   document.getElementById("overlay").style.display = "none";
        audioElement.play();
			/*const a = document.createElement('a')
			a.href = 'data:audio/mp3;base64,' + response;
			a.setAttribute('download', true)
			a.click()*/
		},
		error: function(xhr, status, error) {
			swal.fire("Something went worng, Please try again");
			document.getElementById("overlay").style.display = "none";
			document.getElementById("addCancelBtn").removeChild(cancelButton);
		}
	});
}

function convertToOcrTrans() {
	if (document.getElementById("ocr").files.length == 0) {
		swal.fire("Please select a file.");
		return false;
	}
	var e = document.getElementById("languages");
	var languages = e.options[e.selectedIndex].value.trim();
	
	if (languages === "") {
		swal.fire("Please select a language.");
		return false;
	}
	var m = document.getElementById("model");
	var model = m.options[m.selectedIndex].value.trim();
	
	if(model === ""){
		swal.fire("Please select a model.")
	}
	
	var c = document.getElementById("col-type");
	var column = c.options[c.selectedIndex].value.trim();
	
	
	var formData = new FormData();
	var ocr = document.getElementById("ocr").files[0];
	
	formData.append('ocr', ocr);
	formData.append('languages', languages);
	formData.append('model', model);
	formData.append('column', column);
	
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
    cancelButtonImage.src = "${pageContext.request.contextPath}/resources/images/crosss.png";
    cancelButtonImage.style.width = "25px";
    cancelButton.appendChild(cancelButtonImage);
    document.getElementById("addCancelBtn").appendChild(cancelButton);
    
	$.ajax({
		url: 'ajax/converToOcr',
		type: 'post',
		data: formData,
		processData: false,
		contentType: false,
		success: function(response) {
			if (response.error) {
				// Handle the error
				alert(response.error);
				document.getElementById("overlay").style.display = "none";
				document.getElementById("addCancelBtn").removeChild(cancelButton);
				// Optionally, provide feedback to the user about the error
				// For example:
				// alert("An error occurred: " + response.error);
			} else {
				$("#src_text").val(response['ocr-output']);
				// Set data of CKEditor instance with OCR output from the response
			//	console.log(response['ocr-output']);
			//	response['ocr-output'] = response['ocr-output'].replace(/\n/g, '<br>');
				//CKEDITOR.instances['result'].setData(response['ocr-output']);
				//document.getElementById("overlay").style.display = "none";
			}

		translateTextAjax(response['ocr-output']);

			//CKEDITOR.instances['result'].setData(JSON.parse(JSON.stringify(response))['ocr-output']);
		},
		error: function(xhr, status, error) {  // Callback function executed if the request fails
			// Handle error here, you can log it or perform any other action
			alert("AJAX request failed: " + status + ", " + error);
			document.getElementById("overlay").style.display = "none";
			document.getElementById("addCancelBtn").removeChild(cancelButton);
			//document.getElementById("overlay").style.display = "none";
			// Optionally, you can provide feedback to the user about the error
			// For example:
			// alert("An error occurred while processing your request. Please try again later.");
		}
	});
}
async function ocrImageChange() {
	const input = document.getElementById('ocr');
        const image = input.files[0];
        const fileType = image.type;
	if (!fileType.startsWith('image/')) {
        swal.fire("Please upload an image file!");
         input.value = '';
        return false;
    }
    
    
        const previewButton = document.getElementById('previewButton');
        const imagePreview = document.getElementById('image-preview');
       
        if (image) {
            const reader = new FileReader();

            reader.onload = function(e) {
                imagePreview.src = e.target.result;
                previewButton.style.display = 'block';
            }

            reader.readAsDataURL(image);
        } else {
            imagePreview.src = '';
            previewButton.style.display = 'none';
        }
    }

function translateTextAjax(ocredText) {
	$("#trans_text").val('');
	var tsourceLanguage = document.getElementById("languages").value;
	var destLanguage = document.getElementById("destLanguages").value;	
	//var text = document.getElementById("src_text").value;
	var sourceLanguage = '';
	if (ocredText === "") {
		swal.fire("Text field cannot be empty.");
		return;
	}
	if(tsourceLanguage === destLanguage) {
		swal.fire("Source language and destination language cann't be same.");
		return;
	}
	 const styleElement = document.createElement('style');
    document.head.appendChild(styleElement);
    styleElement.sheet.insertRule('.loader:after { content: "Translating..."; }', 0);
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

	if(tsourceLanguage == 'assamese'){
		sourceLanguage = 'asm';
	}
	if(tsourceLanguage == 'bangla'){
		sourceLanguage = 'ben';
	}
	if(tsourceLanguage == 'odia'){
		sourceLanguage = 'ori';
	}
	if(tsourceLanguage == 'hindi'){
		sourceLanguage = 'hin';
	}
	
	$.ajax({
		url: 'ajax/machineTranslation',
		type: 'post',
		data: {
			sourceLanguage: sourceLanguage,
			destLanguage: destLanguage,
			text: JSON.stringify(ocredText)
		},
		success: function(response) {
			/*$("#trans_text").val(JSON.parse(JSON.stringify(response))['out']);*/
			
			var output = response.output;
        	var targetText = "";

        // Iterate over each item in the output array
        output.forEach(function(item) {
            var target = item.target; // Target text in English
            // Append target with a new line to the targetText variable
            targetText += target + "\n";
        });

        // Append the targetText to the textarea
        $("#trans_text").val($("#trans_text").val() + targetText);
		
			
			document.getElementById("overlay").style.display = "none";
			document.getElementById("addCancelBtn").removeChild(cancelButton);
		
			
		},
		error: function(xhr, status, error) {
			swal.fire("Something went worng, Please try again");
			document.getElementById("overlay").style.display = "none";
			document.getElementById("addCancelBtn").removeChild(cancelButton);
		}
	});
}
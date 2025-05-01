function speaktextAjax() {
	var lang = document.getElementById("lang").value;
	var text = document.getElementById("text").value;

	var selectedOption = document.getElementById("lang").options[document.getElementById("lang").selectedIndex];
	var selectedLanguageText = selectedOption.textContent;

	if (text === "") {
		swal.fire("Text field cannot be empty.");
		return;
	}
	console.log("text = "+ text);
	
	 const styleElement = document.createElement('style');
    document.head.appendChild(styleElement);
    styleElement.sheet.insertRule('.loader:after { content: "Generating audio..."; }', 0);
    document.getElementById("overlay").style.display = "block";
    
    const cancelButton = document.createElement('button');
    cancelButton.id = "cancel-button";
    cancelButton.style.background = "none";
   cancelButton.style.border = "none";

    // Create an image element for the button
    const cancelButtonImage = document.createElement('img');
    cancelButtonImage.src = `${contextPath}/resources/images/crosss.png`;
    cancelButtonImage.style.width = "25px";
    cancelButton.appendChild(cancelButtonImage);
    document.getElementById("addCancelBtn").appendChild(cancelButton);
    
	const jqXHR = $.ajax({
		url: 'ajax/textToSpeach',
		type: 'post',
		data: {
			lang: lang,
			text: text
		},
		success: function(response) {
			if (response === "error") {
				swal.fire("Something went wrong, Please try again");
				document.getElementById("overlay").style.display = "none";
				document.getElementById("addCancelBtn").removeChild(cancelButton);
			} else {
				var audioElement = document.createElement('audio');
				audioElement.id = 'audioElement';
				audioElement.controls = true;
				audioElement.style.marginBottom = '2%';
				audioElement.src = 'data:audio/mp3;base64,' + response;

				// Append the audio element to the DOM
				document.getElementById("audioContainer").innerHTML = '';
				document.getElementById("audioContainer").innerHTML += '<div class="form-group mb-3"><span style="color:#003381; font-weight:500">Output Audio:</span>'
				document.getElementById("audioContainer").style.display = "block";
				document.getElementById("audioContainer").appendChild(audioElement);

				// Play the audio
				document.getElementById("overlay").style.display = "none";
				document.getElementById("addCancelBtn").removeChild(cancelButton);
				audioElement.play();
				/*const a = document.createElement('a')
				a.href = 'data:audio/mp3;base64,' + response;
				a.setAttribute('download', true)
				a.click()*/
			}
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



function validateTextArea(lang, text) {
	switch (lang) {
		case 'HI_FEMALE2':
			return containsHindiCharacters(text);
		case 'BN_FEMALE2':
			return containsBengaliCharacters(text);
		case 'EN_HI_MIXED':
			return containsEnglishCharacters(text);
		case 'PA_MALE1':
			return containsPunjabiCharacters(text);
		default:
			return false;
	}
}

function containsHindiCharacters(content) {
	var hindiRegex = /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/;
	return hindiRegex.test(content);
}
function containsBengaliCharacters(content) {
	var bengaliRegex = /^[\u0980-\u09FF0-9\s.,!?()"'@#$%—–]+$/;
	return bengaliRegex.test(content);
}
function containsEnglishCharacters(content) {
	var englishRegex = /^[A-Za-z0-9\s.,!?()"'@#$%—–]+$/;
	return englishRegex.test(content);
}
function containsPunjabiCharacters(content) {
	var punjabiRegex = /^[\u0A00-\u0A7F0-9\s.,!?()"'@#$%—–]+$/;
	return punjabiRegex.test(content);
}






async function convertAudioToTextAjax_orign() {
	const language = document.getElementById('lang').value;
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

	let base64String = await audioToBase64(file);

	const styleElement = document.createElement('style');
	document.head.appendChild(styleElement);

	// Update the content of the pseudo-element
	styleElement.sheet.insertRule('.loader:after { content: "Converting to text..."; }', 0);
	document.getElementById("overlay").style.display = "block";
	$.ajax({
		url: 'ajax/automaticSpeechRecognition',
		type: 'post',
		data: {
			language: language,
			base64String: base64String
		},
		success: function(response) {
			
    			const resultdiv = document.getElementById('result')
    			// resultdiv.value = data.result
    			//CKEDITOR.instances['result'].setData(JSON.parse(JSON.stringify(response))['result']);
    			
    			resultdiv.value = JSON.parse(JSON.stringify(response))['result'];
			document.getElementById("overlay").style.display = "none";
		},
		error: function(xhr, status, error) {
			swal.fire("Something went worng, Please try again");
			document.getElementById("overlay").style.display = "none";
		}
	});
}

async function audioToBase64(audioFile) {
	return new Promise((resolve, reject) => {
		let reader = new FileReader();
		// onerror is catch  (fault data)
		reader.onerror = reject;
		reader.onload = (e) => resolve(e.target.result);
		reader.readAsDataURL(audioFile);
	});
}

function containsLanguageCharacters(content, languageCode) {
    // Define regular expressions for each language or character set
    const languageRegex = {
    'asm': /^[\u0980-\u09FF0-9\s.,!?()"'@#$%—–]+$/,   // Assamese
    'ben': /^[\u0980-\u09FF0-9\s.,!?()"'@#$%—–]+$/,   // Bengali
    'brx': /^[\u0980-\u09FF0-9\s.,!?()"'@#$%—–]+$/,   // Bodo
    'doi': /^[\u0980-\u09FF0-9\s.,!?()"'@#$%—–]+$/,   // Dogri
    'eng': /^[a-zA-Z0-9\s.,!?():"'@#$%—–]+$/,         // English
    'kok': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/,   // Konkani
    'guj': /^[\u0A80-\u0AFF0-9\s.,!?()"'@#$%—–]+$/,   // Gujarati
    'hin': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/,   // Hindi
    'kan': /^[\u0C80-\u0CFF0-9\s.,!?()"'@#$%—–]+$/,   // Kannada
    'kas': /^[\u0A80-\u0AFF0-9\s.,!?()"'@#$%—–]+$/,   // Kashmiri
    'mai': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/,   // Maithili
    'mal': /^[\u0D00-\u0D7F0-9\s.,!?()"'@#$%—–]+$/,   // Malayalam
    'mar': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/,   // Marathi
    'mni': /^[\u0980-\u09FF0-9\s.,!?()"'@#$%—–]+$/,   // Manipuri
    'nep': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/,   // Nepali
    'ori': /^[\u0B00-\u0B7F0-9\s.,!?()"'@#$%—–]+$/,   // Odia
    'pan': /^[\u0A80-\u0AFF0-9\s.,!?()"'@#$%—–]+$/,   // Punjabi
    'san': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/,   // Sanskrit
    'sat': /^[\u0980-\u09FF0-9\s.,!?()"'@#$%—–]+$/,   // Santali
    'snd': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/,   // Sindhi
    'tam': /^[\u0B80-\u0BFF0-9\s.,!?()"'@#$%—–]+$/,   // Tamil
    'tel': /^[\u0C00-\u0C7F0-9\s.,!?()"'@#$%—–]+$/,   // Telugu
    'urd': /^[\u0900-\u097F0-9\s.,!?()"'@#$%—–]+$/    // Urdu
};


    // Check if the provided languageCode has a corresponding regex
    if (languageRegex[languageCode]) {
        return languageRegex[languageCode].test(content);
    } else {
        // Return false if languageCode is not found
        return false;
    }
}

function translateTextAjax() {
	$("#trans_text").val('');
	var sourceLanguage = document.getElementById("sourceLanguage").value;
	var destLanguage = document.getElementById("destLanguage").value;
	console.log("src lang == "+sourceLanguage + " and dest lamg == "+ destLanguage);
	var text = document.getElementById("src_text").value;
	if (text === "") {
		swal.fire("Text field cannot be empty.");
		return;
	}
	console.log("input == "+ text)
	if (sourceLanguage === destLanguage) {
		swal.fire("Source language and destination language cann't be same.");
		return;
	}
	
   
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
    cancelButtonImage.src = `${contextPath}/resources/images/crosss.png`;
    cancelButtonImage.style.width = "25px";
    cancelButton.appendChild(cancelButtonImage);
    document.getElementById("addCancelBtn").appendChild(cancelButton);  
	console.log(text);
	const jqXHR = $.ajax({
    url: 'ajax/machineTranslation',
    type: 'post',
    dataType: "json", // Expecting JSON response
     contentType: "application/x-www-form-urlencoded; charset=UTF-8", // Sending form data
    data: {
        src_text: text,
        lang: sourceLanguage + "_" + destLanguage
    },

		success: function(response) {
			console.log("Response:", response);
   
        var outputText = response.output; 
        
        $("#trans_text").val(outputText); 
        
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

     function reverseTranslation() {
    	var sourceLanguage = document.getElementById("destLanguage").value;
    	var destLanguage = document.getElementById("sourceLanguage").value;
    	
    	
    	var transText = $("#trans_text").val();
    	if(!transText){
    		swal.fire("No output text available!");
    		return false;
    	}
    	
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
        cancelButtonImage.src = `${contextPath}/resources/images/crosss.png`;
        cancelButtonImage.style.width = "25px";
        cancelButton.appendChild(cancelButtonImage);
        document.getElementById("addCancelBtn").appendChild(cancelButton);  
    	
    	const jqXHR = $.ajax({
    		url: 'ajax/machineTranslation',
    		type: 'post',
    		dataType: "json", // Expecting JSON response
		     contentType: "application/x-www-form-urlencoded; charset=UTF-8", // Sending form data
		    data: {
		        src_text: transText,
		        lang: sourceLanguage + "_" + destLanguage
		    },
    		success: function(response) {
    			/*$("#trans_text").val(JSON.parse(JSON.stringify(response))['out']);*/

    			var output = response.output; 
    			console.log("output = " + output)
    			
    			document.getElementById("src_text").style.height = "25vh";
    			document.getElementById("reverse_text").style.display = "block";
                $("#reverse_text").val(output);


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
    	
     }
    
function transLiterationAjax() {
	 
	var languagePair = document.getElementById("lang").value;
	var text = document.getElementById("input-word").value;
	if (text === "") {
		swal.fire("Text field cannot be empty.");
		return;
	}
	
	/*var englishRegex = /^[A-Za-z0-9\s.,!?()"'@#$%—–]+$/;
	if(englishRegex.test(text) == false){
		swal.fire('Textarea content does not match English. Please enter text in English.');
		return false;
	}*/

	
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
    cancelButtonImage.src = `${contextPath}/resources/images/crosss.png`;
    cancelButtonImage.style.width = "25px";
    cancelButton.appendChild(cancelButtonImage);
    document.getElementById("addCancelBtn").appendChild(cancelButton); 
            
	const jqXHR = $.ajax({
		url: 'ajax/transLteration',
		type: 'post',
		data: {
			languagePair: languagePair,
			text: text
		},
		success: function(response) {
    console.log("response == " + response.result);

    // Assuming you have an element with ID "outputDiv" to show the response
    document.getElementById("transliterated-word").innerText = response.output;  

    document.getElementById("overlay").style.display = "none";
    document.getElementById("addCancelBtn").removeChild(cancelButton);
},

		error: function(xhr, status, error) {
		// Check if the error was due to aborting
                   if (status === 'abort') {
				console.log("Request was aborted by the user.");
			} else {
				console.log("error == "+ error);
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

async function convertToOCR_orign() {

	if (document.getElementById("ocr").files.length == 0) {
		swal.fire("Please select a file.");
		return false;
	}
	var e = document.getElementById("languages");
	const modalType = e.options[e.selectedIndex].value.trim();
	if (modalType === "") {
		swal.fire("Please select a language.");
		return false;
	}

	const image = document.getElementById("ocr").files[0];

	//	const previewimg = document.getElementById("previewimg");
	const imageToBase64 = await imageToBase64Fun(image);

	//const modalType = document.getElementById("languages").value;//     "odia";

	//	previewimg.setAttribute('src', URL.createObjectURL(image));

	const styleElement = document.createElement('style');
	document.head.appendChild(styleElement);

	// Update the content of the pseudo-element
	styleElement.sheet.insertRule('.loader:after { content: "Generating text..."; }', 0);
	document.getElementById("overlay").style.display = "block";
	$.ajax({
		url: 'ajax/converToOcr',
		type: 'post',
		data: {
			imageToBase64: imageToBase64,
			modalType: modalType
		},
		success: function(response) {

			if (response.error) {
				// Handle the error
				alert(response.error);
				document.getElementById("overlay").style.display = "none";
				// Optionally, provide feedback to the user about the error
				// For example:
				// alert("An error occurred: " + response.error);
			} else {
				// Set data of CKEditor instance with OCR output from the response
				console.log(response['ocr-output']);
				response['ocr-output'] = response['ocr-output'].replace(/\n/g, '<br>');
				CKEDITOR.instances['result'].setData(response['ocr-output']);
				document.getElementById("overlay").style.display = "none";
			}



			//CKEDITOR.instances['result'].setData(JSON.parse(JSON.stringify(response))['ocr-output']);
		},
		error: function(xhr, status, error) {  // Callback function executed if the request fails
			// Handle error here, you can log it or perform any other action
			alert("AJAX request failed: " + status + ", " + error);
			document.getElementById("overlay").style.display = "none";
			// Optionally, you can provide feedback to the user about the error
			// For example:
			// alert("An error occurred while processing your request. Please try again later.");
		}
	});
}
const imageToBase64Fun = file => new Promise((resolve, reject) => {
	const reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onload = () => resolve((reader.result).split(",")[1]);
	reader.onerror = error => reject(error);
});


async function ocrImageChange() {
    const input = document.getElementById('ocr');
    const files = input.files; // Handles both single and multiple file selection
    const imageContainer = document.getElementById('imageContainer');

    // Clear previous images
    imageContainer.innerHTML = '';

    // Loop through all selected files
    for (const file of files) {
        const fileType = file.type;

        // Check if the file is an image
        if (!fileType.startsWith('image/')) {
            swal.fire("Please upload an image file!");
            input.value = '';
            return false;
        }

        // Create image wrapper
        let imageWrapper = document.createElement('div');
        imageWrapper.style.display = 'flex';
        imageWrapper.style.flexDirection = 'column';
        imageWrapper.style.alignItems = 'center';
        imageWrapper.style.margin = '10px';

        // Create image element
        let imageElement = document.createElement('img');
        imageElement.style.width = 'auto'; // Adjust size as needed
        imageElement.style.height = 'auto'; // Maintain aspect ratio
        imageElement.style.maxWidth = '200px'; // Limit max width for smaller images
        imageElement.style.maxHeight = '200px'; // Limit max height

        // Create filename element
        const fileNameElement = document.createElement('div');
        fileNameElement.style.textAlign = 'center';
        fileNameElement.style.marginTop = '5px';
        fileNameElement.style.overflow = 'hidden';
        fileNameElement.style.textOverflow = 'ellipsis';
        fileNameElement.style.whiteSpace = 'nowrap'; // Prevent wrapping

        // Handle TIFF files or other image types
        if (fileType === 'image/tiff' || fileType === 'image/tif') {
            const arrayBuffer = await file.arrayBuffer();
            const tiff = new Tiff({ buffer: arrayBuffer });
            const canvas = tiff.toCanvas();
            imageElement.src = canvas.toDataURL('image/png'); // TIFF converted to PNG
        } else {
            imageElement.src = URL.createObjectURL(file); // Set object URL for other image types
        }

        // Display the file name and truncate if too long
        const fileName = file.name.length > 20 ? file.name.slice(0, 17) + '...' : file.name; // Adjust length if needed
        fileNameElement.innerText = fileName;

        // Add checkbox for each image
        const checkboxElement = document.createElement('input');
        checkboxElement.type = 'checkbox';
        checkboxElement.style.marginTop = '5px';
        checkboxElement.onchange = function () {
            toggleImageSize(imageElement, checkboxElement.checked); // Handle enlargement on checkbox check
        };

        // Add elements to the image wrapper
        imageWrapper.appendChild(imageElement);  // Add the image
        imageWrapper.appendChild(fileNameElement);  // Add the file name
        imageWrapper.appendChild(checkboxElement);  // Add the checkbox

        // Add the image wrapper to the container
        imageContainer.appendChild(imageWrapper);
    }

    // Make OCR button visible after selection
    document.getElementById('ocrbtn').style.visibility = "visible";

    // Initialize CKEditor (if used)
    CKEDITOR.replace('result', {
        height: 400,
        resize_enabled: true
    });
    CKEDITOR.instances['result'].setData('');
}

// Function to toggle image size on checkbox change
function toggleImageSize(imageElement, isChecked) {
    if (isChecked) {
        // Enlarge the image to fill the entire width of the container
        imageElement.style.width = '100%';
        imageElement.style.height = 'auto';
    } else {
        // Reset image size
        imageElement.style.width = 'auto';
        imageElement.style.maxWidth = '200px';
        imageElement.style.height = 'auto';
    }
}


function convertToOCR__real() {
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
	var formData = new FormData();
	var ocr = document.getElementById("ocr").files[0];

	formData.append('ocr', ocr);
	formData.append('languages', languages);

	const styleElement = document.createElement('style');
	document.head.appendChild(styleElement);

	// Update the content of the pseudo-element
	styleElement.sheet.insertRule('.loader:after { content: "Generating text..."; }', 0);
	document.getElementById("overlay").style.display = "block";

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
			} else {
				// Set data of CKEditor instance with OCR output from the response
				console.log(response['ocr-output']);
				response['ocr-output'] = response['ocr-output'].replace(/\n/g, '<br>');
				CKEDITOR.instances['result'].setData(response['ocr-output']);
				document.getElementById("overlay").style.display = "none";
			}
			//CKEDITOR.instances['result'].setData(JSON.parse(JSON.stringify(response))['ocr-output']);
		},
		error: function(xhr, status, error) {  // Callback function executed if the request fails
			// Handle error here, you can log it or perform any other action
			alert("AJAX request failed: " + status + ", " + error);
			document.getElementById("overlay").style.display = "none";
		}
	});
}
function clearImageProcTab(){
	const imgProc = document.getElementById("ImageProc");
	const ckEdit = document.getElementById("CkEditor");
	 var imgPro = document.getElementById("imageProc");
	imgProc.style.display = "none";
			ckEdit.style.display = "flex";
			imgPro.innerHTML = '';
			var i, tabcontent, tablinks;

	  // Hide all tab contents
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }

	  // Remove the active class from all tabs
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	
	tabName = "Edit";
	
	  // Show the clicked tab and add active class
	  document.getElementById(tabName).style.display = "block";
	  document.getElementById(tabName).classList.add("active");
	 // evt.currentTarget.className += " active";
	 
	 
	 //extra code
	 
	/* if (cropper) {
        // Get the cropped canvas and convert it to a base64 string
        const croppedCanvas = cropper.getCroppedCanvas();
        if (croppedCanvas) {
            const croppedBase64String = croppedCanvas.toDataURL('image/png').split(',')[1]; // Get the base64 part
            console.log('Sending cropped image data for OCR...');
            
            formData.append('ocr', croppedBase64String);
             formData.append('languages', languages);
   formData.append('model', model);
   formData.append('column', column);
    sendToServer(formData);
            //sendOCR(croppedBase64String);  // Pass the cropped image base64 to OCR
        }
    } else {*/
        // If cropper is not active, use the original image (from image preview or wherever needed)

}
function convertToOCR_pause() {
	
	clearImageProcTab();
	 const selectedImages = document.querySelectorAll('#imageContainer input[type="checkbox"]:checked');
	 
	 
	var formData = new FormData();
	var e = document.getElementById("languages");
	var languages = e.options[e.selectedIndex].value.trim();
	
	var m = document.getElementById("model");
	var model = m.options[m.selectedIndex].value.trim();
	
	var c = document.getElementById("col-type");
	var column = c.options[c.selectedIndex].value.trim();
	
		if (model === "") {
		swal.fire("Please select a model.");
		return false;
	}
	
	if (languages === "") {
		swal.fire("Please select a language.");
		return false;
	}
	if (column === "") {
		swal.fire("Please select a column type.");
		return false;
	}
	
        const originalImage = document.querySelector('#imagePreview canvas');
        if (!originalImage) {
        swal.fire("Please select an image.");
        return false;
    }
    
         var imgSrc = originalImage.toDataURL('image/png');
		 
		        base64String = imgSrc.split(',')[1];  // Get the base64 part of the data URL
		
		        // Append the base64 string to FormData
		        formData.append('ocr', base64String);
		        formData.append('languages', languages);
		        formData.append('model', model);
		        formData.append('column', column);
		
		        // Proceed with the AJAX request
		        sendToServer(formData);
	}   


let wordMapping = [];

function sendToServer_pause(formData) {
    const styleElement = document.createElement('style');
    document.head.appendChild(styleElement);
    styleElement.sheet.insertRule('.loader:after { content: "Generating text..."; }', 0);
    document.getElementById("overlay").style.display = "block";

    console.log("Preparing to send AJAX request...");
    const textOcr = document.getElementById("result");
    $.ajax({
        url: 'ajax/converToOcr',
        type: 'post',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            console.log("AJAX request successful. Response received:", response);

            if (response.error) {
                alert(response.error);
                document.getElementById("overlay").style.display = "none";
                return; // Exit if there's an error
            } else {
                console.log("OCR output:", response['ocr-output']);
                response['ocr-output'] = response['ocr-output'].replace(/\n/g, '\n');
                console.log("Image info:", response['image-info']);
                
                CKEDITOR.instances['result'].setData(response['ocr-output']);
                document.getElementById("overlay").style.display = "none";

                const wordCount = {};
                wordMapping = Object.values(response['image-info']).map(info => {
                    let cleanedWord = info.text.replace(/\s+/g, '');  // Remove extra spaces

                    // Track occurrences of the same word
                    if (!wordCount[cleanedWord]) {
                        wordCount[cleanedWord] = 1;
                    } else {
                        wordCount[cleanedWord]++;
                    }

                    console.log(`Mapping word: ${cleanedWord}, Coordinates: ${info.coordinates}`);
                    return {
                        word: cleanedWord,   // Cleaned word without extra spaces
                        bbox: info.coordinates,
                        occurrence: wordCount[cleanedWord]  // Track the occurrence index of this word
                    };
                });
                console.log("Word mapping stored:", wordMapping);

                // Attach event listener to detect selection
                attachTextSelectionEvent();
            }
        },
        error: function(xhr, status, error) {
            alert("AJAX request failed: " + status + ", " + error);
            document.getElementById("overlay").style.display = "none";
        }
    });
}
let mouseUpHandler, keyUpHandler;

function attachTextSelectionEvent(imgSrc) {
    let canvas = document.querySelector('#imagePreview canvas');
    const originalSrc = canvas.toDataURL(); // Store the original image data URL
   /// console.log("Original src is  == " + originalSrc);
  //  console.log("Attaching selection change events to CKEditor...");
    
    var editor = CKEDITOR.instances.result;

    editor.on('contentDom', function() {
        const editableElement = editor.editable().$;

        // Define mouseup and keyup handlers
        mouseUpHandler = function() {
           // console.log("Mouse up in CKEditor. Handling selection.");
            setTimeout(function() {
                if (!imgSrc) {
                    handleTextSelection(originalSrc, editor);
                } else {
                    handleTextSelection(imgSrc, editor);
                }
            }, 0);  // Short delay to ensure CKEditor registers the selection
        };

        keyUpHandler = function() {
         //   console.log("Key up in CKEditor. Handling selection.");
            setTimeout(function() {
                if (!imgSrc) {
                    handleTextSelection(originalSrc, editor);
                } else {
                    handleTextSelection(imgSrc, editor);
                }
            }, 0);  // Short delay to ensure CKEditor registers the selection
        };

        // Add event listeners
        editableElement.addEventListener('mouseup', mouseUpHandler);
        editableElement.addEventListener('keyup', keyUpHandler);
   
    });
}

function detachTextSelectionEvent() {
  //  console.log("Detaching selection change events from CKEditor...");

    var editor = CKEDITOR.instances.result;

    if (editor) {
        editor.on('contentDom', function() {
            const editableElement = editor.editable().$;

            if (mouseUpHandler && keyUpHandler) {
                // Remove the mouseup and keyup event listeners
                editableElement.removeEventListener('mouseup', mouseUpHandler);
                editableElement.removeEventListener('keyup', keyUpHandler);

                console.log("Selection change events detached successfully.");
            } else {
                console.log("No event handlers found to detach.");
            }
        });
    }
}

 
function getSelectedTextAndAdjacentWords(editor) {
    // Get the selection object from CKEditor
    const selection = editor.getSelection();
    const range = selection.getRanges()[0]; // Get the first range of the selection
    const selectedText = selection.getSelectedText().trim().replace(/[\r\n]+/g, ' ')  ;
    console.log("Selected Text:", selectedText);

    if (!range) {
        console.error("No range found in the selection.");
        return { selectedWords: [], previousWord: "", nextWord: "" };
    }

   let editorContent = editor.document.getBody().getHtml()
    .replace(/<br\s*\/?>/gi, '\n')  // Convert <br> to newlines
    .replace(/<\/?p[^>]*>/gi, '\n') // Convert <p> tags to newlines
    .replace(/<[^>]+>/g, '')        // Remove remaining HTML tags
     .replace(/[\r\n]+/g, ' ')      // Replace newlines with a single space
    .trim();                        // Trim leading/trailing spaces

console.log("Plain Editor Content:", editorContent);

// Calculate the start and end indices of the selected text
const startIndex = editorContent.indexOf(selectedText.trim());
const endIndex = startIndex + selectedText.trim().length;

if (startIndex === -1) {
    console.error("Selected text not found in editor content.");
    return { previousWord: null, nextWord: null };
}

// Split the entire editor content into words
const words = editorContent.split(/\s+/);

// Find the index of the first word in the selected text
const allTextBeforeSelection = editorContent.slice(0, startIndex).trim();
const allTextAfterSelection = editorContent.slice(endIndex).trim();

const wordsBefore = allTextBeforeSelection.split(/\s+/);
const wordsAfter = allTextAfterSelection.split(/\s+/);

// Get the last word before the selection and the first word after it
const previousWord = wordsBefore.length > 0 ? wordsBefore[wordsBefore.length - 1] : '';
const nextWord = wordsAfter.length > 0 ? wordsAfter[0] : '';


    console.log("Previous Word:", previousWord);
    console.log("Next Word:", nextWord);

    // Split the selected text into words
    const selectedWords = selectedText.split(/\s+/);

    // Return the result
    return { selectedWords, previousWord, nextWord };
}

function getSelectedText(editor) {
    // Extract selected text and selection range from CKEditor
    const selection = editor.getSelection();
    const selectedText = selection.getSelectedText();
    return { selectedText, selection };
}


function handleTextSelection(originalSrc, editor) {
    const { selectedWords, previousWord, nextWord } = getSelectedTextAndAdjacentWords(editor);
  //  console.log("Selected words:", selectedWords);
  // console.log("Previous word:", previousWord);
  // console.log("Next word:", nextWord);

    if (selectedWords.length > 0) {
        const canvas = document.querySelector('#imagePreview canvas');
        if (!canvas) return;

        const img = new Image();
        img.src = originalSrc; // Use the original image to reset
		
	//	console.log(originalSrc);
        img.onload = function() {
            const ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas
            ctx.drawImage(img, 0, 0, canvas.width, canvas.height); // Redraw the original image

           // Use setTimeout to force a reflow and redraw
            setTimeout(() => {
                highlightTextInImage(selectedWords, ctx, previousWord, nextWord); // Highlight only the selected words
            }, 0);
             };
    } else {
        resetCanvas(originalSrc);
    }
}

function resetCanvas(originalSrc) {
    const canvas = document.querySelector('#imagePreview canvas');
    if (!canvas) return;

    const img = new Image();
    img.src = originalSrc;

    img.onload = function() {
        const ctx = canvas.getContext('2d');
        ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear the canvas
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height); // Redraw the original image
    };
}

function highlightTextInImage(selectedWords, ctx, previousWord, nextWord) {
 //   console.log("Highlighting text in image for:", selectedWords.join(', '));

    let selectedWordObjects = [];

    // Traverse through the wordMapping to find the matching words
    for (let i = 0; i < wordMapping.length; i++) {
        const wordObj = wordMapping[i];

        // Match the first selected word
        if (wordObj.word === selectedWords[0]) {
            const firstWordIndex = i;
            const lastWordIndex = firstWordIndex + selectedWords.length - 1;

            // Ensure the next word is within bounds
            if (lastWordIndex >= wordMapping.length) continue;

            const lastWordObj = wordMapping[lastWordIndex];

            // Find the previous word (if any)
            const actualPrevWord = firstWordIndex > 0 ? wordMapping[firstWordIndex - 1].word : null;
            // Find the next word (if any)
            const actualNextWord = lastWordIndex < wordMapping.length - 1 ? wordMapping[lastWordIndex + 1].word : null;

            console.log("Actual previous word:", actualPrevWord);
           console.log("Actual next word:", actualNextWord);

            // Check if the previous word matches and the next word matches
            const isPreviousWordMatch = (actualPrevWord === previousWord || firstWordIndex === 0);
            const isNextWordMatch = (actualNextWord === nextWord || lastWordIndex === wordMapping.length - 1);

            console.log("Is previous word match:", isPreviousWordMatch);
            console.log("Is next word match:", isNextWordMatch);

            // If the previous and next word conditions are met, proceed to highlight
            if (isPreviousWordMatch && isNextWordMatch) {
                console.log(`Highlighting the range: '${selectedWords.join(' ')}'`);

                // Add all the selected words bounding boxes to the selectedWordObjects
                for (let j = firstWordIndex; j <= lastWordIndex; j++) {
                    selectedWordObjects.push(wordMapping[j]);
                }
                break;
            }
        }
    }

    // Now highlight each selected word
    if (selectedWordObjects.length > 0) {
        selectedWordObjects.forEach(wordObj => {
            const [x1, y1, x2, y2] = wordObj.bbox; // Assuming wordObj has a 'bbox' property

            // Draw individual highlight boxes around each selected word
            ctx.fillStyle = 'rgba(255, 0, 0, 0.3)';  // Highlight color (transparent red)
            ctx.fillRect(x1, y1, x2 - x1, y2 - y1);  // Draw rectangle around the word
            console.log("Highlight box drawn for:", wordObj.word);
        });
    } else {
        console.warn("No words matched the selection criteria.");
    }
}

// Calculate the collective bounding box for multiple bounding boxes
function getCollectiveBoundingBox(bboxes) {
    if (bboxes.length === 0) return null;

    let x1 = Infinity, y1 = Infinity, x2 = -Infinity, y2 = -Infinity;

    for (const bbox of bboxes) {
        x1 = Math.min(x1, bbox[0]);
        y1 = Math.min(y1, bbox[1]);
        x2 = Math.max(x2, bbox[2]);
        y2 = Math.max(y2, bbox[3]);
    }

    return [x1, y1, x2, y2];
}



// Get the occurrence index of the selected word
function getSelectedOccurrence(selectedText) {
    const textArea = document.getElementById('result');
    const fullText = textArea.value.replace(/\s+/g, '');  // Remove extra spaces
    const occurrences = fullText.split(selectedText).length - 1;  // Count occurrences
    console.log(`Selected text "${selectedText}" is the ${occurrences} occurrence.`);
    return occurrences;
}

async function saveOcrTextToDb(ocrResponseMap){
	console.log("image info == "+ JSON.stringify(ocrResponseMap) );
	$.ajax({
		url: 'ajax/saveOCRtextDb',
		type: 'POST',
		data: JSON.stringify(ocrResponseMap), 
		contentType: 'application/json',
		success: function(responsetext) {
			console.log(responsetext);
		},
		error: function() {

		}

	});
}
function submitFeedback() {
	
	var name = document.getElementById("name").value;
	var number = document.getElementById("mobile").value;
	var domain = document.getElementById("domain").value;
	var message = document.getElementById("message").value;
	var userEmail = document.getElementById("userEmail").value;

	if (name.trim() == "") {
		Swal.fire("Name Can't not Be Empty");
		return false;
	}
	if (number.trim() == "") {
		Swal.fire("Phone Number Can't not Be Empty");
		return false;
	}
	if (!/^[0-9]{10}$/.test(number)) {
		swal.fire("Fill 10 numeric digits mobile number");
		return false;
	}
	if (userEmail.trim() == "") {
		Swal.fire("Email Can't not Be Empty");
		return false;
	}
	if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(userEmail)) {
		swal.fire("Email format is invalid");
		return false;
	}
	if (domain.trim() == "") {
		Swal.fire("Domain Can't not Be Empty");
		return false;
	}
	if (message.trim() == "") {
		Swal.fire("Message Can't not Be Empty");
		return false;
	}
	$.ajax({
		url: 'ajax/submitFeedBack',
		type: 'POST',
		data: {
			userName: name,
			userNumber: number,
			domainFor: domain,
			feedbackMessage: JSON.stringify(message),
			userEmail: userEmail
		},
		success: function(responsetext) {
			Swal.fire(responsetext);
		},
		error: function() {

		}

	});
}

function convertPdfToImg() {
	var pdfFile = document.getElementById("pdfFile").files[0];
	var formData = new FormData();
	formData.append("pdfFile", pdfFile);
	var name = pdfFile.name.split('.')[0];
	var type = pdfFile.type;
	if (pdfFile == null) {
        swal.fire("Upload a pdf file");
        return false;
    }
	
    if (type !== 'application/pdf') {
        swal.fire("Please upload a PDF file.");
        return;
    }
    const styleElement = document.createElement('style');
	document.head.appendChild(styleElement);

	styleElement.sheet.insertRule('.loader:after { content: "Generating pdf..."; }', 0);
	document.getElementById("overlay").style.display = "block";
	$.ajax({
		url: 'ajax/pdfToImage',
		type: 'POST',
		data: formData,
		processData: false,
		contentType: false,
		xhrFields: {
            responseType: 'blob'  // Set responseType to 'blob' to handle binary data
        },
        success: function(response) {
            // Create a blob from the response
            var blob = new Blob([response], { type: 'application/zip' });

            // Create a link element
            var link = document.createElement('a');
            link.href = window.URL.createObjectURL(blob);
            link.download = name + '.zip'; // The name of the downloaded file

            // Append the link to the body
            document.body.appendChild(link);
            link.click(); // Programmatically click the link to trigger the download

            // Clean up
            document.body.removeChild(link);
            document.getElementById("overlay").style.display = "none";
        },
        error: function() {
			       document.getElementById("overlay").style.display = "none";
            swal.fire("Error processing the request");
     
        }
	});
}


function pdfMerger() {
	var input = document.getElementById('pdfFiles');
    var files = input.files;
    
    if(files.length === 0){
		swal.fire("Upload images can not be empty.");
		return false;
	}

    
    var formData = new FormData();

    // Append all files to FormData
    for (var i = 0; i < files.length; i++) {
        formData.append('pdfFiles', files[i]);
    }
	const styleElement = document.createElement('style');
	document.head.appendChild(styleElement);

	// Update the content of the pseudo-element
	styleElement.sheet.insertRule('.loader:after { content: "Merging images..."; }', 0);
	document.getElementById("overlay").style.display = "block";
    $.ajax({
        type: 'POST',
        url: 'ajax/imagesToPdf',
        data: formData,
        processData: false,
        contentType: false,
       xhrFields: {
            responseType: 'blob'  // Important for receiving binary data like a PDF
        },
        success: function (response) {
		
            // Create a blob object from the binary data
            var blob = new Blob([response], { type: 'application/pdf' });
           var url = window.URL.createObjectURL(blob);
          
            // Create a temporary anchor element to trigger the download
            var a = document.createElement('a');
           
            a.href = url;
            a.download = "_merged.pdf";  // Set the download name
            document.body.appendChild(a);
            a.click();  // Trigger the download
            
            // Clean up the temporary anchor element and object URL
            window.URL.revokeObjectURL(url);
            document.body.removeChild(a);
            document.getElementById("overlay").style.display = "none";
        },
        error: function () {
			document.getElementById("overlay").style.display = "none";
            swal.fire("Error processing the request");
            
        }
    });	
}

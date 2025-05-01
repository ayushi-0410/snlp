<%-- 
    Document   : ocr
    Created on : 25 May, 2023, 5:00:20 PM
    Author     : cdac
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Language OCR</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11"></link>
     <script src="${pageContext.request.contextPath}/resources/jsScript/tiff.min.js" type="text/javascript"></script>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
       <link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.1/cropper.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.1/cropper.css" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.1/cropper.min.css"  /> -->
<link
	href="${pageContext.request.contextPath}/resources/css/cropper.min.css"
	rel="stylesheet" type="text/css" />
	
	 <link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
	  <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
        <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
    <style>
    
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
 width:233px;
 position : static
}
    
        body {
       
            font-family: Arial, sans-serif;
            background-color: #dae8f4;
            text-align: center;
            padding: 20px;
    
        }

        header {
            font-size: 20px;
            margin-bottom: 20px;
        }
		.topnav{
			background: white;
    width: 102.5%;
    left: -19px;
    position: relative;
		}
        .container {
    display: flex;
    justify-content: space-between;
    gap: 5px;
    align-items: stretch;
    height: 70%;
} 

.chosen-images, .selected-image, .text-editor, .ocr-section {
    border: 1px solid #ddd;
    padding: 10px;
    background-color: #E0E0E0;
    flex: 1;
    overflow:auto;
   /* Add scrollbar if content overflows */
}

.ocr-section {
    display: flex;
    justify-content: center;
    align-items: center;
}

.ocr-btn {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin-top: -6px;
    cursor: pointer;
}
.btn-primary{color:#fff;background-color:#007bff;border-color:#007bff}
.btn-primary:hover{color:#fff;background-color:#0069d9;border-color:#0062cc}
.btn-primary.focus,.btn-primary:focus{box-shadow:0 0 0 .2rem rgba(0,123,255,.5)}
.btn-primary.disabled,.btn-primary:disabled{color:#fff;background-color:#9bb7d5;border-color:#9bb7d5}
      /*   .chosen-images, .selected-image, .text-editor {
            border: 1px solid #ddd;
            padding: 10px;
            background-color: #f8e9e9;
        }
 */
        .chosen-images {
            flex-basis: 10%;
            text-align: left;
        }

        .selected-image {
            flex-basis: 30%;
        }

        .text-editor {
            flex-basis: 30%;
        }

        .image-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 10px 0;
        }

        .image-preview img {
            max-width: 100%;
            height: auto;
        }

        .image-preview {
            display: none;
            border: 1px solid #ccc;
            padding: 10px;
            max-width: 100%;
            
            max-height: 87%;
            overflow:auto;
        }


        .header-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        button, select {
            padding: 0;
            font-size: 12px;
        }
        .span-title{
        	    border-bottom: 1px solid;
    text-align: center;
    padding: 0;
    font-size: larger;
    font-weight: 700;
    font-family: sans-serif;
        }
        .editing-bar {
  display: flex; /* Arrange buttons horizontally */
  gap: 6px;
  width:73%;

  margin-top:3px;
}
.rotL-button, .rotR-button{
	margin-top:1px;
}

.crop-button, .zoomin-button, .zoomout-button, .rotL-button, .rotR-button, .saveFinalBtn{
  /* Style your buttons */
  background-color: inherit;
  border: none;
  display:flex;
  flex-direction:column;
  /* padding: 8px 12px; */
  cursor: pointer;
  align-items: center;
}
.span{
	font-size:10px;
}
.edit_btns{
	width:10%;
	display:flex;
	/* align-items: center; */
	justify-content: center;
}

/* Styling the tab buttons */
.tab {
  display: flex;
  background-color: #f1f1f1;
 /*  padding: 10px; */
}

.tab button {
  background-color: inherit;
  border: none;
  padding: 6px 14px;
  cursor: pointer;
  font-size: 16px;
  transition: background-color 0.3s;
}

.tab button.active {
  background-color: #ddd;
  font-weight: bold;
}

.tab button:hover {
  background-color: #ccc;
}

/* Content under tabs */
.tabcontent {
  display: none;
  padding: 2px;
  border-top: 1px solid #ccc;
}
canvas {
   width: 100%;  
   /*  height: 100%; */ 
}

        /* Adjust main content when sidebar is open */
        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        /* Ensure section takes up the right space */
        section {
            position: relative; /* This keeps the sidebar inside the section */
        }

    </style>
</head>
<body class="body_bg" style=" padding-top:0; font-size:15px">

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
		
	<section class="" style="margin-left:0; margin-top:0; text-align:justify">
		<div id="mySidebar" class="sidebar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
    <a href="${pageContext.request.contextPath}/audio" target="_blank">Automatic Speech Recognition</a>
<a href="${pageContext.request.contextPath}/text" target="_blank">Text to Speech</a>
<a href="${pageContext.request.contextPath}/speechTrans" target="_blank">Speech to Speech</a>
<a href="${pageContext.request.contextPath}/liveStreamingVoice" target="_blank">Real Time ASR</a>
<a href="${pageContext.request.contextPath}/transliteration" target="_blank">Transliteration</a>
<a href="${pageContext.request.contextPath}/machTrans" target="_blank">Translation</a>
<a href="${pageContext.request.contextPath}/ocr" target="_blank" style="background: #eaffe5; color: #0c9110; font-weight: 700;">OCR</a>
<a href="${pageContext.request.contextPath}/docTrans" target="_blank" ><i class="bi bi-gear"></i>Image Translation</a>
</div>
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
<div class="row">
                        <div class="col-12 mx-auto">
                        
                        <h3 class="text-center" style="margin-top:1%;margin-bottom:1%;color:#ffffffe0;font-size:23px">Indian Languages OCR</h3>
                        <h5 style="margin-top: 1%; color: beige; font-size:15px">Developed under BHASHINI</h5>
                        </div>
                        </div>

<!-- Header Buttons and Dropdowns -->
<div class="header-buttons">
    <input type="file" id="ocr" multiple onchange="ocrImageChange()" />
  <!--  <select style="padding:0;height:fit-content">
        <option>Select Model</option>
        <option>Version 1</option>
        <option>Version 2</option>
    </select>
    <select style="padding:0; height:fit-content">
        <option>Select Language</option>
        <option>Bangla</option>
        <option>Assamese</option>
        <option>Odia</option>
    </select>
    <select style="padding:0; height:fit-content">
        <option>Select Column</option>
        <option>Single Column</option>
        <option>Double Column</option>
    </select> -->
    
   <div style="margin-top:1px"> 
        <select name="model" id="model" style="height:23px;border-radius:5px" onchange="updateSelections()">
            <option value="">Model Selection</option>
            <option value="tess">Model 1</option>
            <option value="cnn">Model 2</option>
        </select>
    </div>
     <div id="langDiv" style="margin-top:1px;display:none" > 
        <select name="languages" id="languages" style="height:23px;border-radius:5px">
            <option value="">Language Selection</option>
        </select>
    </div>
      <div style="margin-top:1px;display: none" id="col-type-div">
        <select name="col-type" id="col-type" style="height:23px;border-radius:5px">
            <option value="">Column type</option>
        </select>
    </div>
    <!-- OCR Button Section -->
    <div class="" style="background: initial">
        <button id="ocrbtn" class="btn-primary" style="visibility:hidden;padding:1px" onclick="convertToOCR()">OCR</button>
        
    </div>
</div>
<div id="containerDiv" class="container" style="visibility:hidden">

    <!-- Chosen Images Section -->
    <div class="chosen-images">
        <div class="span-title"><span>Chosen Images</span></div>
        <div id="imageContainer" style="overflow: auto;  height: 91%; border-bottom:1px solid"></div>
        <div style="display:flex; gap:5px; margin-top:7px"><button class="btn-primary" id="selectAllBtn" onclick="selectAllImages()" style="display:none">Select all</button>
        <button class="btn-primary" id="deSelectAllBtn" onclick="deSelectAllImages()" style="display:none">Deselect all</button>
        </div>
    </div>

<div class="selected-image" style="overflow:hidden">
  <div class="span-title"><span>Selected Image</span></div>
  <div class="toolbar">
  <div class="tab">
    <button class="tablinks active" onclick="openTab(event, 'Edit')">Edit</button>
    <button class="tablinks" onclick="openTab(event, 'Filters')">Filters</button>
  </div>

  <!-- Edit Tab Content -->
  <div id="Edit" class="tabcontent" style="display: block;">
  <div style="display:flex">
    <div class="editing-bar">
      <div class="edit_btns">
        <button class="crop-button">
          <img src="${pageContext.request.contextPath}/resources/images/crop.png" style="width: 19px;">
          <span class="span">Crop</span>
        </button>
      </div>

      <div class="edit_btns" id="rotL-buttonDiv">
        <button class="rotL-button" onclick="rotateLeft()">
          <img src="${pageContext.request.contextPath}/resources/images/rotateleft.png" style="width: 18px;">
          <span class="span">Rot. left</span>
        </button>
      </div>

      <div class="edit_btns" id="rotR-buttonDiv">
        <button class="rotR-button" onclick="rotateRight()">
          <img src="${pageContext.request.contextPath}/resources/images/rotateright.png" style="width: 18px;">
          <span class="span">Rot. right</span>
        </button>
      </div>

      <div class="edit_btns" id="saveF-buttonDiv">
        <button class="saveFinalBtn">
          <img src="${pageContext.request.contextPath}/resources/images/save.png" style="width: 17px;">
          <span class="span" style="bottom: -2px; position: relative;">Save</span>
        </button>
      </div>
       <div id="cancelCropButton" class="edit_btns" style="display:none;">
        <button class="saveFinalBtn">
          <img src="${pageContext.request.contextPath}/resources/images/crosss.png" style="width: 16px;">
          <span class="span" style="bottom: -2px; position: relative;">Cancel</span>
        </button>
      </div>
      
      
      <div id="okCropButton" class="edit_btns" style="display:none;">
        <button id="save-Button" class="saveFinalBtn">
        	<img src="${pageContext.request.contextPath}/resources/images/ticks.png" style="width: 16px;">
          <span class="span" style="bottom: -2px; position: relative;">Ok</span>
        </button>
       
      </div>
     
    </div>
     <div> <button class="btn-primary" id="undo-Button" style="">Undo</button>
        <button class="btn-primary" id="redo-Button" style="">Redo</button>
        <button class="btn-primary" id="reset-Button" style="">Reset</button></div>
        </div>
         
  </div>

  <!-- Filters Tab Content -->
  <div id="Filters" class="tabcontent" style="display: none;text-align:left">
    <div style="display:flex">
      <select name="filters" id="filters" onchange="filterApplyChange()" style="height: 23px; border-radius: 5px;">
        <option value="">Select filter</option>
        <option value="add_noise">Noise cleaning</option>
        <option value="erosion">Erosion</option>
        <option value="dilation">Dilation</option>
        <option value="binarization">Binarization</option>
        <option value="color2gray">Color 2 gray</option>
        <option value="invert">Inversion</option>
        <option value="wavelet_transform">Wavelet Transform</option>
      </select>
      
     
    </div>
    <div style="text-align:left; display:flex">
    
    <select name="noise_type" id="noise_type" style="height: 23px; border-radius: 5px; display:none">
    <option value="">Select noise type</option>
    	<option value ="0">1</option>
    	<option value ="1">2</option>
    	<option value ="2">3</option>
    </select>
  
    
    
    <select name="kernel_size" id="kernel_size" style="height: 23px; border-radius: 5px;display:none">
    <option value="">Select kernel size</option>
    	<option value ="1">1</option>
    	<option value ="3">3</option>
    	<option value ="5">5</option>
    </select>
    
    <select name ="iters" id="iters" style="height: 23px; border-radius: 5px; display:none">
    <option value="">Select iteration</option>
   	    <option value ="1">1</option>
    	<option value ="2">2</option>
    	<option value ="3">3</option>
    	<option value ="4">4</option>
    	<option value ="5">5</option>
    </select>
 
   
    </div>
      <button class="btn-primary" onclick="applyFilter()">Apply</button>
  </div>
</div>
   <div id="imagePreview" class="image-preview">
   <canvas id="highlightCanvas" style=""></canvas>
   </div>
</div>

    <!-- Text Editor Section -->
    <div class="text-editor" id="CkEditor" style="display:flex; flex-direction:column;text-align:center; align-items:center; gap:5px">
       <div class="span-title" style="width:-webkit-fill-available"><span>Text Editor</span>
       <button class= "btn-primary" onclick ="saveOcrEditedText()"> Save text </button></div>
        <textarea style="display:block; height:90%; width:90%;margin-top:12%" name="result" id="result" placeholder= "OCR text will appear here..."></textarea>
    </div>
    <div class="selected-image" id="ImageProc" style="display:none; ">
        <div class="span-title" style="">
       
        <span>Image Processing</span> 
        
        </div>
        <div class="toolbar">
         <div>
         <button id="undo-FilterBtn" hidden =true>undo</button>
        <button id="redo-FilterBtn" hidden ="true">redo</button> 
        
        <button onclick = "saveFilterImage()">Save</button>
        </div>
        </div>
       <div id="imageProc" class="image-preview" style="max-height:87%;margin-top:7%"></div>
    </div>
</div>

</body>
<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
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
<!-- filters apply and filter history, redo, undo -->
<script>
let filterHistory = [];
let currentFilterHistoryIndex = -1;
let undoFilterButton, redoFilterButton;

// Function to initialize button event listeners
function initialize() {
    undoFilterButton = document.querySelector('#undo-FilterBtn');
    redoFilterButton = document.querySelector('#redo-FilterBtn');

    // Add event listeners for undo and redo buttons
    if (undoFilterButton && redoFilterButton) {
        undoFilterButton.addEventListener('click', undoFilter);
        redoFilterButton.addEventListener('click', redoFilter);
    }

    updateFilterUndoRedoButtons(); // Initial button state
}

// Function to save filter state to history
function saveFilterToHistory(filteredDataURL) {
    // Remove future states if new filter is applied after undo
    filterHistory = filterHistory.slice(0, currentFilterHistoryIndex + 1);
    filterHistory.push(filteredDataURL);
    currentFilterHistoryIndex++;
    updateFilterUndoRedoButtons();
}

// Function to undo a filter application
function undoFilter() {
    if (currentFilterHistoryIndex > 0) {
        currentFilterHistoryIndex--;
        applyFilterHistory();
        updateFilterUndoRedoButtons();
    }
}

// Function to redo a filter application
function redoFilter() {
    if (currentFilterHistoryIndex < filterHistory.length - 1) {
        currentFilterHistoryIndex++;
        applyFilterHistory();
        updateFilterUndoRedoButtons();
    }
}

// Function to apply a filter from the history
function applyFilterHistory() {
    const imageElement = document.getElementById('imageProc').querySelector('img');
    if (filterHistory[currentFilterHistoryIndex]) {
        imageElement.src = filterHistory[currentFilterHistoryIndex];
    }
}

// Update the state of filter undo/redo buttons
function updateFilterUndoRedoButtons() {
    undoFilterButton.disabled = currentFilterHistoryIndex <= 0;
    redoFilterButton.disabled = currentFilterHistoryIndex >= filterHistory.length - 1;
}

// Call initialize to set up buttons when the window is loaded
window.onload = initialize;

function filterApplyChange() {
    const filter = document.getElementById("filters").value;

    // Hide all dropdowns initially
    document.getElementById("noise_type").style.display = "none";
    document.getElementById("kernel_size").style.display = "none";
    document.getElementById("iters").style.display = "none";
    
    // Show dropdowns based on the selected filter
    switch (filter) {
        case "add_noise":
            document.getElementById("noise_type").style.display = "block"; // Show noise type
            break;
        case "erosion":
        case "dilation":
            document.getElementById("kernel_size").style.display = "block"; // Show kernel size
            document.getElementById("iters").style.display = "block"; // Show iterations
            break;
        default:
            console.log("No valid filter selected.");
        break;
            
    }
}
async function applyFilter() {
	let divId = 'imagePreview';
    let divElement = document.getElementById(divId);
    let imgSrc;

    if (divElement) {
        // Find the img element within the div
        let imgElement = divElement.querySelector('canvas'); // This gets the first <img> inside the div
		console.log("found div");
        if (imgElement) {
            imgSrc = imgElement.toDataURL('image/png');

            if (imgSrc.startsWith('data:image/')) {
                // Image is already base64 encoded
                console.log('Image is already in Base64 format:', imgSrc);
            } else {
                // Image is not in Base64, convert it
                imgSrc = await convertImageToBase64(imgSrc); // Update imgSrc with the Base64 version
                console.log('Converted to Base64:', imgSrc);
            }
        } else {
            swal.fire('No image found in the div');
            return;
        }
    } else {
        console.log('Div not found');
    }
    
    const filter = document.getElementById("filters").value;
    
    // Create a FormData object to send to the API
    const formData = new FormData();
    formData.append("imgSrc", imgSrc); // Add the image source
    formData.append("filter", filter); // Add the selected filter
    
    
    switch (filter) {
    case "add_noise":
        // Apply noise cleaning
        console.log("Applying noise cleaning..."); 
        const noiseType = document.getElementById("noise_type").value;
        formData.append("noiseType", noiseType);
        break;
        
    case "erosion":
        // Apply erosion
        console.log("Applying erosion...");
        const erosionKernelSize = document.getElementById("kernel_size").value;
        const erosionIters = document.getElementById("iters").value;
        formData.append("kernelSize", erosionKernelSize);
        formData.append("iters", erosionIters);
        break;
        
    case "dilation":
        // Apply dilation
        console.log("Applying dilation...");
        const dilationKernelSize = document.getElementById("kernel_size").value;
        const dilationIters = document.getElementById("iters").value;
        formData.append("kernelSize", dilationKernelSize);
        formData.append("iters", dilationIters);
        break;
        
    default:
        console.log("No filter selected or filter not recognized.");
        break;
}
    

    console.log("image == " + imgSrc); // Now imgSrc will be the Base64 string if converted
    console.log("filter= " + filter);
   
    const styleElement = document.createElement('style');
	document.head.appendChild(styleElement);

	styleElement.sheet.insertRule('.loader:after { content: "Applying Filter..."; }', 0);
	document.getElementById("overlay").style.display = "block";
    sendToFilterApi(formData);
}

async function sendToFilterApi(formdata){
	$.ajax({
		url: 'ajax/applyFilter',
		type: 'POST',
		data: formdata,
		async: true,
		cache: false,
		contentType: false,
		processData: false,
		success: function(response) {
			
			const res = JSON.parse(JSON.stringify(response))['image'];
			console.log("responwe=== "+ res);
			let divId = 'imageProc';
		    let divElement = document.getElementById(divId);
		    let imgSrc;

		    if (divElement) {
		        // Find the img element within the div
		        let imgElement = divElement.querySelector('img'); // This gets the first <img> inside the div
				console.log("found div");
		        if (imgElement) {
		        	 imgElement.src = "";
		           imgElement.src = "data:image/jpeg;base64,"+ res;
		           saveFilterToHistory("data:image/jpeg;base64,"+ res);
		           applyFilterHistory(); 
		           saveToHistory("data:image/jpeg;base64,"+ res);
		           updateFilterUndoRedoButtons();
		           console.log(filterHistory);
		           document.getElementById("overlay").style.display = "none";
		        } else {
		            swal.fire('No image found in the div');
		            document.getElementById("overlay").style.display = "none";
		        }
		    } else {
		        swal.fire('Div not found');
		        document.getElementById("overlay").style.display = "none";
		    }
		   
			
		},
		error: function(xhr, status, error) {
			swal.fire("Error! Try again.")
			document.getElementById("overlay").style.display = "none";
		}
	});
}

// Function to fetch and convert image to Base64
function convertImageToBase64(imgUrl) {
    return new Promise((resolve, reject) => {
        let img = new Image();
        img.crossOrigin = 'Anonymous'; // This is required to avoid CORS issues
        img.src = imgUrl;

        img.onload = function () {
            let canvas = document.createElement('canvas');
            canvas.width = img.width;
            canvas.height = img.height;

            let ctx = canvas.getContext('2d');
            ctx.drawImage(img, 0, 0);

            let dataURL = canvas.toDataURL('image/png'); // You can change 'image/png' to the format you need
            resolve(dataURL);
        };

        img.onerror = function () {
            reject('Error loading image');
        };
    });
}

function saveFilterImage(){
	const currentImageProc = document.querySelector('#imageProc img');
	const currentImagePreview = document.querySelector('#imagePreview canvas');
	const ctx = currentImagePreview.getContext('2d');
	
	ctx.clearRect(0, 0, currentImagePreview.width, currentImagePreview.height);

	//currentImagePreview.width = currentImageProc.width; // Set canvas width
	//currentImagePreview.height = currentImageProc.height; // Set canvas height
    ctx.drawImage(currentImageProc, 0, 0);
	/* currentImagePreview.toDataURL('image/png') = '';
	currentImagePreview.toDataURL('image/png') = currentImageProc.src; */
    const saveFButton = document.querySelector('.saveFinalBtn');
	CKEDITOR.instances['result'].setData("");
	saveFButton.click();
	
}
</script>

<!-- Switch between edit and filters tab -->
<script>
function openTab(evt, tabName) {
	const imgProc = document.getElementById("ImageProc");
	const ckEdit = document.getElementById("CkEditor");
	 var imgPro = document.getElementById("imageProc");
	 if(tabName === "Filters"){
			imgProc.style.display = "block";
			ckEdit.style.display = "none";
			imgPro.style.display = "block";
			var imgSrc;
			
			 const lastSavedImage = cropHistory[cropHistory.length - 1];
/* 
		        if (lastSavedImage) {
		           
		        	imgSrc = lastSavedImage; // Use the last saved image from the array

		          
		        }
		        else{ */
		        	let divId = 'imagePreview';
					let divElement = document.getElementById(divId);
					

					if (divElement) {
					    // Find the img element within the div
					    let imgElement = divElement.querySelector('canvas'); // This gets the first <img> inside the div

					    if (imgElement) {
					        imgSrc = imgElement.toDataURL('image/png');; 
					        console.log(imgSrc); 
					    } else {
					        console.log('No image found in the div');
					        
					    }
					} else {
					    console.log('Div not found');
					    
					}
		        /* } */
			
			
			
			let imageElement = document.createElement('img');
		 //   imageElement.id = imageId;
		    imageElement.style.maxWidth = '100%';
		    imageElement.style.maxHeight = '100%';
		    imageElement.setAttribute('data-rotation', 0);
		    imageElement.style.objectFit = 'contain';
		    imageElement.src = imgSrc;
		    
		    imgPro.appendChild(imageElement);
		}
	 if(tabName === "Edit"){
		
		 imgProc.style.display = "none";
			ckEdit.style.display = "flex";
			
			imgPro.innerHTML = '';
	 }
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
console.log(evt);
	  // Show the clicked tab and add active class
	  if(tabName === "Edit"){
		  document.getElementById(tabName).style.display = "block";
	  }
if(tabName === "Filters"){
	document.getElementById(tabName).style.display = "flex";
	  }
	  
	  evt.currentTarget.className += " active";
	}

	// Show Edit tab by default
	document.getElementById("Edit").style.display = "block";

</script>

<!-- ocr image selection, displaying selected image, crop/rotate/undo/redo/save -->
<script>
let imagesMap = {}; 
let ocrResponseMap = {};

async function ocrImageChange() {
    const input = document.getElementById('ocr');
    const files = input.files;
    const imageContainer = document.getElementById('imageContainer');
    const imagePreview = document.getElementById('imagePreview');

    // Clear previous images
    imageContainer.innerHTML = '';
    imagePreview.style.display = 'none';
    document.getElementById('containerDiv').style.visibility = "visible";

    //let imagesMap = {};  // Create a map to store {imageId: base64String}

    for (let [index, file] of Array.from(files).entries()) {
        const fileType = file.type;

        if (!fileType.startsWith('image/')) {
            swal.fire("Please upload an image file!");
            input.value = '';
            return;
        }

        const now = new Date();
        const formattedDate = now.toLocaleDateString('en-GB').replace(/\//g, '');
        const formattedTime = now.toTimeString().split(' ')[0].replace(/:/g, '') + now.getMilliseconds().toString().padStart(3, '0');

      //  console.log(`Date: ${formattedDate}, Time: ${formattedTime}`);
        console.log(formattedDate+ "-----"+ formattedTime);
        
        let imageElement = document.createElement('img');
        imageElement.id = "img" + index + "_" + files.length + "-" + formattedDate + "-"+ formattedTime;
        console.log(imageElement.id);
        imageElement.style.maxWidth = '100px';
        imageElement.style.maxHeight = '200px';
        imageElement.dataset.index = index;

        const fileNameElement = document.createElement('div');
        const fileName = file.name.length > 20 ? file.name.slice(0, 17) + '...' : file.name;
        fileNameElement.innerText = fileName;

        let base64String = '';

        if (fileType === 'image/tiff' || fileType === 'image/tif') {
            // Handle TIFF image conversion
            const arrayBuffer = await file.arrayBuffer();
            const tiff = new Tiff({ buffer: arrayBuffer });
            const canvas = tiff.toCanvas();
            base64String = canvas.toDataURL('image/png'); // Convert TIFF to PNG as base64
            imageElement.src = base64String;

            // Add imageId and base64String to the map
            imagesMap[imageElement.id] = base64String;  // Append the base64 string for TIFF images
        } else {
            // For other image types
            const reader = new FileReader();
            reader.onload = function (e) {
                base64String = e.target.result;
                imageElement.src = base64String;

                // Add imageId and base64String to the map
                imagesMap[imageElement.id] = base64String;  // Append the base64 string for other image types
            };
            reader.readAsDataURL(file);
        }
		
        const checkboxElement = document.createElement('input');
        checkboxElement.type = 'checkbox';
        checkboxElement.dataset.index = index;
        checkboxElement.style.marginTop = '5px';
        
        // Create image preview (optional)
        let imageWrapper = document.createElement('div');
        imageWrapper.classList.add('image-wrapper');
        imageWrapper.appendChild(imageElement);
        imageWrapper.appendChild(fileNameElement);
        imageWrapper.appendChild(checkboxElement);
        imageContainer.appendChild(imageWrapper);
        
        // Add click event listener to the image element
        imageElement.addEventListener('click', function () {
            displaySelectedImage(this.dataset.index);
        });
    }
    document.getElementById("selectAllBtn").style.display = "block";
    document.getElementById("deSelectAllBtn").style.display = "block";
  //  updateSelectBtns();
    document.getElementById('ocrbtn').style.visibility = "visible";
  CKEDITOR.replace('result', {
        height: 400,
        resize_enabled: true
    });
    CKEDITOR.instances['result'].setData('');   
    // Wait for all images to be processed
    setTimeout(() => {
        // Send the imagesMap as JSON to the server
        sendImageFilesToServer(imagesMap);
    }, 1000);  // Adjust timeout as necessary
}
function convertToOCR() {
    console.log("Starting OCR conversion process...");

    const selectedCheckboxes = document.querySelectorAll('input[type="checkbox"]:checked');
    
    // Check if language and model are selected
    var e = document.getElementById("languages");
    var languages = e.options[e.selectedIndex].value.trim();
    console.log("Selected language:", languages);

    var m = document.getElementById("model");
    var model = m.options[m.selectedIndex].value.trim();
    console.log("Selected model:", model);

    var c = document.getElementById("col-type");
    var column = c.options[c.selectedIndex].value.trim();
    console.log("Selected column type:", column);

    if (model === "") {
        console.warn("Model selection is empty.");
        swal.fire("Please select a model.");
        return false;
    }

    if (languages === "") {
        console.warn("Language selection is empty.");
        swal.fire("Please select a language.");
        return false;
    }

    if (column === "") {
        console.warn("Column type selection is empty.");
        swal.fire("Please select a column type.");
        return false;
    }

    // If checkboxes are selected, confirm the OCR processing for all
    if (selectedCheckboxes.length > 0) {
        console.log("Selected checkboxes count:", selectedCheckboxes.length);
        swal.fire({
            title: 'Confirm OCR',
            text: "Do you want to process all the checked images for OCR Or the selected image only",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'All Checked',
            cancelButtonText: 'Selected one'
        }).then((result) => {
            if (result.isConfirmed) {
                console.log("User confirmed processing of selected images.");
                processSelectedImages(languages, model, column);  // Process selected images if confirmed
            } else {
            	// If no checkboxes are selected, proceed with the image in the preview div
                const canvas = document.querySelector('#imagePreview canvas');
                if (canvas) {
                	var canId = canvas.id
                	var index = canId.split('highlightCanvasimgP')[1];
                	var originalImageId = "img" + index;
                	const allImages = document.querySelectorAll('img[id^="img"]');
                    let imgElement = null;
                    let fullImageId = null;

                    // Loop through each image and check if the ID starts with 'img' + index
                    allImages.forEach(image => {
                        const splitId = image.id.split('_')[0]; // Split the image ID by '_'
                        
                        // If it matches the 'img' + index pattern, it's the desired image
                        if (splitId === originalImageId) {
                            imgElement = image;
                            fullImageId = image.id;
                        }
                    });
                	
                    if(imgElement){
                    	  const base64String = canvas.toDataURL('image/png');  // Convert canvas to base64
                          console.log("Processing image from canvas for OCR:", base64String);
                          const base64Strin = base64String.split(',')[1];  
                          sendOcrRequest(base64Strin, languages, model, column, fullImageId, "single");
                    }
                  
                } else {
                    console.warn("No image selected for OCR.");
                    swal.fire("No image selected for OCR.");
                }
            }
        });
    } else {
    	// If no checkboxes are selected, proceed with the image in the preview div
        const canvas = document.querySelector('#imagePreview canvas');
        if (canvas) {
        	var canId = canvas.id
        	var index = canId.split('highlightCanvasimgP')[1];
        	var originalImageId = "img" + index;
        	const allImages = document.querySelectorAll('img[id^="img"]');
            let imgElement = null;
            let fullImageId = null;

            // Loop through each image and check if the ID starts with 'img' + index
            allImages.forEach(image => {
                const splitId = image.id.split('_')[0]; // Split the image ID by '_'
                
                // If it matches the 'img' + index pattern, it's the desired image
                if (splitId === originalImageId) {
                    imgElement = image;
                    fullImageId = image.id;
                }
            });
        	
            if(imgElement){
            	  const base64String = canvas.toDataURL('image/png');  // Convert canvas to base64
                  console.log("Processing image from canvas for OCR:", base64String);
                  const base64Strin = base64String.split(',')[1];  
                  sendOcrRequest(base64Strin, languages, model, column, fullImageId, "single");
            }
          
        } else {
            console.warn("No image selected for OCR.");
            swal.fire("No image selected for OCR.");
        }
    }
}

// Function to process selected images (checked checkboxes)
async function processSelectedImages(languages, model, column) {
    console.log("Processing selected images...");

    const selectedCheckboxes = document.querySelectorAll('input[type="checkbox"]:checked');
    
    // Loop through each selected checkbox and process the corresponding image
    for (let checkbox of selectedCheckboxes) {
    	const index = checkbox.dataset.index;  // Get the index of the selected image
        const originalImageId = 'img' + index; // e.g., 'img0'
        let fullImageId = null;

        console.log("Current checkbox index = ", index); // Debug to check if index is populated
        
        if (!index) {
            console.warn("No index found for the checkbox.");
            continue;  // Skip to the next checkbox if no index is found
        }

        // Get all elements starting with 'img' prefix
        const allImages = document.querySelectorAll('img[id^="img"]');
        let imgElement = null;

        // Loop through each image and check if the ID starts with 'img' + index
        allImages.forEach(image => {
            const splitId = image.id.split('_')[0]; // Split the image ID by '_'
            
            // If it matches the 'img' + index pattern, it's the desired image
            if (splitId === originalImageId) {
                imgElement = image;
                fullImageId = image.id;
            }
        });
        
        if (imgElement) {
            const base64String = imgElement.src.split(',')[1];  // Remove 'data:image/jpeg;base64,' part
            console.log("Processing image at index:", index);
            console.log("Base64 string of the image:", base64String);

            const fullImageId = imgElement.id;  // Ensure full image ID is being used
            console.log("Full Image ID:", fullImageId);

            // Send OCR request for each image and pass the fullImageId to associate response with it
            await sendOcrRequest(base64String, languages, model, column, fullImageId, "multiple");
        } else {
            console.warn(`Image element with index ${index} not found.`);
        }
    }
}

// Function to send OCR request and store response
async function sendOcrRequest(base64String, languages, model, column, imageId, type) {
    var formData = new FormData();
    formData.append('ocr', base64String);
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
    cancelButtonImage.src = `${pageContext.request.contextPath}/resources/images/crosss.png`;
    cancelButtonImage.style.width = "25px";
    cancelButton.appendChild(cancelButtonImage);
    document.getElementById("addCancelBtn").appendChild(cancelButton);
    
    return new Promise((resolve, reject) => {
    	const jqXHR = $.ajax({
            url: 'ajax/converToOcr',
            type: 'post',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
            	if(response.error){
            		swal.fire("some error occured!");
            		 document.getElementById("overlay").style.display = "none";
            		 document.getElementById("addCancelBtn").removeChild(cancelButton);
            		return false;
            	}
            	else{
            		openTab(event, "Edit" );
            		console.log("OCR successfully performed:", response);

                    // Store the OCR response in the map using the imageId as the key
                  /*   ocrResponseMap[imageId] = {
                        'ocr-output': response.ocrOutput,
                        'image-info': { languages, model, column }
                    }; */
                   
                    ocrResponseMap[imageId] = {
                            'ocr-output': response['ocr-output'],
                            'image-info': response['image-info'],
                            'req-params': { languages, model, column }
                        };
                    console.log("Image info coordinates: "+ response['image-info']);
                    saveOcrTextToDb(ocrResponseMap);
                    if(type === "single"){
                    	detachTextSelectionEvent();
                    	//console.log("not formatted == "+ response['ocr-output']);
                    	if (CKEDITOR.instances['result']) {
                    		let formattedOcrOutput = response['ocr-output'].replace(/\n/g, '<br>');
                    		//console.log("formateed == "+formattedOcrOutput);
                            CKEDITOR.instances['result'].setData(formattedOcrOutput);
                    	}
                    	attachTextSelectionEvent(imgSrc);
                    }
                    	
                    	var imgElement = document.getElementById(imageId);
                    	const wordCount = {};
                        wordMapping = Object.values(ocrResponseMap[imgElement.id]['image-info']).map(info => {
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
                      //  console.log("Word mapping stored:", wordMapping);

                        // Attach event listener to detect selection
                        var imgSrc;
                       
                        
                        const canvas = document.querySelector('#imagePreview canvas');
                        if(canvas){
                        	//console.log("yes found div");
                        	 imgsrc = canvas.toDataURL('image/png');
                        }else{
                        	 imgSrc = imgElement.src;
                        }
                       // attachTextSelectionEvent(imgSrc);
                    
                    
                  //  console.log("id= "+ imageId);
                 //   console.log("its result = "+ ocrResponseMap[imageId]);
                    //console.log(`OCR output stored for imageId: ${imageId}`, ocrResponseMap[imageId]);
						 document.getElementById("overlay").style.display = "none";
						 document.getElementById("addCancelBtn").removeChild(cancelButton);
                    resolve(response);
            	}
                
            },
            error: function(xhr, status, error) {
        		// Check if the error was due to aborting
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
		document.getElementById("loader1").removeChild(cancelButton);
	}
        });
    	
    });
}


function sendImageFilesToServer(imagesMap) {
    $.ajax({
        url: 'ajax/saveAllToOcr',
        type: 'POST',
        contentType: 'application/json',  // Important: send data as JSON
        data: JSON.stringify(imagesMap),  // Convert imagesMap to JSON string
        success: function (response) {
            console.log("Files successfully sent to the server:", response);
        },
        error: function (error) {
            console.error("Error sending files to the server:", error);
        }
    });
}


    const imagePreview = document.getElementById('imagePreview');

 // Buttons
 const cropButton = document.querySelector('.crop-button');
 const saveButton = document.querySelector('#save-Button');
 const undoButton = document.querySelector('#undo-Button');
 const redoButton = document.querySelector('#redo-Button');
 const resetButton = document.querySelector('#reset-Button');
 const rotLButton = document.querySelector('.rotL-button');
 const rotRButton = document.querySelector('.rotR-button');
 const saveFButton = document.querySelector('.saveFinalBtn');
 const rotLButtonDiv = document.querySelector('#rotL-buttonDiv');
 const rotRButtonDiv = document.querySelector('#rotR-buttonDiv');
 const saveFButtonDiv = document.querySelector('#saveF-buttonDiv');
 
 let rotationDegrees = {};
 let currentRotationAngle = 0;  
 // Initialize variables
 let cropper;
 let cropHistory = [];
 let currentHistoryIndex = -1;
 const historyStack = [];
 let historyIndex = -1;
 let zoomLevel = 1;  // Default zoom level
 const zoomStep = 0.1; 
 let originalImageElement; 

 
let rotationAngle = 0;
 function rotateLeft() {
	    rotationAngle -= 90; // Decrease the angle
	    console.log("ROtated left = "+ rotationAngle);
	    drawRotatedImage();
	}

	// Rotate right functionality
	function rotateRight() {
	    rotationAngle += 90; // Increase the angle
	    console.log("ROtated right = "+ rotationAngle);
	    drawRotatedImage();
	}

	// Function to draw the rotated image
	function drawRotatedImage() {
		 const canvas = document.querySelector('#imagePreview canvas');
		    const ctx = canvas.getContext('2d');

		    const img = new Image();
		    img.src = canvas.toDataURL(); // current image source from canvas

		    img.onload = function() {
		        // Calculate new dimensions based on the rotation
		        let newWidth, newHeight;
		        if (rotationAngle % 180 === 0) {
		            newWidth = img.width;
		            newHeight = img.height;
		        } else {
		            newWidth = img.height;
		            newHeight = img.width;
		        }

		        // Resize the canvas to fit the rotated image
		        canvas.width = newWidth;
		        canvas.height = newHeight;

		        // Clear the canvas and draw the rotated image
		        ctx.clearRect(0, 0, canvas.width, canvas.height);
		        ctx.save();
		        ctx.translate(canvas.width / 2, canvas.height / 2); // Move to the center of canvas
		        ctx.rotate(rotationAngle * Math.PI / 180); // Rotate the image
		        ctx.drawImage(img, -img.width / 2, -img.height / 2); // Draw image centered
		        ctx.restore();

		        // Update the canvas's base64 image after rotation
		        const rotatedImageDataUrl = canvas.toDataURL(); 
		        originalImageElement.src = rotatedImageDataUrl;  // Update the original image source

		        // Save rotated image in history
		        saveToHistory(rotatedImageDataUrl);
	    };
	    
	    
	}

  let originalImageDataUrl;
  
 function displaySelectedImage(index) {
	 
	 resetStuff();
		detachTextSelectionEvent();
     const input = document.getElementById('ocr');
     const file = input.files[index];
     const fileType = file.type;
     const imageId = 'imgP' + index;

     openTab(event, "Edit");	
	 tabName = "Edit";
	
	 detachTextSelectionEvent();
	  // Show the clicked tab and add active class
	  document.getElementById(tabName).style.display = "block";
	  document.getElementById(tabName).classList.add("active");
     
	 
  // Hide the OK button
   
     document.getElementById('cancelCropButton').style.display = 'none';
     document.getElementById('okCropButton').style.display = 'none';

     // Show the other option buttons
     rotLButtonDiv.style.display = "flex";
     rotRButtonDiv.style.display = "flex";
     saveFButtonDiv.style.display = "flex";
     
     const can = document.querySelector('#imagePreview canvas');
     if(can){
    	 const ctx = can.getContext('2d');
         ctx.clearRect(0, 0, can.width, can.height);	 
     }
     let imageElement = document.createElement('img');
     imageElement.id = imageId;
     
     
     const canvas = document.createElement('canvas');
     canvas.id = 'highlightCanvas'+imageId;
     imagePreview.appendChild(canvas); // Append the canvas to the image preview container

     const context = canvas.getContext('2d');
	
     // Handle image loading
    if (fileType === 'image/tiff' || fileType === 'image/tif') {
        file.arrayBuffer().then(arrayBuffer => {
            const tiff = new Tiff({ buffer: arrayBuffer });
            const tiffCanvas = tiff.toCanvas(); 
            originalImageElement = new Image(); // Use this globally
            originalImageElement.src = tiffCanvas.toDataURL('image/png');

            originalImageElement.onload = function () {
                canvas.width = originalImageElement.width;
                canvas.height = originalImageElement.height;
                context.drawImage(originalImageElement, 0, 0);
                originalImageDataUrl = canvas.toDataURL();
                console.log("TIFF image drawn on canvas.");
            };
        });
        saveToHistory(originalImageElement.src);
    } else {
        originalImageElement = new Image();
        originalImageElement.src = URL.createObjectURL(file);

        originalImageElement.onload = function () {
            canvas.width = originalImageElement.width;
            canvas.height = originalImageElement.height;
            context.drawImage(originalImageElement, 0, 0);
            originalImageDataUrl = canvas.toDataURL();
            console.log("Non-TIFF image drawn on canvas.");
        };
        saveToHistory(originalImageElement.src);
    }
     
     
    const originalImageId = 'img' + index; // e.g., 'img0'
    let fullImageId = null;

    // Get all elements starting with 'img' prefix
    const allImages = document.querySelectorAll('img[id^="img"]');
    let imgElement = null;

    // Loop through each image and check if the ID starts with 'img' + index
    allImages.forEach(image => {
        const splitId = image.id.split('_')[0]; // Split the image ID by '_'
        
        // If it matches the 'img' + index pattern, it's the desired image
        if (splitId === originalImageId) {
            imgElement = image;
            fullImageId = image.id;
        }
    });
	if(ocrResponseMap){
    if (imgElement && ocrResponseMap[imgElement.id]) {
        const ocrResult = ocrResponseMap[imgElement.id]['ocr-output'].replace(/\n/g, '<br>');
        console.log("OCR Result: ", ocrResult);
        if (CKEDITOR.instances['result']) {
            CKEDITOR.instances['result'].setData(ocrResult);
            
            const wordCount = {};
            wordMapping = Object.values(ocrResponseMap[imgElement.id]['image-info']).map(info => {
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
            var imgSrc = imgElement.src;
            attachTextSelectionEvent(imgSrc);
            
        } else {
            console.log("CKEditor instance 'result' is not initialized.");
        }
        
    } else {
    	   CKEDITOR.instances['result'].setData('');
        console.log(`Image with id ${imgElement ? imgElement.id : 'undefined'} not found in ocrResponseMap.`);
    }
	}
	

    // imagePreview.appendChild(imageElement);
//canvas.addEventListener('wheel', handleZoom);
    
     // Handle crop button click
     cropButton.addEventListener('click', function() {
    	 const canvas = document.getElementById('highlightCanvas'+imageId);
    	    const base64Image = canvas.toDataURL('image/png');
         if (cropper) {
             cropper.destroy();  // Destroy existing cropper if present
         }
      
         document.getElementById('cancelCropButton').style.display = 'flex';
         document.getElementById('okCropButton').style.display = 'flex';
         rotLButtonDiv.style.display = "none";
         cropButton.style.display = "none";
         rotRButtonDiv.style.display = "none";
         saveFButtonDiv.style.display = "none";
         cropper = new Cropper(canvas, {});
     }); // Ensures Cropper is initialized once per image load

     // Save the cropped image on Save button click
     saveButton.addEventListener('click', function() {
         if (cropper) {
             const croppedCanvas = cropper.getCroppedCanvas();
             if (croppedCanvas) {
            	 const canvas = document.getElementById('highlightCanvas'+imageId);
            	 const context = canvas.getContext('2d');
            	 
            	 const croppedDataURL = croppedCanvas.toDataURL('image/png');
                 const currentImageElement = imagePreview.querySelector('img'); // Get the current image element
                 currentImageElement.src = croppedDataURL; // Update the current image element with the cropped image
                 const img = new Image();
                 img.src = currentImageElement.src;
                 
                 img.onload = function () {
                     canvas.width = img.width; // Set canvas width
                     canvas.height = img.height; // Set canvas height
                     context.drawImage(img, 0, 0); // Draw the image on canvas
                     console.log("Image drawn on canvas.");
                 //    attachTextSelection(croppedDataURL);
                 };
                
  // Push the cropped image into the history stack
                 saveToHistory(croppedDataURL);

                 // Destroy cropper after saving
                 cropper.destroy();
                 cropper = null;
                originalImageElement.src = croppedDataURL;
             }
         }
        
         if (CKEDITOR.instances['result']) {
             CKEDITOR.instances['result'].setData('');
         }
         
         // Hide the OK button
         document.getElementById('cancelCropButton').style.display = 'none';
         document.getElementById('okCropButton').style.display = 'none';

         // Show the other option buttons
         rotLButtonDiv.style.display = "flex";
         rotRButtonDiv.style.display = "flex";
         saveFButtonDiv.style.display = "flex";
         cropButton.style.display = "flex";
     });

     saveFButton.addEventListener('click', function() {
      
    	 Swal.fire({
    		    title: "Do you want to save (This will replace your original image with this image)?",
    		    icon: "question",
    		    showCancelButton: true,
    		    confirmButtonColor: "#3085d6",
    		    cancelButtonColor: "#d33",
    		    confirmButtonText: "Yes"
    		}).then((result) => {
    		    if (result.isConfirmed) {
    		    	  cropHistory = [];
		                 currentHistoryIndex = -1;
		                 updateUndoRedoButtons();
    		    	 const imagePreview = document.getElementById('imagePreview');
    		         const canvas = document.getElementById('highlightCanvas'+imageId);
    		    	 const context = canvas.getContext('2d');
    		    	 
    		         // Extract the index from the imagePreview ID
    		         const index = imageId.replace('imgP', ''); // This will give you the index (e.g., '0' for 'imgP0')

    		         // Build the original image ID
    		         
    		         const originalImageId = 'img' + index; // e.g., 'img0'
    		         let fullImageId = null;
    		      // Get all elements starting with 'img' prefix
    		         const allImages = document.querySelectorAll('img[id^="img"]');

    		         // Loop through each image and check if the ID starts with 'img' + index
    		         let originalImageEle = null;
    		         allImages.forEach(image => {
    		             // Split the image ID by '_' and check the first part
    		             const splitId = image.id.split('_')[0];
    		             
    		             // If it matches the 'img' + index pattern, it's the desired image
    		             if (splitId === originalImageId) {
    		                 originalImageEle = image;
    		                 fullImageId = image.id; 
    		             }
    		         });
    		         // Get the original image element
    		         // originalImageEle = document.getElementById(originalImageId);

    		         if (originalImageEle) {
    		        	 
    		        	    const base64Image = canvas.toDataURL('image/png');
    		             // Replace the src of the original image with the current image preview src
    		             originalImageEle.src = base64Image;

    		             // Ensure that subsequent clicks open the new image in the preview bar
    		             originalImageEle.onclick = function() {
    		            	 
    		            	 imagePreview.innerHTML = ''; // Clear previous preview
    		            	 const newCanvas = document.createElement('canvas');
    		            	 newCanvas.id = 'highlightCanvas'+imageId;
    		                 imagePreview.appendChild(newCanvas); // Append the canvas to the image preview container

    		                 const context = newCanvas.getContext('2d');

    		                 // Load the image to the canvas
    		                 const img = new Image();
    		                 img.src = originalImageEle.src;

    		                 img.onload = function () {
    		                	 newCanvas.width = img.width; // Set canvas width
    		                	 newCanvas.height = img.height; // Set canvas height
    		                     context.drawImage(img, 0, 0); // Draw the image on canvas
    		                     console.log("Image drawn on canvas.");
    		                 }; 
    		               
    		                
    		              //   saveToHistory(newPreviewImage.src);  // Save the new image to the history stack for undo/redo
    		             };
    		              
    		             updateImageInDB(fullImageId,originalImageEle.src);
    		             if (CKEDITOR.instances['result']) {
    		                 CKEDITOR.instances['result'].setData('');
    		             }
    		             ocrResponseMap[fullImageId]['ocr-output'] = '';
    		           
    		             

    		             // Optionally adjust the display of the replaced image
    		           //  adjustImageSize(originalImageElement);
    		         } else {
    		             console.error(`Original image with ID ${originalImageId} not found.`);
    		         }
    		     
    		            }
    		 else {
    				return;
    			}
    		});
     });
 }
 
 function saveOcrEditedText(){
	 var editor = CKEDITOR.instances.result;

     // Fetch the content from CKEditor
     if (editor) {
         var content = editor.getData();
         var tempElement = document.createElement('div');
         tempElement.innerHTML = content;  // Set the inner HTML
         var textContent = tempElement.textContent || tempElement.innerText;  // Get the text content

         console.log("Fetched text content: ", textContent);

     }
     let fullImageId = null;
     const canvas = document.querySelector('#imagePreview canvas');
     if (canvas) {
     	var canId = canvas.id;
     	var index = canId.split('highlightCanvasimgP')[1];
     	var originalImageId = "img" + index;
     	const allImages = document.querySelectorAll('img[id^="img"]');
         

         // Loop through each image and check if the ID starts with 'img' + index
         allImages.forEach(image => {
             const splitId = image.id.split('_')[0]; // Split the image ID by '_'
             
             // If it matches the 'img' + index pattern, it's the desired image
             if (splitId === originalImageId) {
                 fullImageId = image.id;
             }
         });
     }
     let formData = new FormData();
     formData.append("id", fullImageId);
	    formData.append("content", textContent);
	    formData.append("type", "ocr-text");
	   
	    $.ajax({
	        url: 'ajax/updateImgInDb',
	        type: 'post',
	        data: formData,
	        processData: false, // Prevents jQuery from converting the FormData into a string
	        contentType: false, // Tells jQuery not to set Content-Type header (it will be set automatically)
	        success: function(response) {
	            console.log("ocr text updated successfully:", response);
	        },
	        error: function(xhr, status, error) {
	            console.error("Error updating text:", xhr.responseText);
	        }
	    });
	
 }
 async function updateImageInDB(id, base64) {
	    let formData = new FormData();
	    formData.append("id", id);
	    formData.append("base64", base64);
	    formData.append("type", "image-src");
		
	   // alert("here");
	    $.ajax({
	        url: 'ajax/updateImgInDb',
	        type: 'post',
	        data: formData,
	        processData: false, // Prevents jQuery from converting the FormData into a string
	        contentType: false, // Tells jQuery not to set Content-Type header (it will be set automatically)
	        success: function(response) {
	            console.log("Image updated successfully:", response);
	        },
	        error: function(xhr, status, error) {
	            console.error("Error updating image:", xhr.responseText);
	        }
	    });
	}


 function resetStuff(){
	 // CKEDITOR.instances['result'].setData("");
	  const imagePreview = document.getElementById('imagePreview'); // Ensure imagePreview is defined
	     imagePreview.innerHTML = '';
	     imagePreview.style.display = 'block';
    const imageProc = document.getElementById('imageProc'); // Ensure imagePreview is defined
	     imageProc.innerHTML = '';
	   
	     cropHistory = [];
	     currentHistoryIndex = -1;
	     updateUndoRedoButtons();
 }
 
 
 function disableCropper() {
	
	    if (cropper) {
	        cropper.destroy();
	        cropper = null;
	        document.getElementById('cancelCropButton').style.display = 'none';
	        document.getElementById('okCropButton').style.display = 'none';// Hide the cancel button
	    }
	    saveFButtonDiv.style.display = "flex";
	    rotLButtonDiv.style.display = "flex";
	    rotRButtonDiv.style.display = "flex";
	    cropButton.style.display = "flex";
	}

	// Add event listener for cancel button
	document.getElementById('cancelCropButton').addEventListener('click', disableCropper);
 function resizeImageAfterCrop(imgElement) {
	    imgElement.style.maxWidth = "100%";
	    imgElement.style.maxHeight = "100%";
	    imgElement.style.objectFit = "contain";
	}
 

// Function to apply the current rotation and redraw the image on the canvas
function rotateImage() {
  const originalImage = document.querySelector('#imagePreview img');  // Your image element
  const canvas = document.createElement('canvas');
  const ctx = canvas.getContext('2d');
  let imgSrc = originalImage.src;
	
  console.log("Original image source:", imgSrc);

  if (imgSrc.startsWith("blob:")) {
    console.log("Image source is a blob URL.");
    
    fetch(imgSrc)
      .then(response => response.blob())
      .then(blob => {
        const img = new Image();
        const url = URL.createObjectURL(blob);  // Create an object URL from the blob
        img.src = url;
        console.log("Created object URL for blob:", url);

        img.onload = function() {
          console.log("Image loaded for rotation.");

          // Adjust canvas dimensions based on the current rotation angle
          if (currentRotationAngle % 180 === 0) {
            canvas.width = img.width;
            canvas.height = img.height;
          } else {
            canvas.width = img.height;
            canvas.height = img.width;
          }

          console.log("Canvas dimensions set to:", canvas.width, canvas.height);

          // Translate and rotate the canvas
          ctx.clearRect(0, 0, canvas.width, canvas.height);
          ctx.translate(canvas.width / 2, canvas.height / 2);
          ctx.rotate((currentRotationAngle * Math.PI) / 180);
          ctx.drawImage(img, -img.width / 2, -img.height / 2);

          // Update the image preview with the new rotated image
          const newImgSrc = canvas.toDataURL('image/png');  // Convert rotated image to base64
          originalImage.src = newImgSrc;  // Update the original image's source
          console.log("Image rotated and updated.");
          saveToHistory(newImgSrc);
          currentRotationAngle = 0;

          URL.revokeObjectURL(url);  // Revoke the object URL to free up memory
          console.log("Object URL revoked.");
        };
      })
      .catch(error => {
        console.error("Error fetching blob for rotation:", error);
        swal.fire("Error processing image.");
      });
  } else {
    console.log("Image source is not a blob URL.");

    // Handle normal base64 or URL images
    const img = new Image();
    img.src = imgSrc;

    img.onload = function() {
      console.log("Image loaded for rotation (base64 or URL).");

      // Adjust canvas dimensions based on the current rotation angle
      if (currentRotationAngle % 180 === 0) {
        canvas.width = img.width;
        canvas.height = img.height;
      } else {
        canvas.width = img.height;
        canvas.height = img.width;
      }

      console.log("Canvas dimensions set to:", canvas.width, canvas.height);

      // Translate and rotate the canvas
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      ctx.translate(canvas.width / 2, canvas.height / 2);
      ctx.rotate((currentRotationAngle * Math.PI) / 180);
      ctx.drawImage(img, -img.width / 2, -img.height / 2);

      // Update the image preview with the new rotated image
      const newImgSrc = canvas.toDataURL('image/png');  // Convert rotated image to base64
      originalImage.src = newImgSrc;  // Update the original image's source
      saveToHistory(newImgSrc); 
      currentRotationAngle =0;
      console.log("Image rotated and updated.");
    };

    img.onerror = function() {
      console.error("Error loading the image for rotation.");
    };
  }
}

	function adjustImageSize(imgElement) {
	    const container = imgElement.parentElement;
	    const containerAspectRatio = container.offsetWidth / container.offsetHeight;
	    const imageAspectRatio = imgElement.naturalWidth / imgElement.naturalHeight;

	    if (imageAspectRatio > containerAspectRatio) {
	        imgElement.style.width = "100%";
	        imgElement.style.height = "100%";
	    } else {
	        imgElement.style.width = "auto";
	        imgElement.style.height = "100%";
	    }
	}
	
//Save the current cropped state to the history stack
 function saveToHistory(croppedDataURL) {
     // Remove future states if new crop is made after undo
     cropHistory = cropHistory.slice(0, currentHistoryIndex + 1);

     // Push the new cropped image into the history
     cropHistory.push(croppedDataURL);
     currentHistoryIndex++;
     
     updateUndoRedoButtons();
 }
 // Undo function to revert to previous cropped state
 function undoCrop() {
	 CKEDITOR.instances['result'].setData("");
     if (currentHistoryIndex > 0) {
         currentHistoryIndex--;
         applyCropHistory();
         updateUndoRedoButtons();  // Update button states
     }
 }

 // Redo function to move forward in the cropped history
 function redoCrop() {
	 CKEDITOR.instances['result'].setData("");
     if (currentHistoryIndex < cropHistory.length - 1) {
         currentHistoryIndex++;
         applyCropHistory();
         updateUndoRedoButtons();  // Update button states
     }
 }
 
 function reset(){
	 CKEDITOR.instances['result'].setData("");
	 if(cropHistory[0]){
		 const imageElement = imagePreview.querySelector('canvas');
         const ctx = imageElement.getContext('2d');
        
         const img = document.createElement('img');
         img.src = cropHistory[0];
         img.onload = function () {
             // Adjust canvas size to match the image dimensions
             imageElement.width = img.width;
             imageElement.height = img.height;

             // Clear the canvas
             ctx.clearRect(0, 0, imageElement.width, imageElement.height);

             // Draw the restored image onto the canvas
             ctx.drawImage(img, 0, 0);

             // Destroy existing Cropper instance if any
             if (cropper) {
                 cropper.destroy();
             }
            
         };
	 }
	  undoButton.disabled = true;
	  redoButton.disabled = true;
	 
 }
 
 
 // Apply the cropped state from the history
 function applyCropHistory() {
     if (cropHistory[currentHistoryIndex]) {
         const imageElement = imagePreview.querySelector('canvas');
         const ctx = imageElement.getContext('2d');
        
         const img = document.createElement('img');
         img.src = cropHistory[currentHistoryIndex];
         img.onload = function () {
             // Adjust canvas size to match the image dimensions
             imageElement.width = img.width;
             imageElement.height = img.height;

             // Clear the canvas
             ctx.clearRect(0, 0, imageElement.width, imageElement.height);

             // Draw the restored image onto the canvas
             ctx.drawImage(img, 0, 0);

             // Destroy existing Cropper instance if any
             if (cropper) {
                 cropper.destroy();
             }
            
         };
         console.log("ROtated  = "+ rotationAngle);
         rotationAngle = 0;
         console.log("ROtated  = "+ rotationAngle);
         originalImageElement.src = img.src;
     }
 }
 function updateUndoRedoButtons() {
	    // Disable undo if there is nothing to undo (no past history)
	    if (currentHistoryIndex <= 0) {
	        undoButton.disabled = true;
	    } else {
	        undoButton.disabled = false;
	    }

	    // Disable redo if there is nothing to redo (no future history)
	    if (currentHistoryIndex >= cropHistory.length - 1) {
	        redoButton.disabled = true;
	    } else {
	        redoButton.disabled = false;
	    }
	}
 // Add event listeners for Undo and Redo buttons
 undoButton.addEventListener('click', undoCrop);
 redoButton.addEventListener('click', redoCrop);
resetButton.addEventListener('click', reset);
 updateUndoRedoButtons();
    function selectAllImages() {
        const checkboxes = document.querySelectorAll('.image-wrapper input[type="checkbox"]');
        checkboxes.forEach(checkbox => checkbox.checked = true);
     //   updateSelectBtns();
    } 
    
    function deSelectAllImages() {
        const checkboxes = document.querySelectorAll('.image-wrapper input[type="checkbox"]');
        checkboxes.forEach(checkbox => checkbox.checked = false);
    //    updateSelectBtns();
    } 
    function updateSelectBtns(){
    	const checkboxes = document.querySelectorAll('.image-wrapper input[type="checkbox"]');
        const selectAllBtn = document.getElementById("selectAllBtn");
        const deSelectAllBtn = document.getElementById("deSelectAllBtn");
        
        const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
        const anyChecked = Array.from(checkboxes).some(checkbox => checkbox.checked);
        
        selectAllBtn.disabled = allChecked; // Disable if all are checked
        deSelectAllBtn.disabled = !anyChecked; // Disable if none are checked
    }
</script>

<!-- update language and column selections -->
<script>

function updateSelections() {
    var model = document.getElementById('model').value;
    var languageSelect = document.getElementById('languages');
    var colTypeDiv = document.getElementById('col-type-div');
    var colType = document.getElementById('col-type');

    // Clear existing options
    languageSelect.innerHTML = '';
    colType.innerHTML = '';
    if (model === 'tess') {
    	
    	document.getElementById("langDiv").style.display = "block";
    	 colTypeDiv.style.display = 'block';
    	//document.getElementById("colDiv").style.display = "block";
        // Add options for Tesseract
        languageSelect.options.add(new Option('Language Selection', ''));
        languageSelect.options.add(new Option('English', 'english'));
        languageSelect.options.add(new Option('Hindi', 'hindi'));
        languageSelect.options.add(new Option('Odia', 'odia'));
        languageSelect.options.add(new Option('Bengali', 'bangla'));
        languageSelect.options.add(new Option('Assamese', 'assamese'));
	
        colType.options.add(new Option('Single Column', 'single_column'));
        colType.options.add(new Option('Double Column', 'double_column'));
        
        // Show column type dropdown
       
    } else if (model === 'cnn') {
    	document.getElementById("langDiv").style.display = "block";
    	colTypeDiv.style.display = 'block';
        // Add options for CNN
        languageSelect.options.add(new Option('Language Selection', ''));
        languageSelect.options.add(new Option('Bengali', 'bangla'));
        languageSelect.options.add(new Option('Assamese', 'assamese'));
        languageSelect.options.add(new Option('Odia', 'odia'));
		
        
        colType.options.add(new Option('Single Column', '--psm 6 --oem 3'));
        colType.options.add(new Option('Double Column', '--psm 12 --oem 3'));
        colType.options.add(new Option('Sparse Text', '--psm 11 --oem 3'));
        // Hide column type dropdown
        
    } else {
        // No model selected, hide column type dropdown
        colTypeDiv.style.display = 'none';
    }
}
</script>



   <script>
   document.addEventListener("DOMContentLoaded", function() {
	    var editorDiv = document.getElementById("cke_1_contents");
	    if (editorDiv) {
	        editorDiv.style.height = "500px";
	    }
	});

</script>

<script>
    var selectedLanguage = ''; // Variable to store the selected language
    var imageIndex = 0; // Index to keep track of the current image being displayed

    // Define an object to store image-text pairs for each language
    var languageData = {
        'bangla': [
            { 'image': '${pageContext.request.contextPath}/resources/images/bangla1.png', 'text': '${pageContext.request.contextPath}/resources/textfiles/bangla4.txt' },
            { 'image': '${pageContext.request.contextPath}/resources/images/bangla3.jpg', 'text': '${pageContext.request.contextPath}/resources/textfiles/bangla3.txt'}
        ],
        'odia': [
            { 'image': '${pageContext.request.contextPath}/resources/images/odia1.jpg', 'text': '${pageContext.request.contextPath}/resources/textfiles/odia4.txt' },
            { 'image': '${pageContext.request.contextPath}/resources/images/odia3.bmp', 'text': '${pageContext.request.contextPath}/resources/textfiles/odia3.txt' }
        ],
        'hindi': [
            { 'image': '${pageContext.request.contextPath}/resources/images/hindi1.jpg', 'text': '${pageContext.request.contextPath}/resources/textfiles/hindi1.txt' },
            { 'image': '${pageContext.request.contextPath}/resources/images/hindi2.jpg', 'text': '${pageContext.request.contextPath}/resources/textfiles/hindi2.txt' },
            {'image': '${pageContext.request.contextPath}/resources/images/hindi3.jpg', 'text': '${pageContext.request.contextPath}/resources/textfiles/hindi3.txt' }
        ]
        // Add more language-image-text pairs as needed
    };

    function languageSelection() {
    	if(document.getElementById("ocr").files.length == 0){
        selectedLanguage = document.getElementById('languages').value;
        var resultTextarea = document.getElementById('result');

        // Clear preview
        var previewImg = document.getElementById('previewimg');
        previewImg.src = ''; // Clear the preview image

		// Show the first image for the selected language
        imageIndex = 0;
        showImage();
    }}

    // Function to display the next image
    function nextImage() {
        imageIndex++;
        if (imageIndex >= languageData[selectedLanguage].length) {
            imageIndex = 0; // Loop back to the first image if at the end
        }
        showImage();
    }

    // Function to display the previous image
    function previousImage() {
        imageIndex--;
        if (imageIndex < 0) {
            imageIndex = languageData[selectedLanguage].length - 1; // Loop back to the last image if at the beginning
        }
        showImage();
    }

    // Function to show the current image and corresponding text
    function showImage1() {
        var previewImg = document.getElementById('previewimg');
        previewImg.src = languageData[selectedLanguage][imageIndex].image;
        
        CKEDITOR.instances['result'].setData(languageData[selectedLanguage][imageIndex].text);
        document.getElementById("next").style.display = "block";
    }
    
    function showImage() {
        var previewImg = document.getElementById('previewimg');
        var textFilePath = languageData[selectedLanguage][imageIndex].text;
        document.getElementById('ocrbtn').style.visibility = "visible";
        // Set the image source
        previewImg.src = languageData[selectedLanguage][imageIndex].image;

        // Check if the text value is a file path
        if (textFilePath.startsWith('${pageContext.request.contextPath}/resources/textfiles/')) {
            // Extract the filename from the path
            //var fileName = textFilePath.substring(textFilePath.lastIndexOf('/') + 1);
            
            // Fetch the content of the text file
            fetch(textFilePath)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    
                    return response.text();
                })
                .then(data => {
                    // Set the text content in CKEditor
                    data = data.replace(/\n/g, '<br>');
                    console.log(data);
                    CKEDITOR.replace('result',{
                    	height:400,
                    	resize_enabled:true                    	
                    });
                    
                    CKEDITOR.instances['result'].setData(data);
                })
                .catch(error => {
                    console.error('There was a problem fetching the text file:', error);
                });
        } else {
            // If the text value is not a file path, set it directly in CKEditor
            CKEDITOR.instances['result'].setData(textFilePath);
        }
        document.getElementById("next").style.display = "block";
   
    }

   
</script>
	

    <script>



        //  async   function content() {


        //     const image = document.getElementById("ocr")
        //  const file = image.files[0]
        //   console.log(file)
        // const url = await toBase64(file)
        // console.log(url)

        //     }


        const toBase64 = file => new Promise((resolve, reject) => {
                const reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = () => resolve((reader.result).split(",")[1]);
                reader.onerror = error => reject(error);
            });


        async function content() {

            const image = document.getElementById("ocr").files[0]
            const previewimg = document.getElementById("previewimg")
            const base64 = await toBase64(image)
            previewimg.setAttribute('src', URL.createObjectURL(image))
            const loader = document.getElementById("loader")
            loader.classList.remove('d-none')
            ev.setAttribute('disabled', 'true')
            fetch("http://10.226.30.33:8081/post_json", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",

                },
                body: JSON.stringify({
                    "image-content": base64
                })

            })
                    .then((response) => response.json())
                    .then((data) => {
                        console.log(data)
                        //  we used value for input 
                        // we used innerhtml or innertext for all other tag meams which are not input , textarea , select
                        CKEDITOR.instances['result'].setData(data['ocr-output'])
                        // document.getElementById("result").value = data['ocr-output']
                        loader.classList.add('d-none')
                        ev.removeAttribute('disabled')
                    })
                    .catch((error) => {
                        console.error(error);
                        loader.classList.add('d-none')
                        ev.removeAttribute('disabled')
                    });

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
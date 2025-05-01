<%-- 
    Document   : mt
    Created on : 25 May, 2023, 4:54:05 PM
    Author     : cdac
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
         <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/tinymce/js/tinymce/tinymce.min.js" referrerpolicy="origin"></script>

        <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
		<link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
        
        <script src="${pageContext.request.contextPath}/resources/jsScript/microservices.js" type="text/javascript"></script>
         <script src="${pageContext.request.contextPath}/resources/jsScript/tiff.min.js" type="text/javascript"></script>
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
.topnav {
    overflow: hidden;
    background-color: #7683ff69;
    /*position: fixed;*/
}

</style>
<style>
         #image-preview {
            max-width: 100%;
            max-height: 100%;
            object-fit: contain; /* Ensures the image fits within the dimensions */
        }

        .modal-dialog {
            max-width: 33%; /* Adjust the width of the modal dialog */
        }
    </style>

        <title>JSP Page</title>
    </head>

<!--    <style>
        .icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 80px;
            height: 60px;
            cursor: pointer;
        }

        .arrow {
            position: absolute;
            top: 25px;
            width: 90%;
            height: 10px;
            background-color: #fff;
            box-shadow: 0 3px 5px rgba(0, 0, 0, .2);
            animation: arrow 700ms linear infinite;
        }

        .arrow::after, .arrow::before {
            content: '';
            position: absolute;
            width: 60%;
            height: 10px;
            right: -8px;
            background-color: #fff;
        }

        .arrow::after {
            top: -12px;
            transform: rotate(45deg);
        }

        .arrow::before {
            top: 12px;
            box-shadow: 0 3px 5px rgba(0, 0, 0, .2);
            transform: rotate(-45deg);
        }
    </style>-->


    <body class ="body_bg" style="background-repeat: no-repeat;
    overflow:hidden; height:96vh">
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
		</div>
		</div>
		
		
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
<a href="${pageContext.request.contextPath}/docTrans" target="_blank"  style="background: #eaffe5; color: #0c9110; font-weight: 700;"><i class="bi bi-gear"></i> Image Translation</a>
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
		
        <form id="mtform">
            <section class="container my-5" style="margin-top:1rem !important">
                <div class="container">


                    <div class="row">
                        <div class="col-12 mx-auto">
                        <h3 class="text-center" style="margin-top:0;margin-bottom:10px;color:#ffffffe0 !important">Indian Languages OCR and Translation</h3>
                            <!-- <h3  class="text-center text-dark" style="color:#b51717e0 !important">Indian Languages OCR and Translation</h3> -->

							   <div class="col-sm-12" style=" flex-flow:row; gap:2%">
                   
                    <div class="card border-0 shadow-lg">
                        <div class="card-body" style="padding:0">
                            <form>

                                <div class="form-group">
                                    <input type="file" id="ocr" class="form-control" onchange="ocrImageChange()">
                                </div>
                                
                                
                                <div class="spinner-border spinner-border-sm ms-2 d-none" id="loader" role="status">
                                    <span class="sr-only"></span>
                                </div>
                                
                            </form>
                           
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="showImageModal()" id="previewButton" style="padding:3px;display:none;margin-top:4px">
    Show Image Preview
</button></div>
                    
                    <div class="col-sm-12" style="display:flex">
                    
                    <div style="margin-top:6px"> 
      <select name="model" id="model"  style="border:1px solid red;width:100%;padding:0; padding-left:3px" onchange="updateSelections()">
            <option value="">Select Model</option>
            <option value="tess">Model 1</option>
            <option value="cnn">Model 2</option>
        </select>
    </div>
    
    <div style="margin-top:6px;display: none" id="col-type-div">
        <select name="col-type" id="col-type" style="height:23px;border-radius:5px">
            <option value="">Column type</option>
            <option value="single_column">Single Column</option>
            <option value="double_column">Double Column</option>
        </select>
    </div>
                    </div>
                    
                    
                    <div class="col-sm-12" style="display:flex">
                    	<div class="col-sm-6" id="langDiv" style="margin-top:10px;display:none">
                    	Choose source language: 
        <select name="languages" id="languages" style="height:23px;border-radius:5px">
            <option value="">Language Selection</option>
        </select>
    </div>
						<div class="col-sm-6"  id="deslangDiv" style="margin-top:10px; text-align:center; display:none">
						Choose destination language: <select name="languages" id="destLanguages" style="height:23px;border-radius:5px; border:1px solid green" >
							<option value="">Language Selection</option>
							<option value="asm">Assamese</option>
							<option value="ben">Bangla</option>
							<option value="ori">Odia</option>
							<option value="hin">Hindi</option>

						</select>
						</div>
                    </div>
                   <!--  <div style="margin-top:17px; text-align:right"> </div>
                                    -->
  <div class="container mt-2">
                                <div class="row">
                                    <div class="col-sm-5 form-group">
                                        <textarea class="form-control" id="src_text" name="src_text" placeholder="Text" rows="16" style="height:400px;border:1px solid red;"></textarea>
                                    </div>
                                    <div class="col-sm-2 form-group ">
                                        <div class="icon" style="margin-top: 110%;">
                                           <div style="margin-bottom: 15px; margin-top:10px; text-align: center;">
                                        <!-- <input type="button" class="btn btn-primary" id="translatebutton" value="OCR and Translate"
                                               onclick="convertToOcrTrans();" /> -->
                                              <button type="button" class="btn-primarygg" id="translatebutton" onclick="convertToOcrTrans()" style="background:inherit; border:0" title="OCR and Translate">
<img src="${pageContext.request.contextPath}/resources/images/image-translation.png" style="width:45%;"></button></div>
                                        </div>
                                    </div>


                                    <div class="col-sm-5 form-group ">
                                        <textarea class="form-control" id="trans_text" placeholder="" rows="16" style="height:400px;border:1px solid green;"></textarea>
                                    </div>

                                    <div style="margin-bottom: 15px; margin-top:10px; text-align: right;">
                                        
                                        <input type="button" class="btn btn-info" id="translatebutton" value="Copy"
                                               onclick="copy();" />
                                        <input type="button" class="btn btn-danger" id="translatebutton" value="Clear"
                                               onclick="clearTranscription();" />
                                    </div>

                                </div>


                            </div>


                            </div>
                        </div>
                    </div>
            </section>
        </form>
        <!-- Modal -->
<div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height:80vh;max-height:85vh">
            <div class="modal-header" style="    border: 1px solid yellow;
    background: #f7ecba;">
                <h5 class="modal-title text-center" id="imageModalLabel" style="width:100%">Image Preview</h5>
                <button type="button" onclick="closeModal()" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="overflow:auto; text-align:center;    background: beige;
    border: 1px solid yellow;">
                <img id="image-preview" alt="Image Preview">
            </div>
        </div>
    </div>
</div>
            <!--  <footer>
            <div class="container">
                <div class="eleven columns">
                    <p>Website Content Managed by SNLP. Designed and Developed by Centre for Development of Advanced Computing ( CDAC )</p>

                </div>
                <div class="three columns"> <span class="typcn typcn-social-facebook-circular socialIcons"></span> <span class="typcn typcn-social-instagram-circular socialIcons"></span> <span class="typcn typcn-social-google-plus-circular socialIcons"></span> <span class="typcn typcn-social-linkedin-circular socialIcons"></span> </div>
            </div>
        </footer> -->
        
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
    <script>
    function showImageModal() {
        $('#imageModal').modal('show');
    }
    function closeModal(){
    	$('#imageModal').modal('hide');
    }
    </script>
<script>
function updateSelections() {
    var model = document.getElementById('model').value;
    var languageSelect = document.getElementById('languages');
    var colTypeDiv = document.getElementById('col-type-div');

    // Clear existing options
    languageSelect.innerHTML = '';

    if (model === 'tess') {
    	
    	document.getElementById("langDiv").style.display = "block";
    	//document.getElementById("colDiv").style.display = "block";
        // Add options for Tesseract
        languageSelect.options.add(new Option('Language Selection', ''));
        languageSelect.options.add(new Option('English', 'english'));
        languageSelect.options.add(new Option('Hindi', 'hindi'));
        languageSelect.options.add(new Option('Odia', 'odia'));
        languageSelect.options.add(new Option('Bengali', 'bangla'));
        languageSelect.options.add(new Option('Assamese', 'assamese'));
        document.getElementById("deslangDiv").style.display = "block";
        // Show column type dropdown
        colTypeDiv.style.display = 'block';
    } else if (model === 'cnn') {
        // Add options for CNN
        languageSelect.options.add(new Option('Language Selection', ''));
        languageSelect.options.add(new Option('Bengali', 'bangla'));
        languageSelect.options.add(new Option('Assamese', 'assamese'));
        languageSelect.options.add(new Option('Odia', 'odia'));
        document.getElementById("langDiv").style.display = "block";
        document.getElementById("deslangDiv").style.display = "block";
        // Hide column type dropdown
        colTypeDiv.style.display = 'none';
    } else {
        // No model selected, hide column type dropdown
        colTypeDiv.style.display = 'none';
    }
}
</script>
    <script type="text/javascript">

        $('#selectedLang').change(function () {
            var selectedText = $("#selectedLang option:selected").text();
            document.getElementById("trans").value = "";
        });

        //tinymce.init({ selector:'#src_text' });
    </script>


    <script type="text/javascript">
        function translatetext() {
            //var formURL = "http://10.10.10.214/translator/translate?lang="+$("#lang //option:selected").val()+"&src_text="+$("#src_text").val();
            //+"&src_text="+tinymce.get('content');
            var formURL = "http://10.10.10.214/translator/translate";
            var formdata = $("#mtform").serialize();
            $('#translatebutton').attr('value', 'Translating...');

            $.ajax(
                    {
                        url: formURL,
                        context: this,
                        type: "GET",
                        contentType: "text/plain; charset=UTF-8",
                        data: formdata,

                        success: function (response) {

                            var obj = JSON.parse(JSON.stringify(response));
                            var text = '';
                            function printValues(obj) {
                                for (var k in obj) {

                                    if (obj[k] instanceof Object) {
                                        printValues(obj[k]);
                                    } else if (k === 'tgt') {
                                        if (obj[k].includes("ред") || obj[k].includes(".")) {
                                            text += obj[k] + " ";
                                        } else {
                                            text += obj[k] + "ред ";
                                        }
                                        console.log(k + "-->" + obj[k]);// + "<br>");
                                    }
                                    ;
                                }
                            }
                            ;
                            printValues(obj);
                            text = text.replaceAll('\@\@ ', '');
                            text = text.replaceAll('\@\@', '');
                            //text=text.replaceAll('ред','');
                            $("#trans_text").val(text);
                            $('#translatebutton').attr('value', 'Translate');
                        },
                        error: function (xhr, status, error, response) {
                            alert("Server Encountered some error. Please try after some times or Contact administrator");
                        }
                        ,
                        failure: function (errorData, response) {

                        }
                    });



        }

        function copy() {
            $("#trans_text").select();
            document.execCommand('copy');
        }
        function clearTranscription() {
            $("#trans_text").val('');//='';
            $("#src_text").val('');

        }
    </script>
</html>
<%@include file="footer.jsp" %>
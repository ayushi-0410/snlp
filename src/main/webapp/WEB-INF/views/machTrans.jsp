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
		<link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script type="text/javascript" src="js/owl.carousel.min.js"></script>
        
        <script src="//cdnjs.cloudflare.com/ajax/libs/tinymce/4.5.1/tinymce.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js" integrity="sha512-r22gChDnGvBylk90+2e/ycr3RVrDi8DIOkIGNhJlKfuyQM4tIRAI062MaV8sfjQKYVGjOBaZBOA87z+IhZE9DA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
			 <link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
        <style type="text/css">
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
 left: 44%;
			  top: 45%;
 width:233px;
 position : static
}

 
         #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        /* Ensure section takes up the right space */
        section {
            position: relative; /* This keeps the sidebar inside the section */
        }
         #sourceLanguage, #destLanguage {
      border: 2px solid #6c757d; /* Border color */
      border-radius: 8px; /* Rounded corners */
      padding: 3px;
      font-size: 1rem;
      background: linear-gradient(to right, #f8f9fa, #e9ecef); /* Subtle gradient */
      color: #495057; /* Text color */
      transition: all 0.3s ease;
    }

    #sourceLanguage:hover, #destLanguage:hover {
      border-color: #0d6efd; /* Hover border color */
      box-shadow: 0 0 8px rgba(13, 110, 253, 0.5); /* Glow effect */
    }

    #sourceLanguage:focus, #destLanguage:focus {
      border-color: #0d6efd;
      outline: none; /* Remove default focus outline */
      box-shadow: 0 0 10px rgba(13, 110, 253, 0.8);
    }
	.btn-info{
		--bs-btn-color: white;
    	--bs-btn-bg: #36cf1a;
        --bs-btn-hover-bg: #2fb716;
        --bs-btn-hover-color: white;
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
<a href="${pageContext.request.contextPath}/text" target="_blank"> Text to Speech</a>
<a href="${pageContext.request.contextPath}/speechTrans" target="_blank"> Speech to Speech</a>
<a href="${pageContext.request.contextPath}/liveStreamingVoice" target="_blank">Real Time ASR</a>
<a href="${pageContext.request.contextPath}/transliteration" target="_blank">Transliteration</a>
<a href="${pageContext.request.contextPath}/machTrans" target="_blank" style="background: #eaffe5; color: #0c9110; font-weight: 700;">Translation</a>
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
		
        <form id="mtform">
            <section class="container my-5" style="margin-top:1rem !important">
                <div class="container">


                    <div class="row">
                        <div class="col-12 mx-auto">
                            <h3  class="text-center text-dark" style="color:#ffffffe0 !important">Indian languages Machine Translation</h3>

                            <div class="dropdown-wrapper" style="display:flex; justify-content:center;flex-direction:column">
                                <div class="micro-wrapper" style="">
                                <input type="file" id="trans" accept=".txt" class="form-control" onchange="transTextChange(event)">
                                    
                                </div> 
                              <div class="" style="display:flex;margin-top:1rem; justify-content:center">
<p class="micro-text" style="color:#ffffffe0; font-weight:500;margin-bottom:0; margin-top:4px">Choose language pair: &nbsp; </p>
								<div class="language-select">
									 <select id="sourceLanguage" name="sourceLanguage">
									 <option value="asm">Assamese</option>
                                        <option value="ben">Bengali</option>
                                        <option value="brx">Bodo</option>
                                        <option value="doi">Dogri</option>
                                        <option value="eng">English</option>
                                        <option value="kok">Konkani</option>
                                        <option value="guj">Gujarati</option>
                                        <option value="hin">Hindi</option>
                                        <option value="kan">Kannada</option>
                                        <option value="kas">Kashmiri</option>
                                        <option value="mai">Maithili</option>
                                        <option value="mal">Malayalam</option>
                                        <option value="mar">Marathi</option>
                                        <option value="mni">Manipuri</option>
                                        <option value="nep">Nepali</option>
                                        <option value="ori">Odia (Oriya)</option>
                                        <option value="pan">Punjabi</option>
                                        <option value="san">Sanskrit</option>
                                        <option value="sat">Santali</option>
                                        <option value="snd">Sindhi</option>
                                        <option value="tam">Tamil</option>
                                        <option value="tel">Telugu</option>
                                        <option value="urd">Urdu</option>
									</select>
									
									<button type="button" style="background:none; border:none" onclick="swapLang()">
									<img src="${pageContext.request.contextPath}/resources/images/swap.png" style="width:25px">
									</button>
									 <select id="destLanguage" name="destLanguage">
								 <option value="asm">Assamese</option>
                                        <option value="ben">Bengali</option>
                                        <option value="brx">Bodo</option>
                                        <option value="doi">Dogri</option>
                                        <option value="eng">English</option>
                                        <option value="kok">Konkani</option>
                                        <option value="guj">Gujarati</option>
                                        <option value="hin">Hindi</option>
                                        <option value="kan">Kannada</option>
                                        <option value="kas">Kashmiri</option>
                                        <option value="mai">Maithili</option>
                                        <option value="mal">Malayalam</option>
                                        <option value="mar">Marathi</option>
                                        <option value="mni">Manipuri</option>
                                        <option value="nep">Nepali</option>
                                        <option value="ori">Odia (Oriya)</option>
                                        <option value="pan">Punjabi</option>
                                        <option value="san">Sanskrit</option>
                                        <option value="sat">Santali</option>
                                        <option value="snd">Sindhi</option>
                                        <option value="tam">Tamil</option>
                                        <option value="tel">Telugu</option>
                                        <option value="urd">Urdu</option>
									</select>
								</div>
							</div>


                            </div>


                            <div class="container mt-3" style="background: #ffffff73 ; padding: 2%;border-radius: 23px; height:62vh">
                            <!-- #212725 -->
                                <div class="row">
                                    <div class="col-sm form-group">
                                        <textarea class="form-control" id="src_text" name="src_text" placeholder="Enter input text here..." rows="16" style="height:50vh;border:1px solid red;"></textarea>
                                        <textarea class="form-control" id="reverse_text" name="src_text" placeholder="" rows="16" style="display:none; height:25vh;margin-top:1%;border:1px solid red;"></textarea>
                                    </div>
                                    <div class="col-1 form-group ">
                                        <div class="icon">
                                            <div class="arrow" onclick="translatetext();"></div>
                                        </div>
                                    </div>


                                    <div class="col-sm form-group " style="background: #ffffff; border: 1px solid green; border-radius: 8px; text-align: end">
                                       <button type="button" class="btn btn-primary" id="reverseTrans" style="margin-bottom: 4px;
    padding: 2px;
    margin-top: 2px;" onclick="reverseTranslation()" >Reverse</button> 
                                       <textarea class="form-control" id="trans_text" placeholder="Output will be shown here..." rows="16" style="height:46vh;"></textarea>
                                    </div>

                                    <div style="margin-bottom: 15px; margin-top:10px; text-align: center;">
                                        <input type="button" class="btn btn-primary" id="translatebutton" value="Translate"
                                               onclick="translateTextAjax();" />
                                        <input type="button" class="btn btn-info" id="copybutton" value="Copy"
                                               onclick="copy();" />
                                        <input type="button" class="btn btn-danger" id="clearbutton" value="Clear"
                                               onclick="clearTranscription();" />
                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>
            </section>
        </form>
        
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
   
    <script type="text/javascript">

        $('#selectedLang').change(function () {
            var selectedText = $("#selectedLang option:selected").text();
            document.getElementById("trans").value = "";
        });

        //tinymce.init({ selector:'#src_text' });
    </script>
    <script>
    	function swapLang(){
    		var srcLang = $('#sourceLanguage option:selected').val();
    		var destLang = $('#destLanguage option:selected').val();
    		console.log("Source Language Value Before Swap: " + srcLang);
    		console.log("Destination Language Value Before Swap: " + destLang);

    		
    		$('#sourceLanguage').val(destLang);
    	    $('#destLanguage').val(srcLang);
    		
    	}
    </script>
    <script>
    const contextPath = "${pageContext.request.contextPath}";
</script>
    
   <script>
   function transTextChange(event) {
       const file = event.target.files[0];
       if (file) {
           const reader = new FileReader();
           reader.onload = function(e) {
        	   let text = e.target.result;
               text = text.replace(/\t/g, '');
               document.getElementById('src_text').value = text;
           };
           reader.readAsText(file);
       }
   }

   document.getElementById('trans').addEventListener('change', transTextChange);
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
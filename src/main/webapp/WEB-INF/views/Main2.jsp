
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Our Technology</title>
         <!--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserrat:300,400,700'>
        <link href="${pageContext.request.contextPath}/resources/css/main_style.css" rel="stylesheet" type="text/css"/>
        <link id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainDark.css">
        
        
        <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css"/>
         <link  href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/js/all.min.js" integrity="sha512-u3fPA7V8qQmhBPNT5quvaXVa1mnnLSXUep5PS1qo5NRzHwG19aHmNJnj1Q8hpA/nBWZtZD4r4AX6YOt5ynLN2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js">
</script>
</head>
<style>/* ayushi */
/* Footer Section
********************************************************************* */

		
.socialIcons {
    font-size: 34px;
    color: rgba(255, 255, 255, 0.7);
}
.image-container{
    margin: auto;
    max-width: 1000px;
    padding-bottom: 25px;
    padding-top: 25px;
    text-align:center;
    }
    
 .translationSection ul{
 	grid-gap: 1rem;
    display: grid;
   grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
 	}
 .page-container ul {
    font-weight: 300;
    line-height: 1.9rem;
    list-style: circle;
    margin: 20px 0;
}
.translationSection ul li, .videoSection ul li, .voiceSection ul li {
    transition: all .2s ease-in-out;
}
.translationSection ul li:hover{
	color: #fff;
  transform: scale(1.1); /* Example transformation */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}
.translationSection ul li {
    background: #ffffffc4;
    border-radius: 10px;
    box-shadow: 0 0 11px #000000;
    max-width: 95%;
    overflow: hidden;
    padding: 20px;
    text-align: center;
}
.translationSection .css-hboir5 {
    display: block;
    width: 100%;
}

.css-hboir5 {
    align-items: center;
    display: flex;
    justify-content: flex-start;
}
.logo-maker-page .css-1hnxo7a {
    margin-right: 0;
}
.translationSection .css-1hnxo7a {
    align-items: center;
    display: inline-block;
    justify-content: center;
    position: relative;
    max-width: 50%;
    /* width: 65px; */
}
.logo-maker-page .css-195k0gj {
    padding-left: 0;
}
.translationSection .css-9f6g39 {
    font-size: 1rem;
    font-weight: 700;
    line-height: 1.5rem;
    font-family: cursive;
}
.translationSection .css-itvw0n {
    font-size: .8rem;
    height: 5rem;
    line-height: normal;
    margin: 5px 0 0;
    overflow: auto;
    font-family:math;
    text-align: justify;
}
.text-center{
	color:white;
	font-size: 26px;
	font-family: auto;
	background: #00000073;
	padding: 3px;
}
.topnav {
    overflow: hidden;
    background-color: #dae8f4;
    /*position: fixed;*/
}
</style>

    <body>
        <div id="mainDIV" style=""> <!-- #5286b4  #a0b2c330 -->
       
<section id="header">
	
     
        
       
        
        <div class="topnav" id="myTopnav" style="background:white;    position: fixed;
    width: -webkit-fill-available;
    z-index: 99;">
            <div class="main_nav">
              

               
				<select id="themeSelector" onchange="applyTheme()">
  <option value="Dark">Dark</option>
  <option value="Light">Light</option>
</select>
				<img src="${pageContext.request.contextPath}/resources/images/cdac-logo.png">
                <a href="${pageContext.request.contextPath}/home" style="margin-right:1%; color:black; float: right;">
                <i class="fa fa-home" aria-hidden="true"></i>
                 Home
                </a>


            </div>
        </div>
	

</section>
<div id="spchpp" class="image-container"> 
	<div class="image-container logo-maker-page" style="margin-top:3%"> 
		<h2 class="text-center" style="border-radius:23px">SPEECH PROCESSING</h2>
		<div class="row">
			<div class="col-lg-12">
			<div class="translationSection">
				<ul>
					<li><a href="${pageContext.request.contextPath}/audio" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/asr1.png" style="width:70%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Automatic Speech Recognition</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">ASR enables users to interact with computer systems using their voice, allowing 
							for hands-free operation and more natural, intuitive communication with digital devices.</p>
						</div>
					</div></a></li>
					
					
					<li><a href="${pageContext.request.contextPath}/text" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/tts.png" style="width:65%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Text To Speech</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">TTS technology transforms written text into
							 spoken words using AI, enabling users to listen to written content.</p>
						</div>
					</div></a></li>
					
					<li><a href="${pageContext.request.contextPath}/speechTrans" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/sts.png" style="width:63%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Speech To Speech</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">Speech-to-speech technology converts spoken language from one language 
							into another in real-time, with a focus on facilitating communication in Indian languages.</p>
						</div>
					</div></a></li>
					
					<li><a href="${pageContext.request.contextPath}/liveStreamingVoice" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/live.png" style="width:70%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Real Time Automatic Speech Recognition</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">This module converts real-time spoken audio into on-screen text, enabling instant transcription and enhancing accessibility during live streams</p>
						</div>
					</div></a></li>
					
					
					
					
				</ul>
			</div>
			</div>
		</div>
	</div>
</div>



<div id="textpp" class="image-container"> <!-- ayushiii -->
	<div class="image-container logo-maker-page">
		<h2 class="text-center" style="border-radius:23px">TEXT PROCESSING</h2>
		<div class="row">
			<div class="col-lg-12">
			<div class="translationSection">
				<ul >
					<li><a  href="${pageContext.request.contextPath}/transliteration" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/translit.png" style="width:65%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Transliteration</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">Transliteration converts text from one script to another,
							 preserving pronunciation and aiding in understanding across different writing systems.</p>
						</div>
					</div></a></li>
					
					
					<li><a href="${pageContext.request.contextPath}/machTrans" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/trans.webp" style="width:69%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Machine Translation</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">Machine translation automatically translates text from one 
							language to another, for various Indian languages.</p>
						</div>
					</div></a></li>
					
				</ul>
			</div>
			</div>
		</div>
	</div>
</div>


<div id="imgpp" class="image-container"> <!-- ayushiii -->
	<div class="image-container logo-maker-page">
		<h2 class="text-center" style="border-radius:23px">IMAGE PROCESSING</h2>
		<div class="row">
			<div class="col-lg-12">
			<div class="translationSection">
				<ul>
					<li><a  href="${pageContext.request.contextPath}/ocr" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/ocrico.png" style="width:108%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">OCR</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">OCR digitizes printed or handwritten text from images, making it editable and searchable, 
							thus transforming physical documents into machine-readable formats.</p>
						</div>
					</div></a></li>
					
					<li><a  href="${pageContext.request.contextPath}/docTrans" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/doctrans.png" style="width:63%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Image translation</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">Image translation extracts text from images using OCR and
							 translates it into the desired language,
							 allowing users to understand content from scanned documents or photos for different Indian languages.</p>
						</div>
					</div></a></li>
				</ul>
			</div>
			</div>
		</div>
	</div>
</div>

<%-- <div id="pdf" class="image-container"> <!-- ayushiii -->
	<div class="image-container logo-maker-page">
		<h2 class="text-center" style="border-radius:23px">PDF PROCESSING</h2>
		<div class="row">
			<div class="col-lg-12">
			<div class="translationSection">
				<ul>
					<li><a  href="${pageContext.request.contextPath}/pdfToImg" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/pdftoimg.svg" style="width:108%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">PDF to Image</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">OCR digitizes printed or handwritten text from images, making it editable and searchable, 
							thus transforming physical documents into machine-readable formats.</p>
						</div>
					</div></a></li>
					
						
					<li><a  href="${pageContext.request.contextPath}/PdfMerger" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/ocrico.png" style="width:108%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Image to PDF</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">OCR digitizes printed or handwritten text from images, making it editable and searchable, 
							thus transforming physical documents into machine-readable formats.</p>
						</div>
					</div></a></li>
				</ul>
			</div>
			</div>
		</div>
	</div>
</div> --%>


<div id="othprod" class="image-container">
<!--background: #3c4277;  -->
	<div class="image-container logo-maker-page">
		<h2 class="text-center" style="border-radius:23px">OTHER PRODUCTS</h2>
		<div class="row">
			<div class="col-lg-12">
			<div class="translationSection">
				<ul>
				<li><a href="${pageContext.request.contextPath}/chatBotQuery" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/123_1.png" style="width: 64%; border-radius: 66%;"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">ChatBot Query</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">This module allows user to ask queries specific to medical domain after uploading their pdf document containing their medical records, prescriptions, etc.</p>
						</div>
					</div></a></li>
					<li><a href="https://krishimantrana.in/" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/km.png" style="width:70%;border-radius:50%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Krishi Mantrana</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">Krishi Mantrana provides farmers with an AI-based
							 question-answer system and a voice-enabled interface, offering structured agricultural knowledge and interactive
							  dialogue management for better decision-making.</p>
						</div>
					</div></a></li>
					
					
					<li><a href="https://krishimantrana.in/chatbot" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/km_mobile.png" style="width:35%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Krishi Mantrana Mobile Version</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">The mobile version of Krishi Mantrana offers 
							farmers a portable, AI-based question-answer system with voice interaction and a structured agricultural 
							knowledge base and interactive
							  dialogue management.</p>
						</div>
					</div></a></li>
					
					<li><a href="https://www.railheritage.in/NRM/" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/NRMp.png" style="width:70%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Rail Heritage</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">Rail Heritage digitizes records of the National Rail Museum in New Delhi and the
							 Rail Museum in Trichy, making them easily searchable and traceable with structured metadata and full-text search capabilities.</p>
						</div>
					</div></a></li>
					
					<li><a href="https://sstp.dst.gov.in/" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/sstp.png" style="width:72%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">State Science & Technology Programme</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">This program promotes the science, technology, 
							and innovation ecosystem across sectors and domains, supporting sustainable development in line with state and national priorities.</p>
						</div>
					</div></a></li>
					
					
					<%-- <li><a href="#" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/autism.png" style="width:72%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Disaaa</div>
							<p class="chakra-text css-itvw0n" style="color:#373434"> ASMA is a smartphone-based mobile app designed to screen children 
							aged 2 to 12 years for autism, providing early detection and intervention support.</p>
						</div>
					</div></a></li> --%>
					
					<li><a href="http://220.156.189.179/MultilingualMorphBuilder/" target = "_blank" style="text-decoration:none;">
					<div class= "css-hboir5">
						<div class = "css-1hnxo7a">
						<img src="${pageContext.request.contextPath}/resources/images/multi-languages-1024x683.jpg" style="width:60%"></div>
						<div class = "css-195k0gj">
							<div class="chakra-heading css-9f6g39" style="color:black">Multilingual Morph Builder</div>
							<p class="chakra-text css-itvw0n" style="color:#373434">This tool aids in the study of word structure by focusing on the 
							components within words, such as stems, root words, prefixes, and suffixes, across multiple languages.</p>
						</div>
					</div></a></li>
					
				</ul>
			</div>
			</div>
		</div>
	</div>
</div>



               
        </div>
        
        
           
        
        
        <script>
function applyTheme() {
    const selectedTheme = document.getElementById("themeSelector").value; // Get selected theme
    const themeStylesheet = document.getElementById("themeStylesheet"); // Get <link> tag
    
    // Update the href dynamically
    if (selectedTheme === "Dark") {
        themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/mainDark.css"; // Load dark theme
    } else if (selectedTheme === "Light") {
        themeStylesheet.href = "${pageContext.request.contextPath}/resources/css/mainLight.css"; // Load light theme
    }
}

</script>
        
    </body>
</html>
<%@include file="footer.jsp" %>
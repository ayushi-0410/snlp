
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Hindi Transliteration</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
        <script src="${pageContext.request.contextPath}/resources/jsScript/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/jsScript/commonJs.js" type="text/javascript"></script>
        <link href="${pageContext.request.contextPath}/resources/css/loader.css" rel="stylesheet" type="text/css" />
        
        <link href="${pageContext.request.contextPath}/resources/css/sidebar.css" rel="stylesheet" type="text/css" />
         <link  id="themeStylesheet" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/body-light.css" rel="stylesheet" type="text/css" />
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

</style>
    </head>
    <body class="body_bg" style="
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
<a href="${pageContext.request.contextPath}/transliteration" target="_blank"  style="background: #eaffe5; color: #0c9110; font-weight: 700;">Transliteration</a>
<a href="${pageContext.request.contextPath}/machTrans" target="_blank">Translation</a>
<a href="${pageContext.request.contextPath}/ocr" target="_blank"> OCR</a>
<a href="${pageContext.request.contextPath}/docTrans" target="_blank"><!-- <i class="bi bi-gear"></i>  -->Image Translation</a>
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
      <!--   <section class="container my-5" style="margin-top:1rem !important">
            <div class="row" style="display:block">
                <div class="col-6 mx-auto" style="width: 50%">
                      <h3  class="text-center text-dark" style="color:#b51717e0 !important">Transliteration</h3>
                      <div class="form-group mb-3"><span style="color:#003381; font-weight:500">Choose language:</span>
                                    <select id="lang" class="form-select" style="border:1px solid red; margin-top:4px">
                                        <option value="hi" selected>English to Hindi</option>
                                        <option value="bn">English to Bengali</option>
                                        <option value="or">English to Odia</option>
                                    </select>
                                </div>
                    <h6 style="    text-align: center;">A transliteration doesn't tell you the meaning of the word, but it gives you an idea of how the word is pronounced in a foreign language.</h6>
                    <div class="card border-0 shadow-lg">
                        <div class="card-body">
                                
                                <textarea rows="4" id="input-word" name="input-word" class="form-control"  placeholder="Enter Text" required style="border:1px solid green"></textarea><br>
                                <div >
                                    <button  type="submit" class="btn btn-primary mb-5" onclick="transLiterationAjax()">Convert </button></div>
                              <div style="display:flex"> <span style="font-weight:600"> Output Text:</span>  <p id="transliterated-word" style="width:max-content;margin-left:2%"></p></div>
                            
                        </div>
                    </div>
                </div>
                <div class = "row" style="display:contents">
                 <div id="transOut" class="col-6 mx-auto" style="width: 50%;display:none; margin-top:1%">
                 	<div class= "card border-0 shadow-lg" style="height:23vh">
                 	
                 	 <div class="card-body">
                                <div class="form-group mb-3" >
		                                <div style="display:flex">
		                                	 <span style="font-weight:600"> Output Text:</span> 
		                                	 <p id="transliterated-word" style="width:max-content;margin-left:2%"></p>
		                                </div>
                         
                                </div>
                      </div>
                 		
                            
                 	</div>
                 	</div>
                 </div>
            </div>
        </section> -->
        
         <section class="container my-5" style="margin-top:1rem !important">
                <div class="container">


                    <div class="row">
                        <div class="col-12 mx-auto">
                            <h3  class="text-center text-dark" style="color:#ffffffe0 !important">Transliteration</h3>

                            <div class="dropdown-wrapper" style="display:flex; justify-content:center;flex-direction:column">
                                <div class="micro-wrapper" style="">
                                <input type="file" id="trans" accept=".txt" class="form-control" onchange="transTextChange(event)">
                                    
                                </div> 
                                 <div class="" style="display:flex;margin-top:1rem; justify-content:center">
								
                             <span style="color:#ffffffe0; font-weight:500;width:12%">Choose language:</span>
                                    <select id="lang" class="form-select" style="border:1px solid red;width:fit-content; padding-left:3px">
                                        <option value="as">Assamese</option>
                                        <option value="bn">Bengali</option>
                                        <option value="gu">Gujarati</option>
                                        <option value="hi">Hindi</option>
                                        <option value="kn">Kannada</option>
                                        <option value="ml">Malayalam</option>
                                        <option value="mr">Marathi</option>
                                        <option value="or">Odia (Oriya)</option>
                                        <option value="pa">Punjabi</option>
                                        <option value="ta">Tamil</option>
                                        <option value="te">Telugu</option>
                                        <option value="ur">Urdu</option>
                                    </select>
                                    
                                

                            </div>
</div>

                            <div class="container mt-2" style="background: #ffffff73 ; padding: 2%;border-radius: 23px; height:62vh">
                                <div class="row">
                                    <div class="col-sm form-group">
  <textarea rows="4" id="input-word" name="input-word" class="form-control"  placeholder="Enter Text" required rows="16" style="height:50vh; border:1px solid green"></textarea>
                               
                                    </div>
                                    <div class="col-1 form-group ">
                                      <!--   <div class="icon">
                                             <button  type="submit" class="btn btn-primary mb-5" onclick="transLiterationAjax()" style="margin-top:236%">Convert </button>
                                        </div> -->
                                    </div>


                                    <div class="col-sm form-group ">
                                        <textarea class="form-control" id="transliterated-word" placeholder="Output will be shown here..." rows="16" style="height:50vh;border:1px solid green;"></textarea>
                                    </div>

                                    <div style="margin-bottom: 15px; margin-top:10px; text-align: center;">
                                        <input type="button" class="btn btn-primary" id="translatebutton" value="Transliterate"
                                               onclick="transLiterationAjax()" />
                                        <input type="button" class="btn btn-info" id="translatebutton" value="Copy"
                                               onclick="copy();" />
                                        <input type="button" class="btn btn-danger" id="translatebutton" value="Clear"
                                               onclick="clearTranscription();" />
                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>
            </section>

        <!-- <div class="card-body ">
            <div>
                <p id="transliterated-word"></p>
            </div>
        </div> -->
        
             
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
   function transTextChange(event) {
       const file = event.target.files[0];
       if (file) {
           const reader = new FileReader();
           reader.onload = function(e) {
        	   let text = e.target.result;
               text = text.replace(/\t/g, '');
               document.getElementById('input-word').value = text;
           };
           reader.readAsText(file);
       }
   }

   document.getElementById('trans').addEventListener('change', transTextChange);
        </script>
    <script>
        const myform = document.querySelector("#transliterate-form");
        const inputWord = document.querySelector("#input-word");
        const transliteratedWord = document.querySelector("#transliterated-word");
        // replace with your Google Cloud API key

        myform.addEventListener("submit", (event) => {
            event.preventDefault();
            const apiUrl = `http://10.10.10.214:8083/`;
            const data = document.getElementById("input-word").value;
            const lang = document.getElementById("lang").value;
            fetch(`${apiUrl}${lang}/${data}`, {
                        method: "GET",
                        headers: {
                            "Content-Type": "application/json",
                            // Authorization: `Bearer ${apiKey}`,
                        },
                    })
                            .then((response) => response.text())
                            .then((data) => {
                                // for  printing result in p tag
                                // for innerhtml div 
                                document.getElementById("transliterated-word").innerText = data
                                console.log(data)
                            })
                            .catch((error) => {
                                console.error(error);
                            });
                });
    </script>
<script>
    const contextPath = "${pageContext.request.contextPath}";
</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    

</html>
<%@include file="footer.jsp" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>IPD Discharge Summary</title>

        <meta charset="UTF-8">
        <link rel="icon" type="image/png" href="Img/cdac.png">


<style type="text/css">
.highlight {
	background-color: yellow;
}

.containerPara {
	margin-top: 1%;
	height: 150px;
	border: solid 1px black;
	border-radius: 15px;
	overflow-y: scroll;
}

p {
	margin-top: 0;
	margin-bottom: 0rem;
}


.action-button {
    cursor: pointer;
    border-radius: 50%;
    height: auto;
    width: 32%;
    font-size: 1.5em;
    display: flex;
    align-items: center;
    justify-content: center;
}

.col-12 {
    padding: 0;
}

.row.text-center {
    margin: 10px 0;
}

</style>




<style>
    b{
        font-size:larger;
    }

    
        .loader {
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            /* Safari */
            animation: spin 2s linear infinite;
            position: fixed;
            top: 50%;
            left: 50%;
            display: none;
            z-index: 1;
        }

        /* Safari */
        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
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





<!-- Stylesheets -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.min.css">
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.4.0.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.0/dist/sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/onnxruntime-web/dist/ort.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@ricky0123/vad-web@0.0.7/dist/bundle.min.js"></script>
        <script src="https://www.WebRTC-Experiment.com/RecordRTC.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
        
        
        
        


    </head>
    <body id="content" style="background-color: #0098ad73" >
        <nav class="navbar navbar-expand-lg navbar-light sticky-top" style="background-color: #0098ad; color: white;border-bottom: 2px solid black">
            <div class="container-fluid">
            
            <div class="loader" id="load"></div>
            
            
                <!--<a class="navbar-brand" href="#">
                    <img src="Img/cdac.png" style="width: 80px;" alt="CDAC Logo"/>
                </a>-->
                <form class="d-flex mx-auto align-items-center">
                    <h2 class="text-white mb-0 align-items-center">IPD Discharge Summary</h2>
                </form>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                   <!--  <button id="downloadPdf" class="btn btn-success ms-auto d-lg-none mt-3">
                        <i class="fa-solid fa-download"></i> Generate PDF
                    </button> -->
                </div>
                <button id="downloadPdf" class="btn btn-success d-none d-lg-block ms-auto">
                    <i class="fa-solid fa-download"></i> Generate PDF
                </button>
            </div>
        </nav>


        <div>
            <div class="container-fluid mt-5 mb-5" id="container1">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center hover-shadow bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" align="left" style="background-color: #f0f0f0; padding: 10px; color: rgb(0 0 0); font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Chief Complaints
                                </div>
                                <div class="col-12 mb-3 input-group">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer1">
                                            
                                            
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select1" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>

													<div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton1" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button1" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer1')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
												</div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('1')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                        
                                                        
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('1')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton1" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('1')">Expander</button>
                                                            
                                                            
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp1" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container2">
                <div class="row justify-content-center">
                    <div class="col-md-8">

                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center hover-shadow bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" align="left" style="background-color: #f0f0f0; padding: 10px; color: rgb(0 0 0); font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    History of Present Illness
                                </div>
                                <div class="col-12 mb-3 input-group">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer2">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select2" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton2" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button2" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer2')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('2')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('2')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton2" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('2')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp2" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container3">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Condition At Discharge
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer3">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select3" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton3" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button3" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer3')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('3')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('3')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton3" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('3')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp3" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container4">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Hospital Course
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer4">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select4" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                       <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton4" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button4" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer4')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('4')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('4')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton4" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('4')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp4" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid mt-5 mb-5" id="container5">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Other Investigations
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer5">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select5" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton5" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button5" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer5')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('5')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('5')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton5" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('5')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp5" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container6">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Diagnosis
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer6">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select6" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton6" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button6" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer6')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('6')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('6')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton6" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('6')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp6" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container7">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Other Advice
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer7">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select7" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton7" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button7" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer7')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('7')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('7')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton7" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('7')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp7" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container8">
                <div class="row justify-content-center">
                    <div class="col-md-8">                  
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Follow Up Advice
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer8">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select8" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton8" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button8" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer8')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('8')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('8')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton8" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('8')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp8" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid mt-5 mb-5" id="container9">
                <div class="row justify-content-center">
                    <div class="col-md-8">                   
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Presenting Complaints
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer9">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select9" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton9" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button9" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer9')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('9')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('9')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton9" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('9')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp9" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container10">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    History of Presenting Complaints
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer10">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select10" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton10" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button10" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer10')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('10')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('10')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton10" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('10')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp10" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container11">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Past History
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer11">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select11" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton11" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button11" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer11')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('11')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('11')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton11" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('11')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp11" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container12">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Personal History
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer12">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select12" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton12" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button12" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer12')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('12')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('12')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton12" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('12')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp12" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid mt-5 mb-5" id="container13">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="container-fluid px-1 px-sm-3 mb-2">
                            <div class="row align-items-center bg-white" style="box-shadow: 0 0.5px 10px 1.5px #b0acac; border-radius: .25rem; border: 1px solid;">
                                <div class="col-12" style="background-color: #f0f0f0; padding: 10px; color: #000; font-size: 1.1em; font-weight: bold; letter-spacing: 1px;">
                                    Family History
                                </div>
                                <div class="col-12 mb-3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-12 col-md-10 containerPara" contenteditable="true" id="responseContainer13">
                                            
                                                <!-- <textarea class="form-control mt-3 recognizedText" id="responseContainer1" style="height: auto; min-height: 100px; overflow-y: scroll;"></textarea> -->
                                            </div>
                                            <div class="col-12 col-md-2 justify-content-center align-items-start">  <!-- remove d-flex class -->
                                                <div class="controls mt-3">
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-6 d-none">
                                                            <select id="model-select13" class="selectpicker" data-style="btn-success" data-width="100%">
                                                                <option value="EN_HI_MIXED">English Hindi</option>
                                                                <option value="HI_FEMALE2">Hindi Female 1</option>
                                                                <option value="BN_FEMALE2">Hindi Female 2</option>
                                                                <option value="PA_MALE1">PA_MALE1</option>
                                                            </select>
                                                        </div>
                                                        
                                                        <div
														class="col-12 d-flex justify-content-around align-items-center">
														<button type="button" id="recordButton13" style="border-radius: 35%"
															class="btn btn-primary action-button"
															title="Click to speak">
															<i class="fa fa-microphone" aria-hidden="true"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" id="tts-button13" style="border-radius: 35%"
															title="Click to listen">
															<i class="fa-solid fa-volume-high"></i>
														</button>
														<button type="button"
															class="btn btn-primary action-button" style="border-radius: 35%"
															onclick="clearTextArea('responseContainer13')"
															title="Click to clear text">
															<i class="fa fa-trash" aria-hidden="true"></i>
														</button>
													</div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                    <div class="col-12">
                                                            <button type="button" class="btn btn-primary btn-lg p-1" onclick="textHighlighter('13')" style="height:100%;width:100%;border-radius:15%" title="Click to highlight snomed ct terms">Highlighter</button>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-2">
                                                        <div class="col-12">
                                                            <!-- <button type="button" class="btn btn-primary btn-lg p-1" onclick="textExpender('13')" style="height:100%;width:100%;border-radius:15%" title="Click to expand acronyms">Expander</button> -->
                                                            <button id="toggleButton13" type="button" class="btn btn-primary btn-lg p-1" title="Click to expand acronyms" style="height:100%;width:100%;border-radius:15%" onclick="toggleButton('13')">Expander</button>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12 mt-2 mb-1">
                                                            <audio id="audio-player" style="display: none"></audio>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-12" id="responseContainerTemp13" style="display:  none;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="myfooter mt-5" style="position: fixed; left: 0; bottom: 0; width: 100%; background-color: #0098ad; color: white; text-align: center;border: 2px solid black">
            <span class="hidden-xs" style="font: Book Antiqua; font-variant: small-caps;"><strong>© Centre For Development Of Advanced Computing</strong></span>
            <span class="hidden-sm hidden-md hidden-lg" style="font: Book Antiqua; font-variant: small-caps;">© C-DAC</span>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
        <script>
                                                                function clearTextArea(id) {
                                                                    //document.getElementById(id).value = "";
                                                                	document.getElementById(id).textContent = "";
                                                                }
        </script>

        <!-- TTS API Calling -->
        <script>
            $(document).ready(function () {

                function handleTtsButtonClick(buttonId) {
                    const buttonIndex = buttonId.replace('tts-button', '');
                    //const text = $(`#responseContainer${buttonIndex}`).val();  // need to change in paragraph
                    const text = document.getElementById('responseContainer' + buttonIndex).textContent;
                    
                    const model = $(`#model-select${buttonIndex}`).val();

                    if (!text) {
                        alert("Please enter some text.");
                        return;
                    }

                    $.ajax({
                        url: 'tts_service',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            model: model,
                            text: text,
                            app_name: "EHR_Demo"
                        }),
                        xhrFields: {
                            responseType: 'application/json'
                        },
                        success: function (data) {
//                             alert(data['audio']);
                            
                            
                            const binaryString = atob(data['audio']);
                            const binaryLen = binaryString.length;
                            const bytes = new Uint8Array(binaryLen);

                            for (let i = 0; i < binaryLen; i++) {
                                bytes[i] = binaryString.charCodeAt(i);
                            }
                            audioArrayBuffer = bytes.buffer
                            const audioBlob = new Blob([audioArrayBuffer], { type: 'audio/wav' });
                            
                            const url = window.URL.createObjectURL(audioBlob);
                            
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
                }


                for (let i = 1; i <= 13; i++) {
                    $(`#tts-button${i}`).click(function () {
                        handleTtsButtonClick(this.id);
                    });
                }
            });
        </script>








        <script>
            document.addEventListener('DOMContentLoaded', async () => {
                let currentWebSocket = null;
                let mediaRecorder = null;
                let myvad = null;
                let audioChunks = [];
                let activeButton = null;
                let isRecording = false;

                function blobToBase64(blob) {
                    return new Promise((resolve, reject) => {
                        const reader = new FileReader();
                        reader.readAsDataURL(blob);
                        reader.onload = () => resolve(reader.result.split(',')[1]);
                        reader.onerror = error => reject(error);
                    });
                }

                async function startRecording(button, responseContainer) {
                    try {

                        if (currentWebSocket && currentWebSocket.readyState === WebSocket.OPEN) {
                            console.log('Closing existing WebSocket connection');
                            currentWebSocket.close();
                            resetButtons();
                            isRecording = false;
                            activeButton = null;
                        }


                        const ws = new WebSocket("wss://imeddesk.uat.dcservices.in/asr_service/stream");
                        currentWebSocket = ws;

                        ws.onmessage = event => {
                            console.log(`WebSocket message received:`, event.data);
                            //responseContainer.value += event.data + " ";  // need to change in paragraph
                            responseContainer.textContent += event.data + " "; 
                        };

                        ws.onopen = () => {
                            button.innerHTML = '<i class="fa fa-stop-circle" style="color: Tomato;" aria-hidden="true"></i> ';
                            isRecording = true;
                            activeButton = button;
                        };

                        ws.onclose = () => {
                            console.log('WebSocket connection closed');
                            if (currentWebSocket === ws) {
                                currentWebSocket = null;
                                if (activeButton === button) {
                                    button.innerHTML = '<i class="fa fa-microphone" aria-hidden="true"></i> ';
                                    isRecording = false;
                                    activeButton = null;
                                }
                            }
                        };


                        const stream = await navigator.mediaDevices.getUserMedia({audio: true});
                        mediaRecorder = new MediaRecorder(stream, {mimeType: 'audio/webm'});

                        mediaRecorder.ondataavailable = event => {
                            if (event.data.size > 0) {
                                audioChunks.push(event.data);
                            }
                        };

                        mediaRecorder.onstart = () => console.log('Recording started');
                        mediaRecorder.onstop = async () => {
                            if (audioChunks.length > 0) {
                                const audioBlob = new Blob(audioChunks, {type: 'audio/webm'});
                                const b64Audio = await blobToBase64(audioBlob);
                                if (currentWebSocket && currentWebSocket.readyState === WebSocket.OPEN) {
                                    currentWebSocket.send(b64Audio);
                                }
                                audioChunks = [];
                            }
                        };


                        myvad = await vad.MicVAD.new({
                            onSpeechStart: () => {
                                if (mediaRecorder.state === 'paused' || mediaRecorder.state === 'inactive') {
                                    mediaRecorder.start();
                                }
                            },
                            onSpeechEnd: async (audio) => {
                                console.log('Speech ended');
                                if (mediaRecorder.state === 'recording') {
                                    mediaRecorder.stop();
                                }
                            },
                            onVADMisfire: () => {
                                console.log('VAD misfire');
                            },
                            onVADTimeout: () => {
                                console.log('VAD timeout');
                                if (mediaRecorder.state === 'recording') {
                                    mediaRecorder.stop();
                                }
                            },
                            onError: (e) => {
                                console.error('VAD error:', e);
                            }
                        });

                        myvad.start();
                    } catch (error) {
                        console.error('Error accessing media devices:', error);
                    }
                }

                function stopRecording() {
                    if (mediaRecorder && mediaRecorder.state === 'recording') {
                        mediaRecorder.stop();
                    }
                    if (myvad) {
                        myvad.pause();
                    }
                    if (currentWebSocket && currentWebSocket.readyState === WebSocket.OPEN) {
                        currentWebSocket.close();
                    }
                }

                function resetButtons() {
                    document.querySelectorAll('[id^="recordButton"]').forEach(button => {
                        button.innerHTML = '<i class="fa fa-microphone" aria-hidden="true"></i> ';
                    });
                }

                document.querySelectorAll('[id^="recordButton"]').forEach(button => {
                    button.addEventListener('click', async () => {
                        //const responseContainer = document.getElementById(`responseContainer${button.id.replace('recordButton', '')}`);   // need to replace in paragraph
                        const responseContainer = document.getElementById(`responseContainer${button.id.replace('recordButton', '')}`);   

                        if (activeButton && activeButton !== button) {
                            stopRecording();
                            resetButtons();
                        }

                        if (!isRecording || activeButton !== button) {
                            await startRecording(button, responseContainer);
                        } else {
                            stopRecording();
                            resetButtons();
                            isRecording = false;
                            activeButton = null;
                        }
                    });
                });
            });


        </script>






        <script>
            document.addEventListener('DOMContentLoaded', function () {

                const textareas = document.querySelectorAll('textarea');

                function autoResize(textarea) {
                    textarea.style.height = 'auto';
                    textarea.style.height = (textarea.scrollHeight) + 'px';
                }


                textareas.forEach(textarea => {
                    textarea.addEventListener('input', () => autoResize(textarea));
                    autoResize(textarea);
                });
            });


        </script>
        <script>
            document.getElementById('downloadPdf').addEventListener('click', function () {
            	const {jsPDF} = window.jspdf;
                const doc = new jsPDF();


                const margin = 10;
                const padding = 10;
                const pageWidth = doc.internal.pageSize.getWidth();
                const pageHeight = doc.internal.pageSize.getHeight();
                const contentWidth = pageWidth - 2 * (margin + padding);
                const lineHeight = 4;
                const lineSpacing = 2;


                const mainHeading = "IPD Discharge Summary";
                doc.setFontSize(20);
                const headingWidth = doc.getTextWidth(mainHeading);
                const headingX = (pageWidth - headingWidth) / 2;


                doc.setDrawColor(0, 0, 0);
                doc.setLineWidth(0.2);
                doc.rect(margin, margin, pageWidth - 2 * margin, pageHeight - 2 * margin);


                doc.text(mainHeading, headingX, 20);
                const underlineY = 22;
                doc.setLineWidth(0.5);
                doc.line(headingX, underlineY, headingX + headingWidth, underlineY);


                const sections = [
                    {heading: "Chief Complaints", content: document.getElementById('responseContainer1').textContent},
                    {heading: "History of Present Illness", content: document.getElementById('responseContainer2').textContent},
                    {heading: "Condition At Discharge", content: document.getElementById('responseContainer3').textContent},
                    {heading: "Hospital Course", content: document.getElementById('responseContainer4').textContent},
                    {heading: "Other Investigations", content: document.getElementById('responseContainer5').textContent},
                    {heading: "Operative Findings", content: document.getElementById('responseContainer6').textContent},
                    {heading: "Other Advice", content: document.getElementById('responseContainer7').textContent},
                    {heading: "Follow Up Advice", content: document.getElementById('responseContainer8').textContent},
                    {heading: "Presenting Complaints", content: document.getElementById('responseContainer9').textContent},
                    {heading: "History of Presenting Complaints", content: document.getElementById('responseContainer10').textContent},
                    {heading: "Past History", content: document.getElementById('responseContainer11').textContent},
                    {heading: "Personal History", content: document.getElementById('responseContainer12').textContent},
                    {heading: "Family History", content: document.getElementById('responseContainer13').textContent},
                ];


                let verticalOffset = 40;


                function addJustifiedText(doc, text, x, y, maxWidth) {
                    const words = text.split(' ');
                    let line = '';
                    let lineWidth = 0;
                    let pageHeightUsed = y;

                    words.forEach((word) => {
                        const testLine = line + word + ' ';
                        const testWidth = doc.getTextWidth(testLine);

                        if (testWidth > maxWidth) {

                            const spaces = line.split(' ').length - 1;
                            const spaceWidth = (maxWidth - lineWidth) / spaces;


                            const justifiedLine = line.split(' ').map((word, index) => {
                                if (index === 0)
                                    return word;
                                return ' '.repeat(spaceWidth) + word;
                            }).join(' ');

                            doc.text(justifiedLine, x, y);
                            y += lineHeight + lineSpacing;
                            line = word + ' ';
                            lineWidth = doc.getTextWidth(word);
                        } else {
                            line = testLine;
                            lineWidth = testWidth;
                        }
                    });


                    if (line) {
                        doc.text(line, x, y);
                        pageHeightUsed = y + lineHeight + lineSpacing;
                    }

                    return pageHeightUsed;
                }
 

                sections.forEach((section, index) => {

                    if (verticalOffset + 30 > pageHeight - margin) {
                        doc.addPage();
                        doc.rect(margin, margin, pageWidth - 2 * margin, pageHeight - 2 * margin);
                        verticalOffset = margin + padding;
                    }


                    doc.setFontSize(16);
                    const headingText = section.heading;
                    const headingLines = doc.splitTextToSize(headingText, contentWidth);
                    headingLines.forEach((line, i) => {
                        const headingX = margin + padding;
                        const headingY = verticalOffset + i * 10;
                        doc.text(line, headingX, headingY);
                        const lineWidth = doc.getTextWidth(line);
                        doc.setLineWidth(0.5);
                        doc.line(headingX, headingY + 2, headingX + lineWidth, headingY + 2);
                    });

                    verticalOffset += 10 * headingLines.length;


                    const content = section.content;
                    doc.setFontSize(12);
                    const newVerticalOffset = addJustifiedText(doc, content, margin + padding, verticalOffset, contentWidth);
                    verticalOffset = newVerticalOffset + 10;


                    if (verticalOffset > pageHeight - margin - padding) {
                        doc.addPage();
                        doc.rect(margin, margin, pageWidth - 2 * margin, pageHeight - 2 * margin);
                        verticalOffset = margin + padding;
                    }
                });


                doc.save('IPD-Discharge-Summary.pdf');
            });
        </script>
        
        
        
        <script>
        function toggleButton(id) {
            const button = document.getElementById('toggleButton'+id);
            var text = document.getElementById('responseContainer'+id).textContent;
        	if(text.trim() === ""){
        		alert("Text not found for expand acronym.");
                return;
        	}
            
            if (button.innerText === 'Expander') {
            	textExpender(id);
                button.innerText = 'Undu';
                button.setAttribute('onclick', 'toggleButton('+id+')');
            } else {
                unduFunction(id);
                button.innerText = 'Expander';
                button.setAttribute('onclick', 'toggleButton('+id+')');
            }
        }
        
        
        
            function expandFunction() {
                console.log("Expand function called");
                alert("expandFunction");
            }

            function unduFunction(id) {
                console.log("Undu function called");
                
                document.getElementById('responseContainer' + id).innerHTML = document.getElementById('responseContainerTemp' + id).innerHTML;
                document.getElementById('responseContainerTemp' + id).innerHTML = "";
            }

            
        </script>
        
        
        
        
        
        <script>
        
        function textHighlighter(id){
        	var text = document.getElementById('responseContainer'+id).textContent;
        	if(text.trim() === ""){
        		alert("Text not found for highlight snomed ct terms.");
                return;
        	}
        	
        	const loader = document.getElementById("load");
            loader.style.display = 'block';
        	
        	$.ajax({
                url: 'http://10.10.11.35/snowmed_ct_terms_highlighter_service',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    text: text.trim(),                    
                }),
                xhrFields: {
                    responseType: 'application/json'
                },
                success: function (data) {
                	
                	alert(text);
                	
                     //document.getElementById('responseContainer'+id).innerHTML  = data['text']; 
                     document.getElementById('responseContainer' + id).innerHTML = data['text'];   
                     loader.style.display = 'none';
                },
                error: function (xhr, status, error) {
                    console.error("Error:", status, error);
                    alert("There was an error processing your request.");
                    loader.style.display = 'none';
                }
        	});
        	}
        
        
        
        
        function textExpender(id){
        	var text = document.getElementById('responseContainer'+id).textContent;
        	
        	if(text.trim() === ""){
        		alert("Text not found for expand acronym.");
                return;
        	}        	
        	const loader = document.getElementById("load");
            loader.style.display = 'block';
        	
        	$.ajax({
                url: 'ajax/acronym_expander_service',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    text: text.trim(),                    
                }),
                
                success: function (data) {
                	document.getElementById('responseContainerTemp' + id).innerHTML = text;
                     document.getElementById('responseContainer' + id).innerHTML = data['text'];
                     loader.style.display = 'none';
                },
                error: function (xhr, status, error) {
                    console.error("Error:", status, error);
                    document.getElementById('responseContainerTemp' + id).innerHTML = text;
                    alert("There was an error processing your request.");
                    loader.style.display = 'none';
                }
        	});
        	}
        
        </script>
        
        
    </body>
</html>

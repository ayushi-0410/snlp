

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" type="image/x-icon" href="Img/cdac_1.png">
        <!-- CSS Libraries -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="style-toggle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
    </head>
    <body>
        <div id='topbar' style="background-color: white; padding: 10px;">
            <img src="Img/cdac-logo.png" alt='Logo' id='logo'>
            <label for='sidebar-check' id='sidebar-toggle' onclick='' style="color: black; font-size: 40px;">☰</label>
            <div id='page-title' style="color: black; font-size: 32px; margin: 10px 0; font-weight: bold; text-align: center;font-family: monospace;">Voice and Text Application Demonstration</div>
        </div>

        <!-- top -->
        <div id="content">
            <input checked id='sidebar-check' type='checkbox'>
            <div id='sidebar' class='text-white p-4 mt-4'>
                <input checked class='category-check d-none' id='category-1' type='checkbox'>
                <div class='category text-center'>
                    <label class='category-label d-none' for='category-1'>Category</label>
                    <ul class='category-list list-unstyled'>
                        <a href="home.jsp" style="text-decoration: none !important;"><label class='d-block text-light p-2 bg-warning rounded mx-auto'>Home Page</label></a>
                        <li class='my-2'>
                            <a href="ASR.jsp" style="text-decoration: none !important;"><label class='d-block text-light p-2 rounded mx-auto' style="background-color: #005893cc;height: 80%;" >ASR</label></a>
                        </li>
                        <li class='my-2'>
                            <a href="SASR.jsp" style="text-decoration: none !important;"><label class='d-block text-light p-2 rounded mx-auto' style="background-color: #005893cc;height: 80%;">Streaming ASR</label></a>
                        </li>
                        <li class='my-2'>
                            <a href="T2S.jsp" style="text-decoration: none !important;"> <label class='d-block text-light p-2 rounded mx-auto' style="background-color: #005893cc;height: 80%;" >Text-to-Speech</label></a>
                        </li>
                        <li class='my-2'>
                            <a href="MT.jsp" style="text-decoration: none !important;"><label class='d-block text-light p-2 bg-success rounded mx-auto' >Machine Translation</label></a>
                        </li>
                        <li class='my-2'>
                            <a href="S2S.jsp" style="text-decoration: none !important;"><label class='d-block text-light p-2  rounded mx-auto' style="background-color: #005893cc;height: 80%;">Speech to speech</label></a>
                        </li>
                        <li class='my-2'>
                            <a href="TRANS.jsp" style="text-decoration: none !important;"><label class='d-block text-light p-2  rounded mx-auto' style="background-color: #005893cc;height: 80%;">Transliteration</label></a>
                        </li>
                    </ul>
                </div>
            </div>

            <div id='main'>
                <form id="mtform">
                    <!-- ASR Section -->
                    <input checked class='content-check'  name='main-content' type='radio'>
                    <div class='content'>
                        <div class="text-center mb-4">
                            <h1>Machine Translation</h1>
                        </div>
                        <div id="container1" class="container" style="border: 2px solid black; background-image: url('Img/bg1.jpg'); padding: 20px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                            <div class="row">
                                <!-- Source Language Section -->
                                <div class="form-group col-md-6 col-12">
                                    <label for="source_lang"><strong>Source Language:</strong></label>
                                    <select class="custom-select d-inline-block" style="width:auto;" id="source_lang" name="source_lang" onchange="clearTranscription();">
                                        <option value="-1" selected>Select</option>
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
                                        <!-- Other languages... -->
                                    </select>
                                </div>

                                <!-- Target Language Section -->
                                <div class="form-group col-md-6 col-12">
                                    <label class= "d-inline-block" for="target_lang"><strong>Target Language : </strong></label>
                                    <select class="custom-select d-inline-block" style="width:auto;" id="target_lang" name="target_lang">
                                        <option value="-1" selected>Select</option>
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
                                        <!-- Other languages... -->
                                    </select>
                                </div>
                            </div>

                            <!-- Textarea Section -->
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <textarea class="form-control" id="src_text" name="src_text" placeholder="Select Source Language" rows="15" style="border: 2px solid; background-color: #FFFFFF;"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <textarea class="form-control"  id="trans_text" placeholder="Translated Text" rows="15" disabled="disabled" style="border: 2px solid; background-color: #FFFFFF;"></textarea>
                                    </div>
                                </div>
                            </div>

                            <!-- Translate Button -->
                            <div class="row">
                                <div class="col-md-12 col-12 text-center">
                                    <button type="button" class="btn btn-success btn-lg" id="translatebutton" onclick="translatetext();">
                                        Translate
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- content -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script type="text/javascript">

                                        $(document).ready(function () {
                                            document.getElementById('source_lang').addEventListener('change', function () {

                                                var source_selected_value = this.value;
                                                var target_dropdown = document.getElementById('target_lang');
                                                target_dropdown.value = "-1";
                                                $("#trans_text").attr("placeholder", "Translated Text");
                                                var target_dropdown_options = document.getElementById('target_lang').getElementsByTagName('option');
                                                for (var i = 0; i < target_dropdown_options.length; i++) {
                                                    if (target_dropdown_options[i].value === source_selected_value) {
                                                        target_dropdown_options[i].style.display = 'none';
                                                    } else {
                                                        target_dropdown_options[i].style.display = '';
                                                    }
                                                }

                                            });

                                            document.getElementById('target_lang').addEventListener('change', function () {
                                                $("#trans_text").val("");
                                                if (this.value === "-1") {
                                                    $("#trans_text").attr("placeholder", "Translated Text");
                                                }
                                            });

                                        });

                                        function translatetext() {

                                            var formdata = $('#mtform').serializeArray();

                                            var data = {"lang": "", "src_text": ""};
                                            var source;
                                            var target;
                                            for (var a = 0; a < formdata.length; a++) {
                                                if (formdata[a]["name"] === "source_lang") {

                                                    source = formdata[a]["value"];
                                                }
                                                if (formdata[a]["name"] === "target_lang") {

                                                    target = formdata[a]["value"];
                                                }
                                                if (formdata[a]["name"] === "src_text") {
                                                    data["src_text"] = formdata[a]["value"];
                                                }

                                            }
                                            data["lang"] = source + "_" + target;
                                            

                                            if (data["src_text"].trim() === "") {
                                                $("#src_text").attr("class", "form-control is-invalid");
                                                $("#trans_text").val("");
                                                $("#src_text").val("");
                                            } else if (document.getElementById('target_lang').value === "-1") {
                                                Swal.fire("Select Target Language");
//                    alert('Select Target Language');
                                            } else if (document.getElementById('source_lang').value === "-1") {
                                                Swal.fire("Select Source Language");
//                    alert('Select Source Language');
                                            } else
                                            {
                                                $("#src_text").attr("class", "form-control is-valid");
                                                var formURL = "ulcamtaction";
                                                $('#translatebutton').html("<span class=\"spinner-border spinner-border-sm\"></span> Translating...");
                                                $('#translatebutton').attr("disabled", true);                                            
                                                $.ajax(
                                                        {
                                                            url: formURL,
                                                            context: this,
                                                            type: "POST",
                                                            contentType: "application/json; charset=UTF-8",
                                                            data: JSON.stringify(data),
                                                            success: function (response) {

                                                                var text = response["output"];
                                                                text = text.replaceAll('\@\@ ', '');
                                                                text = text.replaceAll('\@\@', '');
                                                                text = text.replaceAll('?', '');
                                                                console.log(text);
                                                                $("#trans_text").val(text);
                                                                $('#translatebutton').attr("disabled", false);
//                                $('#trans_progress').attr('style', 'display: none;');
                                                                $('#translatebutton').html("Translate");
                                                            },
                                                            error: function (xhr, status, error, response) {
                                                                $('#translatebutton').attr("disabled", false);
                                                                $('#translatebutton').html("Translate");
                                                            }
                                                            ,
                                                            failure: function (errorData, response) {
                                                                $('#translatebutton').attr("disabled", false);
                                                                $('#translatebutton').html("Translate");
                                                            }
                                                        });
                                            }
                                        }
                                        function clearTranscription() {
                                            $("#trans_text").val("");
                                            $("#src_text").val("");
                                            var sourceText = $("#source_lang option:selected").text();
                                            var targetText = $("#target_lang option:selected").text();

                                            $("#src_text").attr("placeholder", sourceText + " Text");
                                            $("#trans_text").attr("placeholder", "Translated " + targetText + " Text");
                                        }
        </script>
        <script>
            $(document).ready(function () {
                document.getElementById('sidebar-toggle').click();
            });
        </script>
    </body>
</html>
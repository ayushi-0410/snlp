package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfCopy;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

@RequestMapping("/ajax")
@Controller
public class AjaxController {

	@Value("${ttsAPIUrl}")
	private String ttsAPIUrl;

	@Value("${asrAPIUrl}")
	private String asrAPIUrl;

	@Value("${mtAPIUrl}")
	private String mtAPIUrl;

	@Value("${transliterationAPIUrl}")
	private String transliterationAPIUrl;

	@Value("${ocrAPIUrl}")
	private String ocrAPIUrl;

	@Value("${ocrTessUrl}")
	private String ocrTessUrl;

	@Value("${asrInputPath}")
	private String asrInputPath;

	@Value("${ttsOutputPath}")
	private String ttsOutputPath;

	@Value("${speechToTextInputPath}")
	private String speechToTextInputPath;

	@Value("${ocrInputPath}")
	private String ocrInputPath;

	@Value("${pdfInputPath}")
	private String pdfInputPath;

	@Value("${pdfToImgPathTemp}")
	private String pdfToImgPathTemp;

	@Value("${imagesToPDF}")
	private String imagesToPDF;

	@Value("${pdf2imageAPI}")
	private String pdf2imageAPI;

	@Autowired
	UserService userService;

	@Autowired
	RestTemplate restTemplate;

	@Autowired
	private JavaMailSender emailSender;

	String currentDateForFile = new SimpleDateFormat("yyyyMMddHHmmssSSSSSS").format(new Date());

	@ResponseBody
	@RequestMapping(value = "/textToSpeach", method = RequestMethod.POST)
	public String textToSpeach(@RequestParam("lang") String lang, @RequestParam("text") String text) {
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		if (userName == "anonymousUser") {
			userName = "guestUser";
		}
		String fileName = currentDateForFile + userName + ".wav";
		JSONObject requestBodyJson = new JSONObject();
		requestBodyJson.put("model", lang);
		requestBodyJson.put("text", text);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		System.out.println("Request body of tts: " + requestBodyJson);
		System.out.println("Tts url : " + ttsAPIUrl);
		HttpEntity<String> requestEntity = new HttpEntity<>(requestBodyJson.toString(), headers);
		try {
			ResponseEntity<byte[]> responseEntity = restTemplate.exchange(ttsAPIUrl, HttpMethod.POST, requestEntity,
					byte[].class);
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
//				String base64Audio = Base64.encodeBase64String(responseEntity.getBody());
				String base64Audio = Base64.getEncoder().encodeToString(responseEntity.getBody());
				boolean saveTtsFlag = userService.saveTTSDetails(lang, text, ttsOutputPath + fileName);
				// byte[] audioByte = Base64.decodeBase64(base64Audio);
				File audioFile = new File(ttsOutputPath, fileName);
				try (FileOutputStream fos = new FileOutputStream(audioFile)) {
					fos.write(responseEntity.getBody());
					fos.close();
				}
				return base64Audio;
			} else {
				return "error 1";
			}
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			return "error";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/automaticSpeechRecognition", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String automaticSpeechRecognition(@RequestParam("language") String language,
			@RequestParam("base64String") String base64String, @RequestParam("appName") String appName) {
		System.out.println("baseString is = " + base64String);
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		if (userName == "anonymousUser") {
			userName = "guestUser";
		}
		String fileName = currentDateForFile + userName + ".wav";
		Path filePath = Paths.get(speechToTextInputPath, fileName);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("language", language);
		jsonObject.put("message", base64String.split(",")[1].trim());
		jsonObject.put("app_name", appName);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);
		// RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(asrAPIUrl, HttpMethod.POST, requestEntity,
					String.class);
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
//				byte[] audioByte = Base64.decodeBase64(base64String.split(",")[1].trim());
				byte[] audioByte = Base64.getDecoder().decode(base64String.split(",")[1].trim());
				File audioFile = new File(speechToTextInputPath, fileName);
				try (FileOutputStream fos = new FileOutputStream(audioFile)) {
					fos.write(audioByte);
					fos.close();
				}
				String responseBody = responseEntity.getBody();
				JSONObject jsonResponse = new JSONObject(responseBody);
				boolean saveAsrFlag = userService.saveAsrDetails(language, filePath,
						(String) jsonResponse.get("result"));
				System.out.println("repsonse of asr ===== " + jsonResponse.toString());
				return jsonResponse.toString();
			} else {

				return "Error : " + responseEntity.getStatusCodeValue();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/machineTranslation", method = RequestMethod.POST, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String machineTranslation(@RequestParam("src_text") String src_text, @RequestParam("lang") String lang) {

		System.out.println("lang= " + lang);
		System.out.println("src == " + src_text);

		JSONObject jsonData = new JSONObject();
		jsonData.put("src_text", src_text);
		jsonData.put("lang", lang);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON_UTF8);
		// headers.set("Authorization", "Bearer " + token);
		HttpEntity<String> requestEntity = new HttpEntity<>(jsonData.toString(), headers);
		System.out.println("mtAPIUrl: " + mtAPIUrl);

		// RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(mtAPIUrl, HttpMethod.POST, requestEntity,
					String.class);
			System.out.println("Response Status: " + responseEntity.getStatusCode());
			System.out.println("Response Body: " + responseEntity.getBody());
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
				String responseBody = responseEntity.getBody();
				JSONObject jsonResponse = new JSONObject(responseBody);
				String outputText = jsonResponse.getString("output");

				System.out.println("json response == " + jsonResponse.toString());
				boolean saveFlag = userService.saveTranslationDetails(src_text, lang, outputText, lang);
				return jsonResponse.toString();
			} else {
				return "fail";
			}

		} catch (Exception ex) {
			ex.printStackTrace(); // This prints the full stack trace
			System.out.println("Error Message: " + ex.getMessage());
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/transLteration", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String transLteration(@RequestParam("languagePair") String languagePair, @RequestParam("text") String text) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("lang", languagePair);
		jsonObject.put("text", text.trim());
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);
		System.out.println("request entity = " + requestEntity);
		// RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(transliterationAPIUrl, HttpMethod.POST,
					requestEntity, String.class);
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
				String responseBody = responseEntity.getBody();
				JSONObject jsonResponse = new JSONObject(responseBody);
				System.out.println("response == " + jsonResponse.toString());
				boolean saveDetails = userService.saveTranslitrationDetails(text, languagePair,
						jsonResponse.get("output").toString().trim());
				System.out.println("response == " + jsonResponse.toString());
				return jsonResponse.toString();
			} else {
				return "Error : " + responseEntity.getStatusCode();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/converToOcr_orign", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String converToOcr_orign(@RequestParam("imageToBase64") String imageToBase64,
			@RequestParam("modalType") String modalType) {
		String apiUrl = "http://10.226.30.33:8081/post_json";
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("image-content", imageToBase64);
		jsonObject.put("model-type", modalType);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);
		// RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity,
					String.class);
			System.out.println("response is = " + responseEntity);
			String responseBody = responseEntity.getBody();
			// Parse the JSON response
			JSONObject jsonResponse = new JSONObject(responseBody);
			System.out.println("json respo = " + jsonResponse);
			return jsonResponse.toString();
		} catch (Exception ex) {
			JSONObject jsonResponseExcep = new JSONObject();
			jsonResponseExcep.put("error", "Some error occured, Please try again.");
			ex.printStackTrace();
			return jsonResponseExcep.toString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/converToOcr", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String converToOcr(@RequestParam("ocr") String ocr, @RequestParam("languages") String languages,
			@RequestParam("model") String model, @RequestParam("column") String column) {
		try {
			// RestTemplate restTemplate = new RestTemplate();
			System.out.println("model === " + model);
			// byte[] fileContent = ocr.getBytes();
//			String base64String = Base64.encodeBase64String(fileContent);
			String base64String = ocr;
			Path filePath = Paths.get(ocrInputPath, currentDateForFile + ocr);

			if (model.equalsIgnoreCase("cnn")) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("image-content", base64String);
				jsonObject.put("model-type", languages);
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.APPLICATION_JSON);

				HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);
				ResponseEntity<String> responseEntity = restTemplate.exchange(ocrAPIUrl, HttpMethod.POST, requestEntity,
						String.class);
				if (responseEntity.getStatusCode() == HttpStatus.OK) {
					// Files.write(filePath, ocr);
					String responseBody = responseEntity.getBody();
					JSONObject jsonResponse = new JSONObject(responseBody);
					boolean flagSave = userService.saveOcrDetails(filePath, languages,
							(String) jsonResponse.getString("ocr-output"));
					return jsonResponse.toString();
				} else {
					JSONObject jsonResponseExcep = new JSONObject();
					jsonResponseExcep.put("error", "Some error occured, Please try again.");
					return jsonResponseExcep.toString();
				}
			}

			if (model.equalsIgnoreCase("tess")) {

				JSONObject jsonObj = new JSONObject();
				jsonObj.put("image-content", base64String);
				jsonObj.put("language", languages);
				jsonObj.put("page_type", column);

				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(MediaType.APPLICATION_JSON);

				HttpEntity<String> requestEntity = new HttpEntity<>(jsonObj.toString(), headers);
				System.out.println("eq ent == " + requestEntity);
				ResponseEntity<String> responseEntity = restTemplate.exchange(ocrTessUrl, HttpMethod.POST,
						requestEntity, String.class);
				System.out.println("response ent=== " + responseEntity);

				if (responseEntity.getStatusCode() == HttpStatus.OK) {
					// Files.write(filePath, fileContent);
					String responseBody = responseEntity.getBody();
					JSONObject jsonResponse = new JSONObject(responseBody);
					boolean flagSave = userService.saveOcrDetails(filePath, languages,
							(String) jsonResponse.getString("ocr-output"));
					return jsonResponse.toString();
				} else {
					JSONObject jsonResponseExcep = new JSONObject();
					jsonResponseExcep.put("error", "Some error occured, Please try again.");
					return jsonResponseExcep.toString();
				}

			} else {
				JSONObject jsonResponseExcep = new JSONObject();
				jsonResponseExcep.put("error", "Model not selected");
				return jsonResponseExcep.toString();
			}
		} catch (Exception ex) {
			JSONObject jsonResponseExcep = new JSONObject();
			jsonResponseExcep.put("error", "Some error occured, Please try again.");
			ex.printStackTrace();
			return jsonResponseExcep.toString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/automaticSpeechRecognitionDB", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String automaticSpeechRecognitionDB(@RequestParam("audiofileinput") MultipartFile[] audiofileinput1,
			@RequestParam("lang") String lang, @RequestParam("appName") String appName) {

		System.out.println("in controller");

		try {
			// RestTemplate restTemplate = new RestTemplate();
			byte[] fileContent = audiofileinput1[0].getBytes();
//	        String base64String = Base64.encodeBase64String(fileContent);
			String base64String = Base64.getEncoder().encodeToString(fileContent);
			Path filePath = Paths.get(asrInputPath, currentDateForFile + audiofileinput1[0].getOriginalFilename());
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("language", lang);
			jsonObject.put("message", base64String);
			jsonObject.put("app_name", appName);
			// Set headers for JSON content
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);
			// Send request to ASR API

			System.out.println("file is = " + base64String);

			ResponseEntity<String> responseEntity = restTemplate.exchange(asrAPIUrl, HttpMethod.POST, requestEntity,
					String.class);
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
				Files.write(filePath, fileContent);
				String responseBody = responseEntity.getBody();
				JSONObject jsonResponse = new JSONObject(responseBody);
				Boolean saveFlag = userService.saveAsrDetails(lang, filePath, (String) jsonResponse.get("result")); // store
																													// details
																													// in
																													// database
				return jsonResponse.toString();
			} else {
				return "Error: " + responseEntity.getStatusCodeValue();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			return "error";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/pdfToImage", method = RequestMethod.POST)
	public String pdfToImg(@RequestParam("pdfFile") MultipartFile pdfFile, Principal principle) throws IOException {

		if (null == principle || principle == null) {
			return "session time out. Please log in.";
		}

		System.out.println("inside ajax controller pdf");
		File tempDir = new File(pdfToImgPathTemp + principle.getName());
		if (!tempDir.exists()) {
			tempDir.mkdirs();
		}
		String retVal = "";
		// Generate a unique file name for the uploaded PDF file
		String fileName = pdfFile.getOriginalFilename();

		System.out.println("file name = " + fileName);

		String filePath = tempDir + File.separator + fileName;

		// Save the uploaded PDF file to the temporary directory
		Path path = Paths.get(filePath);
		Files.write(path, pdfFile.getBytes());

		// Create a JSON object with the file path
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("pdf_file", filePath);
		String jsonPayload = "{\"pdf_file\": \"" + filePath + "\"}";

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);

		// Send
		System.out.println("okay okay =" + requestEntity);
		/*
		 * ResponseEntity<String> responseEntity = restTemplate.exchange(pdf2imageAPI,
		 * HttpMethod.POST, requestEntity,String.class);
		 */

		ResponseEntity<byte[]> responseEntity = restTemplate.exchange(pdf2imageAPI, HttpMethod.POST, requestEntity,
				byte[].class);

		/*
		 * JSONObject jsonObject2 = new JSONObject(responseEntity.getBody());
		 * System.out.println("json obvject 2 = "+jsonObject2); String filePathZ =
		 * jsonObject2.getString("zip_file_path");
		 */

		RestTemplate restTemplate = new RestTemplate();

		/*
		 * HttpHeaders header = new HttpHeaders();
		 * headers.setAccept(Arrays.asList(MediaType.APPLICATION_OCTET_STREAM));
		 * HttpEntity<String> entity = new HttpEntity<>(headers);
		 * 
		 * ResponseEntity<byte[]> fileResponse = restTemplate.exchange(filePathZ,
		 * HttpMethod.GET, entity, byte[].class);
		 */

		if (responseEntity.getStatusCode() == HttpStatus.OK) {
			byte[] fileContent = responseEntity.getBody();

			String userHome = System.getProperty("user.home");

			// Construct the path to the Downloads folder
			Path downloadsPath = Paths.get(userHome, "Downloads");

			// Specify the file path in the Downloads folder
			Path pathZ = downloadsPath.resolve("downloaded_images_" + fileName + ".zip");

			System.out.println("file path for sownload = " + Files.exists(pathZ));

			if (Files.exists(pathZ)) {
				// Check if the file has content

				int counter = 1;
				while (Files.exists(pathZ)) {

					System.out.println("in while");

					// Generate new filename with counter
					String newFileName = "downloaded_images_" + fileName + counter + ".zip";

					System.out.println("new file name after count = " + newFileName);

					pathZ = downloadsPath.resolve(newFileName);

					System.out.println("pathz after new file name = " + pathZ);
					counter++;
				}

//	                try {
//	                    long fileSize = Files.size(pathZ);
//	                    if (fileSize > 0) {
//	                    	retVal = "content";
//	                        System.out.println("File already exists and has content.");
//	                        // Handle the case where the file exists and has content
//	                    } else {
//	                    	retVal = "exists";
//	                        System.out.println("File already exists but is empty.");
//	                        // Handle the case where the file exists but is empty
//	                        Files.write(pathZ, fileContent);
//	                    }
//	                } catch (IOException e) {
//	                    e.printStackTrace();
//	                    retVal = e.getMessage();
//	                    // Handle any exceptions
//	                }
			}

			Files.write(pathZ, fileContent);

			System.out.println("File downloaded successfully at: " + pathZ.toAbsolutePath().toString());
			retVal = "sucess";

			Boolean saveFlag = userService.savePDFToImagesDetails(fileName); // store details in database

		} else {
			System.out.println("Failed to download file. HTTP Status Code: " + responseEntity.getStatusCode());
			retVal = "fail";

			/*
			 * File file = new File(filePathZ);
			 * 
			 * if (!file.exists()) { return
			 * ResponseEntity.status(HttpStatus.NOT_FOUND).body(null); }
			 * 
			 * FileInputStream fileInputStream = new FileInputStream(file);
			 * InputStreamResource resource = new InputStreamResource(fileInputStream);
			 * 
			 * HttpHeaders headers1 = new HttpHeaders();
			 * headers1.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" +
			 * file.getName()); headers1.add(HttpHeaders.CONTENT_TYPE,
			 * MediaType.APPLICATION_OCTET_STREAM_VALUE);
			 * System.out.println(ResponseEntity.ok().headers(headers1).contentLength(file.
			 * length()).body(resource));
			 * 
			 * return ResponseEntity.ok() .headers(headers1) .contentLength(file.length())
			 * .body(resource);
			 */

		}
		System.out.println(retVal);
		// deleteDirectory(tempDir);
		return retVal;
	}

	// Method to delete a directory and its contents
	private void deleteDirectory(File directoryToBeDeleted) {
		File[] allContents = directoryToBeDeleted.listFiles();
		if (allContents != null) {
			for (File file : allContents) {
				deleteDirectory(file);
			}
		}
		directoryToBeDeleted.delete();
	}

	@RequestMapping(value = "/downloadZip", method = RequestMethod.GET)
	public ResponseEntity<ByteArrayResource> downloadZipFile(@RequestParam("fileName") String fileName)
			throws IOException {
		// Load the file as a ByteArrayResource
		Path zipFilePath = Paths.get(pdfInputPath, fileName);
		byte[] zipFileBytes = Files.readAllBytes(zipFilePath);
		ByteArrayResource resource = new ByteArrayResource(zipFileBytes);

		// Set headers for download
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment", fileName);

		// Return ResponseEntity with file content and headers
		return ResponseEntity.ok().headers(headers).contentLength(zipFileBytes.length).body(resource);
	}

	@ResponseBody
	@RequestMapping(value = "/submitFeedBack", method = RequestMethod.POST)
	public String submitFeedBack(@RequestParam("userName") String userName,
			@RequestParam("userNumber") String userNumber, @RequestParam("domainFor") String domainFor,
			@RequestParam("feedbackMessage") String feedbackMessage, @RequestParam("userEmail") String userEmail) {
		String returnString = "";
		boolean mailSendFlag = true;
		String preMsg = "";
		String exFeedbackMsg = "";
		boolean saveFeedbackFlag = false;

		String[] lines = feedbackMessage.split("\n");
		for (String line : lines) {
			if (line.trim() != "") {
				exFeedbackMsg = exFeedbackMsg + line + "<br>";
			}
		}
		preMsg = "Dear User,<br>" + userName + " has sent following feedback for " + domainFor + " :<br><br>"
				+ exFeedbackMsg + "<br>Thank you,<br>" + "SNLP Team.";
		try {
			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo("tayushi0410@gmail.com");
			helper.setSubject("Feedback for : " + domainFor);
			helper.setText(preMsg, true); // true indicates HTML

			// You can add attachments if needed
			// helper.addAttachment("filename", new File("/path/to/attachment"));

			emailSender.send(message);
			// returnString = "Email sent successfully!";
		} catch (MessagingException e) {
			e.printStackTrace();
			returnString = "Error while sending feedback.<br>Please try again later.";
			mailSendFlag = false;
		}

		if (mailSendFlag == true) {
			saveFeedbackFlag = userService.saveFeedbackFromUser(userName, userNumber, userEmail, domainFor,
					feedbackMessage);
			if (saveFeedbackFlag == true) {
				returnString = "We get your feedback.<br>Thank you for your feedback.";
			}
		}
		return returnString.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/imagesToPdf", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String imagesToPdg(@RequestParam("pdfFiles") List<MultipartFile> files) {

		final float PAGE_WIDTH = 595; // PDF page width
		final float PAGE_HEIGHT = 842; // PDF page height
		final float MARGIN = 20; // Margin to leave around the image

		if (files.isEmpty()) {
			return "No files uploaded";
		}

		Document document = new Document();

		try {
			String directoryPath = imagesToPDF; // Specify your directory path
			String fileName = "generated.pdf";
			FileOutputStream fos = new FileOutputStream(directoryPath + "/" + fileName);
			PdfWriter.getInstance(document, fos);
			document.open();

			for (MultipartFile imageFile : files) {
				if (!imageFile.getContentType().startsWith("image")) {
					return "File " + imageFile.getOriginalFilename() + " is not an image.";
				}

				// Convert MultipartFile to iText Image
				Image image = Image.getInstance(imageFile.getBytes());

				// Calculate dimensions and position
				float imgWidth = image.getScaledWidth();
				float imgHeight = image.getScaledHeight();

				// Calculate scale to fit image within page margins
				float scale = Math.min((PAGE_WIDTH - 2 * MARGIN) / imgWidth, (PAGE_HEIGHT - 2 * MARGIN) / imgHeight);

				// Scale image dimensions
				imgWidth *= scale;
				imgHeight *= scale;

				// Calculate position to center image on the page
				float x = (PAGE_WIDTH - imgWidth) / 2;
				float y = (PAGE_HEIGHT - imgHeight) / 2;

				// Set absolute position and dimensions for the image
				image.setAbsolutePosition(x, y);
				image.scaleAbsolute(imgWidth, imgHeight);

				// Add image to the document
				document.add(image);
				document.newPage(); // Add a new page for each image
			}

			document.close();
			fos.close();

			return "PDF file saved successfully!";
		} catch (IOException | DocumentException e) {
			e.printStackTrace();
			return "Error saving PDF file: " + e.getMessage();
		} finally {
			if (document.isOpen()) {
				document.close();
			}

			System.out.println("done");
		}
	}

	@ResponseBody
	@RequestMapping(value = "/pdfMerger", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String pdfMerger(@RequestParam("pdfFiles") List<MultipartFile> files, HttpServletResponse response) {
		String mergedFilePath = "C:\\Users\\CDAC\\Desktop\\merger.pdf"; // Replace with desired output file name

		Document document = new Document();
		OutputStream outputStream = null;

		try {
			outputStream = new FileOutputStream(mergedFilePath);
			PdfCopy copy = new PdfCopy(document, outputStream);
			document.open();

			// Iterate through input PDFs
			for (MultipartFile file : files) {
				PdfReader reader = new PdfReader(file.getInputStream());
				// Merge each PDF into the document
				copy.addDocument(reader);
				reader.close();
			}

			// Close the document and output stream
			document.close();
			outputStream.close();

			// Return merged file name
			return mergedFilePath;
		} catch (Exception e) {
			System.err.println("Exception while merging PDFs: " + e.getMessage());
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return "Error merging PDFs: " + e.getMessage();
		} finally {
			try {
				if (document != null) {
					document.close();
				}
				if (outputStream != null) {
					outputStream.close();
				}
			} catch (IOException e) {
				System.err.println("Exception while closing resources: " + e.getMessage());
			}
		}
	}

	// ----------------------------------------------------------------------------------------------------------------------------------------------------

	@ResponseBody
	@RequestMapping(value = "/textHighlighter", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String textHighlighter(@RequestParam("text") String text) throws FileNotFoundException, IOException {

		Map<Integer, List<String>> dictionaryMap = new HashMap<Integer, List<String>>();

		final String DICTIONARY_FILE_PATH = "G:\\highlighterText\\All_SnowmedCT.txt";
		int maximumKeyValue = 0;
		int totalChunkWords = 0;
		try (BufferedReader br = new BufferedReader(new FileReader(DICTIONARY_FILE_PATH))) {
			String line;
			int whileCounter = 1;
			while ((line = br.readLine()) != null) {
				line = line.replaceAll("\\p{Punct}", "");
				int dictKey = line.trim().split("\\s+").length;
				if (dictionaryMap.get(dictKey) == null) {
					dictionaryMap.put(dictKey, new ArrayList<String>());
					maximumKeyValue++;
				}
				List<String> tempList = dictionaryMap.get(dictKey);
				tempList.add(line.toLowerCase().trim());
				dictionaryMap.put(dictKey, tempList);
				whileCounter++;
			}
		}

		text = text.replaceAll("\\p{Punct}", "");
		String textArray[] = text.split("\\s+");
		System.out.println("text is = " + text);

		for (int i = 0; i < textArray.length;) {
			for (int j = maximumKeyValue; j >= 1; j--) {
				List<String> tempDirList = dictionaryMap.get(j);
				if (i + j <= textArray.length) {
					StringBuilder chunk = new StringBuilder();
					for (int k = 0; k < j; k++) {
						chunk.append(textArray[i + k]).append(" ");
					}
					if (tempDirList.contains(chunk.toString().toLowerCase().trim())) {
						text = text.replaceAll("(?i)\\b" + Pattern.quote(chunk.toString().trim()) + "\\b",
								"<span class=\"highlight\">" + chunk.toString().trim() + "</span>");
						for (int l = 0; l < j; l++) {
							totalChunkWords++;
							textArray[i + l] = "<span class=\"highlight\">" + textArray[i + l] + "</span>";
						}
						i = i + j - 1;
						break;
					}
				}
			}
			i++;
		}

//	    for(int i = maximumKeyValue; i >= 1; i--) {
//	    	List<String> tempDirList = dictionaryMap.get(i);
//	    	for (int j = 0; j <= textArray.length - i; j++) {
//	    		if(textMap.get(j) == false) {
//	    			StringBuilder chunks = new StringBuilder();
//		            for (int k = 0; k < i; k++) {
//		                if (j + k <= textArray.length) {
//		                    chunks.append(textArray[j + k]).append(" ");
//		                }
//		            }
//		            
////		            System.out.println("chunk is = "+chunks);
//		            
//		            if(tempDirList.contains(chunks.toString().trim())) {
//		            	for(int l = 0; l < i; l++) {
//		            		textMap.put(j+l, true);
//		            		totalChunkWords++;		            		
//		            		textArray[j+l] = "<span class=\"highlight\">"+textArray[j+l]+"</span>";		            		
//		            	}
////		            	System.out.println("contain chunks = "+chunks.toString());
//		            	String chunkString = chunks.toString().trim();
//		                //text = text.replace(chunkString, chunkString.toUpperCase());
//		            }
//	    		}            
//	        }
//	    }

		System.out.println("output text is = " + text);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("text", text);// String.join(" ", textArray));
		jsonObject.put("wordCount", totalChunkWords);
		return jsonObject.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/textAveritation", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String textAveritation(@RequestParam("text") String text) throws FileNotFoundException, IOException {

		final String DICTIONARY_FILE_PATH = "G:\\highlighterText\\medicalDictionary.txt";
		Map<String, String> dictionaryMap = new HashMap<String, String>();
		text = text.replaceAll("\\p{Punct}", "");
		String textArray[] = text.split("\\s+");
		int whileCounter = 0;
		try (BufferedReader br = new BufferedReader(new FileReader(DICTIONARY_FILE_PATH))) {
			String line;
			while ((line = br.readLine()) != null) {
				line = line.replaceAll("\\p{Punct}", "");
				String dictKey = line.trim().split("\t")[0].toLowerCase();
				if (dictionaryMap.get(dictKey) == null) {
					dictionaryMap.put(dictKey.trim(), line.trim().split("\t")[1]);
				}
				whileCounter++;
			}
		}
		for (int i = 0; i < textArray.length; i++) {

			System.out.println("text is = " + textArray[i].replace("\"", " ") + " and avr = "
					+ dictionaryMap.get(textArray[i].toLowerCase()));

			if (dictionaryMap.get(textArray[i].toLowerCase().replace("\"", " ").trim()) != null) {
				textArray[i] = textArray[i] + "("
						+ dictionaryMap.get(textArray[i].toLowerCase().replace("\"", " ").trim()) + ")";
			}
		}
		System.out.println("map is = " + dictionaryMap);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("text", String.join(" ", textArray));// String.join(" ", textArray));
		jsonObject.put("wordCount", dictionaryMap.size());
		return jsonObject.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/acronym_expander_service", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String acronym_expander_service(@RequestParam("text") String text)
			throws FileNotFoundException, IOException {

		System.out.println("text = " + text);

		String apiUrl = "http://10.226.17.19:42/acronym_expander_service";

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("text", text);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);
		// RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity,
					String.class);
			System.out.println("response is = " + responseEntity);
			String responseBody = responseEntity.getBody();
			// Parse the JSON response
			JSONObject jsonResponse = new JSONObject(responseBody);
			System.out.println("json respo = " + jsonResponse);
			return jsonResponse.toString();
		} catch (Exception ex) {
			JSONObject jsonResponseExcep = new JSONObject();
			jsonResponseExcep.put("error", "Some error occured, Please try again.");
			ex.printStackTrace();
			return jsonResponseExcep.toString();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/snowmed_ct_terms_highlighter_service", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public String snowmed_ct_terms_highlighter_service(@RequestParam("text") String text)
			throws FileNotFoundException, IOException {

		System.out.println("text = " + text);

		String apiUrl = "http://10.226.17.19:41/snowmed_ct_terms_highlighter_service";

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("text", text);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		HttpEntity<String> requestEntity = new HttpEntity<>(jsonObject.toString(), headers);
		// RestTemplate restTemplate = new RestTemplate();
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity,
					String.class);
			System.out.println("response is = " + responseEntity);
			String responseBody = responseEntity.getBody();
			// Parse the JSON response
			JSONObject jsonResponse = new JSONObject(responseBody);
			System.out.println("json respo = " + jsonResponse);
			return jsonResponse.toString();
		} catch (Exception ex) {
			JSONObject jsonResponseExcep = new JSONObject();
			jsonResponseExcep.put("error", "Some error occured, Please try again.");
			ex.printStackTrace();
			return jsonResponseExcep.toString();
		}
	}

}

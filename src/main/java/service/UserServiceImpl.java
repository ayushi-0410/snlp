package service;

import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;

import dao.UserDAO;
import jakarta.transaction.Transactional;
import modal.AsrDetails;
import modal.OcrDetails;
import modal.PDFToImageDetails;
import modal.TranslationDetails;
import modal.TranslitrationDetails;
import modal.TtsDetails;
import modal.UserFeedBack;

public class UserServiceImpl implements UserService {

	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	@Autowired
	UserDAO userDao;

	@Transactional
	@Override
	public Boolean saveAsrDetails(String lang, Path filePath, String output) {
		// TODO Auto-generated method stub
		String apiHitBy = SecurityContextHolder.getContext().getAuthentication().getName();
		if (apiHitBy == "anonymousUser") {
			apiHitBy = "guestUser";
		}
		AsrDetails asrDetails = new AsrDetails();
		asrDetails.setReqLanguage(lang);
		asrDetails.setInputFilePath(filePath.toString());
		asrDetails.setApiResponse(output);
		asrDetails.setApiHitDate(currentDate);
		asrDetails.setApiHitBy(apiHitBy);
		return userDao.saveAsrDetails(asrDetails);
	}

	@Transactional
	@Override
	public boolean saveTTSDetails(String lang, String text, String output) {
		// TODO Auto-generated method stub
		String apiHitBy = SecurityContextHolder.getContext().getAuthentication().getName();
		if (apiHitBy == "anonymousUser") {
			apiHitBy = "guestUser";
		}
		TtsDetails ttsDetails = new TtsDetails();
		ttsDetails.setReqLanguage(lang);
		ttsDetails.setInputText(text);
		ttsDetails.setApiResponsePath(output);
		ttsDetails.setApiHitDate(currentDate);
		ttsDetails.setApiHitBy(apiHitBy);
		return userDao.saveTTSDetails(ttsDetails);
	}

	@Transactional
	@Override
	public boolean saveTranslitrationDetails(String text, String languagePair, String outputText) {
		// TODO Auto-generated method stub
		String apiHitBy = SecurityContextHolder.getContext().getAuthentication().getName();
		if (apiHitBy == "anonymousUser") {
			apiHitBy = "guestUser";
		}
		TranslitrationDetails td = new TranslitrationDetails();
		td.setInputText(text.trim());
		td.setReqLanguage(languagePair);
		td.setApiResponse(outputText);
		td.setApiHitDate(currentDate);
		td.setApiHitBy(apiHitBy);
		return userDao.saveTranslitrationDetails(td);
	}

	@Transactional
	@Override
	public boolean saveOcrDetails(Path filePath, String languages, String outputText) {
		// TODO Auto-generated method stub
		String apiHitBy = SecurityContextHolder.getContext().getAuthentication().getName();
		if (apiHitBy == "anonymousUser") {
			apiHitBy = "guestUser";
		}
		OcrDetails od = new OcrDetails();
		od.setInputImagePath(filePath.toString());
		od.setReqLanguage(languages);
		od.setApiResponseText(outputText);
		od.setApiHitBy(apiHitBy);
		od.setApiHitDate(currentDate);
		return userDao.saveOcrDetails(od);
	}

	@Transactional
	@Override
	public boolean saveTranslationDetails(String sourceText, String sourceLanguage, String destText,
			String destLanguage) {
		// TODO Auto-generated method stub
		String apiHitBy = SecurityContextHolder.getContext().getAuthentication().getName();
		if (apiHitBy == "anonymousUser") {
			apiHitBy = "guestUser";
		}
		TranslationDetails td = new TranslationDetails();
		td.setSourceText(sourceText);
		td.setSourceLanguage(sourceLanguage);
		td.setDestText(destText);
		td.setDestLanguage(destLanguage);
		td.setApiHitDate(currentDate);
		td.setApiHitBy(apiHitBy);
		return userDao.saveTranslationDetails(td);
	}

	@Transactional
	@Override
	public boolean saveFeedbackFromUser(String userName, String userNumber, String userEmail, String domainFor,
			String feedbackMessage) {
		// TODO Auto-generated method stub
		System.out.println("hello = " + SecurityContextHolder.getContext().getAuthentication().getName());
		UserFeedBack userFB = new UserFeedBack();
		userFB.setUserLoginId(SecurityContextHolder.getContext().getAuthentication().getName());
		userFB.setUserEmail(userEmail);
		userFB.setUserName(userName);
		userFB.setUserMobileNumber(userNumber);
		userFB.setFeedbackDomain(domainFor);
		userFB.setFeedback(feedbackMessage);
		userFB.setFeedbackDate(currentDate);
		userFB.setFeedbackStatus("active");
		return userDao.saveFeedbackFromUser(userFB);
	}

	@Transactional
	@Override
	public Boolean savePDFToImagesDetails(String fileName) {
		// TODO Auto-generated method stub
		String apiHitBy = SecurityContextHolder.getContext().getAuthentication().getName();
		if (apiHitBy == "anonymousUser") {
			apiHitBy = "guestUser";
		}
		PDFToImageDetails p = new PDFToImageDetails();
		p.setPdfName(fileName);
		p.setApiHitDate(currentDate);
		p.setApiHitBy(apiHitBy);
		return userDao.savePDFToImagesDetails(p);
	}
}

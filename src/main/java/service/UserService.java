package service;

import java.nio.file.Path;

public interface UserService {

	Boolean saveAsrDetails(String lang, Path filePath, String output);

	boolean saveTTSDetails(String lang, String text, String output);

	boolean saveTranslitrationDetails(String text, String languagePair, String outputText);

	boolean saveOcrDetails(Path filePath, String languages, String outputText);

	boolean saveTranslationDetails(String sourceText, String sourceLanguage, String destText, String destLanguage);

	boolean saveFeedbackFromUser(String userName, String userNumber, String userEmail, String domainFor,
			String feedbackMessage);

	Boolean savePDFToImagesDetails(String fileName);

}

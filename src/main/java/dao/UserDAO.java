package dao;

import modal.AsrDetails;
import modal.OcrDetails;
import modal.PDFToImageDetails;
import modal.TranslationDetails;
import modal.TranslitrationDetails;
import modal.TtsDetails;
import modal.UserFeedBack;

public interface UserDAO {

	Boolean saveAsrDetails(AsrDetails asrDetails);

	boolean saveTTSDetails(TtsDetails ttsDetails);

	boolean saveTranslitrationDetails(TranslitrationDetails td);

	boolean saveOcrDetails(OcrDetails od);

	boolean saveTranslationDetails(TranslationDetails td);
	
	boolean saveFeedbackFromUser(UserFeedBack userFB);

	Boolean savePDFToImagesDetails(PDFToImageDetails p);

}

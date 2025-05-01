package dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import modal.AsrDetails;
import modal.OcrDetails;
import modal.PDFToImageDetails;
import modal.TranslationDetails;
import modal.TranslitrationDetails;
import modal.TtsDetails;
import modal.UserFeedBack;

public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public Boolean saveAsrDetails(AsrDetails asrDetails) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(asrDetails);
		return true;
	}

	@Override
	public boolean saveTTSDetails(TtsDetails ttsDetails) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(ttsDetails);
		return true;
	}

	@Override
	public boolean saveTranslitrationDetails(TranslitrationDetails td) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(td);
		return true;
	}

	@Override
	public boolean saveOcrDetails(OcrDetails od) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(od);
		return true;
	}

	@Override
	public boolean saveTranslationDetails(TranslationDetails td) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(td);
		return true;
	}

	@Override
	public boolean saveFeedbackFromUser(UserFeedBack userFB) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(userFB);
		return true;
	}

	@Override
	public Boolean savePDFToImagesDetails(PDFToImageDetails p) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(p);
		return true;
	}
}

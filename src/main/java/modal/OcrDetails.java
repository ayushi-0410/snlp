package modal;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity(name = "ocrDetails")
@Table(name = "ocrDetails")
public class OcrDetails implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "serial")
	private Integer id;
	
	@Column(name = "reqLanguage")
	private String reqLanguage;
	
	@Column(name = "inputImagePath", columnDefinition = "text")
	private String inputImagePath;
	
	@Column(name = "apiResponseText", columnDefinition = "text")
	private String apiResponseText;
	
	@Column(name = "apiHitDate")
	private String apiHitDate;
	
	@Column(name = "apiHitBy")
	private String apiHitBy;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReqLanguage() {
		return reqLanguage;
	}

	public void setReqLanguage(String reqLanguage) {
		this.reqLanguage = reqLanguage;
	}

	public String getInputImagePath() {
		return inputImagePath;
	}

	public void setInputImagePath(String inputImagePath) {
		this.inputImagePath = inputImagePath;
	}

	public String getApiResponseText() {
		return apiResponseText;
	}

	public void setApiResponseText(String apiResponseText) {
		this.apiResponseText = apiResponseText;
	}

	public String getApiHitDate() {
		return apiHitDate;
	}

	public void setApiHitDate(String apiHitDate) {
		this.apiHitDate = apiHitDate;
	}

	public String getApiHitBy() {
		return apiHitBy;
	}

	public void setApiHitBy(String apiHitBy) {
		this.apiHitBy = apiHitBy;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

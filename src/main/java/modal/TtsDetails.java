package modal;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity(name = "ttsDetails")
@Table(name = "ttsDetails")
public class TtsDetails implements Serializable {
	private static final long serialVersiionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "serial")
	private Integer id;

	@Column(name = "reqLanguage")
	private String reqLanguage;

	@Column(name = "inputText", columnDefinition = "text")
	private String inputText;

	@Column(name = "apiResponsePath", columnDefinition = "text")
	private String apiResponsePath;

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

	public String getInputText() {
		return inputText;
	}

	public void setInputText(String inputText) {
		this.inputText = inputText;
	}

	public String getApiResponsePath() {
		return apiResponsePath;
	}

	public void setApiResponsePath(String apiResponsePath) {
		this.apiResponsePath = apiResponsePath;
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

	public static long getSerialversiionuid() {
		return serialVersiionUID;
	}
}

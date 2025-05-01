package modal;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity(name = "translationDetails")
@Table(name = "translationDetails")
public class TranslationDetails implements Serializable{
	private static final long serialVersiionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "serial")
	private Integer id;
	
	@Column(name = "sourceLanguage")
	private String sourceLanguage;
	
	@Column(name = "sourceText", columnDefinition = "text")
	private String sourceText;
	
	@Column(name = "destLanguage")
	private String destLanguage;
	
	@Column(name = "destText", columnDefinition = "text")
	private String destText;
	
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

	public String getSourceLanguage() {
		return sourceLanguage;
	}

	public void setSourceLanguage(String sourceLanguage) {
		this.sourceLanguage = sourceLanguage;
	}

	public String getSourceText() {
		return sourceText;
	}

	public void setSourceText(String sourceText) {
		this.sourceText = sourceText;
	}

	public String getDestLanguage() {
		return destLanguage;
	}

	public void setDestLanguage(String destLanguage) {
		this.destLanguage = destLanguage;
	}

	public String getDestText() {
		return destText;
	}

	public void setDestText(String destText) {
		this.destText = destText;
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

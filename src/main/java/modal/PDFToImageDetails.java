package modal;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity(name = "pdfToImageDetails")
@Table(name = "pdfToImageDetails")
public class PDFToImageDetails  implements Serializable {
	private static final long serialVersiionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "serial")
	private Integer id;
	
	@Column(name = "pdfName", columnDefinition = "text")
	private String pdfName;
	
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

	public String getPdfName() {
		return pdfName;
	}

	public void setPdfName(String pdfName) {
		this.pdfName = pdfName;
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

package modal;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity(name = "feedbackDetails")
@Table(name = "feedbackDetails")
public class UserFeedBack implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "serial")
	private Integer id;
	
	@Column(name = "userLoginId")
	private String userLoginId;
	
	@Column(name = "userEmail")
	private String userEmail;
	
	@Column(name = "userName")
	private String userName;
	
	@Column(name = "userMobileNumber")
	private String userMobileNumber;
	
	@Column(name = "feedbackDomain")
	private String feedbackDomain;
	
	@Column(name = "feedback")
	private String feedback;
	
	@Column(name = "feedbackDate")
	private String feedbackDate;
	
	@Column(name = "feedbackStatus")
	private String feedbackStatus;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobileNumber() {
		return userMobileNumber;
	}

	public void setUserMobileNumber(String userMobileNumber) {
		this.userMobileNumber = userMobileNumber;
	}

	public String getFeedbackDomain() {
		return feedbackDomain;
	}

	public void setFeedbackDomain(String feedbackDomain) {
		this.feedbackDomain = feedbackDomain;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	public String getFeedbackDate() {
		return feedbackDate;
	}

	public void setFeedbackDate(String feedbackDate) {
		this.feedbackDate = feedbackDate;
	}

	public String getFeedbackStatus() {
		return feedbackStatus;
	}

	public void setFeedbackStatus(String feedbackStatus) {
		this.feedbackStatus = feedbackStatus;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}

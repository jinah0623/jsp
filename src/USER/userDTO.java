package USER;

import java.util.Date;

public class userDTO {
	private String signID;
	private String signPASS;
	private String signName;
	private String signAdd;
	private String userID;
	private String userPASS;
	private String userEmail;
	private String userGender;
	private String userAddr;
	private Date regdate;
	private String useFlag;
	
	
	
	public String getSignName() {
		return signName;
	}
	public void setSignName(String signName) {
		this.signName = signName;
	}
	public String getSignAdd() {
		return signAdd;
	}
	public void setSignAdd(String signAdd) {
		this.signAdd = signAdd;
	}
	public String getSignID() {
		return signID;
	}
	public void setSignID(String signID) {
		this.signID = signID;
	}
	public String getSignPASS() {
		return signPASS;
	}
	public void setSignPASS(String signPASS) {
		this.signPASS = signPASS;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPASS() {
		return userPASS;
	}
	public void setUserPASS(String userPASS) {
		this.userPASS = userPASS;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
}

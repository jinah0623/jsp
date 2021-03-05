package CONTENT;

import java.util.Date;

public class contentDTO {
	private int contentID;
	private String title;
	private String userID;
	private Date regdate;
	private String content;
	private int available;
	private int hit;
	public int getContentID() {
		return contentID;
	}
	public void setContentID(int contentID) {
		this.contentID = contentID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
}

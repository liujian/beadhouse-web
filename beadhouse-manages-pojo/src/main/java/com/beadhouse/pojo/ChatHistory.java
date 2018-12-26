package com.beadhouse.pojo;

import java.io.Serializable;
import java.util.Date;

public class ChatHistory implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9162824339801302149L;
	
	private Integer chatid;
	
	private Integer loginUserId;
	
	private String emailAddress;
	
	private String firstName;
	
	private String lastName;
	
	private Integer elderUserId;
	
	private String elderUserEmail;
	
	private String elderFirstName;
	
	private String elderLastName;
	
	private Integer questId;

	private String quest;
	
	private Integer defineQuestId;
	
	private String defineQuest;
	
	private String userVoiceUrl;
	
	private String voicequest;
	
	private Date questDate;
	
	private String elderUserResponse;
	
	private String elderUserVoiceUrl;
	
	private Date responseDate;

	public Integer getChatid() {
		return chatid;
	}

	public void setChatid(Integer chatid) {
		this.chatid = chatid;
	}

	public Integer getLoginUserId() {
		return loginUserId;
	}

	public void setLoginUserId(Integer loginUserId) {
		this.loginUserId = loginUserId;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public Integer getElderUserId() {
		return elderUserId;
	}

	public void setElderUserId(Integer elderUserId) {
		this.elderUserId = elderUserId;
	}

	public String getElderUserEmail() {
		return elderUserEmail;
	}

	public void setElderUserEmail(String elderUserEmail) {
		this.elderUserEmail = elderUserEmail;
	}

	public Integer getQuestId() {
		return questId;
	}

	public void setQuestId(Integer questId) {
		this.questId = questId;
	}

	public String getQuest() {
		return quest;
	}

	public void setQuest(String quest) {
		this.quest = quest;
	}

	public Integer getDefineQuestId() {
		return defineQuestId;
	}

	public void setDefineQuestId(Integer defineQuestId) {
		this.defineQuestId = defineQuestId;
	}

	public String getDefineQuest() {
		return defineQuest;
	}

	public void setDefineQuest(String defineQuest) {
		this.defineQuest = defineQuest;
	}

	public String getUserVoiceUrl() {
		return userVoiceUrl;
	}

	public void setUserVoiceUrl(String userVoiceUrl) {
		this.userVoiceUrl = userVoiceUrl;
	}

	public String getVoicequest() {
		return voicequest;
	}

	public void setVoicequest(String voicequest) {
		this.voicequest = voicequest;
	}

	public Date getQuestDate() {
		return questDate;
	}

	public void setQuestDate(Date questDate) {
		this.questDate = questDate;
	}

	
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getElderFirstName() {
		return elderFirstName;
	}

	public void setElderFirstName(String elderFirstName) {
		this.elderFirstName = elderFirstName;
	}

	public String getElderLastName() {
		return elderLastName;
	}

	public void setElderLastName(String elderLastName) {
		this.elderLastName = elderLastName;
	}

	public String getElderUserResponse() {
		return elderUserResponse;
	}

	public void setElderUserResponse(String elderUserResponse) {
		this.elderUserResponse = elderUserResponse;
	}

	public String getElderUserVoiceUrl() {
		return elderUserVoiceUrl;
	}

	public void setElderUserVoiceUrl(String elderUserVoiceUrl) {
		this.elderUserVoiceUrl = elderUserVoiceUrl;
	}

	public Date getResponseDate() {
		return responseDate;
	}

	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}

	

}

package com.beadhouse.pojo;

import java.io.Serializable;
import java.util.Date;

public class OrderUser implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4679949845737084980L;
	
	private String elderUserId;
	
	private String elderUserEmail;
	
	private String elderFirstName;
	
	private String elderLastName;
	
	private String elderBirthday;
	
	private Integer elderUserAge;
	
	private String elderUserAddress;
	
	private String elderUserPassword ;
	
	private String elderUserphone;
	
	private String elderUserOther;
	
	private Date createdate;
	
	private String createUser;
	
	private String modificationuser;
	
	private Date modificationdate;
	
	private String token;
	
	private String elderAvatar;
	

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getElderAvatar() {
		return elderAvatar;
	}

	public void setElderAvatar(String elderAvatar) {
		this.elderAvatar = elderAvatar;
	}


	public String getElderUserId() {
		return elderUserId;
	}

	public void setElderUserId(String elderUserId) {
		this.elderUserId = elderUserId;
	}

	public String getElderUserEmail() {
		return elderUserEmail;
	}

	public void setElderUserEmail(String elderUserEmail) {
		this.elderUserEmail = elderUserEmail;
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

	public String getElderBirthday() {
		return elderBirthday;
	}

	public void setElderBirthday(String elderBirthday) {
		this.elderBirthday = elderBirthday;
	}

	public Integer getElderUserAge() {
		return elderUserAge;
	}

	public void setElderUserAge(Integer elderUserAge) {
		this.elderUserAge = elderUserAge;
	}

	public String getElderUserAddress() {
		return elderUserAddress;
	}

	public void setElderUserAddress(String elderUserAddress) {
		this.elderUserAddress = elderUserAddress;
	}

	public String getElderUserPassword() {
		return elderUserPassword;
	}

	public void setElderUserPassword(String elderUserPassword) {
		this.elderUserPassword = elderUserPassword;
	}

	public String getElderUserphone() {
		return elderUserphone;
	}

	public void setElderUserphone(String elderUserphone) {
		this.elderUserphone = elderUserphone;
	}

	public String getElderUserOther() {
		return elderUserOther;
	}

	public void setElderUserOther(String elderUserOther) {
		this.elderUserOther = elderUserOther;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getModificationuser() {
		return modificationuser;
	}

	public void setModificationuser(String modificationuser) {
		this.modificationuser = modificationuser;
	}

	public Date getModificationdate() {
		return modificationdate;
	}

	public void setModificationdate(Date modificationdate) {
		this.modificationdate = modificationdate;
	}
	
	

}

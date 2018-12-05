package com.beadhouse.pojo;

import java.io.Serializable;
import java.util.Date;

public class Schedule implements Serializable {
	
	private static final long serialVersionUID = -4394337749651081673L;
	
	private Integer scheduleId;
	
	private Date date;
	
	private String dateString;
	
	private String breakfast;
	
	private String lunch;
	
	private String dinner;

	public Integer getScheduleId() {
		return scheduleId;
	}

	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}

	public String getLunch() {
		return lunch;
	}

	public void setLunch(String lunch) {
		this.lunch = lunch;
	}

	public String getDinner() {
		return dinner;
	}

	public void setDinner(String dinner) {
		this.dinner = dinner;
	}

	public String getDateString() {
		return dateString;
	}

	public void setDateString(String dateString) {
		this.dateString = dateString;
	}
	
	

}

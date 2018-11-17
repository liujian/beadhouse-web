package com.beadhouse.pojo;

import java.io.Serializable;

public class Quest implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4394337749651081673L;
	private Integer questid;
	private String quest;
	private Integer sort;

	public Integer getQuestid() {
		return questid;
	}
	public void setQuestid(Integer questid) {
		this.questid = questid;
	}
	public String getQuest() {
		return quest;
	}
	public void setQuest(String quest) {
		this.quest = quest;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}

}

package com.beadhouse.service;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Quest;

public interface QuestService {
	
	/**
	 * 获取问题列表
	 */
	public EUDataGridResult getQuestList(Pagenation pagenation);

	
	/**
	 * 根据问题ID获取问题
	 */
	public Quest getQuest(Integer questid);
	
	/**
	 * 修改问题
	 */
	
	public void updateQuest(Quest quest);
	
	/**
	 * 删除问题
	 */
	public void deleteQuest(Integer questid);
	
	/**
	 * 新增问题
	 */
	public void insertQuest(Quest quest);
}

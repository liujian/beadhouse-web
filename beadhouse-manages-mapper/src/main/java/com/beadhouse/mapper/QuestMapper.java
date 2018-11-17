package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.Quest;




public interface QuestMapper {
	List<Quest> getquestlist(Quest quest);
	
	Quest getQuest(Integer questid);
	
	void updateQuest(Quest quest);
	
	void insertQuest(Quest quest);
	
	void deleteQuest(Integer questid);
}

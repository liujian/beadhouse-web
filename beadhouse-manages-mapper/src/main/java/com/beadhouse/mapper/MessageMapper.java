package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.ChatHistory;



public interface MessageMapper {
	
	List<ChatHistory> selectChatbyorderUser(ChatHistory param);

}

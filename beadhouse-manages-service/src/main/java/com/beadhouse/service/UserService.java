package com.beadhouse.service;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.User;

public interface UserService {
	
	EUDataGridResult getUserList(Pagenation pagenation);
	
	User getUser(Integer id);
	
	void deleteUser(Integer id);
	
	User getUser(String emailAddress);
	
	void updateUser(User user);
	
	void inserUser(User user);

}

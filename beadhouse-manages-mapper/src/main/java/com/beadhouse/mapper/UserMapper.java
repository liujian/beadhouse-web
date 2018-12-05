package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.User;

public interface UserMapper {
	
	List<User> getUserList(User user);

	User getUser(Integer id);
	
    User getUserByEmailAddress(String emailAddress);
    
	void inserUser(User user); 
   
    void updateUser(User user);
    
    void deleteUser(Integer id);
    
  
}
package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.OrderUser;

public interface OrderUserMapper {
	
	OrderUser selectByOrderUserEmail(String orderUserEmail);
    void insertOrderUser(OrderUser orderUser); 
    List<OrderUser> selectAllOrderUser(OrderUser orderUser);
    void updateOrderUser(OrderUser orderUser);
    void deleteOrderUser(String OrderUserEmail);
  
}
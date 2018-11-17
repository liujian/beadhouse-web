package com.beadhouse.service;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.OrderUser;
import com.beadhouse.pojo.Pagenation;

public interface OrderUserService {
	/**
	 * 获取老人账户列表
	 * @param pagenation
	 * @return
	 */
	public EUDataGridResult getOrderUserList(Pagenation pagenation);
	
	/**
	 * 老人账户唯一性检查
	 */
	public OrderUser getOrderUser(String elderUserEmail);
	
	/**
	 * 新增老人账户信息
	 */
	public void insertOrderUser(OrderUser orderUser);
	
	/**
	 * 修改老人账户信息
	 */
	public void updateOrderUser(OrderUser orderUser);
	
	/**
	 * 删除老人账户信息
	 */
	public void deleteOrderUser(String elderUserEmail);
	
}

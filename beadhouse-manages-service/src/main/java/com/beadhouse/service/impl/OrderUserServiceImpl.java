package com.beadhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.OrderUserMapper;
import com.beadhouse.pojo.OrderUser;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.service.OrderUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class OrderUserServiceImpl implements OrderUserService {
	@Autowired
	private OrderUserMapper orderUserMapper;
	@Override
	public EUDataGridResult getOrderUserList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		OrderUser str=new OrderUser();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			str.setElderUserEmail((pagenation.getValues()));
		}
		List<OrderUser> list= orderUserMapper.selectAllOrderUser(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<OrderUser> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	@Override
	public OrderUser getOrderUser(String elderUserEmail) {
		OrderUser orderUser = orderUserMapper.selectByOrderUserEmail(elderUserEmail);
		return orderUser;
	}
	@Override
	public void insertOrderUser(OrderUser orderUser) {
		orderUserMapper.insertOrderUser(orderUser);
		
	}
	@Override
	public void updateOrderUser(OrderUser orderUser) {
		orderUserMapper.updateOrderUser(orderUser);
		
	}
	@Override
	public void deleteOrderUser(String elderUserEmail) {
		orderUserMapper.deleteOrderUser(elderUserEmail);
		
	}

}

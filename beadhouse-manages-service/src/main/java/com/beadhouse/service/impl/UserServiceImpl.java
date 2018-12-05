package com.beadhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.UserMapper;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.User;
import com.beadhouse.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public EUDataGridResult getUserList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		User str=new User();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			str.setEmailAddress((pagenation.getValues()));
		}
		List<User> list= userMapper.getUserList(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<User> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public User getUser(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.getUser(id);
	}

	@Override
	public void deleteUser(Integer id) {
		userMapper.deleteUser(id);
		
	}

	@Override
	public User getUser(String emailAddress) {
		// TODO Auto-generated method stub
		return userMapper.getUserByEmailAddress(emailAddress);
	}

	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
		
	}

	@Override
	public void inserUser(User user) {
		userMapper.inserUser(user);
		
	}

}

package com.beadhouse.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.MessageMapper;
import com.beadhouse.pojo.ChatHistory;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.service.HistorychatService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class HistorychatServiceImpl implements HistorychatService{

	@Autowired
	private MessageMapper messageMapper;
	@Override
	public EUDataGridResult getHistorychatList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		ChatHistory str=new ChatHistory();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			str.setElderUserEmail(pagenation.getValues());
		}
		List<ChatHistory> list= messageMapper.selectChatbyorderUser(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<ChatHistory> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

}

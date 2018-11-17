package com.beadhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.QuestMapper;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Quest;
import com.beadhouse.service.QuestService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class QuestServiceImpl implements QuestService{
       
	@Autowired
	private QuestMapper questMapper;
	@Override
	public EUDataGridResult getQuestList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		Quest str=new Quest();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			str.setQuest((pagenation.getValues()));
		}
		List<Quest> list= questMapper.getquestlist(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Quest> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	@Override
	public Quest getQuest(Integer questid) {
		// TODO Auto-generated method stub
		return questMapper.getQuest(questid);
	}
	@Override
	public void updateQuest(Quest quest) {
		questMapper.updateQuest(quest);
		
	}
	@Override
	public void deleteQuest(Integer questid) {
		questMapper.deleteQuest(questid);
		
	}
	@Override
	public void insertQuest(Quest quest) {
		questMapper.insertQuest(quest);
		
	}

}

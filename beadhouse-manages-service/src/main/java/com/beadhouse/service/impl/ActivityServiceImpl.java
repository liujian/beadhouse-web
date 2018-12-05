package com.beadhouse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.ActivityMapper;
import com.beadhouse.mapper.ScheduleMapper;
import com.beadhouse.pojo.Activity;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Schedule;
import com.beadhouse.service.ActivityService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ActivityServiceImpl implements ActivityService{

	@Autowired
	private ScheduleMapper scheduleMapper;
	
	@Autowired
	private ActivityMapper activityMapper;
	
	
	@Override
	public EUDataGridResult getscheduleList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		Schedule str=new Schedule();
	
		if(pagenation.getValues2()!=null){			
			str.setDate((pagenation.getValues2()));
		}
		List<Schedule> list= scheduleMapper.getscheduleList(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Schedule> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EUDataGridResult getactivityList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		Activity str=new Activity();
	
		str.setScheduleId(Integer.parseInt(pagenation.getValues()));
		List<Activity> list= activityMapper.getactivityList(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<Activity> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	@Override
	public void insertSchedule(Schedule schedule) {
		scheduleMapper.insertSchedule(schedule);
		
	}

	@Override
	public Schedule getSchedule(Integer scheduleId) {
		// TODO Auto-generated method stub
		return scheduleMapper.getSchedule(scheduleId);
	}

	@Override
	public void updateSchedule(Schedule schedule) {
		scheduleMapper.updateSchedule(schedule);
		
	}

	@Override
	public void deleteschedule(Integer scheduleId) {
		scheduleMapper.deleteschedule(scheduleId);
		
	}

	@Override
	public void insertActivity(Activity activity) {
		activityMapper.insertActivity(activity);
		
	}

	@Override
	public void deleteActivity(Integer activityId) {
		activityMapper.deleteActivity(activityId);
		
	}

	@Override
	public Activity getActivity(Integer activityId) {
		// TODO Auto-generated method stub
		return activityMapper.getActivity(activityId);
	}

	@Override
	public void updateActivity(Activity activity) {
		activityMapper.updateActivity(activity);
		
	}



}

package com.beadhouse.service;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.Activity;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Schedule;

public interface ActivityService {
	
	EUDataGridResult getscheduleList(Pagenation pagenation);
	
	EUDataGridResult getactivityList(Pagenation pagenation);
	
	void insertSchedule(Schedule schedule);
	
	Schedule getSchedule(Integer scheduleId);
	
	void updateSchedule(Schedule schedule);
	
	void deleteschedule(Integer scheduleId);
	
	void insertActivity(Activity activity);
	
	void deleteActivity(Integer activityId);
	
	Activity getActivity(Integer activityId);
	
	void updateActivity(Activity activity);
	
	
}

package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.Schedule;

public interface ScheduleMapper {

	List<Schedule> getscheduleList(Schedule str);
	
	void insertSchedule(Schedule str);
	
	Schedule getSchedule(Integer scheduleId); 
	
	void updateSchedule(Schedule schedule);

	void deleteschedule(Integer scheduleId);
}

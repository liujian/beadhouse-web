package com.beadhouse.mapper;

import java.util.List;

import com.beadhouse.pojo.Activity;

public interface ActivityMapper {

	List<Activity> getactivityList(Activity str);
	
	void insertActivity(Activity str);
	
	Activity getActivity(Integer activityId); 
	
	void updateActivity(Activity str);

	void deleteActivity(Integer activityId);
}

package com.beadhouse.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.Activity;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Schedule;
import com.beadhouse.service.ActivityService;

/**
 * 
 * @notes 活动消息配置 
 *
 * @author liujian
 * @date 2018年12月3日
 * @class ActivityController.java
 */
@Controller
@RequestMapping("/activity")
public class ActivityController {

	@Autowired
	private ActivityService activityService;
	//日程列表
	@RequestMapping("/scheduleList")
	private String getscheduleList(HttpServletRequest request, Model model,Pagenation pagenation,String date){
		Date time =null;
		if(!StringUtils.isEmpty(date)){
			try {
				time =  new SimpleDateFormat("yyyy-MM-dd").parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues2(time);
 		EUDataGridResult list=activityService.getscheduleList(pagenation);
 		List<Schedule> scheduleList=(List<Schedule>)list.getRows(); 
 		if(scheduleList!=null){
 		    pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
 			model.addAttribute("scheduleList", scheduleList);
 			model.addAttribute("itemsCount", scheduleList.size());
 			model.addAttribute("pagenation", pagenation);
 		}
		if(!StringUtils.isEmpty(date)){
			model.addAttribute("date", date); 
		}
		return "activity/scheduleList";
		
	}
	
	//新增
	@RequestMapping("/scheduleAddpage")
	public String showScheduleAddpage(Model model) {
		return "activity/scheduleAddpage";
	}
	@RequestMapping("/scheduleadd")
	private String getScheduleadd(Schedule schedule,HttpSession httpSession) {
		Schedule obj=new Schedule();
		obj.setDate(schedule.getDate());
		obj.setBreakfast(schedule.getBreakfast());
		obj.setLunch(schedule.getLunch());
		obj.setDinner(schedule.getDinner());
		activityService.insertSchedule(obj);
		return "redirect:/activity/scheduleList";
	}
	
	//修改
	@RequestMapping("/scheduleupdatepage")
	private String getScheduleupdatepage(@RequestParam(value="scheduleId")Integer scheduleId, Model model,String date) {
		Schedule obj=activityService.getSchedule(scheduleId);
		obj.setDateString(new SimpleDateFormat("yyyy-MM-dd").format(obj.getDate()));
 		model.addAttribute("date", date);
		model.addAttribute("obj", obj);
  		return "activity/scheduleAddpage";	 
	}
	
	@RequestMapping("/scheduleupdate")
	private String getScheduleupdate(Schedule schedule,HttpSession httpSession) { 
		Schedule obj=activityService.getSchedule(schedule.getScheduleId());
		obj.setDate(schedule.getDate());
		obj.setBreakfast(schedule.getBreakfast());
		obj.setLunch(schedule.getLunch());
		obj.setDinner(schedule.getDinner());
		
		activityService.updateSchedule(obj);
		
		return "redirect:/activity/scheduleList";
	}
	//删除
	@RequestMapping("/deleteschedule")
	private String deleteschedule(@RequestParam(value="scheduleId")Integer scheduleId,int currentpage,int rowCount) {
		activityService.deleteschedule(scheduleId);
		return  "redirect:/activity/scheduleList?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	
	
	//跳转至活动列表
	@RequestMapping("/activityList")
	private String getactivityList(@RequestParam(value="scheduleId")Integer scheduleId, Model model,Pagenation pagenation) {
		pagenation.setValues(scheduleId.toString());
		EUDataGridResult list=activityService.getactivityList(pagenation);
 		List<Activity> activityList=(List<Activity>)list.getRows(); 
 		if(activityList!=null){
 		    pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
 			model.addAttribute("activityList", activityList);
 			model.addAttribute("itemsCount", activityList.size());
 			model.addAttribute("pagenation", pagenation);
 			model.addAttribute("pagenation", pagenation);
 			model.addAttribute("scheduleId", scheduleId);
 		}
  		return "activity/activityList";	 
	}

	
	//新增
	@RequestMapping("/activityAddpage")
	public String showactivityAddpage(@RequestParam(value="scheduleId")Integer scheduleId, Model model) {
		Activity obj=new Activity();
		obj.setScheduleId(scheduleId);
		model.addAttribute("obj", obj);
		return "activity/activityAddpage";
	}
	@RequestMapping("/activityadd")
	private String getactivityadd(Activity activity,HttpSession httpSession) {
		Activity obj=new Activity();
		obj.setActivity(activity.getActivity());
		obj.setScheduleId(activity.getScheduleId());
		activityService.insertActivity(obj);
		return "redirect:/activity/activityList?scheduleId="+activity.getScheduleId();
	}
	
	//修改
	@RequestMapping("/activityupdatepage")
	private String activityupdatepage(@RequestParam(value="activityId")Integer activityId, Model model) {
		Activity obj=activityService.getActivity(activityId);
		
		model.addAttribute("obj", obj);
  		return "activity/activityAddpage";	 
	}
	
	@RequestMapping("/activityupdate")
	private String activityupdate(Activity activity,HttpSession httpSession) { 
		Activity obj=activityService.getActivity(activity.getActivityId());
		
		obj.setActivity(activity.getActivity());
		
		activityService.updateActivity(obj);
		
		return "redirect:/activity/activityList?scheduleId="+activity.getScheduleId();
	}
	
	
	//删除
	@RequestMapping("/deleteactivity")
	private String deleteactivity(@RequestParam(value="activityId")Integer activityId,@RequestParam(value="scheduleId")Integer scheduleId,int currentpage,int rowCount) {
		activityService.deleteActivity(activityId);
		return  "redirect:/activity/activityList?scheduleId="+scheduleId;
	}
		
	
	
	
	
	
	
	
	
	@InitBinder 
	public void initBinder(WebDataBinder binder) { 
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		dateFormat.setLenient(true); 
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); 
	}


}

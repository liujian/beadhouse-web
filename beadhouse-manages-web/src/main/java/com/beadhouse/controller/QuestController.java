package com.beadhouse.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.common.pojo.EarthResult;
import com.beadhouse.pojo.EarthOperator;
import com.beadhouse.pojo.OrderUser;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Quest;
import com.beadhouse.service.QuestService;

/**
 * 问题列表配置
 *
 * @author liujian
 * @date 2018年9月28日
 * @class ProductController.java
 */
@Controller
@RequestMapping("/Quest")
public class QuestController {

	@Autowired
	private QuestService questService;
	
	//问题列表查询
	@RequestMapping("/QuestList")
	private String gerQuestList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords){
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues(keywords);
 		EUDataGridResult list=questService.getQuestList(pagenation);
 		List<Quest> Introductionlist=(List<Quest>)list.getRows(); 
 		if(Introductionlist!=null){
 		    pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
 			model.addAttribute("Introductionlist", Introductionlist);
 			model.addAttribute("itemsCount", Introductionlist.size());
 			model.addAttribute("pagenation", pagenation);
 		}
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
		return "quest/questListpage";
		
	}
	
	//新增
	@RequestMapping("/QuestAddpage")
	public String showQuestAddpage(Model model) {
		return "quest/questAddpage";
	}
	@RequestMapping("/Questadd")
	private String getQuestadd(Quest quest,HttpSession httpSession) {
		Quest obj=new Quest();
		obj.setQuest(quest.getQuest());
		obj.setSort(quest.getSort());
		questService.insertQuest(obj);
		return "redirect:/Quest/QuestList";
	}
	
	
	//修改
	@RequestMapping("/Questupdatepage")
	private String getQuesttoupdatepage(@RequestParam(value="questid")Integer questid, Model model,String keywords) {
		Quest obj=questService.getQuest(questid);
 		try {
			keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
 		model.addAttribute("keywords", keywords);
		model.addAttribute("obj", obj);
  		return "quest/questAddpage";	 
	}
	
	@RequestMapping("/Questupdate")
	private String getQuestupdate(Quest quest,HttpSession httpSession) { 
		Quest obj=questService.getQuest(quest.getQuestid());
		obj.setQuest(quest.getQuest());
		obj.setSort(quest.getSort());
		questService.updateQuest(obj);
		
		return "redirect:/Quest/QuestList";
	}
	//删除
	@RequestMapping("/deleteQuest")
	private String getDeleteQuest(@RequestParam(value="questid")Integer questid,int currentpage,int rowCount) {
		questService.deleteQuest(questid);
		return  "redirect:/Quest/QuestList?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	

	
}

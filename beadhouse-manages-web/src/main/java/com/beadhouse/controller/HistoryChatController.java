package com.beadhouse.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.ChatHistory;
import com.beadhouse.pojo.OrderUser;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Quest;
import com.beadhouse.service.HistorychatService;

/**
 * 历史聊天记录
 *
 * @author liujian
 * @date 2018年10月9日
 * @class HistoryChatController.java
 */
@Controller
@RequestMapping("/historychat")
public class HistoryChatController {

	@Autowired
	private HistorychatService historychatService;
	
	//聊天记录列表查询
	@RequestMapping("/historychatList")
	private String gerQuestList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords){
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues(keywords);
 		EUDataGridResult list=historychatService.getHistorychatList(pagenation);
 		List<ChatHistory> Introductionlist=(List<ChatHistory>)list.getRows(); 
 		if(Introductionlist!=null){
 		    pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
 			model.addAttribute("chatlist", Introductionlist);
 			model.addAttribute("itemsCount", Introductionlist.size());
 			model.addAttribute("pagenation", pagenation);
 		}
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
		return "chathistory/chathistoryListpage";
		
	}
	
	   //转问题列表
		@RequestMapping("/Questupdatepage")
		private String getOrderuserupdatepage(@RequestParam(value="quest")String quest, Model model,String keywords) {
			Quest obj=new Quest();
			obj.setQuest(quest);
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			model.addAttribute("keywords", keywords);
			model.addAttribute("obj", obj);
	  		return "chathistory/questAddpage";	 
		}
	

	
}

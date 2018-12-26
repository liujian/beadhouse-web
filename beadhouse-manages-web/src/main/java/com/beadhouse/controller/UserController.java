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
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.User;
import com.beadhouse.service.UserService;

/**
 * 用户帐号管理
 *
 * @author liujian
 * @date 2018年12月5日
 * @class UserController.java
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	//账号查询
	@RequestMapping("/userList")
	private String getUserList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords){
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues(keywords);
 		EUDataGridResult list=userService.getUserList(pagenation);
 		List<User> userlist=(List<User>)list.getRows(); 
 		if(userlist !=null){
 		    pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
 			model.addAttribute("userlist", userlist);
 			model.addAttribute("itemsCount", userlist.size());
 			model.addAttribute("pagenation", pagenation);
 		}
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
		return "user/userListpage";
		
	}
	
	//新增
	@RequestMapping("/userAddpage")
	public String showuserPage(Model model) {
		return "user/userAddpage";
	}
	@RequestMapping("/useradd")
	private String useradd(User user,HttpSession httpSession) {
		User obj=new User();
		obj.setEmailAddress(user.getEmailAddress());
		obj.setPassword(user.getPassword());
		obj.setFirstName(user.getFirstName());
		obj.setLastName(user.getLastName());
		obj.setPhone(user.getPhone());
        obj.setBirthday(user.getBirthday());
		obj.setCreateDate(new Date());
		userService.inserUser(obj);
		
		return "redirect:/user/userList";
	}
	
	
	//修改
	@RequestMapping("/userupdatepage")
	private String userupdatepage(@RequestParam(value="id")Integer id, Model model,String keywords) {
		User obj=userService.getUser(id);
 		try {
			keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
 		model.addAttribute("keywords", keywords);
		model.addAttribute("obj", obj);
  		return "user/userAddpage";	 
	}
	@RequestMapping("/userupdate")
	private String userupdate(User user,HttpSession httpSession) { 
		User obj= userService.getUser(user.getId());
		obj.setPassword(user.getPassword());
		obj.setFirstName(user.getFirstName());
		obj.setLastName(user.getLastName());
		obj.setPhone(user.getPhone());
        obj.setBirthday(user.getBirthday());
        obj.setUpdateDate(new Date());
		userService.updateUser(obj);
		
		return "redirect:/user/userList";
	}
	//删除
	@RequestMapping("/deleteuser")
	private String deleteuser(@RequestParam(value="id")Integer id,int currentpage,int rowCount) {
		userService.deleteUser(id);
		return  "redirect:/user/userList?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	
  //数据唯一性校验
	@RequestMapping("/usertouinque")
	@ResponseBody
	private EarthResult usertouinque(User user) { 
		User Cpi= userService.getUser(user.getEmailAddress());
		EarthResult str=null;
		if(Cpi!=null){
			 str=EarthResult.build(0, "The account exists!");
		}else{
			 str=EarthResult.build(1, "1");
		}
		return str;		 
	}
	
}

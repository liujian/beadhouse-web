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
import com.beadhouse.service.OrderUserService;

/**
 * 老人帐号配置
 *
 * @author liujian
 * @date 2018年9月27日
 * @class ProductController.java
 */
@Controller
@RequestMapping("/OrderUser")
public class OrderUserController {

	@Autowired
	private OrderUserService orderUserService;
	
	//老人账号查询
	@RequestMapping("/OrderUserList")
	private String gerOrderUserList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords){
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues(keywords);
 		EUDataGridResult list=orderUserService.getOrderUserList(pagenation);
 		List<OrderUser> Elderlist=(List<OrderUser>)list.getRows(); 
 		if(Elderlist!=null){
 		    pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
 			model.addAttribute("Elderlist", Elderlist);
 			model.addAttribute("itemsCount", Elderlist.size());
 			model.addAttribute("pagenation", pagenation);
 		}
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
		return "orderuser/orderuserListpage";
		
	}
	
	//新增
	@RequestMapping("/orderuserAddpage")
	public String showOrderuserPage(Model model) {
		return "orderuser/orderuserAddpage";
	}
	@RequestMapping("/OrderUseradd")
	private String getTransactionadd(OrderUser orderUser,HttpSession httpSession) {
		OrderUser obj=new OrderUser();
		String orderUserEmail=orderUser.getElderUserEmail();
		obj.setElderUserEmail(orderUserEmail.split(",")[0]);
		obj.setElderUserPassword(orderUser.getElderUserPassword());
		obj.setElderFirstName(orderUser.getElderFirstName());
		obj.setElderLastName(orderUser.getElderLastName());
		obj.setElderBirthday(orderUser.getElderBirthday());
		obj.setElderUserAge(orderUser.getElderUserAge());
		obj.setElderUserAddress(orderUser.getElderUserAddress());
		obj.setElderUserphone(orderUser.getElderUserphone());
		obj.setElderUserOther(orderUser.getElderUserOther());
		
		
		EarthOperator user=(EarthOperator)httpSession.getAttribute("user");
		obj.setCreateUser(user.getLoginname());
		obj.setCreatedate(new Date());
		orderUserService.insertOrderUser(obj);
		
		return "redirect:/OrderUser/OrderUserList";
	}
	
	
	//修改
	@RequestMapping("/orderuserupdatepage")
	private String getOrderuserupdatepage(@RequestParam(value="elderUserEmail")String elderUserEmail, Model model,String keywords) {
		OrderUser obj=orderUserService.getOrderUser(elderUserEmail);
 		try {
			keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
 		model.addAttribute("keywords", keywords);
		model.addAttribute("obj", obj);
  		return "orderuser/orderuserAddpage";	 
	}
	@RequestMapping("/OrderUserupdate")
	private String OrderUserupdate(OrderUser orderUser,HttpSession httpSession) { 
		OrderUser obj= orderUserService.getOrderUser(orderUser.getElderUserEmail());
		obj.setElderUserPassword(orderUser.getElderUserPassword());
		obj.setElderFirstName(orderUser.getElderFirstName());
		obj.setElderLastName(orderUser.getElderLastName());
		obj.setElderBirthday(orderUser.getElderBirthday());
		obj.setElderUserAge(orderUser.getElderUserAge());
		obj.setElderUserAddress(orderUser.getElderUserAddress());
		obj.setElderUserphone(orderUser.getElderUserphone());
		obj.setElderUserOther(orderUser.getElderUserOther());
		EarthOperator user=(EarthOperator)httpSession.getAttribute("user");
		obj.setModificationuser(user.getLoginname());
		obj.setModificationdate(new Date());
		orderUserService.updateOrderUser(obj);
		
		return "redirect:/OrderUser/OrderUserList";
	}
	//删除
	@RequestMapping("/deleteorderuser")
	private String deleteorderuser(@RequestParam(value="elderUserEmail")String elderUserEmail,int currentpage,int rowCount) {
		orderUserService.deleteOrderUser(elderUserEmail);
		return  "redirect:/OrderUser/OrderUserList?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	
  //数据唯一性校验
	@RequestMapping("/OrderUsertouinque")
	@ResponseBody
	private EarthResult getOrderUsertouinque(OrderUser orderUser) { 
		OrderUser Cpi= orderUserService.getOrderUser(orderUser.getElderUserEmail());
		EarthResult str=null;
		if(Cpi!=null){
			 str=EarthResult.build(0, "当前老人账号 已经维护了一条数据!");
		}else{
			 str=EarthResult.build(1, "1");
		}
		return str;		 
	}
	
}

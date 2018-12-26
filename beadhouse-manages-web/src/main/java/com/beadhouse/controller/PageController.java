package com.beadhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccic.cas.client.util.CasUtils;
import com.beadhouse.pojo.EarthAction;
import com.beadhouse.pojo.EarthMenu;
import com.beadhouse.pojo.EarthOperator;
import com.beadhouse.service.AuthorService;
import com.beadhouse.util.ResultMap;
import com.beadhouse.util.SafetyUtil;

/**
 * 页面跳转controller
 */
@Controller
public class PageController {
	@Autowired
	private AuthorService authorService;
	
	private final Log log = LogFactory.getLog(getClass());
	
	/**
	 * 打开首页
	 */
	@RequestMapping("/")
	public String showIndex() {
		return "admin/login";
	}
	
	// 登录
	@RequestMapping("/Login")
	@ResponseBody
	public ResultMap Login(HttpServletRequest request,HttpSession httpSession,Model model,String loginname,String loginpwd){
		/**
		 * 对密码进行加盐加密解密处理
		 */
		if(loginname!=null&&!"".equals(loginname)){
		  loginpwd=SafetyUtil.addMD5Salt(loginname, loginpwd);
		}
		
		ResultMap result = new ResultMap();
		List<EarthOperator> list=null;
		if(!StringUtils.isEmpty(CasUtils.getUserCode(request))){
			loginname = CasUtils.getUserCode(request);
			list=authorService.getEarthOperator2(loginname);
			if(list.size() == 0) {
				result.setMessage("noHave");
				result.setData(CasUtils.getCasServerLoginUrl());
				return result;
			}
		}else{
			// if(StringUtils.isEmpty(loginname)||)
			list=authorService.getEarthOperator(loginname,loginpwd);	
		}
		
		if(list.size()>0){
			
		   // 补全对象信息，权限，菜单
          // List<String> useraction=authorService.getUserEarthAction2(loginname);
           //list.get(0).setEarthactionsx(useraction);
           //List<EarthAction> useraction2=authorService.getUserEarthAction(loginname);
         //  list.get(0).setEarthaction(useraction2);
           List<EarthMenu> usermenu=authorService.getUserEarthMenu(loginname);
           list.get(0).setEarthmenu(usermenu); 
           httpSession.setAttribute("user", list.get(0));
		   // objectToJson
           // httpSession.setAttribute("user2",JsonUtils.objectToJson(list.get(0).getEarthaction()));
           result.setMessage("success");
           return result;
		}
		if(StringUtils.isEmpty(loginname)&&StringUtils.isEmpty(loginpwd)){
			result.setMessage("success2");
			return result;
		}else{
			result.setMessage("defeated");
			return result;
		}
		// return "defeated";
	}
	
	
	/**
	 * 展示其他页面
	 */
	
	@RequestMapping("/{page}")
	public String showpage(@PathVariable String page) {
		// System.out.println("admin/"+page);
		return "admin/"+page;
	}
	
	@RequestMapping("/main")
	public String showpage2() {

		return "admin/main";
	}
	
	@RequestMapping("/index")
	public String showpage3() {
		return "admin/index";
	}
	
	@RequestMapping("/left")
	public String showpage4(Model model,HttpServletRequest request) {
		try {
			EarthOperator webUser = (EarthOperator) request.getSession().getAttribute("user");
			StringBuffer s=new StringBuffer();
			String tree="";
//			if("admin".equals(webUser.getLoginname())){
				tree=authorService.buildAdminPermissionTree(s);
//			}else{
//				tree=authorService.buildAdminPermissionTree3(s,webUser.getEarthmenu());
//			}
 
			model.addAttribute("tree",tree);
		} catch (Exception e) {
			 e.printStackTrace();  
			 log.error("保存信息失败,错误原因:"+e.getMessage(),e);   
		}
 
		return "admin/left";
	}
	
	@RequestMapping("/adminExit")
	public String exit(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.removeAttribute("user");
			session.invalidate(); 
		}
		return "admin/login";
	}
	
}

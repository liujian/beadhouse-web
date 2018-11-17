package com.beadhouse.controller;

import java.io.UnsupportedEncodingException;
 
import java.util.Date;
 
import java.util.List;
 

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.common.pojo.EarthResult;
import com.beadhouse.pojo.EarthAction;
import com.beadhouse.pojo.EarthMenu;
import com.beadhouse.pojo.EarthOperator;
import com.beadhouse.pojo.EarthRole;
import com.beadhouse.pojo.EarthRoleAction;
import com.beadhouse.pojo.EarthRoleMenu;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.service.AuthorService;
import com.beadhouse.util.SafetyUtil;
 


/**
 * 系统管理
 * 
 */
@Controller
@RequestMapping("/Author")
public class AuthorController {

	@Autowired
	private AuthorService authorService;
	
	private final Log log = LogFactory.getLog(getClass());
 	
	@RequestMapping("/muenaddpage")
	private String getmuenAddpage(@ModelAttribute("earthMenu")EarthMenu earthMenu,Model model) { 
		List<EarthMenu> list=  authorService.getMenuList();
		model.addAttribute("list",list);
		return "/admin/menuListContent";
	}
	
	@RequestMapping("/muenadd")
	private String getmuenAdd(@ModelAttribute("earthMenu")EarthMenu earthMenu) { 
 		authorService.insertEarthMenu(earthMenu);
		return "redirect:/Author/muenlist";
	}
	
	@RequestMapping("/muenlist")
	private String getAnswerandContentList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords) {
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues(keywords);
 		EUDataGridResult list=authorService.getMenuPageList(pagenation);
 		List<EarthMenu> HelpCenterlist=(List<EarthMenu>)list.getRows();
		pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
		model.addAttribute("HelpCenterlist", HelpCenterlist);
		model.addAttribute("itemsCount", list.getTotal());
		model.addAttribute("pagenation", pagenation);
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
		return "admin/menuList";
	}
	
	@RequestMapping("/muenupdatepage")
	private String getmuenUpdatepage(EarthMenu earthMenu,Model model) { 
		List<EarthMenu> list=  authorService.getMenuList();
		EarthMenu obj=authorService.getMenuById(earthMenu.getId());
		model.addAttribute("list",list);
		model.addAttribute("obj",obj);
		
		return "/admin/menuListContent";
	}
	@RequestMapping("/muenupdate")
	private String getmuenUpdate(EarthMenu earthMenu) { 
 		authorService.updateMenu(earthMenu);
		return "redirect:/Author/muenlist";
	}
	@RequestMapping("/muendelete")
	private String getmuenDelete(EarthMenu earthMenu,int currentpage,int rowCount) { 
 		authorService.deleteMenu(earthMenu); 
		return "redirect:/Author/muenlist?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	
	//菜单名称数据重复校验
	@RequestMapping("/menuaddverify")
	@ResponseBody
	private EarthResult getAddverify(EarthMenu earthMenu) { 
		List<EarthMenu> HelpCenterlist = authorService.getMenuRepetList(earthMenu);
		EarthResult str=null;
		System.out.println(HelpCenterlist.size());
		if(HelpCenterlist.size()>0){
			 str=EarthResult.build(0, "Menu name: "+earthMenu.getName()+"  This data already exist!");
		}else{
			 str=EarthResult.build(1, "1");
		}
		return str;
	}
	
    //***************************权限管理***********************
	
	@RequestMapping("/authorityAddpage")
	private String getauthorityAddpage(EarthAction earthAction,Model model) { 
		return "/admin/authorityAddpage";
	}
	
	@RequestMapping("/authorityAdd")
	private String getauthorityAdd(EarthAction earthAction) { 
 		earthAction.setCreatetime(new Date());
 		earthAction.setVersion(0);
 		authorService.insertEarthAuthority(earthAction);
		return "redirect:/Author/authorityList";
	}
	
	@RequestMapping("/authorityUpdatepage")
	private String getauthorityUpdatepage(EarthAction earthAction,Model model) { 
		EarthAction obj=authorService.getAuthorityById(earthAction.getId());
		model.addAttribute("obj", obj);
		return "/admin/authorityAddpage";
	}
	
	@RequestMapping("/authorityUpdate")
	private String getauthorityUpdate(EarthAction earthAction) { 
		EarthAction obj=authorService.getAuthorityById(earthAction.getId());
	    obj.setAction(earthAction.getAction());
	    obj.setMenuid(earthAction.getMenuid());
	    obj.setRemark(earthAction.getRemark());
	    obj.setActionname(earthAction.getActionname());
 		authorService.updateAuthority(obj);
 		 
		return "redirect:/Author/authorityList";
	}
	
	@RequestMapping("/authorityList")
	private String getauthorityList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords) {
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues(keywords);
 		EUDataGridResult list=authorService.getAuthorityPageList(pagenation);
 		List<EarthAction> HelpCenterlist=(List<EarthAction>)list.getRows();
		pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
		model.addAttribute("HelpCenterlist", HelpCenterlist);
		model.addAttribute("itemsCount", list.getTotal());
		model.addAttribute("pagenation", pagenation);
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
		return "admin/authorityList";
	}
	
	@RequestMapping("/authorityDelete")
	private String getauthorityDelete(EarthAction earthMenu,int currentpage,int rowCount) { 
 		authorService.deleteAuthority(earthMenu);
		return "redirect:/Author/authorityList?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	
	//权限标识数据重复校验
	@RequestMapping("/authorityaddverify")
	@ResponseBody
	private EarthResult getauthorityAddverify(EarthAction earthAction) { 
		List<EarthAction> HelpCenterlist = authorService.getActionRepetList(earthAction);
		EarthResult str=null;
		System.out.println(HelpCenterlist.size());
		if(HelpCenterlist.size()>0){
			 str=EarthResult.build(0, "权限标识: "+earthAction.getAction()+"  已经维护了一条数据!");
		}else{
			 str=EarthResult.build(1, "1");
		}
		return str;
	}
		
	//*************************角色管理**************************
    //角色管理权限添加
	@RequestMapping("/roleAuthorityAdd")
	@ResponseBody
	private String getroleAuthorityAdd(String roleid,String ids,String menuids) { 
		//清空关联表数据
		EarthRole role=new EarthRole();
		role.setId(Long.valueOf(roleid));
		authorService.deleteRoleRelevance(role);
		
		if(ids.length()>0){
			ids=ids.substring(0,ids.length()-1);
		}
		if(menuids.length()>0){
			menuids=menuids.substring(0, menuids.length()-1);
		}
		//添加关联表 角色与权限
		String[] idj=ids.split(",");
		for(String idauthor:idj){
			EarthRoleAction obj=new EarthRoleAction();
			obj.setRoleid(Long.valueOf(roleid));
			obj.setActionid(Long.valueOf(idauthor));
			authorService.insertRoleAuthority(obj);
		}
		//添加关联表 角色与菜单	
		String[] menuidsj=menuids.split(",");
		for(String idmenu:menuidsj){
			EarthRoleMenu obj=new EarthRoleMenu();
			obj.setRoleid(Long.valueOf(roleid));
			obj.setMenuid(Long.valueOf(idmenu));
			authorService.insertRoleMenu(obj);
		}
		
		return "success";
	}
	
	
	@RequestMapping("/roleAddpage")
	private String getroleAddpage(EarthRole earthRole,Model model) { 
		
		return "/admin/roleAddpage";
	}
	
	@RequestMapping("/roleAdd")
	private String getroleAdd(EarthRole earthRole) { 
		earthRole.setCreatetime(new Date());
		earthRole.setVersion(0);
 		authorService.insertEarthRole(earthRole);
		return "redirect:/Author/roleList";
	}
	
	@RequestMapping("/roleUpdatepage")
	private String getroleUpdatepage(EarthRole earthRole,Model model) { 
		EarthRole obj=authorService.getRoleById(earthRole.getId());
		model.addAttribute("obj", obj);
		return "/admin/roleAddpage";
	}
	
	@RequestMapping("/roleUpdate")
	private String getroleUpdate(EarthRole earthRole) {
		EarthRole obj= authorService.getRoleById(earthRole.getId());
		obj.setRolename(earthRole.getRolename());
		obj.setRoletype(earthRole.getRoletype());
		obj.setRemark(earthRole.getRemark());
  		authorService.updateRole(obj);
		return "redirect:/Author/roleList";
	}
	
	@RequestMapping("/roleList")
	private String getroleList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords,String roletype) {
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		pagenation.setValues(keywords);
		pagenation.setValues4(roletype);
		
 		EUDataGridResult list=authorService.getRolePageList(pagenation);
 		List<EarthRole> HelpCenterlist=(List<EarthRole>)list.getRows();
		pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
		model.addAttribute("HelpCenterlist", HelpCenterlist);
		model.addAttribute("itemsCount", list.getTotal());
		model.addAttribute("pagenation", pagenation);
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
	    if(!StringUtils.isEmpty(roletype)){
	    	model.addAttribute("roletype", roletype); 
		}
		return "admin/roleList";
	}
	@RequestMapping("/roleDelete")
	private String getroleDelete(EarthRole EarthRole,int currentpage,int rowCount) { 
 		authorService.deleteRole(EarthRole);
		return "redirect:/Author/roleList?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	
	
	//角色名称数据重复校验
	@RequestMapping("/roleaddverify")
	@ResponseBody
	private EarthResult getroleAddverify(EarthRole earthRole) { 
		List<EarthRole> HelpCenterlist = authorService.getRoleRepetList(earthRole);
		EarthResult str=null;
		System.out.println(HelpCenterlist.size());
		if(HelpCenterlist.size()>0){
			 str=EarthResult.build(0, "角色名称: "+earthRole.getRolename()+"  已经维护了一条数据!");
		}else{
			 str=EarthResult.build(1, "1");
		}
		return str;
	}
	
	//************************操作员管理*********************************
	
	@RequestMapping("/operatorDelete")
	private String getoperatorDelete(EarthOperator EarthOperator,int currentpage,int rowCount) { 
 		authorService.deleteOperator(EarthOperator);
		return "redirect:/Author/operatorList?currentpage="+currentpage+"&rowCount="+rowCount+"";
	}
	
	@RequestMapping("/operatorAddpage")
	private String getoperatorAddpage(EarthOperator earthOperator,Model model) { 	
		List<EarthRole> list=authorService.getallRole();
		model.addAttribute("list", list);
		return "/admin/operatorAddpage";
	}
	
	@RequestMapping("/operatorAdd")
	private String getoperatorAdd(EarthOperator earthOperator) { 
		earthOperator.setCreatetime(new Date());
		earthOperator.setVersion(0);
		//对密码进行加密加密处理
		String loginname=earthOperator.getLoginname();
		String pwd=earthOperator.getLoginpwd();
		String loginpwd=SafetyUtil.addMD5Salt(loginname, pwd);
		earthOperator.setLoginpwd(loginpwd);
			
 		authorService.insertEarthOperator(earthOperator);
		return "redirect:/Author/operatorList";
	}
	
	@RequestMapping("/operatorUpdatepage")
	private String getoperatorUpdatepage(EarthOperator earthOperator,Model model) { 
		EarthOperator obj=authorService.getOperatorById(earthOperator.getId());
		obj.setRoleid(earthOperator.getRoleid());
		List<EarthRole> list=authorService.getallRole();
		model.addAttribute("list", list);
		model.addAttribute("obj", obj);
		return "/admin/operatorAddpage";
	}
	
	@RequestMapping("/operatorUpdate")
	private String getoperatorUpdate(EarthOperator earthOperator) { 
			
		EarthOperator obj=authorService.getOperatorById(earthOperator.getId());
		System.out.println("用户名："+obj.getLoginname());
		obj.setRoleid(earthOperator.getRoleid());
		//obj.setLoginname(earthOperator.getLoginname());
		if(!earthOperator.getLoginpwd().equals(obj.getLoginpwd())){
			//对密码进行加密加密处理
			String loginpwd = SafetyUtil.addMD5Salt(obj.getLoginname(), earthOperator.getLoginpwd());
			obj.setLoginpwd(loginpwd);
		}
		obj.setRealname(earthOperator.getRealname());
		obj.setType(earthOperator.getType());
		
 		authorService.updateOperator(obj);
		return "redirect:/Author/operatorList";
	}
	
	@RequestMapping("/operatorList")
	private String getoperatorList(HttpServletRequest request, Model model,Pagenation pagenation,String keywords) {
		if(!StringUtils.isEmpty(keywords)){
			try {
				keywords=java.net.URLDecoder.decode( keywords, "UTF-8" );
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
 		pagenation.setValues(keywords);
 		EUDataGridResult list=authorService.getOperatorPageList(pagenation);
 		List<EarthOperator> HelpCenterlist=(List<EarthOperator>)list.getRows();
		pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
		model.addAttribute("HelpCenterlist", HelpCenterlist);
		model.addAttribute("itemsCount", list.getTotal());
		model.addAttribute("pagenation", pagenation);
		if(!StringUtils.isEmpty(keywords)){
			model.addAttribute("keywords", keywords); 
		}
		return "admin/operatorList";
	}
	
	//操作员登录名数据重复校验
	@RequestMapping("/Operatoraddverify")
	@ResponseBody
	private EarthResult getOperatorAddverify(EarthOperator earthOperator) { 
		List<EarthOperator> HelpCenterlist = authorService.getOperatorRepetList(earthOperator);
		EarthResult str=null;
		//System.out.println(HelpCenterlist.size());
		if(HelpCenterlist.size()>0){
			 str=EarthResult.build(0, "Login name: "+earthOperator.getLoginname()+"  This data already exist!");
		}else{
			 str=EarthResult.build(1, "1");
		}
		return str;
	}
	 
}

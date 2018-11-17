package com.beadhouse.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.beadhouse.common.utils.JsonUtils;
import com.beadhouse.pojo.EarthAction;
import com.beadhouse.pojo.EarthMenu;
import com.beadhouse.service.AuthorService;


/**
 * 系统管理
 */
@Controller
@RequestMapping("/commoncontrol")
public class CommonController {

	@Autowired
	private AuthorService authorService;
 	
	//菜单树
    @RequestMapping("findChildOrgList")
    @ResponseBody
    public List<Map<String, Object>> findChildOrgList(String code, Model model) {   
    	 List<EarthMenu> list=authorService.getMenuList2(Long.valueOf(code));
        List<Map<String, Object>> orgList = new ArrayList<Map<String, Object>>();
        for(EarthMenu orgObject : list) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("id", orgObject.getId());
            map.put("code", orgObject.getId());
            map.put("nameCn", orgObject.getName());
            map.put("nameWithCode", orgObject.getId() + " " + orgObject.getName());
            map.put("parentOrgCode", orgObject.getParentid());
            if (0 == orgObject.getLevel()) {
                map.put("isParent", "true");
            }else {
                map.put("isParent", "false");

            }

            orgList.add(map);
        }
        return orgList;

    }
    //权限树
    @RequestMapping("findActionList")
    public String findActionList(String code,String roleid, Model model) {   
    	  String str=authorService.buildAdminPermissionTree2(new StringBuffer());
    	  List<EarthAction> list=authorService.getRoleAction(roleid);
    	  model.addAttribute("user3", JsonUtils.objectToJson(list));
          model.addAttribute("data", str);
          return "admin/muentree2";
    }
    
    
    
    
}

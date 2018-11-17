package com.beadhouse.service;

 
import java.util.List;

import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.EarthAction;
import com.beadhouse.pojo.EarthMenu;
import com.beadhouse.pojo.EarthOperator;
import com.beadhouse.pojo.EarthRole;
import com.beadhouse.pojo.EarthRoleAction;
import com.beadhouse.pojo.EarthRoleMenu;
import com.beadhouse.pojo.Pagenation;
 
public interface AuthorService {

	public void insertEarthMenu(EarthMenu earthMenu);
	public EUDataGridResult getMenuPageList(Pagenation pagenation);
	public String buildAdminPermissionTree(StringBuffer treeBuf) ;
	public String buildAdminPermissionTree2(StringBuffer treeBuf) ;
	public	EarthMenu getMenuById(long id);
	public List<EarthMenu> getMenuList();
	public List<EarthMenu> getMenuList2(long id);
	public void updateMenu(EarthMenu EarthMenu);
	public void deleteMenu(EarthMenu EarthMenu);
	public List<EarthMenu> getMenuRepetList(EarthMenu EarthMenu);
	//权限管理
	public void insertEarthAuthority(EarthAction EarthAction);
	public EUDataGridResult getAuthorityPageList(Pagenation pagenation);
	public	EarthAction getAuthorityById(long id);
	public void updateAuthority(EarthAction EarthAction);
	public void deleteAuthority(EarthAction EarthAction);
	public List<EarthAction> getActionRepetList(EarthAction EarthAction);
	//查询角色权限
	public List<EarthAction> getRoleAction(String id);
	
	//角色管理
	public void insertEarthRole(EarthRole EarthRole);
	public EUDataGridResult getRolePageList(Pagenation pagenation);
	public	EarthRole getRoleById(long id);
	public List<EarthRole> getallRole();
	public void updateRole(EarthRole EarthRole);
	public void deleteRole(EarthRole EarthRole);
	public void deleteRoleRelevance(EarthRole EarthRole);
	public void insertRoleAuthority(EarthRoleAction EarthRoleActionlist);
	public void insertRoleMenu(EarthRoleMenu EarthRoleMenu);
	public List<EarthRole> getRoleRepetList(EarthRole EarthRole);
	
	//人员管理
	public void insertEarthOperator(EarthOperator EarthOperator);
	public EUDataGridResult getOperatorPageList(Pagenation pagenation);
	public	EarthOperator getOperatorById(long id);
	public void updateOperator(EarthOperator EarthOperator);
	public void deleteOperator(EarthOperator EarthOperator);
	public List<EarthOperator> getOperatorRepetList(EarthOperator EarthOperator);
	//登录查询用户信息
	public List<EarthOperator> getEarthOperator(String loginname,String loginpwd);
	//查询用户的权限
	public List<EarthAction> getUserEarthAction(String loginname);
	public List<String> getUserEarthAction2(String loginname);
    //查询用户的菜单
	public List<EarthMenu> getUserEarthMenu(String loginname);
	public String buildAdminPermissionTree3(StringBuffer treeBuf,List<EarthMenu> zjd);
	public List<EarthOperator> getEarthOperator2(String loginname);
	
}

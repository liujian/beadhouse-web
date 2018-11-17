package com.beadhouse.service.impl;


import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.beadhouse.service.AuthorService;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.mapper.EarthActionMapper;
import com.beadhouse.mapper.EarthMenuMapper;
import com.beadhouse.mapper.EarthOperatorMapper;
import com.beadhouse.mapper.EarthRoleActionMapper;
import com.beadhouse.mapper.EarthRoleMapper;
import com.beadhouse.mapper.EarthRoleMenuMapper;
import com.beadhouse.mapper.EarthRoleOperatorMapper;

import com.beadhouse.pojo.EarthAction;
import com.beadhouse.pojo.EarthActionExample;
import com.beadhouse.pojo.EarthMenu;
import com.beadhouse.pojo.EarthMenuExample;
import com.beadhouse.pojo.EarthMenuExample.Criteria;
import com.beadhouse.pojo.EarthOperator;
import com.beadhouse.pojo.EarthOperatorExample;
import com.beadhouse.pojo.EarthRole;
import com.beadhouse.pojo.EarthRoleAction;
import com.beadhouse.pojo.EarthRoleActionExample;
import com.beadhouse.pojo.EarthRoleExample;
import com.beadhouse.pojo.EarthRoleMenu;
import com.beadhouse.pojo.EarthRoleMenuExample;
import com.beadhouse.pojo.EarthRoleOperator;
import com.beadhouse.pojo.EarthRoleOperatorExample;
import com.beadhouse.pojo.Pagenation;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
 
 
@Service
public class AuthorServiceImpl implements AuthorService {
	
	@Autowired
	private EarthMenuMapper earthMenuMapper;
	
	@Autowired
	private EarthActionMapper earthActionMapper;
	
	@Autowired
    private EarthRoleMapper earthRoleMapper;
	
	@Autowired
    private EarthOperatorMapper earthOperatorMapper;
	
	@Autowired
	private EarthRoleActionMapper earthRoleActionMapper;
	
	@Autowired
	private EarthRoleOperatorMapper earthRoleOperatorMapper;
	
	@Autowired
	private EarthRoleMenuMapper earthRoleMenuMapper;
	
	private final Log log = LogFactory.getLog(getClass());
	
	@Override
	public void insertEarthMenu(EarthMenu earthMenu) {
		 earthMenuMapper.insert(earthMenu);
		
	}

	@Override
	public EUDataGridResult getMenuPageList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		EarthMenuExample str = new EarthMenuExample();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			Criteria criteria = str.createCriteria();
			criteria.andNameLike("%" + pagenation.getValues() + "%");
		}
		List<EarthMenu> list=(List<EarthMenu>) earthMenuMapper.selectByExample2(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<EarthMenu> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	public List<EarthMenu> getMenutreeList(Pagenation pagenation) {
		EarthMenuExample str = new EarthMenuExample();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			Criteria criteria = str.createCriteria();
			criteria.andParentidEqualTo(Long.valueOf(pagenation.getValues()));
		}
		List<EarthMenu> list=(List<EarthMenu>) earthMenuMapper.selectByExample(str);
		//创建一个返回值对象
	  
		return list;
	}
	public List<EarthMenu> getMenuList() {
		    EarthMenuExample str = new EarthMenuExample();		
			Criteria criteria = str.createCriteria();
			criteria.andParentidIsNull();
		List<EarthMenu> list=(List<EarthMenu>) earthMenuMapper.selectByExample(str);
		//创建一个返回值对象
	  
		return list;
	}
    public String buildAdminPermissionTree(StringBuffer treeBuf) {
	    try {
			Pagenation pagenation=new Pagenation();
			List<EarthMenu> menuList = getMenutreeList(pagenation);
			for (EarthMenu map : menuList) {
				String id = map.getId().toString();// id
				String level = map.getLevel().toString();   
				if ("0".equals(level)){
					treeBuf.append("  <dd> <div class='title'> ");
					treeBuf.append("<span><img src='images/leftico01.png' /> </span>" + map.getName() + " </div> <ul class='menuson'>");
					//拼接处子id
					Pagenation pagenation2=new Pagenation();
					pagenation2.setValues(id);
					List<EarthMenu>  zjd = getMenutreeList(pagenation2);
					for(EarthMenu map2 : zjd){
						treeBuf.append("  <li> <cite></cite><a href='" + map2.getUrl() + "' target='rightFrame' '>" + map2.getName() + "</a> <i></i>  </li>");
					}
					treeBuf.append("  </ul> <dd> ");
					 
				}	 
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("保存信息失败,错误原因:"+e.getMessage(),e);   
		}
         return treeBuf.toString();
	}
    //用户所拥有的菜单
    public String buildAdminPermissionTree3(StringBuffer treeBuf,List<EarthMenu> zjd) {
	    try {
			Pagenation pagenation=new Pagenation();
			List<EarthMenu> menuList = getMenutreeList(pagenation);
			
/*    for(EarthMenu li:menuList){
				 for(EarthMenu li2:zjd){
					 if(li.getId().longValue()==li2.getParentid().longValue()){
						 if(li!=null)
						 menuList.remove(li);
					 }
				 }
			}*/
			Set<EarthMenu> menuList2=new LinkedHashSet<EarthMenu>();
			for(int i=0;i<menuList.size();i++){
				if ("0".equals(menuList.get(i).getLevel().toString())){
			    	for(int j=0;j<zjd.size();j++){
			    		if(menuList.get(i).getId().longValue()==zjd.get(j).getParentid().longValue()){ 			
			    			menuList2.add(menuList.get(i));
			    		}
			    	}
				}
			}
			   
			 
			for (EarthMenu map : menuList2) {
				//String id = map.getId().toString();// id
				String level = map.getLevel().toString();   
				 
				if ("0".equals(level)){
					
					treeBuf.append("  <dd> <div class='title'> ");
					treeBuf.append("<span><img src='images/leftico01.png' /> </span>" + map.getName() + " </div> <ul class='menuson'>");
					//拼接处子id
					for(EarthMenu map2 : zjd){
						if(map2.getParentid().equals(map.getId())){
						treeBuf.append("  <li> <cite></cite><a href='" + map2.getUrl() + "' target='rightFrame' '>" + map2.getName() + "</a> <i></i>  </li>");
						}
					}
					treeBuf.append("  </ul> <dd> ");
				 
				}	 
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("保存信息失败,错误原因:"+e.getMessage(),e);   
		}
	 
         return treeBuf.toString();
	}
    
    //权限树
    public String buildAdminPermissionTree2(StringBuffer treeBuf) {
	    Pagenation pagenation = new Pagenation();
	    List<EarthMenu> menuList = getMenutreeList(pagenation);
	    treeBuf.append("[{ name:'权限树',ename:9999,open:true,nocheck:true,nodes: [");
		for (EarthMenu map : menuList) {
			String id = map.getId().toString();// id
			String level = map.getLevel().toString();   
			if ("0".equals(level)){
				treeBuf.append(" {name:'"+map.getName()+"',ename:"+map.getId()+"");
				//拼接处子id
				Pagenation pagenation2=new Pagenation();
				pagenation2.setValues(id);
				List<EarthMenu>  zjd=getMenutreeList(pagenation2);
				if(zjd.size()>0){
					treeBuf.append(",open:true,nocheck:true,nodes: [");
					for(EarthMenu map2 : zjd){
						treeBuf.append("{name:'"+map2.getName()+"',menuid:"+map2.getId()+" ");
						Pagenation pagenation3=new Pagenation();
					    pagenation3.setValues(String.valueOf(map2.getId()));
						List<EarthAction> list= getAuthorityPageList2(pagenation3);
						if(list.size()>0){
							treeBuf.append(",open:true,check:true,nodes: [");
							for(EarthAction map3:list){
								treeBuf.append("{name:'"+map3.getActionname()+"',ename:"+map3.getId()+"},");
							}
						//	treeBuf.toString().substring(treeBuf.toString().length()-1);
							String str=treeBuf.substring(0,treeBuf.toString().length()-1);
							treeBuf.delete(0,treeBuf.length());
							treeBuf.append(str);
							
							
							
							treeBuf.append("]},");
						}else{
							treeBuf.append("},");
						}
						
					}
				
					//treeBuf.append("}],");
					
					String str=treeBuf.substring(0,treeBuf.toString().length()-1);
					treeBuf.delete(0,treeBuf.length());
					treeBuf.append(str);
					treeBuf.append("]},");
			    }else{
			    	treeBuf.append("},");
			    }
			}	 
		}
		//System.out.println(treeBuf.toString().length());
		String treeBuf2 = treeBuf.substring(0,treeBuf.toString().length()-1);
	
		 treeBuf2+="] }]";
         return treeBuf2.toString();
	}
    

	@Override
	public EarthMenu getMenuById(long id) {
		EarthMenu  list = (EarthMenu) earthMenuMapper.selectByPrimaryKey(id);
		//创建一个返回值对象
     	return list;
	}

	@Override
	public void updateMenu(EarthMenu EarthMenu) {		 
		earthMenuMapper.updateByPrimaryKey(EarthMenu);
	}

	@Override
	public void deleteMenu(EarthMenu EarthMenu) {
		earthMenuMapper.deleteByPrimaryKey(EarthMenu.getId());
		EarthMenuExample str = new EarthMenuExample();
		str.setMenuid(String.valueOf(EarthMenu.getId()));
		//删除权限与菜单关联的数据
		earthMenuMapper.deleteByExample2(str);
		//删除角色与菜单关联的数据
		earthMenuMapper.deleteByExample3(str);
		//删除角色权限与菜单关联的数据
		earthMenuMapper.deleteByExample4(str);
		
	}

	@Override
	public void insertEarthAuthority(EarthAction EarthAction) {
		 earthActionMapper.insert(EarthAction);
	}

	@Override
	public EUDataGridResult getAuthorityPageList(Pagenation pagenation) {
        //分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		EarthActionExample str = new EarthActionExample();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			com.beadhouse.pojo.EarthActionExample.Criteria criteria = str.createCriteria();
			criteria.andActionnameLike(pagenation.getValues());
		}
		List<EarthAction> list = (List<EarthAction>) earthActionMapper.selectByExample(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<EarthAction> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}
	
	public List<EarthAction> getAuthorityPageList2(Pagenation pagenation) {
        //分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		EarthActionExample str = new EarthActionExample();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			com.beadhouse.pojo.EarthActionExample.Criteria criteria = str.createCriteria();
			criteria.andMenuidEqualTo(Long.valueOf(pagenation.getValues()));
		}
		List<EarthAction> list = (List<EarthAction>) earthActionMapper.selectByExample(str);
		return list;
	}
	

	@Override
	public EarthAction getAuthorityById(long id) {
		EarthAction obj = earthActionMapper.selectByPrimaryKey2(id);
		return obj;
	}

	@Override
	public void updateAuthority(EarthAction EarthAction) {
		 earthActionMapper.updateByPrimaryKey(EarthAction);
	}

	@Override
	public void deleteAuthority(EarthAction EarthAction) {
		earthActionMapper.deleteByPrimaryKey(EarthAction.getId());
		EarthRoleActionExample str = new EarthRoleActionExample();
		//删除与角色与权限关联的信息
		com.beadhouse.pojo.EarthRoleActionExample.Criteria criteria = str.createCriteria();
		criteria.andActionidEqualTo(EarthAction.getId());
		earthRoleActionMapper.deleteByExample(str);
		
	}

	@Override
	public void insertEarthRole(EarthRole EarthRole) {
		earthRoleMapper.insert(EarthRole);
	}

	@Override
	public EUDataGridResult getRolePageList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		EarthRoleExample str = new EarthRoleExample();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			com.beadhouse.pojo.EarthRoleExample.Criteria criteria = str.createCriteria();
			criteria.andRolenameLike(pagenation.getValues());
		}
		if(!StringUtils.isEmpty(pagenation.getValues4())){			
			com.beadhouse.pojo.EarthRoleExample.Criteria criteria = str.createCriteria();
			criteria.andRoletypeEqualTo(pagenation.getValues4());
		}
		System.out.println(str.toString());
		List<EarthRole> list = (List<EarthRole>) earthRoleMapper.selectByExample(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<EarthRole> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EarthRole getRoleById(long id) {
		EarthRole obj = earthRoleMapper.selectByPrimaryKey(id);
		return obj;
	}

	@Override
	public void updateRole(EarthRole EarthRole) {
		earthRoleMapper.updateByPrimaryKey(EarthRole);
	}

	@Override
	public void deleteRole(EarthRole EarthRole) {
		//角色删除时需要删除 角色与权限 角色与菜单 角色与操作员 三者表的关联数据
		earthRoleMapper.deleteByPrimaryKey(EarthRole.getId());
		//角色与权限 
		EarthRoleActionExample str = new EarthRoleActionExample();
		com.beadhouse.pojo.EarthRoleActionExample.Criteria criteria = str.createCriteria();
		criteria.andRoleidEqualTo(EarthRole.getId());
		earthRoleActionMapper.deleteByExample(str);
		//角色与菜单
		EarthRoleMenuExample str2 = new EarthRoleMenuExample();
		com.beadhouse.pojo.EarthRoleMenuExample.Criteria criteria2 = str2.createCriteria();
		criteria2.andRoleidEqualTo(EarthRole.getId());
		earthRoleMenuMapper.deleteByExample(str2);
		//角色与操作员
		EarthRoleOperatorExample str3 = new EarthRoleOperatorExample();
		com.beadhouse.pojo.EarthRoleOperatorExample.Criteria criteria3 = str3.createCriteria();
		criteria3.andRoleidEqualTo(EarthRole.getId());
		earthRoleOperatorMapper.deleteByExample(str3);
		
	}

	@Override
	public void insertEarthOperator(EarthOperator EarthOperator) {
	    earthOperatorMapper.insert(EarthOperator);
		EarthRoleOperator obj = new EarthRoleOperator();
		obj.setOperatorid(EarthOperator.getId());
		obj.setRoleid(Long.valueOf(EarthOperator.getRoleid()));
		earthRoleOperatorMapper.insert(obj);
		
		
	}
	
	
	//--------------------------------操作员------------------------------------------

	@Override
	public EUDataGridResult getOperatorPageList(Pagenation pagenation) {
		//分页处理
		PageHelper.startPage(pagenation.getCurrentpage(), pagenation.getPageSize());
		EarthOperatorExample str = new EarthOperatorExample();
		if(!StringUtils.isEmpty(pagenation.getValues())){			
			com.beadhouse.pojo.EarthOperatorExample.Criteria criteria = str.createCriteria();
			criteria.andRealnameLike(pagenation.getValues());
		}
		List<EarthOperator> list = (List<EarthOperator>) earthOperatorMapper.selectByExample2(str);
		//创建一个返回值对象
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//取记录总条数
		PageInfo<EarthOperator> pageInfo = new PageInfo<>(list);
		result.setTotal(pageInfo.getTotal());
		return result;
	}

	@Override
	public EarthOperator getOperatorById(long id) {
		EarthOperator obj = earthOperatorMapper.selectByPrimaryKey(id);
		return obj;
	}

	@Override
	public void updateOperator(EarthOperator EarthOperator) {
		earthOperatorMapper.updateByPrimaryKey(EarthOperator);
		//修改对应的关联表
		EarthRoleOperatorExample example = new EarthRoleOperatorExample();		
		com.beadhouse.pojo.EarthRoleOperatorExample.Criteria criteria = example.createCriteria();
		criteria.andOperatoridEqualTo(EarthOperator.getId());
		List<EarthRoleOperator> obj = earthRoleOperatorMapper.selectByExample(example);
		if(obj.size()>0){
			obj.get(0).setRoleid(Long.valueOf(EarthOperator.getRoleid()));
			earthRoleOperatorMapper.updateByExample(obj.get(0), example);
		}
	
	}

	@Override
	public void deleteOperator(EarthOperator EarthOperator) {
		 earthOperatorMapper.deleteByPrimaryKey(EarthOperator.getId());		
		 EarthRoleOperatorExample example = new EarthRoleOperatorExample();		
		 com.beadhouse.pojo.EarthRoleOperatorExample.Criteria criteria = example.createCriteria();
		 criteria.andOperatoridEqualTo(EarthOperator.getId());
		 earthRoleOperatorMapper.deleteByExample(example);
	}

	@Override
	public List<EarthMenu> getMenuList2(long id) {
		EarthMenuExample str = new EarthMenuExample();		
		Criteria criteria = str.createCriteria();
		if(id == 0){
			criteria.andParentidIsNull();
		}else{
			criteria.andParentidEqualTo(id);
		}
			
		List<EarthMenu> list=(List<EarthMenu>) earthMenuMapper.selectByExample(str);
		//创建一个返回值对象
	  
		return list;
	 
	}

	@Override
	public void insertRoleAuthority(EarthRoleAction EarthRoleActionlist) {
		 earthRoleActionMapper.insert(EarthRoleActionlist);
		
	}

	@Override
	public List<EarthRole> getallRole() {
		EarthRoleExample str=new EarthRoleExample();
		List<EarthRole> list=(List<EarthRole>) earthRoleMapper.selectByExample(str);
 		return list;
	}

	@Override
	public void insertRoleMenu(EarthRoleMenu EarthRoleMenu) { 
		earthRoleMenuMapper.insert(EarthRoleMenu);
	}

	@Override
	public List<EarthOperator> getEarthOperator(String loginname, String loginpwd) {
		EarthOperatorExample str=new EarthOperatorExample();
		com.beadhouse.pojo.EarthOperatorExample.Criteria criteria = str.createCriteria();
		criteria.andLoginnameEqualTo(loginname);
		criteria.andLoginpwdEqualTo(loginpwd);
		List<EarthOperator> list=earthOperatorMapper.selectByExample(str);
		return list;
	}
   
	@Override
	public List<EarthOperator> getEarthOperator2(String loginname) {
		if(loginname == null) {
			List<EarthOperator> list = new ArrayList<>();
			return list;
		}
		EarthOperatorExample str=new EarthOperatorExample();
		com.beadhouse.pojo.EarthOperatorExample.Criteria criteria = str.createCriteria();
		criteria.andLoginnameEqualTo(loginname);
		List<EarthOperator> list = earthOperatorMapper.selectByExample(str);
		return list;
	}

	@Override
	public void deleteRoleRelevance(EarthRole EarthRole) {
		//角色与权限 
		EarthRoleActionExample str=new EarthRoleActionExample();
		com.beadhouse.pojo.EarthRoleActionExample.Criteria criteria = str.createCriteria();
		criteria.andRoleidEqualTo(EarthRole.getId());
		earthRoleActionMapper.deleteByExample(str);
		//角色与菜单
		EarthRoleMenuExample str2=new EarthRoleMenuExample();
		com.beadhouse.pojo.EarthRoleMenuExample.Criteria criteria2 = str2.createCriteria();
		criteria2.andRoleidEqualTo(EarthRole.getId());
		earthRoleMenuMapper.deleteByExample(str2);
		 
	}

	@Override
	public List<EarthAction> getUserEarthAction(String loginname) {
		EarthActionExample str=new EarthActionExample();
	    str.setLoginname(loginname);
		List<EarthAction> list=earthActionMapper.selectByExample2(str);
		return list;
	}
	
	public List<String> getUserEarthAction2(String loginname) {
		EarthActionExample str=new EarthActionExample();
	    str.setLoginname(loginname);
		List<String> list=earthActionMapper.selectByExample3(str);
		return list;
	}

	@Override
	public List<EarthMenu> getUserEarthMenu(String loginname) {
		EarthMenuExample str=new EarthMenuExample();
	    str.setLoginname(loginname);
		List<EarthMenu> list=earthMenuMapper.selectByExample3(str);
		return list;
	}
	
    //查询当前角色的所有权限
	@Override
	public List<EarthAction> getRoleAction(String id) {
		EarthActionExample str=new EarthActionExample();
	    str.setRoleid(id);//
		List<EarthAction> list=earthActionMapper.selectByExample4(str);
		return list;
	}

	@Override
	public List<EarthMenu> getMenuRepetList(EarthMenu EarthMenu) {
		EarthMenuExample str=new EarthMenuExample();
		Criteria criteria = str.createCriteria();
		criteria.andNameEqualTo(EarthMenu.getName());
		List<EarthMenu> list=(List<EarthMenu>) earthMenuMapper.selectByExample(str);
		 
		return list ;
	}
	
    //
	@Override
	public List<EarthAction> getActionRepetList(EarthAction EarthAction) {
		EarthActionExample str=new EarthActionExample();
		com.beadhouse.pojo.EarthActionExample.Criteria criteria = str.createCriteria();
		criteria.andActionEqualTo(EarthAction.getAction());
		List<EarthAction> list=(List<EarthAction>) earthActionMapper.selectByExample(str);
		return list;
	}

	@Override
	public List<EarthRole> getRoleRepetList(EarthRole EarthRole) {
		EarthRoleExample str=new EarthRoleExample();
		com.beadhouse.pojo.EarthRoleExample.Criteria criteria = str.createCriteria();
		criteria.andRolenameEqualTo(EarthRole.getRolename());
		List<EarthRole> list=(List<EarthRole>) earthRoleMapper.selectByExample(str);
		return list;
	}

	@Override
	public List<EarthOperator> getOperatorRepetList(EarthOperator EarthOperator) {
		EarthOperatorExample str=new EarthOperatorExample();
		com.beadhouse.pojo.EarthOperatorExample.Criteria criteria = str.createCriteria();
		criteria.andLoginnameEqualTo(EarthOperator.getLoginname());
		List<EarthOperator> list=(List<EarthOperator>) earthOperatorMapper.selectByExample(str);
		return list;
	}

	

}

package com.beadhouse.taglib;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;
import org.apache.commons.lang3.StringUtils;
import com.beadhouse.pojo.EarthOperator;
 
/**
 * @描述: 自定义权限权标签 .
 */
@SuppressWarnings("serial")
public class PermissionTaglib2 extends BodyTagSupport {


	private String value; //权限值
	@Override
	public int doStartTag() throws JspException {
		 HttpServletRequest request = (HttpServletRequest)this.pageContext.getRequest(); 
		 String values[]=value.split(",");
		 for(String bz:values){
				if (StringUtils.isNotBlank(bz)){
					final EarthOperator webUser = (EarthOperator) request.getSession().getAttribute("user");
					List<String> action=webUser.getEarthactionsx();
					if (action.contains(bz.trim())){ // 拥有此功能点权限
						return EVAL_BODY_INCLUDE;
					}
				} 
		 }
	
		return SKIP_BODY;
	}

	public String getValue() {
		return value;
	}
	
	public void setValue(String value) {
		this.value = value;
	} 
}

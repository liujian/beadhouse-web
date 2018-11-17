package com.beadhouse.interceptor;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ccic.cas.client.util.CasUtils;
import com.beadhouse.pojo.EarthOperator;

public class LogonInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception arg3)
			throws Exception {
		
		
	}

	
	
	
	
	
	
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		EarthOperator webUser = (EarthOperator) request.getSession().getAttribute("user");
		String url = request.getRequestURI();
		if (StringUtils.isNotBlank(url) && url.toLowerCase().indexOf("login") < 0 && url.toLowerCase().indexOf("validata") < 0) {
          
	    	if (null == webUser) {
	    		//判断是否是单点登录的请求
	    		if(!StringUtils.isEmpty(CasUtils.getUserCode(request))){
	  		        return true; 
	    		}else{
	    			  String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
	    		       response.sendRedirect(localUrl+"login");
	    			   return false;
	    		}
		  

			  }else{
				  if(url.equals("/")){
						String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
					    response.sendRedirect(localUrl+"main");  
				  }else{	
					  String bz=request.getHeader("referer");
					  if(StringUtils.isEmpty(bz)){
						  if(url.equals(request.getContextPath() + "/main")){
						      return true;
						  }else{
							   String localUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
							   response.sendRedirect(localUrl+"main");  
						  }
					   }
				  }
				  return true;
	
			  }

		 }

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		Cookie[] cookies = request.getCookies();  
        // 给cookie设置HttpOnly属性
        if (cookies != null) {  
            Cookie cookie = cookies[0];  
            if (cookie != null) {  
                String value = cookie.getValue();  
                
                StringBuilder builder = new StringBuilder();  
                builder.append("JSESSIONID=" + value + "; ");  
                builder.append("Secure; ");  
                builder.append("HttpOnly; ");  
                  
                Calendar calendar = Calendar.getInstance();  
                calendar.add(Calendar.HOUR, 1);  
                Date date = calendar.getTime();    
                Locale locale = Locale.CHINA;  
                  
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss",locale);    
                builder.append("Expires=" + sdf.format(date));    
                  
                response.setHeader("Set-Cookie", builder.toString());    
            }  
        }  
		
	}


}

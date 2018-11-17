<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/gzzyzz.tld" prefix="z" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <base href="<%=basePath%>">
    <title>Elderly management system interface</title>
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript">
	    $(function () {
		  $('[data-toggle="popover"]').popover()
		})
	</script>
     
  </head>


<body>

	<div class="place">
	    <span>Location：</span>
	    <ul class="placeul">
		    <li>Elderly management system interface</li>
			<li>home page</li>
	    </ul>
    </div>
    
    <div class="mainindex">
    
	    <div class="welinfo">
	    	<span><img src="images/sun.png" alt="天气" /></span>
	    	<b>${user.loginname} Hello, you are the administrator, welcome to use the elderly management system.</b> 
	   	 
	    	
	    </div>
	    
	  <%--   <div class="welinfo">
	    	<span><img src="images/time.png" alt="时间" /></span>
	    	<i>您上次登录的时间：${loginTime}</i> （不是您登录的？<a href="admin_toUpdatepwd">请点这里</a>）
	    </div> --%>
	    
	    <div class="xline">
	           
	    </div>
	    
	    <ul class="iconlist">	 
	       
	    
	     
	    </ul>
	    
	   <!--  <div class="ibox"><a href="admin_toAddAdmin" class="ibtn"><img src="images/iadd.png" />添加新的管理员</a></div> -->
	     
	    
	    <div class="xline"></div>
	    <div class="box"></div>
	    
	    <div class="xline"></div>
	    
    </div>
    
</body>
</html>














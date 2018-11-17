<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
/* String url = CasUtils.getCasServerLoginUrl().substring(0, CasUtils.getCasServerLoginUrl().length()-6)+ "/logout?service="+request.getHeader("Referer"); */
%>
<%@page import="com.ccic.cas.client.util.CasUtils" %>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>无标题文档</title>
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript">
	$(function(){	
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected")
			$(this).addClass("selected");
		})	
	})	
	
	function tuchu(){
		window.location.href="<%=basePath%>adminExit";
	}
	
	
	</script>

</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    	<img src="images/logo.png"   title="系统首页" />
    </div>
            
    <div class="topright">    
    <ul>
 
           <li><a href="<%=basePath%>/adminExit" target="_parent">Logout</a></li>
          <%-- <li><a href="<%=CasUtils.getCasServerLogoutUrl()%>" onclick="tuchu();" target="_parent">退出登录</a></li> --%>
    </ul>
     
   <!--  <div class="user">
    <span>管理员</span>
    <i>消息</i>
    <b>0</b>
    </div> -->    
    
    </div>

</body>
</html>

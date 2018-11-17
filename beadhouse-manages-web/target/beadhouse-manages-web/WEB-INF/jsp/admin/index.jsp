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
    <base href="<%=basePath%>">
    <title>大地时贷管理系统</title>
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
    <span>位置：</span>
    <ul class="placeul">
    <li>大地时贷管理系统</li>
	<li>首页</li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    	<span><img src="images/sun.png" alt="天气" /></span>
    	<b>${user.loginname} 您好，您是管理员，欢迎使用大地时贷管理系统</b> 
   	 
    	
    </div>
    
  <%--   <div class="welinfo">
    	<span><img src="images/time.png" alt="时间" /></span>
    	<i>您上次登录的时间：${loginTime}</i> （不是您登录的？<a href="admin_toUpdatepwd">请点这里</a>）
    </div> --%>
    
    <div class="xline">
           
    </div>
    
    <ul class="iconlist">
      <z:permission2 value="pms:questionwh:view,pms:ideack:view,pms:questionanswh:view">
    <li><img src="images/ico01.png" /><p>
    <a href="javascript:void(0);" data-toggle="popover"  data-placement="bottom" data-container="body" data-trigger="focus"  data-html="true" data-title="帮助中心参数维护"
     data-content="您可点击左侧导航键进行数据操作：<br><br>
    （1）对问题类型参数进行维护<br><br>  
   （2）对问题及答案文字内容进行维护 <br><br>
   （3）查看用户的意见反馈" >帮助中心</a></p>
    </li>
     </z:permission2>
    
    <z:permission2 value="pms:image:save">
    <li><img src="images/ico04.png" /><p><a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="focus"  data-html="true"  data-title="闪屏页上传管理"
     data-content="你可点击左边导航键进行数据操作：<br/><br/>（1）静态多分辨率图片上传">闪屏页上传</a></p></li>
    </z:permission2>
    
     <z:permission2 value="pms:messageloanwh:view,pms:messagesyswh:view">
    <li><img src="images/ico03.png" /><p><a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="focus"  data-html="true"  data-title="消息中心"
     data-content="你可点击左边导航键进行数据操作：<br/><br/>（1）时贷活动内容推送<br/><br/>（2）系统消息" >消息中心</a></p></li>
     </z:permission2>
     
     <z:permission2 value="pms:alertcomentwh:view">
     <li><img src="images/ico06.png" /><p><a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="focus"  data-html="true"  data-title="提示信息配置"
     data-content="你可点击左边导航键进行数据操作：<br/><br/>（1）（弹窗内容）贷款利率说明<br/><br/>（2）（弹窗内容）本期罚息说明">提示信息配置</a></p></li> 
     </z:permission2>
    <z:permission2 value="pms:verifywh:view,pms:notoverifywh:view"> 
    <li><img src="images/ico02.png" /><p><a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="focus"  data-html="true"  data-title="登录注册"
     data-content="您可点击左侧导航键进行：<br/><br/>（1）配置校验规则<br/><br/>（2）查看未通过校验的数据" >登录注册</a></p></li>
     </z:permission2>
      <z:permission2 value="pms:transactionpz:view"> 
    <li><img src="images/ico05.png" /><p><a href="javascript:void(0);" data-toggle="popover" data-placement="bottom" data-trigger="focus"  data-html="true"  data-title="交易通知"
     data-content="您可点击左侧导航键进行：<br/><br/>（1）交易通知规则配置 " >交易通知</a></p></li>
     </z:permission2>
    
    
           
    </ul>
    
   <!--  <div class="ibox"><a href="admin_toAddAdmin" class="ibtn"><img src="images/iadd.png" />添加新的管理员</a></div> -->
     
    
    
    
    <div class="xline"></div>
    <div class="box"></div>
    
   
    
    <div class="xline"></div>
    
    </div>
    
</body>
</html>

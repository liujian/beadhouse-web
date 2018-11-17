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
    <title>交易通知</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">

</style>
     <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script> 
    <script src="js/cpsd.js" type="text/javascript"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<script type="text/javascript">
$(document).ready(function(){
	 

  

});

	$(document).ready(function(){
	    
	});
	function query(){
		   $("#searchForm").attr(
					"action",
					"<%=basePath%>/Transaction/transactiontoList");
			loading('正在查询，请稍等...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/Transaction/transactiontoaddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>交易通知</li>
    <li>交易通知配置</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/MessageCenter/messageSysList" method="post">
	        <ul class="seachform">
		     <li><label>标题</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>&nbsp;</label>
		     <z:permission value="pms:transactionpz:view">
		     <input type="button" class="scbtn" onclick="query()" value="查询"/>
		     </z:permission>
		     </li>
		      <li><label>&nbsp;</label>
		       <z:permission value="pms:transactionpz:view">
		      <input type="button" class="scbtn" onclick="empty()" value="清空"/>
		       </z:permission>
		     </li>
		     
		   <%--   
	         <li><label>&nbsp;</label>
	          <z:permission value="pms:transactionpz:add">
	         <input type="button" class="scbtn" onclick="addsave()" value="新增"/>
	          </z:permission>
	         </li> --%>
		 
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    
	    <th width="100px;">序号</th>
	   
	    <th>标题</th>
	     <th>名称</th>
	    <th>消息中心术语</th>
	    <th>推送消息术语</th>
	    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd" style="width:5%;">${sta.index+1}</td>
		      <td style="width:11%;">${obj.title}</td>
		     <td style="width:10%;">${obj.name}</td>
		    <td style="width:34%;">${obj.message}</td>
		    <td style="width:34%;">${obj.pushmessage}</td>
	    	<td style="width:6%;">
	    	 <z:permission value="pms:transactionpz:edit">
			   	<a href="javascript:void(0)" onclick="contentEditer(${obj.id});" class="tablelink">编辑</a>
			 </z:permission>   	
			  	
		    </td>
	    </tr>
    </c:forEach>
    
    </tbody>
    
    </table>
    
    <div class="pagin">
     
    	<div class="message">
    	 <%@include file="pagenation.jsp" %>   
    	</div>
     
    </div>
    
    
    </div>
    
	<script type="text/javascript">
	function empty(){
		$("#keywords").val("");
	}
	function contentEditer(id){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>/Transaction/transactiontoupdatepage?id="+id+"&keywords="+keywords+"";
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/Transaction/transactiontoList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

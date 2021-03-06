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
    <title>登录注册配置</title>
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
 
	function query(){

		   $("#searchForm").attr(
					"action",
					"<%=basePath%>/logonregister/logonVerifyRuleList");
			loading('正在查询，请稍等...');
           $("#searchForm").submit();
	}
	/* function addsave(){
		window.location.href="<%=basePath%>/MessageCenter/messageSysaddpage";
	} */
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>登录注册</li>
    <li>配置校验规则</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/MessageCenter/messageSysList" method="post">
	        <ul class="seachform">
		     <li><label>名称</label><input name="keywords" id="keywords" type="text" value="${keywords}"   class="scinput" /></li>
		     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="query()" value="查询"/></li>
	      <!--    <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="addsave()" value="新增"/></li> -->
		 <li><label>&nbsp;</label>
		      <input type="button" class="scbtn" onclick="empty()" value="清空"/>
		     </li>
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    
	    <th width="100px;">序号</th>
	    <th>名称</th>
	    <th>个数</th>
	    <th>是否启用</th>
	    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd">${sta.index+1}</td>
		    <td style="width:20%;">${obj.name}</td>
		    <td >${obj.times}</td>
		        <td> 
		         <c:if test="${obj.isinuse eq 1 }"> 是</c:if>  
		         <c:if test="${obj.isinuse eq 0 }"> 否</c:if>  
		        </td>
		        
	    	<td>
	    	   <z:permission value="pms:verifywh:edit">
			   	<a href="javascript:void(0)" onclick="contentEditer('${obj.id}');" class="tablelink">编辑</a>
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
	function contentEditer(code){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>/logonregister/logonVerifyRuleupdatepage?id="+code+"&keywords="+keywords+"";
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/logonregister/logonVerifyRuleList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

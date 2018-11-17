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
    <title>消息中心</title>
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
					"<%=basePath%>/MessageCenter/messageSDList");
			loading('正在查询，请稍等...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/MessageCenter/messageaddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>消息中心</li>
    <li>时贷活动内容推送</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/MessageCenter/messageSDList" method="post">
	        <ul class="seachform">
		     <li><label>标题</label>
		     
		     <input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" />
		     
		     </li>
		     <li><label>&nbsp;</label>
		     <z:permission value="pms:messageloanwh:view">
		     <input type="button" class="scbtn" onclick="query()" value="查询"/>
		     </z:permission>
		     
		     </li>
		     
		      <li><label>&nbsp;</label>
		       <z:permission value="pms:questionanswh:view">
		      <input type="button" class="scbtn" onclick="empty()" value="清空"/>
		       </z:permission>
		     </li>
		     
		     
	         <li><label>&nbsp;</label>
	          <z:permission value="pms:messageloanwh:add">
	         <input type="button" class="scbtn" onclick="addsave()" value="新增"/>
	          </z:permission>
	         </li>
		 <!--     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="dodelete()" value="批量删除"/></li> -->
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    
	    <th width="100px;">序号</th>
	    <th>标题</th>
	    <th>创建时间</th>
	    <th>内容</th>
	    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd">${sta.index+1}</td>
		    <td>${obj.title}</td>
		    <td>${obj.time}</td>
		    <td style="width:40%;">${obj.info}</td>
	    	<td>
	    	   <%-- <z:permission value="pms:messageloanwh:edit">
			   	<a href="javascript:void(0)" onclick="contentEditer(${obj.id});" class="tablelink">编辑</a>
			   </z:permission>  --%>
			     <z:permission value="pms:messageloanwh:delete">
<%-- 			    <a href="<%=basePath%>/MessageCenter/deleteMessageSD?id=${obj.id}&currentpage=${pagenation.currentpage}&rowCount=${pagenation.rowCount}" class="tablelink"> 删除</a>--%>		        
                  <a href="javascript:void(0)" onclick="deletemessage(${obj.id},${pagenation.currentpage},${pagenation.rowCount});" class="tablelink"> 删除</a> 
                  
 
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
	function deletemessage(id,currentpage,rowCount){
		 $.jBox.confirm("确定删除该吗？", "删除提示", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>/MessageCenter/deleteMessageSD?id="+id+"&currentpage="+currentpage+"&rowCount="+rowCount,
	   		            success:function(result){
		   		        	$.jBox.confirm("删除成功!","提示",function(v){	   		        	 
		   		        		query(); 
		   		        	});    
	   		         } 
	   		      });
	         }
	         return true;                                  
	     });
	}
	function empty(){
		$("#keywords").val("");
	}
	function contentEditer(id){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>/MessageCenter/updatemessageSDpage?id="+id+"&keywords="+keywords+"";
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/MessageCenter/messageSDList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

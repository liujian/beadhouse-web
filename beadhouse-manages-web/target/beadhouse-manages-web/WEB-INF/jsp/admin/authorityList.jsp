<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>系统管理</title>
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
					"<%=basePath%>/Author/authorityList");
			loading('正在查询，请稍等...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/Author/authorityAddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>系统管理</li>
    <li>权限管理</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="Author/authorityList" method="post">
	        <ul class="seachform">
		     <li><label>权限名称</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="query()" value="查询"/></li>
	         <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="addsave()" value="新增"/></li>
		 <!--     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="dodelete()" value="批量删除"/></li> -->
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    
	    <th width="100px;">序号</th>
	    <th>权限名称</th>
	     <th>权限</th>
	    <th>描述</th>
	    
	    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd">${sta.index+1}</td>
		    <td>${obj.actionname}</td>
		     <td>${obj.action}</td>
		    <td style="width:40%;">${obj.remark}</td>
		
		  
	    	<td>
			   	
			   	<a href="javascript:void(0)" onclick="contentEditer(${obj.id});" class="tablelink">编辑</a>
			  <%--   <a href="<%=basePath%>/Author/authorityDelete?id=${obj.id}&currentpage=${pagenation.currentpage}&rowCount=${pagenation.rowCount}" class="tablelink"> 删除</a> --%>
		   <a href="javascript:void(0)" onclick="deleteauthority(${obj.id},${pagenation.currentpage},${pagenation.rowCount});"  class="tablelink"> 删除</a> 
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
	function deleteauthority(id,currentpage,rowCount){
		 $.jBox.confirm("确定删除该权限吗？(删除权限后,与此权限的关联信息也会一并删除)", "删除提示", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>/Author/authorityDelete?id="+id+"&currentpage="+currentpage+"&rowCount="+rowCount,
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
	
	function contentEditer(id){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>/Author/authorityUpdatepage?id="+id+"&keywords="+keywords+"";
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/Author/authorityList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

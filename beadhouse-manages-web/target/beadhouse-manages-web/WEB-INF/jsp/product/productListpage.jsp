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
    <title>产品介绍</title>
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
					"<%=basePath%>/product/introductionList");
			loading('正在查询，请稍等...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/product/productaddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>产品介绍</li>
    <li>产品介绍配置</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/product/introductionList" method="post">
	        <ul class="seachform">
		     <li><label>产品代码</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>&nbsp;</label>
		     <z:permission value="pms:productpz:view">
		     <input type="button" class="scbtn" onclick="query()" value="查询"/>
		     </z:permission>
		     </li>
		      <li><label>&nbsp;</label>
		       <z:permission value="pms:productpz:view">
		      <input type="button" class="scbtn" onclick="empty()" value="清空"/>
		       </z:permission>
		     </li>
		     
		     
		     
	         <li><label>&nbsp;</label>
	          <z:permission value="pms:productpz:add">
	         <input type="button" class="scbtn" onclick="addsave()" value="新增"/>
	          </z:permission>
	         </li> 
		 
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    
	    <th width="100px;">序号</th>
	   
	    <th>产品代码</th>
	    <th>产品名称</th>
	    <th>产品介绍</th>
	    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${Introductionlist}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd" style="width:5%;">${sta.index+1}</td>
		      <td style="width:11%;">${obj.productid}</td>
		     <td style="width:10%;">${obj.productname}</td>
		    <td style="width:34%;">${obj.introduct}</td>
	    	<td style="width:6%;">
	    	 <z:permission value="pms:transactionpz:edit">
			   	<a href="javascript:void(0)" onclick="contentEditer('${obj.productid}');" class="tablelink">编辑</a>
			   	<a href="javascript:void(0)" onclick="deletemessage('${obj.productid}',${pagenation.currentpage},${pagenation.rowCount});" class="tablelink"> 删除</a> 
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
	function contentEditer(productid){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
		debugger;
 		 window.location.href="<%=basePath%>/product/productupdatepage?productid="+productid+"&keywords="+keywords+"";
	}
	
	function deletemessage(productid,currentpage,rowCount){
		 $.jBox.confirm("确定删除吗？", "删除提示", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>/product/deleteProduct?productid="+productid+"&currentpage="+currentpage+"&rowCount="+rowCount,
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
	
	
	
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/product/introductionList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

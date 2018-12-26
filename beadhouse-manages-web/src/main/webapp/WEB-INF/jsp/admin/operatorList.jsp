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
    <title>Operators</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">
table th{white-space: nowrap;}
table td{white-space: nowrap;}
body,table{font-size:12px;}
table{empty-cells:show; border-collapse: collapse; margin:0 auto;}
h1,h2,h3{ font-size:12px;margin:0; padding:0;}
table.imgtable{border:1px solid #cad9ea;color:#666;}
table.imgtable th {background-repeat:repeat-x;height:30px;}
table.imgtable td,table.imgtable th{border:1px solid #cad9ea;padding:0 1em 0;}
table.imgtable tr{background-color:#f5fafe;height:30px;}
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
					"<%=basePath%>/Author/operatorList");
			loading('Enquiries, please wait...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/Author/operatorAddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>location：</span>
    <ul class="placeul">
    <li>System Management</li>
    <li>Operators</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="" method="post">
	        <ul class="seachform">
		     <li><label>name</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="query()" value="Search"/></li>
	         <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="addsave()" value="New"/></li>
 	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    <th width="100px;">Serial#</th>
	    <th>Operator Login Name</th>
	    <th>Name</th>
	    <th>Role Name</th>
	    <th>Type</th>
	    <th>Action</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		    <td class="imgtd">${sta.index+1}</td>
		    <td>${obj.loginname}</td>
		    <td>${obj.realname}</td>
		    <td>${obj.rolename}</td>
		    <td>
		    	<c:if test="${obj.type eq 0 }" >Ordinary operator</c:if>
		    	<c:if test="${obj.type eq 1 }" >Super administrator</c:if>
		    </td>
		     
	    	<td>
			   	
			   	<a href="javascript:void(0)" onclick="contentEditer(${obj.id},${obj.roleid});" class="tablelink">Edit</a>
		        <a href="javascript:void(0)" onclick="deleteoperator(${obj.id},${pagenation.currentpage},${pagenation.rowCount});" class="tablelink"> Delete</a>
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
	function deleteoperator(id,currentpage,rowCount){
		 $.jBox.confirm("Do you want to delete this account?", " Delete the prompt.", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>/Author/operatorDelete?id="+id+"&currentpage="+currentpage+"&rowCount="+rowCount,
	   		            success:function(result){
		   		        	$.jBox.confirm("Deleted successfully!","Tips",function(v){	   		        	 
		   		        		query(); 
		   		        	});    
	   		         } 
	   		      });
	         }
	         return true;                                  
	     });
	}
	function contentEditer(id,roleid){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>/Author/operatorUpdatepage?id="+id+"&keywords="+keywords+"&roleid="+roleid+"";
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/Author/operatorList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
</script>
    
</body>
</html>

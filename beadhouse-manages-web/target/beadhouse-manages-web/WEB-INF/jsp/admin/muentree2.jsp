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
    <title>菜单维护</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>  
	
     <link href="<%=basePath%>css/zTreeStyle.css" rel="stylesheet" type="text/css" />
	 <link href="<%=basePath%>css/bootstrap-custom.css" rel="stylesheet" type="text/css" />
	 <link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="<%=basePath%>js/jquery-1.4.2.js"></script>
     <script type="text/javascript" src="<%=basePath%>js/jquery.ztree-2.6.js"></script>
     
      
  <SCRIPT LANGUAGE="JavaScript">
 
	var zTree1;
	var setting;
		setting = {
			//editable: true,
			checkable: true,	
			callback:{
				change: zTreeChange,
			 
			}
			
		};

	$(document).ready(function(){
		refreshTree();
	});



 
	function zTreeChange(event, treeId, treeNode) {
		//alert(""); 
		nodes = zTree1.getCheckedNodes(true);
		//alert(nodes);
		//alert(treeNode.ename);
        
	/* 	$("#onChangeNode").html( "[" + getTime() + "]  treeId=" + treeId + ";<br/>&nbsp;tId=" + treeNode.tId + "; Name=" + treeNode.name
				 + "; <br/>checked=" + treeNode.checked+ "; checkedOld=" + treeNode.checkedOld); */
	}	
    
 function refreshTree() {
      
     var zNodes=${data};
	 zTree1 = $("#treeDemo").zTree(setting, zNodes);
      var  user =JSON.parse('${user3}'); 
     	$.each(user, function( n, value){
     		var nodes = zTree1.getNodesByParam("ename",value.id, null);
     		nodes[0].checked = true;
     		zTree1.updateNode(nodes[0]);
     		var nodes2 = zTree1.getNodesByParam("menuid",value.menuid, null);
     		nodes2[0].checked = true;
     		zTree1.updateNode(nodes2[0]);
    	});	 
    	 
  
       
	}
 
  </SCRIPT>
 </HEAD>

<BODY>
<center class="headTitle">
<TABLE border=0 width="700" class="tb1">
	<TR>
		<TD width=340px align=center valign=top>
		<div class="zTreeDemoBackground">
			<ul id="treeDemo" class="tree"></ul>
		</div>		
		</TD>
		<TD width=360px align=left valign=top>
		<div class="demoContent">
 
				
		</div>	
		</TD>
	</TR>
</TABLE>
</center>
 </BODY>
</HTML>

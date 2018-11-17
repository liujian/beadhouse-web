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
    <title>图片预览</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>  
     <style type="text/css">
      *{margin: 0;padding: 0;}
     .sty { 
      
        width:466;
        height:290;
        display: table-cell;
        vertical-align: middle;
        text-align: center;
    
      }  
     </style>
      
  <SCRIPT LANGUAGE="JavaScript">
  $(function(){
	  findimg();
  });
	function findimg(){
		var name2= encodeURI(encodeURI("${name}"));
        $("#imgDiv").html('<img src="<%=basePath%>/pic/readImg?prizeid='+name2+'"/>');
        $("#imgDiv").show();
	}    
 
  </SCRIPT>
 </HEAD>

   <BODY>
        <div id="imgDiv" class="sty"></div>
   </BODY>
</HTML>

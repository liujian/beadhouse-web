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
    <title>Logo</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>  
     <style type="text/css">
      *{margin: 0;padding: 0;}
     
      .box{  
		    width: 50%;  
		    margin: 50px auto;  
		}  
		.img-box{  
		    width: 100%;  
		    position:relative;  
		    z-index:1;  
		}  
		.img-box img{  
		    width:100%;  
		    margin:auto;  
		    border: solid 1px #4888eb; 
		}  
		.img-box:before {  
		    content: "";  
		    display: inline-block;  
		    width: 0.1px;  
		    vertical-align: middle;  
		}    
     </style>
      
  <SCRIPT LANGUAGE="JavaScript">
  $(function(){
	  var id='<%=request.getAttribute("id")%>';  
	  findimg(id);
  });
	function findimg(id){
        $(".img-box").html('<img src="<%=basePath%>/background/readImg?id='+id+' "/>');
        $(".img-box").show();
	}    
 
  </SCRIPT>
 </HEAD>

   <BODY>
   	<div class="box">  
	    <div class="img-box">  
	        
	    </div>  
	</div>  
   </BODY>
</HTML>

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
    <title>Elder's Accounts</title>
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
					"<%=basePath%>/OrderUser/OrderUserList");
			loading('Enquiries, please wait a moment...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/OrderUser/orderuserAddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>Location:</span>
    <ul class="placeul">
    <li>Elder's Accounts</li>
    <li>Elder’s Account Configuration</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/OrderUser/OrderUserList" method="post">
	        <ul class="seachform">
		     <li><label>Elder's Accounts</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>&nbsp;</label>
		     <input type="button" class="scbtn" onclick="query()" value="Search"/>
		     </li>
		      <li><label>&nbsp;</label>
		      <input type="button" class="scbtn" onclick="empty()" value="Reset"/>
		     </li>
		    
	         <li><label>&nbsp;</label>
	         <input type="button" class="scbtn" onclick="addsave()" value="New"/>
	         </li> 
		 
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
     <tr>
	    <th width="80px;">Serial#</th>
	    <th style="width:200px;">Elder's Account</th>
	    <th style="width:200px;">Elder's First Name</th>
	    <th style="width:200px;">Elder's Last Name</th>
	    <th style="width:200px;">Elder's Birthday</th>
	    <th style="width:200px;">Elder's Phone</th>
	    <th style="width:200px;">Elder's Explain</th>
	    <th style="width:200px;">Action</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${Elderlist}" var="obj" varStatus="sta">
	   <tr>
		    <td class="imgtd" style="width:5%;">${sta.index+1}</td>
		    <td style="width:200px;">${obj.elderUserEmail}</td>
		    <td style="width:200px;">${obj.elderFirstName}</td>
		    <td style="width:200px;">${obj.elderLastName}</td>
		    <td style="width:200px;">${obj.elderBirthday}</td>
		    <td style="width:200px;">${obj.elderUserphone}</td>
		    <td style="width:200px;">${obj.elderUserOther}</td>
		     <td style="width:200px;">
		       <a href="javascript:void(0)" onclick="contentEditer('${obj.elderUserEmail}');" class="tablelink">Edit</a>
			   <a href="javascript:void(0)" onclick="deletemessage('${obj.elderUserEmail}',${pagenation.currentpage},${pagenation.rowCount});" class="tablelink"> Delete</a> 	
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
	function contentEditer(elderUserEmail){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>OrderUser/orderuserupdatepage?elderUserEmail="+elderUserEmail+"&keywords="+keywords+"";
	}
	
	function deletemessage(elderUserEmail,currentpage,rowCount){
		 $.jBox.confirm("Do you want to delete it?？", "Delete prompt", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>OrderUser/deleteorderuser?elderUserEmail="+elderUserEmail+"&currentpage="+currentpage+"&rowCount="+rowCount,
	   		            success:function(result){
		   		        	$.jBox.confirm("Delete success!","Tips",function(v){	   		        	 
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
		$("#pagenation").attr("action","<%=basePath%>/OrderUser/OrderUserList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

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
    <title>List of Activity</title>
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
    <script src="<%=basePath%>js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	
	function addsave(scheduleId){
		window.location.href="<%=basePath%>/activity/activityAddpage?scheduleId="+scheduleId+"";
	}
	
	 function goback(){ 
			
		 window.location.href="<%=basePath%>/activity/scheduleList";
	 }
	 
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>Location:</span>
    <ul class="placeul">
    <li>List of Activities</li>
    <li>Activity Configuration</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/activity/activityList" method="post">
	        <ul class="seachform">
	         <li><label>&nbsp;</label>
	         <input type="button" class="scbtn" onclick="addsave('${scheduleId}')" value="New"/>
	          &nbsp;&nbsp; 
	          <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="Return"/>  
	         </li> 
	         
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    <th width="100px;">Serial#</th>
	    <th>Activity</th>
	    <th>Action</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${activityList}" var="obj" varStatus="sta">
	    <tr>
		    <td class="imgtd" >${sta.index+1}</td>
		    <td>${obj.activity}</td>
	    	<td >
			   	<a href="javascript:void(0)" onclick="contentEditer('${obj.activityId}');" class="tablelink">Edit</a>
			   	<a href="javascript:void(0)" onclick="deletemessage('${obj.activityId}','${obj.scheduleId}',${pagenation.currentpage},${pagenation.rowCount});" class="tablelink">Delete</a> 	
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

	function contentEditer(activityId){
 		 window.location.href="<%=basePath%>activity/activityupdatepage?activityId="+activityId+"";
	}
	
	function query(scheduleId){
		   $("#searchForm").attr(
					"action",
					"<%=basePath%>/activity/activityList?scheduleId="+scheduleId+"");
			loading('Enquiries, please wait a moment...');
        $("#searchForm").submit();
	}
	
	function deletemessage(activityId,scheduleId,currentpage,rowCount){
		 $.jBox.confirm("Are you sure you want to delete it?", "Delete prompt", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>activity/deleteactivity?activityId="+activityId+"&scheduleId="+scheduleId+"&currentpage="+currentpage+"&rowCount="+rowCount,
	   		            success:function(result){
		   		        	$.jBox.confirm("Delete success!","Tips",function(v){	   		        	 
		   		        		query(scheduleId); 
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
		$("#pagenation").attr("action","<%=basePath%>/activity/scheduleList?date="+date+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

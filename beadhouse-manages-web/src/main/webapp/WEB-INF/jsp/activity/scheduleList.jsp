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
    <title>List of Schedule</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">

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
	function query(){
		   $("#searchForm").attr(
					"action",
					"<%=basePath%>/activity/scheduleList");
			loading('Enquiries, please wait a moment...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/activity/scheduleAddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>Location:</span>
    <ul class="placeul">
    <li>List of Schedules</li>
    <li>Schedule Configuration</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/activity/scheduleList" method="post">
	        <ul class="seachform">
		     <li><label>日期</label>  
        	 <input type="text"  placeholder="请选择查询日期"  id="date" name="date" value="${date}"  class="scinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,isShowClear:true})" />
  	         </li>
		    
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
	    <th width="100px;">serial#</th>
	    <th>date</th>
	    <th>breakfast</th>
	    <th>lunch</th>
	    <th>dinner</th>
	    <th>Action</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${scheduleList}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd" >${sta.index+1}</td>
		    <td ><fmt:formatDate value="${obj.date}" pattern="yyyy-MM-dd" /></td>
		    <td>${obj.breakfast}</td>
		    <td>${obj.lunch}</td>
		    <td>${obj.dinner}</td>
	    	<td >
			   	<a href="javascript:void(0)" onclick="contentEditer('${obj.scheduleId}');" class="tablelink">Edit</a>
			   	<a href="javascript:void(0)" onclick="deletemessage('${obj.scheduleId}',${pagenation.currentpage},${pagenation.rowCount});" class="tablelink">Delete</a> 	
		    	<a href="javascript:void(0)" onclick="Activity('${obj.scheduleId}');" class="tablelink">Activity</a> 	
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
		$("#date").val("");
	}
	function contentEditer(scheduleId){
		var data1= encodeURI(encodeURI($("#date").val()));
	
 		 window.location.href="<%=basePath%>activity/scheduleupdatepage?scheduleId="+scheduleId+"&date="+data1+"";
	}
	
	function Activity(scheduleId){	
 		 window.location.href="<%=basePath%>activity/activityList?scheduleId="+scheduleId+"";
	}
	
	function deletemessage(scheduleId,currentpage,rowCount){
		 $.jBox.confirm("Are you sure you want to delete it?", "Delete prompt", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>activity/deleteschedule?scheduleId="+scheduleId+"&currentpage="+currentpage+"&rowCount="+rowCount,
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
		$("#pagenation").attr("action","<%=basePath%>/activity/scheduleList?date="+date+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
  <head>
    <link href="<%=basePath%>/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
	<script language="JavaScript" src="<%=basePath%>js/jquery.js"></script>
	 
	<script type="text/javascript" src="<%=basePath%>js/common.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="<%=basePath%>/js/kindeditor-4.1.10/lang/zh_CN.js"></script>

    <link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
	<script src="<%=basePath%>js/cpsd.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<script type="text/javascript">
	$(function(){
		if(!isEmpty("${obj.activityId}")){
			document.getElementById("activityId").disabled=true;
			
		 }
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("activity").value;
        if(isEmpty(p1)){    
           alertx("The Activity can not be empty.", 'Tips'); 
            return ;
        } 
        
             
          savemess();   
     }
	 function savemess(){
 
     	     if("${obj.activityId}"==null||"${obj.activityId}"==""){
     		    $("#itemAddForm").attr("action","<%=basePath%>activity/activityadd");
     		     loading('Just a moment, please...');
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 
	     		
	     	   $("#itemAddForm").attr("action","<%=basePath%>activity/activityupdate");
	     		 loading('Just a moment, please...');
		        $("#itemAddForm").submit();
		    
	     	} 

     	     
	   }
	 function goback(scheduleId){ 
		
		 window.location.href="<%=basePath%>/activity/activityList?scheduleId="+scheduleId+"";
	 }
	 
	</script>

<body>

	<div class="place">
    <span>Location：</span>
    <ul class="placeul">
    <li>Activity Configuration</li>
   <c:if test="${obj.scheduleId==null}"> 
    <li>New Activity Configuration</li>
    </c:if>
     <c:if test="${obj.scheduleId!=null}"> 
      <li>Activity Configuration Editor</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.scheduleId==null}"> 
          <span>Activity Configuration</span>
         </c:if>
        <c:if test="${obj.scheduleId!=null}"> 
          <span>Activity Configuration Editor</span>
         </c:if>
    </div>
    <form action="activity /activityadd" method="post" id="itemAddForm">
	    <ul class="forminfo">
              <li style="display:none"><label><font color="#f00"></font>activityId</label>
	    	<input name="activityId" id=activityId type="text" class="dfinput" value="${obj.activityId}" />
	    	 </li>
             
	    	 <li>
	    		<label><font color="#f00">*</font>activity</label>
	    	<input name="activity" id="activity" type="text" class="dfinput" value="${obj.activity}" />
	    	 </li>

              <li style="display:none"><label><font color="#f00"></font>scheduleId</label>
	    	<input name="scheduleId" id=scheduleId type="text" class="dfinput" value="${obj.scheduleId}" />
	    	 </li>


	    	<li>
	    	  <label>&nbsp;</label>
	          <input name="activityId" id="activityId" type="hidden"  value="${obj.activityId}" /> 
	    	  <input  type="button" onclick="dataverify()" class="btn" value="Save"/>
	           &nbsp;&nbsp; 
	          <input type="button" onclick="goback('${obj.scheduleId}')" id="add" class="btn" class="dfinput"  value="Return"/>  
	        </li>
	    </ul>
    </form>
    </div>


</body>
</html>


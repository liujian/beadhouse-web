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
		if(!isEmpty("${obj.scheduleId}")){
			document.getElementById("scheduleId").disabled=true;
			
		 }
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("date").value;
        if(isEmpty(p1)){    
           alertx("The Date can not be empty.", 'Tips'); 
            return ;
        } 
        
        var p2 = document.getElementById("breakfast").value;
        if(isEmpty(p2)){    
           alertx("The Breakfast can not be empty.", 'Tips'); 
            return ;
        } 
        
        var p3 = document.getElementById("lunch").value;
        if(isEmpty(p3)){    
           alertx("The Lunch can not be empty.", 'Tips'); 
            return ;
        } 
        
        var p4 = document.getElementById("dinner").value;
        if(isEmpty(p4)){    
           alertx("The Dinner can not be empty.", 'Tips'); 
            return ;
        } 
               
          savemess();   
     }
	 function savemess(){
 
     	     if("${obj.scheduleId}"==null||"${obj.scheduleId}"==""){
     		    $("#itemAddForm").attr("action","<%=basePath%>activity/scheduleadd");
     		     loading('Just a moment, please...');
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 
	     		
	     	   $("#itemAddForm").attr("action","<%=basePath%>activity/scheduleupdate");
	     		 loading('Just a moment, please...');
		        $("#itemAddForm").submit();
		    
	     	} 

     	     
	   }
	 function goback(){ 
		
		 window.location.href="<%=basePath%>/activity/scheduleList";
	 }
	 
	</script>

<body>

	<div class="place">
    <span>Location：</span>
    <ul class="placeul">
    <li>Schedule Configuration</li>
   <c:if test="${obj.scheduleId==null}"> 
    <li>New Schedule Configuration</li>
    </c:if>
     <c:if test="${obj.scheduleId!=null}"> 
      <li>Schedule Configuration editor</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.scheduleId==null}"> 
          <span>Schedule Configuration</span>
         </c:if>
        <c:if test="${obj.scheduleId!=null}"> 
          <span>Schedule Configuration Editor</span>
         </c:if>
    </div>
    <form action="activity /scheduleadd" method="post" id="itemAddForm">
	    <ul class="forminfo">
              <li style="display:none"><label><font color="#f00"></font>scheduleId</label>
	    	<input name="scheduleId" id=scheduleId type="text" class="dfinput" value="${obj.scheduleId}" />
	    	 </li>
            
	        <li ><label><font color="#f00">*</font>Calendar</label>
	   		<input type="text"  placeholder="Select a date"  id="date" name="date" value="${obj.dateString}"  class="scinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,isShowClear:true})" />
	   		</li>
	    
	    	<li>
	    		<label><font color="#f00">*</font>Breakfast</label>
	    	<input name="breakfast" id="breakfast" type="text" class="dfinput" value="${obj.breakfast}" />
	    	 </li>
	    	 
	    	 <li>
	    		<label><font color="#f00">*</font>Lunch</label>
	    	<input name="lunch" id="lunch" type="text" class="dfinput" value="${obj.lunch}" />
	    	 </li>
	    	 
	    	 <li>
	    		<label><font color="#f00">*</font>Dinner</label>
	    	<input name="dinner" id="dinner" type="text" class="dfinput" value="${obj.dinner}" />
	    	 </li>

	    	<li>
	    	  <label>&nbsp;</label>
	          <input name="scheduleId" id="scheduleId" type="hidden"  value="${obj.scheduleId}" /> 
	    	  <input  type="button" onclick="dataverify()" class="btn" value="Save"/>
	           &nbsp;&nbsp; 
	          <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="Return"/>  
	        </li>
	    </ul>
    </form>
    </div>


</body>
</html>


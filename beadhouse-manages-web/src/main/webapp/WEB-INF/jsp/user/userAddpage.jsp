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
		if(!isEmpty("${obj.emailAddress}")){
			document.getElementById("emailAddress").disabled=true;
			
		 }
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("emailAddress").value;
        if(isEmpty(p1)){    
           alertx("The User's account can not be empty.", 'Tips'); 
            return ;
        } 
        var p2 = document.getElementById("password").value;
        if(isEmpty(p2)){    
           alertx("The User's Password cannot be empty.", 'Tips'); 
            return ;
        } 
        
        var p3 = $("#firstName").val();
        if(isEmpty(p3)){
        	alertx("The User's First Name cannot be empty.", 'Tips');
              return ;
        } 
        var p4 = $("#lastName").val();
        if(isEmpty(p4)){
        	alertx("The User's Last Name cannot be empty.", 'Tips');
              return ;
        } 
        
        var p6 = $("#birthday").val();
        if(isEmpty(p6)){
        	alertx("The User's Birthday can not be empty.", 'Tips');
              return ;
        } 
        
        var p7 = $("#phone").val();
        if(isEmpty(p7)){
        	alertx("The User's Phone can not be empty.", 'Tips');
              return ;
        } 
        
        
        var p5 = $("#emailAddress").val();
        if(isEmpty("${obj.emailAddress}")){
            //数据重复校验
                $.ajax({
                       url:"<%=basePath%>/user/usertouinque",
                       dataType:"json",
                        data:{
                        	emailAddress:p5
                        },
                       type:"post",
                       success:function(data){
                         if(data.msg=="1"){
                      	   savemess();
                         }else{
                      	   alertx(data.msg, 'Tips');
                      	   return;
                         }
                        }
                 }); 
            }else{ 
            	savemess();
            }
     }
	 function savemess(){
 
     	     if("${obj.id}"==null||"${obj.id}"==""){
     		    $("#itemAddForm").attr("action","<%=basePath%>/user/useradd");
     		     loading('Please wait a moment while saving...');
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	     	   $("#itemAddForm").attr("action","<%=basePath%>/user/userupdate?keywords="+keywords+"");
	     		 loading('Please wait a moment while saving...');
		        $("#itemAddForm").submit();
		    
	     	} 

     	     
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/user/userList?keywords="+keywords+"";
	 }
	 
 
	</script>

<body>

	<div class="place">
    <span>Location:</span>
    <ul class="placeul">
    <li>User's Configuration</li>
   <c:if test="${obj.id==null}"> 
    <li>New User's Account Configuration</li>
    </c:if>
     <c:if test="${obj.id!=null}"> 
      <li>User's Account Configuration</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.id==null}"> 
          <span>New User's Account Configuration</span>
         </c:if>
        <c:if test="${obj.id!=null}"> 
          <span>User's Account Configuration</span>
         </c:if>
    </div>
    <form action="user/useradd" method="post" id="itemAddForm">
	    <ul class="forminfo">
	        <li><label style="width:120px;"><font color="#f00">*</font>User's Account</label>
	        <input name="emailAddress" id="emailAddress" type="text" class="dfinput"  placeholder="Please enter" value="${obj.emailAddress}" />
	   		</li>
	    
	    	<li>
	    		<label style="width:120px;"><font color="#f00">*</font>Login Password</label>
	    	<input name="password" id="password" type="text" class="dfinput"  placeholder="Please enter" value="${obj.password}" />
	    		
	    	 </li>
	    	<li>
	    		<label style="width:120px;"><font color="#f00">*</font>User's First Name</label>
	    		<input name="firstName" id="firstName" type="text" class="dfinput"  placeholder="Please enter" value="${obj.firstName}" />
	    	 </li>
	    	 <li>
	    		<label style="width:120px;"><font color="#f00">*</font>User's Last Name</label>
	    		<input name="lastName" id="lastName" type="text" class="dfinput" placeholder="Please enter" value="${obj.lastName}" />
	    		
	    	 </li>
	    	 <li>
	    		<label style="width:120px;"><font color="#f00">*</font>User's Birthday</label>
<%-- 	    	  <input name="birthday" id="birthday" type="text" class="dfinput"  placeholder="Please enter" value="${obj.birthday}" />
 --%>	    	<input type="text"  placeholder="Please Select The Date"  id="birthday" name="birthday" value="${obj.birthday}"  class="scinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,isShowClear:true})" />
	    	 </li>
	    	  <li>
	    		<label style="width:120px;"><font color="#f00">*</font>Elder's Phone</label>
	    		<input name="phone" id="phone" type="text" class="dfinput" placeholder="Please enter" value="${obj.phone}" />
	    		
	    	 </li>
	 
	    	
	    	<li>
	    	  <label>&nbsp;</label>
	          <input name="id" id="id" type="hidden"  value="${obj.id}" /> 
	    	  <input  type="button" onclick="dataverify()" class="btn" value="Save"/>
	           &nbsp;&nbsp; 
	          <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="Return"/>  
	        </li>
	    </ul>
    </form>
    </div>


</body>
</html>


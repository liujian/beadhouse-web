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
		if(!isEmpty("${obj.elderUserEmail}")){
			document.getElementById("elderUserEmail").disabled=true;
			
		 }
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("elderUserEmail").value;
        if(isEmpty(p1)){    
           alertx("The Elder's account cannot be empty.", 'Tips'); 
            return ;
        } 
        var p2 = document.getElementById("elderUserPassword").value;
        if(isEmpty(p2)){    
           alertx("The Elder's Password can not be empty.", 'Tips'); 
            return ;
        } 
        
        var p3 = $("#elderfirstName").val();
        if(isEmpty(p3)){
        	alertx("The Elder's First Name can not be empty.", 'Tips');
              return ;
        } 
        var p4 = $("#elderlastName").val();
        if(isEmpty(p4)){
        	alertx("The Elder's Last Name can not be empty.", 'Tips');
              return ;
        } 
        
        var p6 = $("#elderbirthday").val();
        if(isEmpty(p6)){
        	alertx("The Elder's Birthday can not be empty.", 'Tips');
              return ;
        } 
        
        var p7 = $("#elderUserphone").val();
        if(isEmpty(p7)){
        	alertx("The Elder's Phone can not be empty.", 'Tips');
              return ;
        } 
        
        
        var p5 = $("#elderUserEmail").val();
        if(isEmpty("${obj.elderUserEmail}")){
            //数据重复校验
                $.ajax({
                       url:"<%=basePath%>/OrderUser/OrderUsertouinque",
                       dataType:"json",
                        data:{
                        	elderUserEmail:p5
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
 
     	     if("${obj.elderUserEmail}"==null||"${obj.elderUserEmail}"==""){
     		    $("#itemAddForm").attr("action","<%=basePath%>/OrderUser/OrderUseradd");
     		     loading('Please wait a moment while saving...');
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	     	   $("#itemAddForm").attr("action","<%=basePath%>/OrderUser/OrderUserupdate?keywords="+keywords+"");
	     		 loading('Please wait a moment while saving...');
		        $("#itemAddForm").submit();
		    
	     	} 

     	     
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/OrderUser/OrderUserList?keywords="+keywords+"";
	 }
	 
 
	</script>

<body>

	<div class="place">
    <span>Location:</span>
    <ul class="placeul">
    <li>Elderly's Configuration</li>
   <c:if test="${obj.elderUserEmail==null}"> 
    <li>New Elder's Account Configuration</li>
    </c:if>
     <c:if test="${obj.elderUserEmail!=null}"> 
      <li>Elder's Account Configuration</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.elderUserEmail==null}"> 
          <span>New Elder's Account Configuration</span>
         </c:if>
        <c:if test="${obj.elderUserEmail!=null}"> 
          <span>Elder's Account Configuration</span>
         </c:if>
    </div>
    <form action="OrderUser/OrderUseradd" method="post" id="itemAddForm">
	    <ul class="forminfo">
	        <li><label style="width:120px;"><font color="#f00">*</font>Elder's Account</label>
	        <input name="elderUserEmail" id="elderUserEmail" type="text" class="dfinput"  placeholder="Please enter" value="${obj.elderUserEmail}" />
	   		</li>
	    
	    	<li>
	    		<label style="width:120px;"><font color="#f00">*</font>Login Password</label>
	    	<input name="elderUserPassword" id="elderUserPassword" type="text" class="dfinput"  placeholder="Please enter" value="${obj.elderUserPassword}" />
	    		
	    	 </li>
	    	<li>
	    		<label style="width:120px;"><font color="#f00">*</font>Elder's First Name</label>
	    		<input name="elderfirstName" id="elderfirstName" type="text" class="dfinput"  placeholder="Please enter" value="${obj.elderFirstName}" />
	    	 </li>
	    	 <li>
	    		<label style="width:120px;"><font color="#f00">*</font>Elder's Last Name</label>
	    		<input name="elderlastName" id="elderlastName" type="text" class="dfinput" placeholder="Please enter" value="${obj.elderLastName}" />
	    		
	    	 </li>
	    	 <li>
	    		<label style="width:120px;"><font color="#f00">*</font>Elder's Birthday</label>
<%-- 	    	  <input name="elderbirthday" id="elderbirthday" type="text" class="dfinput"  placeholder="Please enter" value="${obj.elderBirthday}" />
 --%>	    		<input type="text"  placeholder="Please Select The Date"  id="elderbirthday" name="elderbirthday" value="${obj.elderBirthday}"  class="scinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,isShowClear:true})" />
	    	 </li>
	    	  <li>
	    		<label style="width:120px;"><font color="#f00">*</font>Elder's Phone</label>
	    		<input name="elderUserphone" id="elderUserphone" type="text" class="dfinput" placeholder="Please enter" value="${obj.elderUserphone}" />
	    		
	    	 </li>
	    	  <li>
	    		<label style="width:120px;"><font color="#f00"></font>Elder's Explain</label>
	    		 <textarea name="elderUserOther" id="elderUserOther" rows="" cols="" class="textinput" >${obj.elderUserOther}</textarea>
	    	 </li>
	    	
	    	<li>
	    	  <label>&nbsp;</label>
	          <input name="elderUserEmail" id="elderUserEmail" type="hidden"  value="${obj.elderUserEmail}" /> 
	    	  <input  type="button" onclick="dataverify()" class="btn" value="Save"/>
	           &nbsp;&nbsp; 
	          <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="Return"/>  
	        </li>
	    </ul>
    </form>
    </div>


</body>
</html>


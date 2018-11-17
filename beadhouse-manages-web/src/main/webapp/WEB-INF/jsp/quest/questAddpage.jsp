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
</head>
<script type="text/javascript">
	$(function(){
		if(!isEmpty("${obj.questid}")){
			document.getElementById("questid").disabled=true;
			
		 }
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("quest").value;
        if(isEmpty(p1)){    
           alertx("The Question can not be empty.", 'Tips'); 
            return ;
        } 
          savemess();   
     }
	 function savemess(){
 
     	     if("${obj.questid}"==null||"${obj.questid}"==""){
     		    $("#itemAddForm").attr("action","<%=basePath%>/Quest/Questadd");
     		     loading('Just a moment, please...');
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	     	   $("#itemAddForm").attr("action","<%=basePath%>/Quest/Questupdate?keywords="+keywords+"");
	     		 loading('Just a moment, please...');
		        $("#itemAddForm").submit();
		    
	     	} 

     	     
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/Quest/QuestList?keywords="+keywords+"";
	 }
	 
	</script>

<body>

	<div class="place">
    <span>Location：</span>
    <ul class="placeul">
    <li>Question Configuration</li>
   <c:if test="${obj.questid==null}"> 
    <li>New Question Configuration</li>
    </c:if>
     <c:if test="${obj.questid!=null}"> 
      <li>Question Configuration editor</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.questid==null}"> 
          <span>Question Configuration</span>
         </c:if>
        <c:if test="${obj.questid!=null}"> 
          <span>Question Configuration Editor</span>
         </c:if>
    </div>
    <form action="Quest/Questadd" method="post" id="itemAddForm">
	    <ul class="forminfo">
	         
	         <li style="display:none"><label><font color="#f00"></font>Question id</label>
	    	<input name="questid" id=questid type="text" class="dfinput" value="${obj.questid}" />
	    	 </li>
	        
	        <li><label><font color="#f00">*</font>Question</label>
	   		<textarea name="quest" id="quest" rows="" cols="" class="textinput" >${obj.quest}</textarea>
	   		</li>
	    
	    	<li>
	    		<label><font color="#f00"></font>Sort</label>
	    	<input name="sort" id="sort" type="text" class="dfinput" value="${obj.sort}" />
	    	 </li>

	    	<li>
	    	  <label>&nbsp;</label>
	          <input name="questid" id="questid" type="hidden"  value="${obj.questid}" /> 
	    	  <input  type="button" onclick="dataverify()" class="btn" value="Save"/>
	           &nbsp;&nbsp; 
	          <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="Return"/>  
	        </li>
	    </ul>
    </form>
    </div>


</body>
</html>


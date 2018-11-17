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
    <link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
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
		if(!isEmpty("${obj.id}")){
		 // $("#nodecode").disabled=true;
			document.getElementById("nodecode").disabled=true;
		 }
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("title").value;
        if(isEmpty(p1)){    
           alertx(" 标题 栏不能为空", '提示'); 
            return ;
        } 
    
         var p2 = $("#message").val();
        if(isEmpty(p2)){
        	alertx(" 消息中心术语 栏不能为空", '提示');
              return ;
        } 
        
        var p3 = $("#pushmessage").val();
        if(isEmpty(p3)){
        	alertx(" 推送消息术语 栏不能为空", '提示');
              return ;
        } 
        var p4 = $("#nodecode").val();
        if(isEmpty("${obj.id}")){
            //数据重复校验
                $.ajax({
                       url:"<%=basePath%>/Transaction/transactiontouinque",
                       dataType:"json",
                        data:{
                        	nodecode:p4 
                        },
                       type:"post",
                       success:function(data){
                         if(data.msg=="1"){
                      	   savemess();
                         }else{
                      	   alertx(data.msg, '提示');
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
     		    $("#itemAddForm").attr("action","<%=basePath%>/Transaction/transactiontoadd");
     		     loading('保存中，请稍等...');
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	    
	     	$("#itemAddForm").attr("action","<%=basePath%>/Transaction/transactiontoupdate?keywords="+keywords+"");
	     		 loading('保存中，请稍等...');
		        $("#itemAddForm").submit();
	     	} 
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/Transaction/transactiontoList?keywords="+keywords+"";
	 }
	 
 
	</script>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>交易通知管理</li>
   <c:if test="${obj.id==null}"> 
    <li>交易通知配置新增</li>
    </c:if>
     <c:if test="${obj.id!=null}"> 
      <li>交易通知配置编辑</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.id==null}"> 
          <span>交易通知配置新增</span>
         </c:if>
        <c:if test="${obj.id!=null}"> 
          <span>交易通知配置编辑</span>
         </c:if>
    </div>
    <form action="/HelpCenter/addAnswerandContent" method="post" id="itemAddForm">
	    <ul class="forminfo">
	        <li><label><font color="#f00">*</font>节点名称</label>
	   		  <select  id="nodecode" name="nodecode"    class="dfinput" style="width:10%;"  >
                   <c:forEach items="${list}" var="a">
                       <option value="${a.code }"  <c:if test="${obj.nodecode eq a.code }"> selected="selected"</c:if>  >${a.name } </option>
                   </c:forEach>
                 </select>
	   		
	   		</li>
	    
	    
	   		<li><label><font color="#f00">*</font>标题</label>
	   		<input name="title" id="title" type="text" class="dfinput" value="${obj.title}" /></li>
	    	<li>
	    		<label><font color="#f00">*</font>消息中心术语</label>
	    		  	<textarea name="message" id="message" rows="" cols="" class="textinput" >${obj.message}</textarea>
	    	 </li>
	    	 <li>
	    		<label><font color="#f00">*</font>推送消息术语</label>
	    		   <textarea   name="pushmessage"   id="pushmessage"  class="textinput"  >${obj.pushmessage}</textarea>
	    	 </li>
	    	
	    	<li><label>&nbsp;</label><input name="id" id="id" type="hidden"  value="${obj.id}" /> 
	    	 <input  type="button" onclick="dataverify()" class="btn" value="保存"/>
	        &nbsp;&nbsp; <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="返回"/>  </li>
	    </ul>
    </form>
    </div>


</body>
</html>

 
<script type="text/javascript">
 
</script>

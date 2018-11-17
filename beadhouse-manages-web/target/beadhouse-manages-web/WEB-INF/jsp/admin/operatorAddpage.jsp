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
    <title>操作员维护</title>
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>editor/kindeditor.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
	 <script src="<%=basePath%>js/cpsd.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){
		
	     if("${obj.id}"==""){
	    	    document.getElementById("loginname").value="";	
				document.getElementById("loginpwd").value="";	
			}else{
				document.getElementById("loginname").disabled=true;
			} 
		});
	
	function dataverify(){
	     var p1 = document.getElementById("loginname").value;
        if(isEmpty(p1)){    
           alertx(" 登录名 栏不能为空"); 
            return ;
        } 
         var p2 = $("#loginpwd").val();
        if(isEmpty(p2)){
        	alertx(" 密码 栏不能为空");
              return ;
        }
        var p3=$("#realname").val();
        if(isEmpty(p3)){
        	alertx(" 真实姓名 栏不能为空");
              return ;
        } 
      
        if(isEmpty("${obj.id}")){
        //数据重复校验
            $.ajax({
                   url:"<%=basePath%>/Author/Operatoraddverify",
                   dataType:"json",
                    data:{
                    	loginname:p1 
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
		  //  savemess();
     }
	 function savemess(){
		 	//var str=$("#selecttpye").val();
	     	//document.getElementById("type1").value=str;
     	    if("${obj.id}"==null||"${obj.id}"==""){
     		    $("#menuContent").attr("action","<%=basePath%>/Author/operatorAdd");
     		   loading('保存中，请稍等...');
         	    $("#menuContent").submit(); 
	     	}else{
	     		//var title= encodeURI(encodeURI($("#title").val()));
	     		 //var keywords= encodeURI(encodeURI("${keywords}"));
	     	//	$("#answerandContent").attr("action","/Author/muenadd?title="+title+"&keywords="+keywords+"");
	     	$("#menuContent").attr("action","<%=basePath%>/Author/operatorUpdate");
	     		 loading('保存中，请稍等...');
		        $("#menuContent").submit();
	     	} 
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/Author/operatorList?keywords="+keywords+"";
	 }
	</script>
	  
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>系统管理</li>
   <c:if test="${obj.id==null}"> 
    <li>新增操作员</li>
    </c:if>
     <c:if test="${obj.id!=null}"> 
      <li>编辑操作员</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.id==null}"> 
          <span>新增操作员</span>
         </c:if>
        <c:if test="${obj.id!=null}"> 
          <span>编辑操作员</span>
         </c:if>
    </div>
    <form action="" method="post" id="menuContent">
	   <ul class="forminfo">
	   		<li><label><font color="#f00">*</font>登录名</label>
	   		<input name="loginname" id="loginname" type="text" class="dfinput" placeholder="请输入" value="${obj.loginname}" /></li>
	   		<li><label><font color="#f00">*</font>密码</label>
	   		<input name="loginpwd" id="loginpwd" type="password" class="dfinput" placeholder="请输入" value="${obj.loginpwd}" /></li>
	    	<li>
	    		<label><font color="#f00">*</font>真实姓名</label>
	    			<input name="realname" id="realname" type="text" class="dfinput" value="${obj.realname}" />
	    	</li>

	    		<li>
	    		<label>操作员类型</label>
                  <select  id="type" name="type"    class="dfinput" style="width:10%;"  >
                     <option value="1"   <c:if test="${obj.type eq 1 }"> selected="selected"</c:if>  >超级管理员 </option>
                     <option value="0"   <c:if test="${obj.type eq 0 }"> selected="selected"</c:if> >普通操作员 </option>
                 </select>
	    	</li>
	    	<li>
	    		<label>角色</label>
                  <select  id="roleid" name="roleid"    class="dfinput" style="width:10%;"  >
	                  <c:forEach items="${list}" var="a" >                
	                     <option value="${a.id}"   <c:if test="${obj.roleid eq a.id }"> selected="selected"</c:if>  >${a.rolename} </option>
 	                 </c:forEach>
                 </select>
	    	</li>
	    	 
	    	<li><label>&nbsp;</label><input name="id" id="id" type="hidden"  value="${obj.id}" /><input  type="button" onclick="dataverify()" class="btn" value="保存"/>
	    &nbsp;&nbsp; <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="返回"/>  </li>
	    </ul>
    </form>
    </div>


</body>
</html>
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
 
 
	 function savemess(){
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	     	$("#itemAddForm").attr("action","<%=basePath%>/logonregister/logonVerifyRuleupdate?keywords="+keywords+"");
	     		 loading('保存中，请稍等...');
		        $("#itemAddForm").submit();
	     	  
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/logonregister/logonVerifyRuleList?keywords="+keywords+"";
	 }
	 
 
	</script>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>登录注册</li>
   <c:if test="${obj.id==null}"> 
    <li>配置校验规则新增</li>
    </c:if>
     <c:if test="${obj.id!=null}"> 
      <li>配置校验规则编辑</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.id==null}"> 
          <span>配置校验规则新增</span>
         </c:if>
        <c:if test="${obj.id!=null}"> 
          <span>配置校验规则编辑</span>
         </c:if>
    </div>
    <form action="" method="post" id="itemAddForm">
	    <ul class="forminfo">
	   <%--  <li><label><font color="#f00">*</font>规则代码</label>
	   		<input name="code" id="code" type="text" class="dfinput" value="${obj.code}" disabled="true"/> </li>
	    	<li> --%>
	   		<li><label><font color="#f00">*</font>规则名称</label>
	   		<input name="name" id="name" type="text" class="dfinput" value="${obj.name}" disabled="true" /> </li>
	    	<li>
	    		<label><font color="#f00">*</font>个数</label>
	    		<input name="times" id="times" type="text" class="dfinput" value="${obj.times}" /> </li>
 	    	 
 	    	 <li>
	    	<label><font color="#f00">*</font>是否启用</label>
 	    	  <select  id="isinuse" name="isinuse"    class="dfinput" style="width:10%;"  >
                 <option value="1"  <c:if test="${obj.isinuse eq 1 }"> selected="selected"</c:if>  >是 </option>
                 <option value="0"  <c:if test="${obj.isinuse eq 0 }"> selected="selected"</c:if>  >否 </option>
              </select>
 	    	 </li>
	    	
	    	<li><label>&nbsp;</label> <input name="id" id="id" type="hidden"  value="${obj.id}" /><input  type="button" onclick="savemess()" class="btn" value="保存"/>
	    &nbsp;&nbsp; <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="返回"/>  </li>
	    </ul>
    </form>
    </div>


</body>
</html>
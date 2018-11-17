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
	     	$("#itemAddForm").attr("action","<%=basePath%>/HintMessage/hintLoanupdate?keywords="+keywords+"");
	     		 loading('保存中，请稍等...');
		        $("#itemAddForm").submit();
	     	  
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/HintMessage/hintLoanList?keywords="+keywords+"";
	 }
	 
 
	</script>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>提示信息配置</li>
   <c:if test="${obj.code==null}"> 
    <li>弹窗内容新增</li>
    </c:if>
     <c:if test="${obj.code!=null}"> 
      <li>弹窗内容编辑</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.code==null}"> 
          <span>弹窗内容新增</span>
         </c:if>
        <c:if test="${obj.code!=null}"> 
          <span>弹窗内容编辑</span>
         </c:if>
    </div>
    <form action="" method="post" id="itemAddForm">
	    <ul class="forminfo">
	   		<li><label><font color="#f00">*</font>名称</label>
	   		<input name="name" id="name" type="text" class="dfinput" value="${obj.name}" disabled="true"/> </li>
	    	<li>
	    		<label><font color="#f00">*</font>提示信息</label>
	    		   <textarea name="hintmsg" id="hintmsg" rows="" cols="" class="textinput"    >${obj.hintmsg}</textarea>
	    	</li>
	    	
	    	<li><label>&nbsp;</label> <input name="code" id="code" type="hidden"  value="${obj.code}" /><input  type="button" onclick="savemess()" class="btn" value="保存"/>
	    &nbsp;&nbsp; <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="返回"/>  </li>
	    </ul>
    </form>
    </div>


</body>
</html>
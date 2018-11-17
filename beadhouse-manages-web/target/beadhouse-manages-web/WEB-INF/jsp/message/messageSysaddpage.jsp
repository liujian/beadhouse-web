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
		
	  
		});
	
	function dataverify(){
	     var p1 = document.getElementById("title").value;
        if(isEmpty(p1)){    
           alertx(" 标题 栏不能为空", '提示'); 
            return ;
        } 
        itemAddEditor.sync();
        var p2 = $("#info").val();
        if(isEmpty(p2)){
        	alertx(" 内容 栏不能为空", '提示');
              return ;
        }

     
		   savemess();
     }
	 function savemess(){
     	     if("${obj.id}"==null||"${obj.id}"==""){
     		    $("#itemAddForm").attr("action","<%=basePath%>/MessageCenter/messageSysadd");
     		     loading('保存中，请稍等...');
     		    itemAddEditor.sync();
   
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	     	$("#itemAddForm").attr("action","<%=basePath%>/MessageCenter/messageSysupdate?keywords="+keywords+"");
	     		 loading('保存中，请稍等...');
	     		 itemAddEditor.sync();
		        $("#itemAddForm").submit();
	     	} 
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/MessageCenter/messageSysList?keywords="+keywords+"";
	 }
	 
 
	</script>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>消息中心管理</li>
   <c:if test="${obj.id==null}"> 
    <li>系统消息新增</li>
    </c:if>
     <c:if test="${obj.id!=null}"> 
      <li>系统消息编辑</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.id==null}"> 
          <span>系统消息新增</span>
         </c:if>
        <c:if test="${obj.id!=null}"> 
          <span>系统消息编辑</span>
         </c:if>
    </div>
    <form action="" method="post" id="itemAddForm">
	    <ul class="forminfo">
	   		<li><label><font color="#f00">*</font>标题</label>
	   		<input name="title" id="title" type="text" class="dfinput" value="${obj.title}" /></li>
	    	<li>
	    		<label><font color="#f00">*</font>正文</label>
	    		   <textarea style="width:800px;height:300px;visibility:hidden;" name="info"   id="info"  >${obj.info}</textarea>
	    	</li>
	    	
	    	<li><label>&nbsp;</label> <input name="id" id="id" type="hidden"  value="${obj.id}" /><input  type="button" onclick="dataverify()" class="btn" value="保存"/>
	    &nbsp;&nbsp; <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="返回"/>  </li>
	    </ul>
    </form>
    </div>


</body>
</html>

 
<script type="text/javascript">
	var itemAddEditor ;
	//页面初始化完毕后执行此方法
	$(function(){
		 
		//创建富文本编辑器
		//itemAddEditor = TAOTAO.createEditor("#itemAddForm [name=desc]");
		itemAddEditor = KindEditor.create("#itemAddForm [name=info]", TT.kingEditorParams);
		//初始化类目选择和图片上传器
		TAOTAO.init({fun:function(node){
			 
			TAOTAO.changeItemParam(node, "itemAddForm");
		}});
	});
	
	
	function clearForm(){
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
	}
</script>

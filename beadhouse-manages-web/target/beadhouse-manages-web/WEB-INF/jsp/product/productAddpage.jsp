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
		if(!isEmpty("${obj.productid}")){
			document.getElementById("productid").disabled=true;
			
		 }
		});
	 
	function dataverify(){
	    var p1 = document.getElementById("productid").value;
        if(isEmpty(p1)){    
           alertx(" 产品id不能为空", '提示'); 
            return ;
        } 
        itemAddEditor.sync();
        var p3 = $("#introduct").val();
        if(isEmpty(p3)){
        	alertx(" 产品介绍 栏不能为空", '提示');
              return ;
        } 
        var p4 = $("#productid").val();
        if(isEmpty("${obj.productid}")){
            //数据重复校验
                $.ajax({
                       url:"<%=basePath%>/product/producttouinque",
                       dataType:"json",
                        data:{
                        	productid:p4 
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
 
     	     if("${obj.productid}"==null||"${obj.productid}"==""){
     		    $("#itemAddForm").attr("action","<%=basePath%>/product/productadd");
     		     loading('保存中，请稍等...');
     		    itemAddEditor.sync();
         	   $("#itemAddForm").submit(); 
	     	}else{
	     		 
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	     	$("#itemAddForm").attr("action","<%=basePath%>/product/productupdate?keywords="+keywords+"");
	     		 loading('保存中，请稍等...');
	     		 itemAddEditor.sync();
		        $("#itemAddForm").submit();
	     	} 
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/product/introductionList?keywords="+keywords+"";
	 }
	 
 
	</script>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>产品介绍配置</li>
   <c:if test="${obj.productid==null}"> 
    <li>产品介绍配置新增</li>
    </c:if>
     <c:if test="${obj.productid!=null}"> 
      <li>产品介绍配置编辑</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.productid==null}"> 
          <span>产品介绍配置新增</span>
         </c:if>
        <c:if test="${obj.productid!=null}"> 
          <span>产品介绍配置编辑</span>
         </c:if>
    </div>
    <form action="product/productadd" method="post" id="itemAddForm">
	    <ul class="forminfo">
	        <li><label><font color="#f00">*</font>产品名称</label>
	   		  <select  id="productid" name="productid"    class="dfinput" style="width:10%;"  >
                   <c:forEach items="${list}" var="a">
                       <option value="${a.productid }"  <c:if test="${obj.productid eq a.productid }"> selected="selected"</c:if>  >${a.productname } </option>
                   </c:forEach>
                 </select>
	   		
	   		</li>
	    
	    	<li>
	    		<label><font color="#f00">*</font>产品介绍</label>
	    		  	<textarea name="introduct" id="introduct" rows="" cols="" class="textinput" >${obj.introduct}</textarea>
	    	 </li>
	    	
	    	
	    	<li>
	    	  <label>&nbsp;</label>
	          <input name="productid" id="productid" type="hidden"  value="${obj.productid}" />
	    	  <input  type="button" onclick="dataverify()" class="btn" value="保存"/>
	           &nbsp;&nbsp; 
	          <input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="返回"/>  
	        </li>
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
	    itemAddEditor = KindEditor.create("#itemAddForm [name=introduct]", TT.kingEditorParams);
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

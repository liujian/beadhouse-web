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
    <title>问题及答案</title>
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
	    	   
			}else{
				document.getElementById("title").disabled="disabled";	
				document.getElementById("selecttpye").disabled="disabled";					
			}
		});
	/* function isEmpty(value){
	      if(value==undefined || value.Trim()=="" || value==null){
	            return true;
	        }else{
	            return false;
	        }
	  }
	  String.prototype.Trim = function(){   
	        return this.replace(/(^\s*)|(\s*$)/g, "");   
	   } */
	function dataverify(){
	    var p1 = document.getElementById("title").value;
        if(isEmpty(p1)){    
         	
           // confirm("问题及答案 标题 栏不能为空");
           alertx(" 标题 栏不能为空", '提示'); 
           return ;
        } 
        
        var p2 = $("#content").val();
        if(isEmpty(p2)){
        	alertx(" 内容 栏不能为空", '提示');
            return ;
        }
        
        var p3=$("#sort").val();
        if(isEmpty(p3)){
        	alertx(" 排序 栏不能为空", '提示');
            return ;
        }else{
        	  var reg = new RegExp("^[0-9]*$");
			  if(!reg.test(p3)){
				alertx(" 排序 栏请填写数字", '提示');
				return;
			  }
        }
        
        var p4=$("#selecttpye").val();
        var p5=$("#selecttpye option:selected").text();
        if(isEmpty("${obj.id}")){
        //数据重复校验
            $.ajax({
                   url:"<%=basePath%>/HelpCenter/addverifyAnswerandContent",
                   dataType:"json",
                   data:{
                		title:p1,
                    	type:p4,
                    	name:p5
                   },
                   type:"post",
                   success:function(data){
                     if(data.msg=="1"){
                  	   savemess();
                     }else{
                  	  // $.jBox.error(,"提示");
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
		 	var str=$("#selecttpye").val();
	     	document.getElementById("type1").value=str;
     	    if("${obj.id}"==null||"${obj.id}"==""){
     		    $("#answerandContent").attr("action","<%=basePath%>/HelpCenter/addAnswerandContent");
     		   loading('保存中，请稍等...');
         	    $("#answerandContent").submit(); 
	     	}else{
	     		var title= encodeURI(encodeURI($("#title").val()));
	     		 var keywords= encodeURI(encodeURI("${keywords}"));
	     		$("#answerandContent").attr("action","<%=basePath%>/HelpCenter/updateAnswerandContent?title="+title+"&keywords="+keywords+"");
	     		 loading('保存中，请稍等...');
		        $("#answerandContent").submit();
	     	} 
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/HelpCenter/listAnswerandContent?keywords="+keywords+"";
	 }
	</script>
	  
</head>

<body>

	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li>帮助中心管理</li>
		    <c:if test="${obj.id==null}"> 
		    	<li>问题及答案新增</li>
		    </c:if>
		    <c:if test="${obj.id!=null}"> 
		    	<li>问题及答案编辑</li>
		    </c:if>
	    </ul>
    </div>
    
    <div class="formbody">
	    <div class="formtitle"> 
	        <c:if test="${obj.id==null}"> 
	          <span>问题及答案新增</span>
	        </c:if>
	        <c:if test="${obj.id!=null}"> 
	          <span>问题及答案编辑</span>
	        </c:if>
	    </div>
	    <form action="/HelpCenter/addAnswerandContent" method="post" id="answerandContent">
		    <ul class="forminfo">
		   		<li>
			   		<label><font color="#f00">*</font>标题</label>
			   		<input name="title" id="title" type="text" class="dfinput" value="${obj.title}" />
		   		</li>
		    	<li>
		    		<label><font color="#f00">*</font>内容</label>
		    		<textarea name="content" id="content" rows="" cols="" class="textinput" >${obj.content}</textarea>
		    	</li>
		    	<li>
		    		<label><font color="#f00">*</font>排序</label>
		    		<input name="sort" type="text" id="sort" class="dfinput" style="width:10%;" value="${obj.sort}"  />
		    	</li>
		    	<li>
		    		<label>问题类型</label>
		    		<input name="type" type="hidden" id="type1"  class="dfinput"   />
	                <select  id="selecttpye" name="directionCode"    class="dfinput" style="width:10%;"  >
	                  <c:forEach items="${HelpCenterlist}" var="a">
	                       <option value="${a.code }"  <c:if test="${obj.type eq a.code }"> selected="selected"</c:if>  >${a.name } </option>
	                   </c:forEach>
	                 </select>
		    	</li>
		    	<li>
			    	<label>&nbsp;</label>
			    	<input name="id" id="id" type="hidden"  value="${obj.id}" />
			    	<input type="button" onclick="dataverify()" class="btn" value="保存"/>&nbsp;&nbsp; 
			    	<input type="button" onclick="goback()" id="add" class="btn" class="dfinput"  value="返回"/>  
		    	</li>
		    </ul>
	    </form>
    </div>


</body>
</html>

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
    <title>菜单维护</title>
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>editor/kindeditor.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
	 <script src="<%=basePath%>js/cpsd.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(function(){
		control();
 
		});
 
	function dataverify(){
	     var p1 = document.getElementById("name").value;
        if(isEmpty(p1)){    
         	
           // confirm("问题及答案 标题 栏不能为空");
           alertx(" 名称 栏不能为空"); 
            return ;
        } 
         var p2 = $("#url").val();
        if(isEmpty(p2)){
        	alertx(" 连接地址 栏不能为空");
              return ;
        }
        var p3=$("#number").val();
        if(isEmpty(p3)){
        	alertx(" 序号 栏不能为空");
              return ;
        }else{
        	  var reg = new RegExp("^[0-9]*$");
			  if(!reg.test(p3)){
				alertx("序号 栏请填写数字");
				return;
			  }
        }
      
       /*  if(isEmpty("${obj.id}")){
        //数据重复校验
            $.ajax({
                   url:"/Author/menuaddverify",
                   dataType:"json",
                    data:{
                    	name:p1 
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
        }  */
		   savemess();
     }
	 function savemess(){
		 	//var str=$("#selecttpye").val();
	     	//document.getElementById("type1").value=str;
     	    if("${obj.id}"==null||"${obj.id}"==""){
     		    $("#menuContent").attr("action","<%=basePath%>/Author/muenadd");
     		   loading('保存中，请稍等...');
         	    $("#menuContent").submit(); 
	     	}else{
	     		//var title= encodeURI(encodeURI($("#title").val()));
	     		 //var keywords= encodeURI(encodeURI("${keywords}"));
	     	//	$("#answerandContent").attr("action","/Author/muenadd?title="+title+"&keywords="+keywords+"");
	     	$("#menuContent").attr("action","<%=basePath%>/Author/muenupdate");
	     		 loading('保存中，请稍等...');
		        $("#menuContent").submit();
	     	} 
	   }
	 function goback(){ 
		 var keywords= encodeURI(encodeURI("${keywords}"));
		 window.location.href="<%=basePath%>/Author/muenlist?keywords="+keywords+"";
	 }
	 function control(){
		var dj= $("#level").val();
		if(dj==0){
			document.getElementById("parentid").disabled=true;
		}else{
			document.getElementById("parentid").disabled=false;
		}
	 }
	</script>
	  
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>菜单管理</li>
   <c:if test="${obj.id==null}"> 
    <li>新增菜单</li>
    </c:if>
     <c:if test="${obj.id!=null}"> 
      <li>编辑菜单</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    <div class="formtitle"> 
         <c:if test="${obj.id==null}"> 
          <span>新增菜单</span>
         </c:if>
        <c:if test="${obj.id!=null}"> 
          <span>编辑菜单</span>
         </c:if>
    </div>
    <form action="/Author/muenadd" method="post" id="menuContent">
	   <ul class="forminfo">
	   		<li><label><font color="#f00">*</font>名称</label>
	   		<input name="name" id="name" type="text" class="dfinput" value="${obj.name}" /></li>
	    	<li>
	    		<label><font color="#f00">*</font>链接地址</label>
	    			<input name="url" id="url" type="text" class="dfinput" value="${obj.url}" />
	    	</li>
	    	<li>
	    		<label><font color="#f00">*</font>序号</label>
	    		<input name="number" type="text" id="number" class="dfinput" style="width:10%;" value="${obj.number}"  />
	    	</li>
	    	
	    		<li>
	    		<label>菜单类型</label>
	    		<%-- <input name="LEVEL" type="text" id="LEVEL" class="dfinput" style="width:10%;" value="${obj.ISLEAF}"  /> --%>
	    		<!--  <input name="type" type="hidden" id="type1"  class="dfinput"   /> -->
	    	   
                  <select  id="level" name="level" onclick="control();"   class="dfinput" style="width:10%;"  >
                     <option value="0"   <c:if test="${obj.level eq 0 }"> selected="selected"</c:if>  >一级菜单 </option>
                     <option value="1"   <c:if test="${obj.level eq 1 }"> selected="selected"</c:if> >二级菜单 </option>
                 </select>
	    	</li>
	    	<li>
	    		<label>上级节点</label>
 	    		 <!-- <input name="type" type="hidden" id="type1"  class="dfinput"   /> -->
	    	        <select  id="parentid" name="parentid"    class="dfinput" style="width:10%;"  >
                    <option value=""  >--请选择--</option>
                  <c:forEach items="${list}" var="a">
                      <%--  <option value="${a.PARENTID }"  <c:if test="${obj.PARENTID eq a.PARENTID }"> selected="selected"</c:if>  >${a.name } </option> --%>
                    <option value="${a.id}"   <c:if test="${obj.parentid eq a.id }"> selected="selected"</c:if>  >${a.name } </option>
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

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
    <title>帮助中心</title>
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
	<script type="text/javascript">
		function check_acc(){
			var p1 = document.getElementById("acc").value;
			if(p1==null||p1==""){
				document.getElementById("accTip").innerHTML="问题类型名称不能为空";
			}else{
    			document.getElementById("accTip").innerHTML = "√";
    		}
		}
		
		function check_pwd(){
			var p1 = document.getElementById("pwd1").value;
			if(p1==null||p1==""){
				document.getElementById("pwdTip").innerHTML="问题类型代码不能为空,请填写两位数字";
			}else{
				//数字校验
				  var reg = new RegExp("^[0-9]*$");
				  if(!reg.test(p1)){
					$.jBox.alert("请填写数字","提示");
					//confirm("请填写数字");
					return;
				  }
				  if(p1.length>2){
					  $.jBox.alert("请填写两位数字","提示");
					  //confirm("请填写两位数字");
					return;  
				  }
    			document.getElementById("pwdTip").innerHTML = "√";
    		   }
		    }
		function dataverify(){
			    var p1 = document.getElementById("acc").value;
		        if(p1==null||p1==""){    
		        	$.jBox.alert("问题类型名称不能为空","提示");
		            return ;
		        } 
		        var p2 = document.getElementById("pwd1").value;
		        if(p2==null||p2==""){
		        	$.jBox.alert("问题类型代码不能为空","提示");
		              return ;
		        }else{
		        	var reg = new RegExp("^[0-9]*$");
					  if(!reg.test(p2)){
						$.jBox.alert("请填写数字","提示");
						//confirm("请填写数字");
						return;
					  }
					  if(p2.length>2){
						  $.jBox.alert("请填写两位数字","提示");
						  //confirm("请填写两位数字");
						return;  
					  }
		        }
		        //数据重复校验
		          $.ajax({
                           url:"<%=basePath%>/HelpCenter/addverify",
                           dataType:"json",
                            data:{
                                  name:p1,
                                  code:p2
                           },
                           type:"post",
                           success:function(data){
                             if(data.msg=="1"){
                          	   savemess();
                             }else{
                          	  // $.jBox.error(,"提示");
                          	   $.jBox.alert(data.msg,"提示");
                          	   return;
                             }
                            }
                     });
		       
		}
		
		 function savemess(){
		        	if("${obj.id}"==null||"${obj.id}"==""){
		        		$("#searchForm").attr("action","<%=basePath%>/HelpCenter/add");
			        	$("#searchForm").submit();
		        	}else{
		        		$("#searchForm").attr("action","<%=basePath%>/HelpCenter/update");
			        	$("#searchForm").submit();
		        	}
			       }
		 function goback(){
			 window.location.href="<%=basePath%>/HelpCenter/list";
		 }
		 
	</script>
</head>

<body>

	<div class="place">
   <span>位置：</span>
    <ul class="placeul">
    <li>帮助中心管理</li>
     <c:if test="${obj.id==null}"> 
   <li>问题类型添加</li>
    </c:if>
     <c:if test="${obj.id!=null}"> 
      <li>问题类型编辑</li>
    </c:if>
    
    
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle">
 
    <c:if test="${obj.id==null}"> 
    <span>添加问题类型</span>
    </c:if>
     <c:if test="${obj.id!=null}"> 
   
       <span>编辑问题类型</span>
    </c:if>
    </div>
    <form action="/HelpCenter/add" method="post" id="searchForm">
	    <ul class="forminfo">
		    <li><label><font color="#f00">*</font>问题类型名称</label><input name="name" onblur="check_acc();" id="acc" type="text" maxlength="10" class="dfinput" value="${obj.name}" />  <i id="accTip" style="color: #f00;"> </i>  </li>
		    <li><label><font color="#f00">*</font>标识顺序</label><input name="code" onblur="check_pwd();" id="pwd1" type="text" maxlength="18" class="dfinput" value="${obj.code}" /><i id="pwdTip" style="color: #f00;"> </i> </li>
 	     	 <li><label>&nbsp;</label><input name="id" id="id" type="hidden"  value="${obj.id}" /><input type="button" onclick="dataverify();" id="add" class="btn" class="dfinput"  value="保存"/>
 	     	&nbsp;&nbsp; <input type="button" onclick="goback();" id="add" class="btn" class="dfinput"  value="返回"/>  </li>
		     
		     

	    </ul>
	      
    </form>
    
    </div>


</body>
</html>

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
    <title>闪屏页上传管理</title>
	<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
 .background { 
    display: block; 
    width: 100%; 
    height: 100%; 
    opacity: 0.4; 
    filter: alpha(opacity=40); 
    background:while; 
    position: absolute; 
    top: 0; 
    left: 0; 
    z-index: 2000; 
} 
.progressBar { 
    border: solid 2px #86A5AD; 
    background: white url(${basePath}/images/progressBar_m.gif) no-repeat 10px 10px; 
} 
.progressBar { 
    display: block; 
    width: 160px; 
    height: 28px; 
    position: fixed; 
    top: 30%; 
    left: 40%; 
    margin-left: -74px; 
    margin-top: -14px; 
    padding: 10px 10px 10px 50px; 
    text-align: left; 
    line-height: 27px; 
    font-weight: bold; 
    position: absolute; 
    z-index: 2001; 
} 
.rightinfo {
    padding: 8px;
    margin-left: 40%;
    margin-top: -9%;
} 
.pagin {
    position: relative;
    margin-top: 10px;
    margin-left: 30%;
    padding: 0 12px;
}
</style>
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
	
 
   <!--  <script src="js/cpsd.js" type="text/javascript"></script> -->
	
	
	<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
			 
		  $(".click").click(function(){
		  $(".tip").fadeIn(200);
		  });
		  
		  $(".tiptop a").click(function(){
		  $(".tip").fadeOut(200);
		});

		  $(".sure").click(function(){
		  $(".tip").fadeOut(100);
		});
		   
		  $(".cancel").click(function(){
		  $(".tip").fadeOut(100);
		}); 
		  

		});

		 
		 function savemess(){  
			 if($('#file').val().length==0){
				 $.jBox.alert("请选择上传的图片文件","提示"); 
			 }else{
			
			    var ajaxbg = $("#background,#progressBar");
			    $('#searchForm').ajaxSubmit({
			                url:'<%=basePath%>pic/uploadpage',
			                data:$('#searchForm').serialize(),
			                type:"POST",
			                beforeSend:function()
			                {  
			                    ajaxbg.show(); 
			                },
			                success:function(msg)
			                {   
			                    ajaxbg.hide(); 
			                    
			                    $.jBox.confirm("保存成功!","提示",function(v){
			                    	 window.location.reload(); 
			                    });
			                    
			        
			                },
			                error:function(){
			                    ajaxbg.hide(); 
			                    alert("导入失败!");
			                }
			            });
			 }
			  //  $("#searchForm").submit(); 
	        
	        	/* 	$("#searchForm").attr("action","${basePath}/pic/uploadpage");
		        	$("#searchForm").submit(); */
	        	
		       }
		 
		 
		 
		function findimg(name){
			var name= encodeURI(encodeURI(name));
               $.jBox.open("iframe:<%=basePath%>/pic/Imageview?name="+name+"", "图片预览" ,500, 420,{
                   buttons: {  '取消': "cancel"},
                   loaded: function (h) {
                    
                   },
                    
                   closed: function(){
               
                   } 
               });
		}
		 
		function query(){
			   $("#searchForm2").attr(
						"action",
						"<%=basePath%>/pic/uploadImageList");
			//	loading('正在查询，请稍等...');
	           $("#searchForm2").submit();
		}
		function goPage(page){  
		    document.getElementById("currentpage").value=page;   
		    var keywords= encodeURI(encodeURI($("#keywords").val()));
			$("#pagenation").attr("action","<%=basePath%>/pic/uploadImageList?keywords="+keywords+"");
	    	$("#pagenation").submit();
	 	} 
	</script>
</head>

<body>
  <div id="background" class="background" style="display: none; "></div> 
<div id="progressBar" class="progressBar" style="display: none; ">上传中，请稍等...</div>
	<div class="place">
   <span>位置：</span>
    <ul class="placeul">
    <li>闪屏页上传管理</li>
     
     <li>静态多分辨率图片上传</li>
  
    
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle">
 
    
    <span>图片上传</span>
 
    </div>
    <form action="/pic/uploadpage" method="post" id="searchForm" enctype="multipart/form-data" >
	    <ul class="forminfo">
		  <!--   <li><label></label>    
		     <i id="accTip" style="color: #f00;"> </i>  </li> -->
		      
		      <li>
	    		<label>手机类型</label>
	    		 <select  id="code" name="code"    class="dfinput" style="width:10%;"  >
                   <!--  <option value=""  >--请选择--</option> -->
                   <c:forEach items="${list}" var="a">
                     <option value="${a.code}"   <c:if test="${obj.code eq a.code }"> selected="selected"</c:if>  >${a.name } </option>
                   </c:forEach>
                 </select>
	    	   </li>
		      
		      
		      
		    
                 
          <!--          <li>
	    		<label>请选择一张图片</label>
	    		 
	    	   </li> -->
		     
		        <li>
	    		<label><font color="#f00">*</font>上传图片</label>
	    		 <input type="file"  id="file" name="image" accept="image/*" /> <i id="accTip" style="color: #f00;"></i>
	    	   </li>
		     
  	     	 <li><label>&nbsp;</label>
 	     	 <input type="button" onclick="savemess();" id="add" class="btn" class="dfinput"  value="保存"/>
               </li>
		     
		     

	    </ul>
	      
    </form>
    
              <div class="rightinfo">
           <form id="searchForm2" action="/MessageCenter/messageSysList" method="post">
	        <ul class="seachform">
		     <li><label>手机类型</label>
		   <%--   <input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /> --%>
		      <select  id="keywords" name="keywords"    class="scinput"    >
                    <option value=""  >--全部--</option>
                   <c:forEach items="${list}" var="a">
                     <option value="${a.code}"   <c:if test="${keywords eq a.code }"> selected="selected"</c:if>  >${a.name } </option>
                   </c:forEach>
                 </select>
		     
		     </li>
		     <li><label>&nbsp;</label>
	 
		     <input type="button" class="scbtn" onclick="query()" value="查询"/>
 
		     </li>
		     <li>  <div id="imgDiv"></div></li>
	        </ul>
          </form>
			    <table class="imgtable">
			       
				    <thead>
				    <tr>	    
					    <th width="100px;">序号</th>
					    <th>手机类型</th>
					    <th>图片名称</th>
					    <th>预览</th>
				    </tr>
				    </thead>
				    
				    <tbody>
				    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
					    <tr>		    
						    <td class="imgtd">${sta.index+1}</td>
						    <td>${obj.code}</td>
						    <td>${obj.imgpath}</td>	
						    <td> <a href="javascript:void(0)" onclick="findimg('${obj.imgpath}');" class="tablelink">点击查看</a></td>			 
					    </tr>
				    </c:forEach>
				    <%--      <tr>		    
						    <td class="imgtd">${sta.index+1}</td>
						    <td>${obj.title}</td>
						    <td>${obj.time}</td>	
						    <td> <a href="javascript:void(0)" onclick="findimg(${obj.id});" class="tablelink">点击查看</a></td>			 
					    </tr> --%>
				        </tbody>
			    
			       </table>
			           <div class="pagin">
					    	 <div class="message">
					    	 <%@include file="pagenation.jsp" %>   
					    	</div>
                      </div>
    
    </div>
   
    </div>
       


</body>
</html>
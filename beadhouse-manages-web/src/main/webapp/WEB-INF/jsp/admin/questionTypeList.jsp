<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/tlds/gzzyzz.tld" prefix="z" %>
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

<style type="text/css">

/* 
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
    background: white url(<%=basePath%>/images/progressBar_m.gif) no-repeat 10px 10px; 
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
*/

#allCheck {
	vertical-align: -2px;
	margin-right: 2px;
}
</style>


<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<%-- <script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script> --%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
<script src="<%=basePath%>js/cpsd.js" type="text/javascript"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<script type="text/javascript">
$(document).ready(function(){
/* 	 
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
}); */
  

});

		$(document).ready(function(){
		  
		});
		function query(){
		/* 	  var ajaxbg = $("#background,#progressBar");
			    $('#searchForm').ajaxSubmit({
			                url:'/HelpCenter/list',
			                data:$('#searchForm').serialize(),
			                type:"POST",
			                beforeSend:function()
			                {  
			                    ajaxbg.show(); 
			                },
			                success:function(msg)
			                {
			                    ajaxbg.hide(); 
			        
			                },
			                error:function(){
			                    ajaxbg.hide(); 
			                    alert("导入失败!");
			                }
			            });
			    $("#searchForm").submit(); */
		    $("#searchForm").attr(
						"action",
						"<%=basePath%>/HelpCenter/list");
				loading('正在查询，请稍等...');
	            $("#searchForm").submit();
		  }
function addsave(){
	 
	window.location.href="<%=basePath%>/questionTypetoAdd";
}
function quanxuan(){
    var techIds = document.getElementsByName("cBox"); 
    var nowStatus = document.getElementById("allCheck");
    for(var i=0;i<techIds.length;i++){
        techIds[i].checked = nowStatus.checked;
    }
	
}
    //批量删除
	<%-- function dodelete(){
	var arr = new Array();
	var n = 0;
	$("input[name='cBox']").each(function(index){
		var checked=this.checked;
		if(checked){
			var aa = $("input[name='id']")[index].value;
			arr[n]=aa;
			n++;
		}
	});
	if(1>arr.length){
		alertx("请勾选问题类型!","提示");
		return true;
	}
	var ids=arr.join(",");
	
	 $.jBox.confirm("确定删除这些数据吗？", "删除提示", function (v, h, f) {
         if (v == 'ok'){
        	   $.ajax({
   		            type:"post",
   		            url:"<%=basePath%>/HelpCenter/delete?ids="+ids,
   		            success:function(result){
	   		        	$.jBox.confirm("删除成功!","提示",function(v){	   		        	 
	   		        		query(); 
	   		        	});    
   		         } 
   		      });
         }
         return true;                                  
     });
	
	} --%>
</script>
</head>


<body>
  <!--     <div id="background" class="background" style="display: none; "></div> 
<div id="progressBar" class="progressBar" style="display: none; ">数据加载中，请稍等...</div>  -->
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>帮助中心管理</li>
    <li>帮助中心问题类型</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/HelpCenter/list" method="post">
	        <ul class="seachform">
		     <li><label>问题类型名称</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>&nbsp;</label>
		      <z:permission value="pms:questionwh:view">
		     <input type="button" class="scbtn" onclick="query()" value="查询"/>
		       </z:permission>
		     </li>
		      <li><label>&nbsp;</label>
		       <z:permission value="pms:questionanswh:view">
		      <input type="button" class="scbtn" onclick="empty()" value="清空"/>
		       </z:permission>
		     </li>
		     
		     
		       <li><label>&nbsp;</label>
		          <z:permission value="pms:questionwh:add">
		       <input type="button" class="scbtn" onclick="addsave()" value="新增"/>
		             </z:permission>
		       </li>
		 <%--       <li><label>&nbsp;</label>
		        <z:permission value="pms:questionwh:delete">
		         <input type="button" class="scbtn" onclick="dodelete()" value="批量删除"/>
		        </z:permission>
		       </li> --%>
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead id="head_table">
	    <tr> 
	    	<th > 
	    		<label><input type="checkbox" id="allCheck" name="allCheck" onclick="quanxuan();"/>全选 </label>
	    	</th>
		    <th width="100px;">序号</th>
		    <th>问题类型名称</th>
		    <th>标识顺序</th>
		    <th>操作</th>
	    </tr>
    </thead>
    
    <tbody>
	    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
		    <tr>
			     <td style="width:7%;"><input type="checkbox" name="cBox" value="" />
					 <input type="hidden" name="id" value="${obj.id }"/></td>
			    <td class="imgtd">${sta.index+1}</td>
			    <td>${obj.name}</td>
			    <td>${obj.code}</td>
		    	<td>
		    	     <z:permission value="pms:messageloanwh:edit">
				   	<a href="<%=basePath%>/HelpCenter/updatepage?id=${obj.id}" class="tablelink">编辑</a>
				   	</z:permission>
				   	 <z:permission value="pms:messageloanwh:delete">
				   <%--  <a href="<%=basePath%>/HelpCenter/delete2?id=${obj.id}" class="tablelink"> 删除</a> --%>
		<a href="javascript:void(0)" onclick="deletetype(${obj.id},${pagenation.currentpage},${pagenation.rowCount});" class="tablelink"> 删除</a> 
				   
			         </z:permission>
			    </td>
		    </tr>
	    </c:forEach>
    
    </tbody>
    
    </table>
    
    <div class="pagin">
     
    	<div class="message">
    	 <%@include file="pagenation.jsp" %>   
    	</div>
     
    </div>
    
    
    </div>
    
	<script type="text/javascript">
	function deletetype(id,currentpage,rowCount){
		 $.jBox.confirm("确定删除该问题类型吗？", "删除提示", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>/HelpCenter/delete2?id="+id+"&currentpage="+currentpage+"&rowCount="+rowCount,
	   		            success:function(data){
		   		        	/* $.jBox.confirm("删除成功!","提示",function(v){	   		        	 
		   		        		query(); 
		   		        	});   */
	   		             if(data.msg=="1"){
	   		            	    query(); 
                           }else{
                        	  // $.jBox.error(,"提示");
                        	   alertx(data.msg,"提示");
                        	   return;
                           }
	   		         } 
	   		      });
	         }
	         return true;                                  
	     });
	}
	function empty(){
		$("#keywords").val("");
	}
	 function goPage(page){  
		    document.getElementById("currentpage").value=page;   
		    var keywords= encodeURI(encodeURI($("#keywords").val()));
			$("#pagenation").attr("action","<%=basePath%>/HelpCenter/list?keywords="+keywords+"");
	    	$("#pagenation").submit();
			
		} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

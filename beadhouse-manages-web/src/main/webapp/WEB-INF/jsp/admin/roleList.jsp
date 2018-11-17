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
    <title>系统管理</title>
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


</style>
     <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script> 
    <script src="js/cpsd.js" type="text/javascript"></script>
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

	$(document).ready(function(){
	    
	});
	function query(){

		   $("#searchForm").attr(
					"action",
					"<%=basePath%>/Author/roleList");
			loading('正在查询，请稍等...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/Author/roleAddpage";
	}
 
   
</script>
</head>


<body>
      <div id="background" class="background" style="display: none; "></div> 
<div id="progressBar" class="progressBar" style="display: none; ">数据正在保存，请稍等...</div> 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>系统管理</li>
    <li>角色管理</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="" method="post">
	        <ul class="seachform">
	              <li>
			     <label>角色类型</label>
			     <select  name="roletype" id="roletype"  class="scinput"  >
			       <option value=""     >---请选择--- </option>
			         <option value="1"   <c:if test="${roletype eq 1 }"> selected="selected"</c:if>  >超级管理员 </option>
                     <option value="0"   <c:if test="${roletype eq 0 }"> selected="selected"</c:if> >普通操作员</option>
			     </select>
			     
			     </li>
			     <li>
			     <label>角色名称</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" />
			     </li>
		     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="query()" value="查询"/></li>
	         <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="addsave()" value="新增"/></li>
		 <!--     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="dodelete()" value="批量删除"/></li> -->
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    
	    <th width="100px;">序号</th>
	    <th>角色类型</th>
	    <th>角色名称</th>
	    <th>描述</th>
	    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd">${sta.index+1}</td>
		    <td>
		     <c:if test="${obj.roletype eq 1}">超级管理员 </c:if>
		     <c:if test="${obj.roletype eq 0}">普通操作员</c:if></td>
		    <td>${obj.rolename}</td>
		    <td>${obj.remark}</td>
	    	<td>
			   	
			   	<a href="javascript:void(0)" onclick="contentEditer(${obj.id});" class="tablelink">编辑</a>
			   	<a href="javascript:void(0)" onclick="addrole(${obj.id});" class="tablelink">添加权限</a>
			  <%--   <a href="<%=basePath%>/Author/roleDelete?id=${obj.id}&currentpage=${pagenation.currentpage}&rowCount=${pagenation.rowCount}" class="tablelink"> 删除</a> --%>
		  <a href="javascript:void(0)" onclick="deleterole(${obj.id},${pagenation.currentpage},${pagenation.rowCount});" class="tablelink"> 删除</a> 
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
	$(function(){
		
	})
	function deleterole(id,currentpage,rowCount){
		 $.jBox.confirm("确定删除该角色吗？(删除角色后,与此角色的关联信息也会一并删除)", "删除提示", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>/Author/roleDelete?id="+id+"&currentpage="+currentpage+"&rowCount="+rowCount,
	   		            success:function(result){
		   		        	$.jBox.confirm("删除成功!","提示",function(v){	   		        	 
		   		        		query(); 
		   		        	});    
	   		         } 
	   		      });
	         }
	         return true;                                  
	     });
	}
	
	function addrole(id){
 
	 
            $.jBox.open("iframe:<%=basePath%>/commoncontrol/findActionList?roleid="+id+"", "权限树" ,500, 420,{
                buttons: { '添加': "ok", '取消': "cancel"},
                loaded: function (h) {
                 
                },
                submit: function (v, h, f) {
                    if(v == "ok"){
                    	var	nodes = h.find("iframe")[0].contentWindow.zTree1.getCheckedNodes(true);
                    	var ids="";
                    	var menuids="";
                    	$.each(nodes, function(n, value){
                    	    if(value.ename!=undefined){
                    		      ids+=value.ename+",";
                    	    }else{
                    	         menuids+=value.menuid+","; 	
                    	    }
                    	});	
                    	

                           var ajaxbg = $("#background,#progressBar");
                            $.ajax({
                                type: "POST",
                                url: "<%=basePath%>/Author/roleAuthorityAdd",
                                data: {
                                	roleid:id,
                                	ids:ids,
                                	menuids:menuids
                               },
                              
                                dataType: "text",
                                async:true,
                                beforeSend:function()
    			                {  
    			                    ajaxbg.show(); 
    			                },
                                success: function(data){
                                    $.jBox.closeTip();
                                    if(data){
                                    //	alert("添加成功！");
                                    	query();
                                    }
                                    
                        
                                },
                                error:function(error){
                                    $.jBox.closeTip();
                                    $.jBox.info("系统异常！", "提醒", {
                                        buttons: { '确认': true},
                                        closed: function () { }
                                    }); 
                                }
                            }); 
                    }
                },
                closed: function(){
            
                } 
            });
        
		
	}
	function contentEditer(id){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>/Author/roleUpdatepage?id="+id+"&keywords="+keywords+"";
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/Author/roleList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

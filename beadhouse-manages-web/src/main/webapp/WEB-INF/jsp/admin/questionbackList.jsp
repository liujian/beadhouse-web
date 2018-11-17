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
    <title>帮助中心管理</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">

</style>
    <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script>
    <script src="<%=basePath%>js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
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

	});
	function query(){
		debugger;
	            var bz=true;
	            var starttime=$("#Timestart").val();
	            var stoptime=$("#Timestop").val();
	            if(!isEmpty(starttime)&&!isEmpty(stoptime)){
	            	 
		            if(starttime>stoptime){
		            	alertx("起始时间  不能  大于结束时间!","提示");
		            	bz=false;
		            }
	            } 
	            if(bz){	
 	             $("#searchForm").attr(
		   						"action",
		   						"<%=basePath%>/HelpCenter/listQuestionback"
		   						);
		   				loading('正在查询，请稍等...');
		   	            $("#searchForm").submit();
	            }      
	  
	}
	function empty(){
		$("#keywords").val("");
		$("#Timestart").val("");
		$("#Timestop").val("");
	}

  
</script>
</head>


<body>
       
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>帮助中心管理</li>
    <li>意见反馈</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="" method="post">
 
	        <ul class="seachform">
		     <li><label>账户名</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>起始时间</label>  
        	 <input type="text"  placeholder="请选择起始时间"  id="Timestart" name="Timestart" value="${Timestart}"  class="scinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,isShowClear:true})" />
  	         </li>
  	          <li><label>结束时间</label>  
        	 <input type="text"  placeholder="请选择结束时间" id="Timestop" name="Timestop" value="${Timestop}"  class="scinput" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,isShowClear:true})" />
  	         </li>
		     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="query()" value="查询"/></li>
		      <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="empty()" value="清空"/></li>
	       
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	        
	    <th width="100px;">序号</th>
	    <th>账户名称</th>
	    <th>电话号码</th>
	    <th>反馈内容</th>
	    <th>发生时间</th>
	    
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		     
		    <td class="imgtd">${sta.index+1}</td>
		    <td>${obj.name}</td>
		    <td style="width:10%;">${obj.phone}</td>
		    <td style="width:40%;">${obj.question}</td>
		    <td> ${obj.stringtime}</td>
	     
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
	//当引入分页控件控件时需要对此方法进行对应修改 
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
	    var Timestart=$("#Timestart").val();
	    var Timestart=$("#Timestart").val();
	    var Timestop=$("#Timestop").val();
		$("#pagenation").attr("action","<%=basePath%>HelpCenter/listQuestionback?keywords="+keywords+"&Timestart="+Timestart+"&Timestop="+Timestop+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

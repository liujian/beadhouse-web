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
    <title>登录注册配置</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">

</style>
     <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script> 
      <script src="<%=basePath%>js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
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
 
	function query(){
		
		var Timestart=$("#Timestart").val();
		var Timestop=$("#Timestop").val();
		if(isEmpty(Timestart)&&isEmpty(Timestop)){
			  $("#searchForm").attr(
						"action",
						"<%=basePath%>/logonregister/notPassDataList");
				loading('正在查询，请稍等...');
	           $("#searchForm").submit();
		}else{
		if(Timestart > Timestop){
			alertx("起始时间 不能大于 结束时间!","提示")
			return ;
		}else{
			   $("#searchForm").attr(
						"action",
						"<%=basePath%>/logonregister/notPassDataList");
				loading('正在查询，请稍等...');
	           $("#searchForm").submit();
		 }
      }
	}

 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li>登录注册</li>
    <li>未通过校验的数据</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/MessageCenter/messageSysList" method="post">
	        <ul class="seachform">
		     <li><label>名称</label>
		      
                  <select  id="keywords" name="keywords"    class="dfinput" style="width:80%;"  >
                   <option value=""    >----------请选择----------</option>
                  <c:forEach items="${list2}" var="a">
                   
                       <option value="${a.code }"  <c:if test="${keywords eq a.code }"> selected="selected"</c:if>  >${a.name } </option>
                   </c:forEach>
                 </select>
		     </li>
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
	    <th>规则名称</th>
	    <th>手机号</th>
	    <th>ip地址</th>
	    <th>设备号</th>
	    <th>日期</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
	    <tr>
		    
		    <td class="imgtd">${sta.index+1}</td>
		    <td style="width:20%;">${obj.validatorname}</td>
		    <td>${obj.phone}</td>
		    <td>${obj.ip}</td>
	    	<td>${obj.device}</td>
	    	<td>${obj.time}</td>
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
	function empty(){
		$("#keywords").val("");
		$("#Timestart").val("");
		$("#Timestop").val("");
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/logonregister/notPassDataList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

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
    <title>Permission Management</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />

<style type="text/css">

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
	    
	});
	function query(){

		   $("#searchForm").attr(
					"action",
					"<%=basePath%>/Author/muenlist");
			loading('Enquiries, please wait...');
           $("#searchForm").submit();
	}
	function addsave(){
		window.location.href="<%=basePath%>/Author/muenaddpage";
	}
 
   
</script>
</head>


<body>
 
	<div class="place">
	    <span>Location：</span>
	    <ul class="placeul">
		    <li>Permission Management</li>
		    <li>Menu Management</li>
	    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="Author/listAnswerandContent" method="post">
	        <ul class="seachform">
		     <li>
			     <label>Menu Name</label>
			     <input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" />
		     </li>
		     <li>
		     	<label>&nbsp;</label>
		     		<input type="button" class="scbtn" onclick="query()" value="Search"/>
		     </li>
		     
	         <li>
		         <label>&nbsp;</label>
		         <input type="button" class="scbtn" onclick="addsave()" value="New"/>
	         </li>
		 <!--     <li><label>&nbsp;</label><input type="button" class="scbtn" onclick="dodelete()" value="批量删除"/></li> -->
	         
	        </ul>
          </form>
	    <table class="imgtable">
	       
		    <thead>
			    <tr>
				    <th width="100px;">Serial#</th>
				    <th>Menu Name</th>
				    <th>Menu </th>
				    <th>Menu Type</th>
				    <th>Previous Menu</th>
				    <th>Action</th>
			    </tr>
		    </thead>
		    
		    <tbody>
			    <c:forEach items="${HelpCenterlist}" var="obj" varStatus="sta">
				    <tr>
					    
					    <td class="imgtd">${sta.index+1}</td>
					    <td>${obj.name}</td>
					    <td style="width:40%;">${obj.url}</td>
					    <td>
						    <c:if test="${obj.level eq 0 }" >First level menu</c:if>
						    <c:if test="${obj.level eq 1 }" >Two level menu</c:if>
					    </td>
					    <td> ${obj.parentidname}</td>
				    	<td>
						   	<a href="javascript:void(0)" onclick="contentEditer(${obj.id});" class="tablelink">Edit</a>
					       <a href="javascript:void(0)" onclick="deletemenu(${obj.id},${pagenation.currentpage},${pagenation.rowCount});" class="tablelink">Delete</a> 
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
	function deletemenu(id,currentpage,rowCount){
		 $.jBox.confirm("Are you sure you want to delete this menu? After deleting the menu, the associated information with this menu will also be deleted.", "Delete prompt", function (v, h, f) {
	         if (v == 'ok'){
	        	   $.ajax({
	   		            type:"post",
	   		            url:"<%=basePath%>/Author/muendelete?id="+id+"&currentpage="+currentpage+"&rowCount="+rowCount,
	   		            success:function(result){
		   		        	$.jBox.confirm("Delete success!","Tips",function(v){	   		        	 
		   		        		query(); 
		   		        	});    
	   		         } 
	   		      });
	         }
	         return true;                                  
	     });
	}
	function contentEditer(id){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>/Author/muenupdatepage?id="+id+"&keywords="+keywords+"";
	}
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/Author/muenlist?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
</script>
    
</body>
</html>

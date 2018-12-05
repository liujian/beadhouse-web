<%@ page language="java" contentType="text/html; charset=UTF-8"   
    pageEncoding="UTF-8"%>  
<%@page import="com.beadhouse.pojo.Pagenation" %>  
 
<script language="javascript">

	$(function(){
		page();
	});
 
	function page(){
		var num="${pagenation.pageCount}";
		 
		if(num>0){
			for(var i=1;i<=num;i++){
			$("#tz").append("  <option  value='" + i + "' >  " +i+ " </option>  ");
			}
			$("#tz").val("${pagenation.currentpage}"); 
		}
		
	}
	function controlpage(){
		
	}

</script>  
<form action="" id="pagenation" method="post" style="display:none">  
    <input type="hidden" name="rowCount" value="${pagenation.rowCount }"/>  
    <input type="hidden" name="currentpage" id="currentpage" value="${pagenation.currentpage}"/>
</form>
<p>  
       Total<i class="blue">&nbsp;${pagenation.pageCount}</i>&nbsp;Page(s)<i class="blue">&nbsp;${itemsCount}</i>&nbsp;items.
    <a href="javascript:void(0);" onclick="goPage(1)" style="cursor: pointer;">Home</a>  
    <a href="javascript:void(0);" onclick="goPage('${pagenation.currentpage-1}')" style="cursor: pointer;">Previous Page</a>  
    &nbsp;<font color="red">${pagenation.currentpage }</font>&nbsp;
    <a href="javascript:void(0);" onclick="goPage('${pagenation.currentpage+1}')" style="cursor: pointer;">Next Page</a>  
    <a href="javascript:void(0)" onclick="goPage('${pagenation.pageCount}')" style="cursor: pointer;">Last</a>  
    &nbsp;&nbsp;Go to Page
    <select onchange="goPage(this.value)"  id="tz">  
    </select>&nbsp;&nbsp;  
</p>
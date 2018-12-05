<%@ page language="java" contentType="text/html; charset=UTF-8"   
    pageEncoding="UTF-8"%>  
<%@page import="com.beadhouse.pojo.Pagenation" %>  
 
 
 
<script type="text/javascript">  
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
       共<i class="blue">&nbsp;${pagenation.pageCount}</i>&nbsp;页<i class="blue">&nbsp;${itemsCount}</i>&nbsp;条记录.
    <a href="javascript:void(0);" onclick="goPage(1)" style="cursor: pointer;">首页</a>  
    <a href="javascript:void(0);" onclick="goPage('${pagenation.currentpage-1}')" style="cursor: pointer;">上一页</a>  
    当前第&nbsp;<font color="red">${pagenation.currentpage }</font>&nbsp;页  
    <a href="javascript:void(0);" onclick="goPage('${pagenation.currentpage+1}')" style="cursor: pointer;">下一页</a>  
    <a href="javascript:void(0)" onclick="goPage('${pagenation.pageCount}')" style="cursor: pointer;">末页</a>  
    &nbsp;&nbsp;跳转到第
    <select onchange="goPage(this.value)"  id="tz">  
    </select>页&nbsp;&nbsp;  
</p>
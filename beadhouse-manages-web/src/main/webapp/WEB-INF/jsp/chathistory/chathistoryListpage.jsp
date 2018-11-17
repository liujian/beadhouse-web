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
    <title>History Q/A</title>
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

	$(document).ready(function(){
	    
	});
	function query(){
		   $("#searchForm").attr(
					"action",
					"<%=basePath%>/historychat/historychatList");
			loading('Enquiries, please wait...');
			debugger;
           $("#searchForm").submit();
	}
	
 
   
</script>
</head>


<body>
 
	<div class="place">
    <span>Location:</span>
    <ul class="placeul">
    <li>History Q/A</li>
    <li>History Q/A List</li>
    </ul>
    </div>
    
    <div class="rightinfo">
           <form id="searchForm" action="/OrderUser/OrderUserList" method="post">
	        <ul class="seachform">
		     <li><label>Elder's Account</label><input name="keywords" id="keywords" type="text" value="${keywords}" maxlength="10" class="scinput" /></li>
		     <li><label>&nbsp;</label>
		     <input type="button" class="scbtn" onclick="query()" value="Search"/>
		     </li>
		      <li><label>&nbsp;</label>
		      <input type="button" class="scbtn" onclick="empty()" value="Reset"/>
		     </li>
	         
	        </ul>
          </form>
    <table class="imgtable">
       
    <thead>
    <tr>
	    <th width="100px;">Serial#</th>
	    <th style="display:none;">聊天id</th>
	    <th style="width:100px;">User Accounts</th>
	    <th style="width:100px;">Elderly Accounts</th>
	    <th style="width:100px;">User Quest</th>
	    <th style="width:200px;">Custom Questions</th>
	    <th style="width:200px;">Question Videos/Audios.</th>
	    <th style="width:200px;">Answers</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${chatlist}" var="obj" varStatus="sta">
	    <tr>
		    <td class="imgtd" style="width:5%;">${sta.index+1}</td>
		    <td style="display:none;">${obj.chatid}</td>
		    <td style="width:100px;">${obj.emailAddress}</td>
		    <td style="width:100px;">${obj.elderUserEmail}</td>
		    <td style="width:100px;">${obj.quest}</td>
		    <td style="width:200px;">${obj.defineQuest}</td>
		    <td style="width:200px;">${obj.voicequest}
		    <p>
		    <a href="javascript:void(0)" onclick="passquest('${obj.voicequest}');" class="tablelink">Turn to Question list</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <a href="javascript:void(0)" onclick="openuservideo('${obj.userVoiceUrl}');" class="tablelink">Listen/Watch</a>
		    </p>
		    </td>
		     <td style="width:200px;">${obj.elderUserResponse}
		      <p>
		     <a href="javascript:void(0)" onclick="openorderuservideo('${obj.elderUserVoiceUrl}');" class="tablelink">Listen/Watch</a>  
		      </p>
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
	function empty(){
		$("#keywords").val("");
	} 
	
	function passquest(voicequest){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>historychat/Questupdatepage?quest="+voicequest+"&keywords="+keywords+"";
 	
	}
	
	 function openuservideo(userVoiceUrl){
		 if(userVoiceUrl==null||userVoiceUrl==""){
			  alertx("No chat audio.", 'Tips'); 
		 }else{
			 window.open(userVoiceUrl);
		 }
		
	} 
	
	function openorderuservideo(elderUserVoiceUrl){
		 if(elderUserVoiceUrl==null||elderUserVoiceUrl==""){
			  alertx("No chat audio.", 'Tips'); 
		 }else{
			 window.open(elderUserVoiceUrl);
		 }
		
	}
	
	
	function goPage(page){  
	    document.getElementById("currentpage").value=page;   
	    var keywords= encodeURI(encodeURI($("#keywords").val()));
		$("#pagenation").attr("action","<%=basePath%>/historychat/historychatList?keywords="+keywords+"");
    	$("#pagenation").submit();
 	} 
		$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>
</html>

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
/* table th{white-space: nowrap;}
table td{white-space: nowrap;} */
body,table{font-size:12px;}
table{empty-cells:show; border-collapse: collapse; margin:0 auto;}
h1,h2,h3{ font-size:12px;margin:0; padding:0;}
table.imgtable{border:1px solid #cad9ea;color:#666;}
table.imgtable th {background-repeat:repeat-x;height:30px;}
table.imgtable td,table.imgtable th{border:1px solid #cad9ea;padding:0 1em 0;}
table.imgtable tr{background-color:#f5fafe;height:30px;}
</style>
     <script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script> 
    <script src="js/cpsd.js" type="text/javascript"></script>
     <script src="<%=basePath%>js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <table class="imgtable" >
       
    <thead>
    <tr class="tr_css">
	    <th width="100px;">Serial#</th>
	    <th style="display:none;">聊天id</th>
	    <th style="white-space: nowrap;">User's Accounts</th>
	    <th style="white-space: nowrap;">Elder's Accounts</th>
	    <th style="white-space: nowrap;">Question</th>
	    <th style="white-space: nowrap;">Question Video/Audio</th>
	    <th style="white-space: nowrap;">Question Date</th>
	    <th style="white-space: nowrap;">Answer  Video/Audio</th>
	    <th style="white-space: nowrap;">Response Date</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${chatlist}" var="obj" varStatus="sta">
	    <tr class="tr_css">
		    <td class="imgtd" style="width:5%;">${sta.index+1}</td>
		    <td style="display:none;">${obj.chatid}</td>
		    <td style="white-space: nowrap;">${obj.firstName}${obj.lastName}(${obj.emailAddress})</td>
		    <td style="white-space: nowrap;">${obj.elderFirstName}${obj.elderLastName}(${obj.elderUserEmail})</td>
		    <td style="width:600px;">${obj.quest}
		     <p>
		    <a style="text-align:right;white-space: nowrap;" href="javascript:void(0)" onclick="passquest('${obj.quest}');" class="tablelink">Add to Question List</a>		      
		       </p>
		    </td>
		    <td style="width:600px;">${obj.voicequest}
		     <p>
		    <a href="javascript:void(0)" id="${obj.userVoiceUrl}+1" onclick="openuservideo('${obj.userVoiceUrl}','${obj.userVoiceUrl}+1');" class="tablelink">Listen/Watch</a>
		    <video id="${obj.userVoiceUrl}" src="${obj.userVoiceUrl}" style="display:none;" controls="controls" width="400" height="300"></video>
		    </p>
		    </td>
		     <td style="white-space: nowrap;"><fmt:formatDate value="${obj.questDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		     <td style="width:600px;">${obj.elderUserResponse}
		      <p>
		     <a href="javascript:void(0)" id="${obj.elderUserVoiceUrl}+1" onclick="openorderuservideo('${obj.elderUserVoiceUrl}','${obj.elderUserVoiceUrl}+1');" class="tablelink">Listen/Watch</a> 
		      <video id="${obj.elderUserVoiceUrl}" src="${obj.elderUserVoiceUrl}" style="display:none;" controls="controls" width="400" height="300"></video> 
		      </p>
		     </td>
		      <td style="white-space: nowrap;"><fmt:formatDate value="${obj.responseDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		 
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
	
	function passquest(quest){
		var keywords= encodeURI(encodeURI($("#keywords").val()));
 		 window.location.href="<%=basePath%>historychat/Questupdatepage?quest="+quest+"&keywords="+keywords+"";
 	
	}
	
	 function openuservideo(userVoiceUrl,voicequest){
		 if(userVoiceUrl==null||userVoiceUrl==""){
			  alertx("No chat audio.", 'Tips'); 
		 }else if(userVoiceUrl.indexOf("amr")!="-1"){
			 $.jBox.confirm("AMR file needs to be downloaded to be played. Do you want to download it?", "Download Prompt", function (v, h, f) {
				 if (v == 'ok'){
					  var $form = $('<form method="GET"></form>');
			            $form.attr('action', userVoiceUrl);
			            $form.appendTo($('body'));
			            $form.submit();   
				 }
				                              
		     });
		 }else{		
			 if(document.getElementById(userVoiceUrl).style.display=="block"){
			
				 document.getElementById(userVoiceUrl).style.display="none";
				 document.getElementById(userVoiceUrl).pause();
				 document.getElementById(voicequest).innerHTML="Listen/Watch";
			 }else{
				 document.getElementById(userVoiceUrl).style.display="block"; 
				 document.getElementById(voicequest).innerHTML="Close Listen/Watch";
			 }
			
			   
		 }
		
	} 
	
	function openorderuservideo(elderUserVoiceUrl,elderUserResponse){
		 if(elderUserVoiceUrl==null||elderUserVoiceUrl==""){
			  alertx("No chat audio.", 'Tips'); 
		 }else if(elderUserVoiceUrl.indexOf("amr")!="-1"){
			 $.jBox.confirm("AMR file needs to be downloaded to be played. Do you want to download it?", "Download Prompt", function (v, h, f) {
				 if (v == 'ok'){
					 var $form = $('<form method="GET"></form>');
			            $form.attr('action', elderUserVoiceUrl);
			            $form.appendTo($('body'));
			            $form.submit();    
				 }
				                             
		     });
		 }else{
			 if(document.getElementById(elderUserVoiceUrl).style.display=="block"){
					
				 document.getElementById(elderUserVoiceUrl).style.display="none";
				 document.getElementById(elderUserVoiceUrl).pause();
				 document.getElementById(elderUserResponse).innerHTML="Listen/Watch";
			 }else{
				 document.getElementById(elderUserVoiceUrl).style.display="block"; 
				 
				 document.getElementById(elderUserResponse).innerHTML="Close Listen/Watch";
			
			 }
			    
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

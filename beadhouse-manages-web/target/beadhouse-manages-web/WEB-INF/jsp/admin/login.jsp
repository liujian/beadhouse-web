<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>欢迎登录大地管理系统</title>
		<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="<%=basePath%>js/jquery.js"></script>
		<script src="<%=basePath%>js/cloud.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox.css" />
	    <link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery-jbox/2.3/Skins2/Metro/jbox_style.css" />
	    <script type="text/javascript" src="<%=basePath%>js/jquery-jbox/2.3/jquery.jBox-2.3.js"></script> 
	    <script src="<%=basePath%>js/cpsd.js" type="text/javascript"></script>
	      <script   language="javascript">    
		      if (top != window)    
		      top.location.href = window.location.href;    
		  </script>   
		<script language="javascript">
		$(function(){
			$.ajax({
	            type: "post", 
	            url : "<%=basePath%>/Login",
	            data: {
	            	loginname:"",
	              	loginpwd:""
                		},  
             /*    beforeSend:function()
		                {  
                	      loading('正在登录，请稍等...');  
		                }, */
	            success: function(data){	//如果调用后台成功
	            	if(data=="defeated"){
	            		$("#loginTip").html("用户名或密码不正确");
	            		closeLoading();
	            	}else if(data=="success"){
	            		/* loading('正在登录，请稍等...'); */
	            		document.getElementById("loginForm").submit();
	            	}
	        	}
        	}); 
		});
		
		
		
			function login_btn(){
				 var loginname = $("#acc").val();
        		var loginpwd = $("#pwd").val();
	        	$.ajax({
		            type: "post", 
		            url : "<%=basePath%>/Login",
		            data: {
		            	loginname:loginname,
		            	loginpwd:loginpwd
                    		},  
                    beforeSend:function()
			                {  
                    	      loading('正在登录，请稍等...');  
			                },
		            success: function(data){	//如果调用后台成功
		            	if(data=="defeated"){
		            		$("#loginTip").html("用户名或密码不正确");
		            		closeLoading();
		            	}else{
		            		/* loading('正在登录，请稍等...'); */
		            		document.getElementById("loginForm").submit();
		            	}
		        	}
	        	}); 
				//window.location.href="main";
			}
			
			$(function() {
				$('.loginbox').css( {
					'position' : 'absolute',
					'left' : ($(window).width() - 692) / 2
				});
				$(window).resize(function() {
					$('.loginbox').css( {
						'position' : 'absolute',
						'left' : ($(window).width() - 692) / 2
					});
				})
			});
		</script>
	</head>

	<body
		style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">

		<div id="mainBody">
			<div id="cloud1" class="cloud"></div>
			<div id="cloud2" class="cloud"></div>
		</div>

		<div class="logintop">
			<span>管理系统</span>
			<ul>
				<li>
					<a href="#">回首页</a>
				</li>
				<li>
					<a href="#">帮助</a>
				</li>
				<li>
					<a href="#">关于</a>
				</li>
			</ul>
		</div>

		<div class="loginbody">

			<span class="systemlogo"></span>
			<div class="loginbox">
				<form action="<%=basePath%>main" id="loginForm" method="post">
					<ul>
						<li>
							<input id="acc" type="text" class="loginuser" value="admin"
								onclick="JavaScript:this.value=''" />
						</li>
						<li>
							<input id="pwd" type="password" class="loginpwd"
								onclick="JavaScript:this.value=''" />
						</li>
						<li id="loginTip" style="margin-bottom:10px;font-size:15px; color: #ff0000;">
						
						</li>
						<li>
							<input name="" type="button"
							 class="loginbtn" value="登录" onclick="login_btn()" />
							<label>
								<input name="" type="checkbox" value="" checked="checked" />
								记住密码
							</label>
							<label>
								<a href="#">忘记密码？</a>
							</label>
						</li>
						
					</ul>
					
				</form>
			</div>

		</div>

		<div class="loginbm">
			版权所有 2018
			<a href="">Made In XBMU</a>
		</div>

	</body>
</html>

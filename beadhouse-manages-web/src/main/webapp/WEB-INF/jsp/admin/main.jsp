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
		<title>Elderly management system interface</title>
	</head>
	<frameset rows="80,*" cols="*" frameborder="no" border="0" framespacing="0">
		<frame src="top" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
		<frameset cols="250,*" frameborder="no" border="0" framespacing="0">
			<frame src="left" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
			<frame src="index" name="rightFrame" id="rightFrame" title="rightFrame" />
		</frameset>
	</frameset>
	<noframes>
		<body>
			
		</body>
	</noframes>
</html>

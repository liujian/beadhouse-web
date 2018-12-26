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
		<title>无标题文档</title>
		<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="<%=basePath%>js/jquery.js"></script>
		<script type="text/javascript">
			$(function() {
				//导航切换
				$(".menuson li").click(function() {
					$(".menuson li.active").removeClass("active")
					$(this).addClass("active");
				});
			
				$('.title').click(function() {
					var $ul = $(this).next('ul');
					$('dd').find('ul').slideUp();
					if ($ul.is(':visible')) {
						$(this).next('ul').slideUp();
					} else {
						$(this).next('ul').slideDown();
					}
				});
				 
			})
		</script>

	</head>

	<body style="background: #f0f9fd;">
		<div class="lefttop">
			<span></span>Database Management
		</div>

		<dl class="leftmenu">
		         ${tree}
		         
               <!-- <dd>
                 <div class="title">
					<span><img src="images/leftico01.png" />
					</span>权限管理
				</div>
				 <ul class="menuson">
				      <li>
						<cite></cite><a href="Author/muenlist" target="rightFrame">菜单管理</a><i></i>
					</li>
					<li>
						<cite></cite><a href="index" target="rightFrame">权限管理</a><i></i>
					</li>
					<li>
						<cite></cite><a href="index" target="rightFrame">角色管理</a><i></i>
					</li>
					<li>
						<cite></cite><a href="index" target="rightFrame">用户管理</a><i></i>
					</li>
				    
				 </ul>
			  </dd>
			<dd>
				<div class="title">
					<span><img src="images/leftico01.png" />
					</span>帮助中心管理
				</div>
				<ul class="menuson">
					 <li>
						<cite></cite><a href="index" target="rightFrame">回到首页</a><i></i>
					</li>
					<li>
						<cite></cite><a href="HelpCenter/list" target="rightFrame">问题类型维护</a><i></i>
					</li>
					 
						<li>
						<cite></cite><a href="HelpCenter/listAnswerandContent" target="rightFrame">问题及答案维护</a><i></i>
					</li>
					<li>
						<cite></cite><a href="HelpCenter/listQuestionback" target="rightFrame">意见反馈</a><i></i>
					</li>
				</ul>
			</dd>

			<dd>
				<div class="title">
					<span><img src="images/leftico02.png" />
					</span>产品配置
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="notice_form" target="rightFrame">发布通知</a><i></i>
					</li>
					<li>
						<cite></cite><a href="notice_allNotices" target="rightFrame">所有通知</a><i></i>
					</li>
				</ul>
			</dd>

			<dd>
				<div class="title">
					<span><img src="images/leftico03.png" />
					</span>消息中心
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="MessageCenter/messageaddpage" target="rightFrame">学习园地</a><i></i>
					</li>
					<li>
						<cite></cite><a href="course_allCourse" target="rightFrame">查询课程</a><i></i>
					</li>
					<li>
						<cite></cite><a href="course_toAddMark" target="rightFrame">成绩录入/查询</a><i></i>
					</li>
					<li>
						<cite></cite><a href="teacher_toAddTeacher" target="rightFrame">添加教师</a><i></i>
					</li>
					<li>
						<cite></cite><a href="teacher_teacherList" target="rightFrame">查询所有教师</a><i></i>
					</li>
					<li>
						<cite></cite><a href="student_toAddStudent" target="rightFrame">添加学生</a><i></i>
					</li>
					<li>
						<cite></cite><a href="student_studentList" target="rightFrame">查询学生信息</a><i></i>
					</li>
					<li>
						<cite></cite><a href="classroom_toAddClassroom" target="rightFrame">添加班级</a><i></i>
					</li>
					<li>
						<cite></cite><a href="classroom_classroomList" target="rightFrame">查询所有班级</a><i></i>
					</li>
				</ul>
			</dd>
 -->
		</dl>

	</body>
</html>

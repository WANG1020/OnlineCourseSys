<%@page import="java.util.List"%>
<%@page import="note.vo.course"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="note.factory.DaoFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OnlineCourse-参与学习</title>
<link rel="stylesheet" type="text/css" href="../css/taParInStu.css">
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
</head>
<body class="wra1">
<% 
String name=(String)session.getAttribute("username");
String img=DaoFactory.getuserDaoInstance().userImg(name);
if(name==null){
	name="未登录";
}							
if(!name.equals("未登录")){%>
<div class="container-fluid">
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					 
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="navbar-nav">
							<li class="nav-item active">
									 <a class="nav-link" href="oc_home.jsp">首页<span class="sr-only">(current)</span></a>
								</li>
							<li class="nav-item">
								 <a class="nav-link" href="#">我的题库</a>
							</li>
						</ul>
						<form class="form-inline">
							<input class="form-control mr-sm-2" type="text" /> 
							<button class="btn btn-primary my-2 my-sm-0" type="submit">
								搜索
							</button>
						</form>
						
						<ul class="navbar-nav ml-md-auto">
						<img src=<%=img %> width="40px" height="40px">
							<li class="nav-item dropdown">
								 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"><%=name%>></a>
								<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
									 <a class="dropdown-item" href="#">我的主页</a> <a class="dropdown-item" href="#">个人资料设置</a>
									 <a class="dropdown-item" href="#">我的信息</a>
									<div class="dropdown-divider">
									</div> <a class="dropdown-item" href="login.html">退出</a>
								</div>
							</li>
							<li>
								<a class="nav-link" href="login.html">登录</a>
							</li>
							&nbsp;|&nbsp;
							<li>
								<a class="nav-link" href="register.jsp">注册</a>
							</li>
						</ul>
				</div>
			</nav>
		</div>
</div>
<br>
<%String course_name=(String)request.getParameter("course_name"); 
	List<course> list=new ArrayList<course>();
	list=DaoFactory.getcourseDaoInstance().studyCourse(course_name);
%>
<div style="background:#eeeeee;">
	<div class="row">
		<div class="col-md-12">
			 <!-- <span class="badge badge-default">Label</span> -->
			<div class="row">
				<div class="col-md-3">
					<img alt="course-img" src=<%=list.get(0).getImg() %> width="130px" height="90px"  />
				</div>
				<div class="col-md-6">
				<br>
					<h3>
						<%=list.get(0).getName() %>
					</h3>
				</div>
				<div class="col-md-2">
				<br>
					<a></a><button type="button" class="btn btn-outline-info">
						开始学习
					</button></a>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
</div>
<div class="divul">
		<ul class="ul1">
				<li class="li1"><a href="">课程章节</a></li>
				<li class="li1"><a href="">问答评论</a></li>
				<li class="li1"><a href="">同学笔记</a></li>
		</ul>
</div>
<div class="header">	
	<%=list.get(0).getDeintro()%>	
</div>
<%}else{%>
	<h4>页面不存在，请查看您的登录信息！</h4>
<%} %>
</body>
</html>
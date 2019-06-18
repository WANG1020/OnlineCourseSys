<!-- 用户的主页面 -->
<%@page import="java.util.List"%>
<%@page import="note.vo.course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="note.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../images/icon.ico"/>
<title>用户主页</title>
<link rel="stylesheet" type="text/css" href="../css/userHome.css">
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
</head>
<body class="wra1">
<%
	HttpSession hSession=request.getSession(true);
	String name=(String)hSession.getAttribute("username");
	String img=DaoFactory.getuserDaoInstance().userImg(name);
	if(name==null){
		name="未登录";
	}							
if(!name.equals("未登录")){%>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		<!-- 导航栏开始 -->
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						 
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="navbar-toggler-icon"></span>
						</button> 
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="navbar-nav">
								<li>
									<img src="../images/icon.png" width="170px" height="40px">
								</li>
								<li class="nav-item active">
									 <a class="nav-link" href="oc_home.jsp">首页<span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item">
									 <a class="nav-link" href="#">我的题库</a>
								</li>
							</ul>
							<form class="form-inline" action="../searchServlet?method=stu" method="post"> 
								<input class="form-control mr-sm-2" type="text" name="search-value"/> 
								<button class="btn btn-primary my-2 my-sm-0" type="submit">
									搜索
								</button>
							</form>
							
							<ul class="navbar-nav ml-md-auto">
							<img src=<%=img %> width="40px" height="40px">
								<li class="nav-item dropdown">
									 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"><%=name%>></a>
									<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
										 <a class="dropdown-item" href="userHome.jsp">我的主页</a> <a class="dropdown-item" href="ManAccoNum.jsp">账号管理</a>
										 <a class="dropdown-item" href="Info.jsp">我的信息</a>
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
			<!-- 导航栏结束 -->
			<!-- 主体内容开始 -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-8">
						<div class="divwra1-left" style="height:380px">
							<ul style="list-style:none;">
								<%String headimg=DaoFactory.getuserDaoInstance().userImg(name); %>
								<em class="infoLabel">个人信息</em>
								<li style="margin-left:12px;padding-top:10px"><img src=<%=headimg %> width=80px height=80px></li>
								<li>姓名：<span style="font-size:32px"><%=name %></span></li>
								<%String email=DaoFactory.getuserDaoInstance().getUserEmail(name); %>
								<li><p style="font-size:19px">Email邮箱：<%=email %></p></li>
								<%List<course> list=new ArrayList<course>(); 
								list=DaoFactory.getcourseDaoInstance().searchAllCourseByName(name); %>
								<li>选择的课程数：<%=list.size() %></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="divwra1-right"  style="overflow: hidden;">
						<h4 align="center">你的课程</h4>
						<div style="height:520px;width:104%;overflow:auto">
							<% for(int j=0;j<list.size();j++){%>
								<div class="divwra1-right-div1">
									<div class="card">
										<a href=containStu.jsp?course_name=<%=list.get(j).getName() %>>
										<img class="card-img-top" alt="kec1" src=<%=list.get(j).getImg() %> width="100px" height="80px" /></a>
										<div class="card-block">
											<h5 class="card-title" align="center">
												<%=list.get(j).getName() %>
											</h5>
											<p class="p1">
												<%=list.get(j).getInto() %>
											</p>
										</div>
									</div>
								</div>
								<br>
							<%}%>
						</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 主体内容结束 -->
		</div>
	</div>
</div>
<%}else{ %>
	<h4>页面不存在，请查看您的登录信息！</h4>
<%} %>
</body>
</html>
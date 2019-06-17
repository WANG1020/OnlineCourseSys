<%@page import="note.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师发布课程页面</title>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
<script type="text/javascript">
function checkImgSubmit() {
	if(	document.getElementById("headpor").value==""||document.getElementById("headpor").value.length<=0){
		alert("请选择课程封面！")
		return false;
	}
	return true;
}
</script>
<style>
.infoLabel {
    width: 85px;
    height: 35px;
    background: #008573;	
    line-height: 26px;
    text-align: center;
    font-size: 14px;
    color: white;
}
</style>
</head>
<body style="background:#f4f4f4;">
<%
	HttpSession hSession=request.getSession(true);
	String name=(String)hSession.getAttribute("username");
	String img=DaoFactory.getuserDaoInstance().userImg(name);
	if(name==null){
		name="未登录";
	}							
%>
<%if(!name.equals("未登录")){%>
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
							<form class="form-inline" action="../searchServlet?method=tea" method="post"> 
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
										 <a class="dropdown-item" href="userHome.jsp">我的主页</a> <a class="dropdown-item" href="ManAccoNum.jsp"s>账号管理</a>
										  <a class="dropdown-item" href=publishingCourses.jsp?name=<%=name%>>发布课程</a><a class="dropdown-item" href="releNotice.jsp">发布公告</a>
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
		</div>
	</div>
</div>
<%} %>
<br>
<center>
<div style="background:white;width:26%;height:300px">
<br>
<em class="infoLabel">发布课程</em>
<div style="padding-left:30px;">
<form action="../publishingCourses" method="post" enctype="multipart/form-data"  onsubmit="return checkImgSubmit();">
	<p>课程封面：<input type="file" name="headpor" id="headpor"></p>
	<p>课程名:<input type="text" id="courseName" name="courseName"></p>
	<%String username=request.getParameter("name"); %>
		<!-- 授课教师 --><input type="hidden" id="name" name="name" value=<%=username %>>
	<p>简介：<input type="text" id="intro" name="intro"></p>
	<p>详细介绍：<input type="text" id="Deintro" name="Deintro"></p>
	<input type="submit" value="发布课程">
</form>
</div>
</div>
</center>
</body>
</html>
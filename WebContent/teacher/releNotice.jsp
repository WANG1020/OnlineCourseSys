<%@page import="note.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布公告</title>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
<style>
.divwra1{
	margin-top:10px;
	margin-left:300px;
	background:white;
	width:40%;
	height:260px;
}
</style>
</head>
<body style="background:#f4f4f4;">
<%String name=(String)session.getAttribute("username");
String img=DaoFactory.getuserDaoInstance().userImg(name); %>
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
					 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"><%=name%></a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
						 <a class="dropdown-item" href="userHome.jsp">我的主页</a> <a class="dropdown-item" href="ManAccoNum.jsp">账号管理</a>
						 <a class="dropdown-item" href=publishingCourses.jsp?name=<%=name%>>发布课程</a><a class="dropdown-item" href="releNotice.jsp">发布公告</a>
						<a class="dropdown-item" href="Info.jsp">我的信息</a>
						<div class="dropdown-divider">
						</div> <a class="dropdown-item" href="login.html">退出</a>
					</div>
				</li>
				<li>
					<a class="nav-link" href="login.html">登录</a>
				</li>
				<p>|</p>
				<li>
					<a class="nav-link" href="register.jsp">注册</a>
				</li>
			</ul>
	</div>
</nav>
<br>
<div class="divwra1">
<form method="post" action="../releNoticeServlet">
  <div class="form-group row">
    <label for="text" class="col-4 col-form-label">课程名</label> 
    <div class="col-8">
      <input id="text" name="text" type="text" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="title" class="col-4 col-form-label">title</label> 
    <div class="col-8">
      <div class="input-group">
        <input id="title" name="title" placeholder="公告的标题" type="text" class="form-control"> 
        <div class="input-group-append">
          <div class="input-group-text">
            <i class="fa fa-align-justify"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="content" class="col-4 col-form-label">content</label> 
    <div class="col-8">
      <div class="input-group">
        <input id="content" name="content" placeholder="发布的内容" type="text" class="form-control"> 
        <div class="input-group-append">
          <div class="input-group-text">
            <i class="fa fa-align-right"></i>
          </div>
        </div>
      </div>
    </div>
  </div> 
  <input type="hidden" value=<%=name %> id="username" name="username">
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">提交</button>
    </div>
  </div>
</form>
</div>
</body>
</html>
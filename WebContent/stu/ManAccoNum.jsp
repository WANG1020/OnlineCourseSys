<!-- 账号中心 -->
<%@ page import="note.factory.DaoFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OnliceCourse-账号中心</title>
<link rel="stylesheet" type="text/css" href="../css/ManAccoNum.css" charset=UTF-8>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
<script>
/*  script函数*/
function checkImgSubmit() {
	if(	document.getElementById("file1").value==""||document.getElementById("file1").value.length<=0){
		alert("请选择你的头像！")
		return false;
	}
	return true;
}
function checkEmailSubmit() {
	if(	document.getElementById("email").value==""||document.getElementById("email").value.length<=0){
		alert("请填写邮箱！")
		return false;
	}
	return true;
}
function chceckPasswordNull(){
	if(document.getElementById("j-input-origin-pwd").value==""||document.getElementById("j-input-origin-pwd").value.length<=0){
		alert("请填写密码！")
		return false;
	}
	else if(document.getElementById("j-input-new-pwd").value==""||document.getElementById("j-input-new-pwd").value.length<=0){
		alert("请填写新密码！")
		return false;
	}
	else if(document.getElementById("j-input-new-repwd").value==""||document.getElementById("j-input-new-repwd").value.length<=0){
		alert("请填写确认密码！")
		return false;
	}else if(document.getElementById("j-input-new-pwd").value!=document.getElementById("j-input-new-repwd").value){
		alert("两次填写的密码不一样！！")
		return false;
	}
	return true;
}
</script>
</head>
<body class="wra1">
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
										 <a class="dropdown-item" href="userHome.jsp">我的主页</a> <a class="dropdown-item" href="ManAccoNum.jsp"s>账号管理</a>
										 <a class="dropdown-item" href="#">消息中心</a>
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
			<div class="row">
				<div class="col-md-8">
					<div class="tabbable" id="tabs-981611">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active show" href="#tab1" data-toggle="tab">基本信息</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="#tab2" data-toggle="tab">账号管理</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active divwra1" id="tab1">
								<%--基本信息开始 --%>
									<br>
									<em class="infoLabel">个人信息</em>
									<ul style="list-style:none;">
										<li class="clearfix">
											<div class="personPic">
												<form action="../UpdateUserImageServlet1" method="post" enctype="multipart/form-data" onsubmit="return checkImgSubmit();">
													<%String headimg=DaoFactory.getuserDaoInstance().userImg(name); %>
													<img width="130px" height="130px" src=<%=headimg %>>
													<input id="file1" class="awra1 " type="file" name="file1" size="20">
													<input  class="btn btn-info" type="submit" value="提交" name="img-submit">
												</form>
											</div>
										</li>
										<li class="clearfix">
											<div class="liwra1">
												<p><span>姓名：</span>&nbsp;&nbsp;<%=name %>&nbsp;&nbsp;<img src="../images/icon2.png"></p>
											</div>
										</li>
										<li class="clearfix">
											<div  class="liwra1">
											<form action="../updateEmailServlet" method="post" onsubmit="return checkEmailSubmit();">
												<p>邮箱：<input id="email" name="email" type="text">&nbsp;<input class="btn btn-outline-info" type="submit" value="绑定邮箱" name="submit-email"></p>
											</form>
											</div>
										</li>
									</ul>
								<%--基本信息结束 --%>
							</div>
							<div class="tab-pane divwra1" id="tab2">
								<!-- 账号管理开始 -->
									<br>
									<em class="infoLabel">修改密码</em>
									<form action="../updateUserPasswordServlet" method="post" onsubmit="return chceckPasswordNull();">
										<ul style="list-style:none;">
											<li class="clearfix">
												<span>密码：</span>
												<div class="inputwra">
													<input type="password" id="j-input-origin-pwd" name="j-input-origin-pwd">
												</div>
											</li>
											<li class="clearfix">
												<span>新密码：</span>
												<div class="inputwra">
												 	<input type="password" id="j-input-new-pwd" name="j-input-new-pwd">
												 </div>
											</li>
											<li class="clearfix">
												<span>确认密码：</span>
												<div class="inputwra">
												 	<input type="password" id="j-input-new-repwd" name="j-input-new-repwd">
												</div>
											</li>
											<li class="clearfix">
												<div class="inputwra1">
													<input  class="btn btn-info" type="submit" value="保存" name="img-submit">
												</div>
											</li>
										</ul>
									</form>
								<!-- 账号管理结束 -->
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
				</div>
			</div>
			</div>
		</div>
	</div>
</div>
<%}else{%>
	<h4>页面不存在，请查看您的登录信息！</h4>
<%} %>
</body>
</html>
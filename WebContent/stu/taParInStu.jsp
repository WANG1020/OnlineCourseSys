<!-- 参与学习 -->
<%@page import="note.vo.courseDir"%>
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
									 <a class="dropdown-item" href="userHome.jsp">我的主页</a> <a class="dropdown-item" href="ManAccoNum.jsp">账号管理</a>
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
					<img alt="course-img" src=<%=list.get(0).getImg() %> width="130px" height="90px">
				</div>
				<div class="col-md-6">
				<br>
					<h3>
						<%=list.get(0).getName() %>
					</h3>
				</div>
				<div class="col-md-2">
				<br>
				<form>
					<a href="#"><button type="button" class="btn btn-outline-info">
						开始学习
					</button>
				 	</a>
				</form>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
</div>
<div class="divul">
		<ul class="ul1">
				<li class="li1"><input id="k-div-1" style="border-style: none;background:white;" type="button" value="课程章节"></li>
				<li class="li1"><input id="k-div-2" style="border-style: none;background:white;" type="button" value="问答评论"></li>
		</ul>
</div>
<div class="header">	
	<%=list.get(0).getDeintro()%>	
</div>
<!-- 章节目录开始 -->
<div class="dir">
<%
int number=DaoFactory.getcourseDirDaoInstance().searchAllChapterNum(list.get(0).getName());
if(number!=0){%>
	<%for(int i=1;i<=number;i++){
	String chapterString=i+"-";
	List<courseDir> list2=new ArrayList<courseDir>(); 
	list2=DaoFactory.getcourseDirDaoInstance().searchByCourseName(list.get(0).getName(),chapterString);
%>
		<h4 style="padding-left:5px;">第<%=list2.get(0).getChapterId() %>章 &nbsp;&nbsp;<%=list2.get(0).getChapterName() %></h4>
		<ul style="list-style:none;">
			<%for(int j=0;j<list2.size();j++){ %>
				<li class="li2" style="height:40px;">
				<% if(!list2.get(j).getClassHourName().equals("练习题")){%>
				<a href="study.jsp?flag=0" style="color:black;">
					<p><img src="../images/1.png">
						<span style="padding-left:8px;"><%=list2.get(j).getClassHourId() %>&nbsp;<%=list2.get(j).getClassHourName() %></span>
						<img style="float:right;padding-right:12px;" src="../images/3.png">
					</p></a>
				<%}else{ %>
					<a href="study.jsp?flag=1" style="color:black;">
					<p><img src="../images/2.png">
						<span style="padding-left:8px;"><%=list2.get(j).getClassHourId() %>&nbsp;<%=list2.get(j).getClassHourName() %></span>
						<img  style="float:right;padding-right:12px;" src="../images/3.png">
					</p></a>
				<%} %>
				</li>
			<%}%>
		</ul>
<%} %>
<%}else{%>
<h4 style="height:300px">亲，老师还没有添加课时噢！</h4>
<%} %>
</div>
<!-- "章节目录"结束 -->

<%}else{%>
	<h4>页面不存在，请查看您的登录信息！</h4>
<%} %>
</body>
</html>
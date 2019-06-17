<%@page import="java.util.ArrayList"%>
<%@page import="note.vo.courseDir"%>
<%@page import="java.util.List"%>
<%@page import="note.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增删课时</title>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
<style type="text/css">
	.divwra1{
		margin-top:10px;
		margin-left:45px;
		background:white;
		width:45%;
		height:400px;
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
						  <a class="dropdown-item" href="publishingCourses.jsp">发布课程</a><a class="dropdown-item" href="#">发布公告</a>
						   <a class="dropdown-item" href="#">我的信息</a>
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


<div class="row">
	<div class="col-md-12">
		<div class="tabbable" id="tabs-716701">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active show" href="#tab1" data-toggle="tab">删除课程目录</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#tab2" data-toggle="tab">增加课程目录</a>
				</li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
				<div class="divwra1">
					<br>
					<form method="post" action="#">
					<table border=1px cellspacing=0>
						<tr>
							<th>课程名</th>
							<th>章节名</th>
							<th>课时名</th>
							<th>删除</th>
						</tr>
						
						<%
						String courseString=request.getParameter("name");
						int number=DaoFactory.getcourseDirDaoInstance().searchAllChapterNum(courseString);
						if(number!=0){
						for(int i=1;i<=number;i++){
							String chapterString=i+"-";
							List<courseDir> list2=new ArrayList<courseDir>(); 
							list2=DaoFactory.getcourseDirDaoInstance().searchByCourseName(courseString,chapterString);
							for(courseDir n:list2){
						%>
						<tr>
							<td><%=n.getCourseName() %></td>
							<td><%=n.getChapterId() %>&nbsp;&nbsp;<%=n.getChapterName() %></td>
							<td><%=n.getClassHourId() %>&nbsp;<%=n.getClassHourName() %></td>
							<td><a href="deleteDir.jsp?courseName=<%=n.getCourseName()%>&classHId=<%=n.getClassHourId() %>">删除</a></td>
							<%-- <td><input type="submit"  class="btn btn-outline-primary" value="删除"></td>
							<input type="hidden" id="courseName" name="courseName" value=<%=n.getCourseName() %>>
							<input type="hidden" id="classHId" name="classHId" value=<%=n.getClassHourId() %>> --%>
						</tr>
						<%}
						}
						} %>					
					</table>
					</form>
				</div>
				</div>
				<div class="tab-pane" id="tab2">
					<div class="divwra1">
						<br>
						<form method="post" action="../insertDir">
							<input type="hidden" name="courseName" id="courseName" value=<%=courseString %>>
							<p>章节id:&nbsp;<input type="text" id="chapterId" name="chapterId"></p>
							<p>章节名:&nbsp;<input type="text" id="chapterName" name="chapterName"></p>
							<p>课时id:&nbsp;<input type="text" id="classHId" name="classHId"></p>
							<p>课时名:&nbsp;<input type="text" id="classHName" name="classHName"></p>
							<p>课时资源:&nbsp;<input type="text" id="res" name="res"></p>
							<input type="submit"  value="发布课时">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
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
<link rel="shortcut icon" href="../images/icon.ico"/>
<title>搜索课程</title>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
</head>
<body style="background:#f4f4f4;">
<%
HttpSession hSession=request.getSession(true);
String flag=(String)hSession.getAttribute("serarch-success-fail");
if(flag.equals("success")){%>
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
					<form class="form-inline" action="../searchServlet?method=tea" method="post"> 
						<input class="form-control mr-sm-2" type="text" name="search-value"/> 
						<button class="btn btn-primary my-2 my-sm-0" type="submit">
							搜索
						</button>
					</form>
					
					<ul class="navbar-nav ml-md-auto">
					<%
						String name=(String)hSession.getAttribute("username");
						String img=DaoFactory.getuserDaoInstance().userImg(name);
						if(name==null){
							name="未登录";
						}							
					%>
					<img src=<%=img %> width="40px" height="40px">
						<li class="nav-item dropdown">
							 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"><%=name%>></a>
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
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-8"><!-- 搜索成功界面开始 -->
			<p style="background:white;width:100%;height:45px;margin-top:19px;font-size:30px;color:#d2d2d2">搜索到的内容</p>
			<%String search=(String)hSession.getAttribute("search");
			List<course> list=new ArrayList<course>(); 
				list=DaoFactory.getcourseDaoInstance().searchCourse(search); %>
			<% for(int j=0;j<list.size();j++){%>
				<div style="clear:both;width:90%;padding-left:20px;margin-top:10px">
					<div class="card">
						<a href=containStu.jsp?course_name=<%=list.get(j).getName() %>>
						<img class="card-img-top" alt="kec1" src=<%=list.get(j).getImg() %> width=100% height="120px" /></a>
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
		</div><!-- 搜索成功界面结束 -->
		<div class="col-md-4">
		<% if(!name.equals("未登录")){%>
				<%List<course> list1=new ArrayList<course>(); 
				list1=DaoFactory.getcourseDaoInstance().searchAllCourseByName(name);
				%>
				<h4 align="center" style="background:white;width:100%;height:45px;margin-top:19px;font-size:30px;color:#d2d2d2">继续学习</h4>
				<% for(int j=0;j<list1.size();j++){%>
					<div class="divwra1-right-div1">
						<div class="card">
							
							<img class="card-img-top" alt="kec1" src=<%=list1.get(j).getImg() %> width="100px" height="80px" />
							<div class="card-block">
								<h5 class="card-title" align="center">
									<%=list1.get(j).getName() %>
								</h5>
								<p class="p1">
									<%=list1.get(j).getInto() %>
								</p>
								<a class="btn btn-primary" style="margin-left:160px"  href=containStu.jsp?course_name=<%=list1.get(j).getName() %>>继续学习</a>
							</div>
						</div>
					</div>
					<br>
				<%}%>
			<%}else{ %>
				<%List<course> list1=new ArrayList<course>(); 
				list1=DaoFactory.getcourseDaoInstance().searchThrCourseByName();
				%>
				<h4 align="center" style="background:white;width:100%;height:45px;margin-top:19px;font-size:30px;color:#d2d2d2">推荐课程</h4>
				<% for(int j=0;j<list1.size();j++){%>
					<div class="divwra1-right-div1">
						<div class="card">
							
							<img class="card-img-top" alt="kec1" src=<%=list1.get(j).getImg() %> width="100px" height="80px" />
							<div class="card-block">
								<h5 class="card-title" align="center">
									<%=list1.get(j).getName() %>
								</h5>
								<p class="p1">
									<%=list1.get(j).getInto() %>
								</p>
								<a class="btn btn-primary" style="margin-left:160px"  href=containStu.jsp?course_name=<%=list1.get(j).getName() %>>继续学习</a>
							</div>
						</div>
					</div>
					<br>
				<%}%>
			<%} %>
		</div>
	</div>
</div>
<%}else{%>
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
					<form class="form-inline" action="../searchServlet" method="post"> 
						<input class="form-control mr-sm-2" type="text" name="search-value"/> 
						<button class="btn btn-primary my-2 my-sm-0" type="submit">
							搜索
						</button>
					</form>
					
					<ul class="navbar-nav ml-md-auto">
					<%
						String name=(String)hSession.getAttribute("username");
						String img=DaoFactory.getuserDaoInstance().userImg(name);
						if(name==null){
							name="未登录";
						}							
					%>
					<img src=<%=img %> width="40px" height="40px">
						<li class="nav-item dropdown">
							 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"><%=name%>></a>
							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
								 <a class="dropdown-item" href="userHome.jsp">我的主页</a> <a class="dropdown-item" href="ManAccoNum.jsp">账号管理</a>
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
	<!-- 导航栏结束 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
			<!-- 搜索失败界面开始 -->
			<p style="background:white;width:100%;height:45px;margin-top:19px;font-size:30px;color:#d2d2d2">搜索到的内容</p>
				<div style="clear:both;width:43%;padding-left:20px;margin-top:10px">
					<p style="color:red;font-size:40px;">亲，没有搜索到内容！！</p>
				</div>
				<br>
			<!-- 搜索失败界面结束 -->
			</div>
			<div class="col-md-4">
				<% if(!name.equals("未登录")){%>
				<%List<course> list1=new ArrayList<course>(); 
				list1=DaoFactory.getcourseDaoInstance().searchAllCourseByName(name);
				%>
				<h4 align="center" style="background:white;width:100%;height:45px;margin-top:19px;font-size:30px;color:#d2d2d2">继续学习</h4>
				<% for(int j=0;j<list1.size();j++){%>
					<div class="divwra1-right-div1">
						<div class="card">
							
							<img class="card-img-top" alt="kec1" src=<%=list1.get(j).getImg() %> width="100px" height="80px" />
							<div class="card-block">
								<h5 class="card-title" align="center">
									<%=list1.get(j).getName() %>
								</h5>
								<p class="p1">
									<%=list1.get(j).getInto() %>
								</p>
								<a class="btn btn-primary" style="margin-left:160px"  href=containStu.jsp?course_name=<%=list1.get(j).getName() %>>继续学习</a>
							</div>
						</div>
					</div>
					<br>
				<%}%>
			<%}else{ %>
				<%List<course> list1=new ArrayList<course>(); 
				list1=DaoFactory.getcourseDaoInstance().searchThrCourseByName();
				%>
				<h4 align="center" style="background:white;width:100%;height:45px;margin-top:19px;font-size:30px;color:#d2d2d2">推荐课程</h4>
				<% for(int j=0;j<list1.size();j++){%>
					<div class="divwra1-right-div1">
						<div class="card">
							
							<img class="card-img-top" alt="kec1" src=<%=list1.get(j).getImg() %> width="100px" height="80px" />
							<div class="card-block">
								<h5 class="card-title" align="center">
									<%=list1.get(j).getName() %>
								</h5>
								<p class="p1">
									<%=list1.get(j).getInto() %>
								</p>
								<a class="btn btn-primary" style="margin-left:160px"  href=containStu.jsp?course_name=<%=list1.get(j).getName() %>>继续学习</a>
							</div>
						</div>
					</div>
					<br>
				<%}%>
			<%} %>
			</div>
		</div>
	</div>
<% }
%>

</body>
</html>
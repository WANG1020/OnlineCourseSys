<%@page import="java.util.List"%>
<%@page import="note.vo.note"%>
<%@page import="java.util.ArrayList"%>
<%@page import="note.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的信息</title>
<link rel="stylesheet" type="text/css" href="../css/info.css" charset=UTF-8>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
</head>
<body class="wra1">
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
<br>
	<span class="msgCenter_sp  fl">消息中心</span>
	<%List<note> list=new ArrayList<note>();
	list=DaoFactory.getnoteDaoInstance().findAllNotice(name);
	System.out.print("公告的长度为"+list.size());%>
	<div id="Whole_li" class="msg_ReadInfo clearfix">
	<ul id="allMessageUl" class="msg_ReadInfoList">
	<%if(list.size()!=0){
		for(int i=0;i<list.size();i++){
	%>
	<%String imgString=DaoFactory.getuserDaoInstance().userImg(list.get(i).getAuthor()); %>
			<li class="msg">
			<span class="msgPic">
				<img src=<%=imgString %> width="60px" height="60px">
				<span style="padding-left:12px;font-size:22px;"><%=list.get(i).getAuthor() %></span></p>
			</span>
			<div class="msgDetailBox">
			<p class="det_teachNm"><%=list.get(i).getCourse_name() %></p>
			<p class="detailsCont">
			<%if(list.get(i).getTitle()!=null){ %>
				<font color="#a5a5a5">title</font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#666666"><%=list.get(i).getTitle() %></font><br>
			<%} %>
			<font color="#a5a5a5">content</font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="#666666"><%=list.get(i).getContent() %></font></p>
		<%}
	} %>
				</ul>
		</div>
</div>
</body>
</html>
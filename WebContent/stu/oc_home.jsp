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
<title>OnlineCourse-首页</title>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" type="text/css" href="../css/oc_home.css">
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-12">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						 
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="navbar-toggler-icon"></span>
						</button> <a class="nav-link" href="#">任务中心</a>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="navbar-nav">
								<li class="nav-item active">
									 <a class="nav-link" href="#">免费课程 <span class="sr-only">(current)</span></a>
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
							<%
								HttpSession hSession=request.getSession(true);
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
			<div class="row">
				<div class="col-md-4">
					<div id="card-616186">
						<div class="card">
							<div class="card-header">
								 <a class="card-link" data-toggle="collapse" data-parent="#card-616186" href="#card-element-278042">C语言入门</a>
							</div>
							<div id="card-element-278042" class="collapse">
								<div class="card-body">
									简介：本C语言教程从以下几个模块来贯穿主要知识点：初始C程序、数据类型、运算符、语句结构、函数和数组。每个阶段都配有练习题同时提供在线编程任务。希望通过本教程帮助C语言入门学习者迅速掌握程序逻辑并开始C语言编程。
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								 <a class="collapsed card-link" data-toggle="collapse" data-parent="#card-616186" href="#card-element-462447">玩转算法和数据结构</a>
							</div>
							<div id="card-element-462447" class="collapse">
								<div class="card-body">
									任何时候学习算法都不晚，而且越早越好，这么多年，你听说过技术过时，什么时候听说过算法过时，不仅没有过时，因为机器学习、大数据的要求，算法变得越来越重要了
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								 <a class="collapsed card-link" data-toggle="collapse" data-parent="#card-616186" href="#card-element-462347">C++远征之起航篇</a>
							</div>
							<div id="card-element-462347" class="collapse">
								<div class="card-body">
									简介：本教程是C++的初级教程，是在C语言基础上的一个延伸，讲述了包括新增数据类型、命名空间等内容，最后通过一个通俗易懂的例子将所述知识点融会贯通，以达到知识灵活运用，最终得以升华的目的。
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="carousel slide" id="carousel-923781">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-923781" class="active">
							</li>
							<li data-slide-to="1" data-target="#carousel-923781">
							</li>
							<li data-slide-to="2" data-target="#carousel-923781">
							</li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
							<a href="../images/c.jpg" data-lightbox="example-set" data-title="Click the right half of the image to move forward.">
							<img class="d-block w-100" alt="Carousel Bootstrap First" src="../images/c.jpg" width="260px" height="200px"/>
								<div class="carousel-caption">
									<h4>
										C语言入门
									</h4>
									<p>
										C语言入门视频教程，带你进入编程世界的必修课-C语言
									</p>
								</div></a>
							</div>
							<div class="carousel-item">
							<a href="../images/sf.jpg" data-lightbox="example-set" data-title="Or press the right arrow on your keyboard.">
								<img class="d-block w-100" alt="Carousel Bootstrap Second" src="../images/sf.jpg" width="260px" height="200px"/>
								<div class="carousel-caption">
									<h4>
										玩转算法和数据结构
									</h4>
									<p>
										ACM获奖者亲授算法面试基础，C++讲解，配套完整Java代码，培养算法思维，修炼编程内功
									</p>
								</div></a>
							</div>
							<div class="carousel-item">
							<a href="../images/c++.jpg" data-lightbox="example-set" data-title="Or press the right arrow on your keyboard.">
								<img class="d-block w-100" alt="Carousel Bootstrap Third" src="../images/c++.jpg" width="260px" height="200px"/>
								<div class="carousel-caption">
									<h4>
										C++远征之起航篇
									</h4>
									<p>
										C++亮点尽在其中，本课程是在C语言基础上的一个延伸，得以升华
									</p>
								</div></a>
							</div>
						</div> <a class="carousel-control-prev" href="#carousel-923781" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-923781" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</br></br>
<%List<course> list=new ArrayList<course>(); 
	list=DaoFactory.getcourseDaoInstance().checkCourse();
	int size=list.size();
	int container_flu=size/4;
	int surplus_record=size%4;
	
%>
<div class="wrapper1">	
	<h4 align="center"><em>其他课程</em></h4>	
	<%if(surplus_record==0){
		for(int i=0;i<container_flu;i++){%>
		
			<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
			<% for(int j=0;j<size;j++){%>
				<div class="col-md-3">
						<div class="card">
							<img class="card-img-top" alt="kec1" src=<%=list.get(j).getImg() %> width="294px" height="98px" />
							<div class="card-block">
								<h5 class="card-title">
									<%=list.get(j).getName() %>
								</h5>
								<p style="width: 98%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
									<%=list.get(j).getInto() %>
								</p>
								<p align="center">
									<a class="btn btn-primary" href="#">参与学习</a> 
								</p>
							</div>
						</div>
					</div>
			<%}%>
					</div>
				</div>
			</div>
			</div>
		<%}
	}else{
		for(int i=0;i<container_flu+1;i++){%>
		<br>
			<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
			<% for(int j=0;j<size;j++){%>
				<div class="col-md-3">
						<div class="card">
							<img class="card-img-top" alt="kec1" src=<%=list.get(j).getImg() %> width="294px" height="98px" />
							<div class="card-block">
								<h5 class="card-title">
									<%=list.get(j).getName() %>
								</h5>
								<p style="width: 98%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
									<%=list.get(j).getInto() %>
								</p>
								<p align="center">
									<a class="btn btn-primary" href="#">参与学习</a> 
								</p>
							</div>
						</div>
					</div>
			<%}%>
					</div>
				</div>
			</div>
			</div>
		<%}
	}
	
	%>
	<!-- 一个container-fluid开始 -->
	<%-- <%-- <div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-3">
						<div class="card">
							<img class="card-img-top" alt="kec1" src=<%=list.get(0).getImg() %> width="294px" height="98px" />
							<div class="card-block">
								<h5 class="card-title">
									<%=list.get(0).getName() %>
								</h5>
								<p style="width: 98%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
									<%=list.get(0).getInto() %>
								</p>
								<p align="center">
									<a class="btn btn-primary" href="#">参与学习</a> 
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card">
							<img class="card-img-top" alt="kec2" src=<%=list.get(1).getImg() %> width="294px" height="98px" />
							<div class="card-block">
								<h5 class="card-title">
									<%=list.get(1).getName() %>
								</h5>
								<p style="width: 98%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
									<%=list.get(1).getInto() %>
								</p>
								<p align="center">
									<a class="btn btn-primary" href="#">参与学习</a> 
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card">
							<img class="card-img-top" alt="kec3" src=<%=list.get(2).getImg() %> width="294px" height="98px" />
							<div class="card-block">
								<h5 class="card-title">
									<%=list.get(2).getName() %>
								</h5>
								<p style="width: 98%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" >
									<%=list.get(2).getInto() %>
								</p>
								<p align="center">
									<a class="btn btn-primary" href="#">参与学习</a> 
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="card">
							<img class="card-img-top" alt="kec3" src=<%=list.get(3).getImg() %> width="294px" height="98px" />
							<div class="card-block">
								<h5 class="card-title">
									<%=list.get(3).getName() %>
								</h5>
								<p style="width: 98%;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
									<%=list.get(3).getInto() %>
								</p>
								<p align="center">
									<a class="btn btn-primary" href="#">参与学习</a> 
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> --%>
		<!-- 一个container-fluid结束 -->
	</div>
</div>
<script type="text/javascript">
$('.carousel').carousel({
	interval:1000,
	pause:false
})
</script>
</body>
</html>
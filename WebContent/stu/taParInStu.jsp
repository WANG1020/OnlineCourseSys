<!-- 继续学习 -->
<%@page import="note.vo.courseDir"%>
<%@page import="java.util.List"%>
<%@page import="note.vo.note"%>
<%@page import="note.vo.course"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="note.factory.DaoFactory" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OnlineCourse-继续学习</title>
<link rel="stylesheet" type="text/css" href="../css/containStu.css" charset=UTF-8>
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
						<form class="form-inline" action="../searchServlet?method=stu" method="post"> 
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
					<p>任课教师：<%=list.get(0).getTeacher() %></p>
				</div>
				<div class="col-md-2">
				<br>
					<form action="../startStudyServlet?method=stutar" method="post">
						<a><button type="submit" class="btn btn-outline-info">
							开始学习
						</button></a>
						<input type="hidden" id="username" name="username" value=<%=name %>>
						<input type="hidden" id="courseName" name="courseName" value=<%=list.get(0).getName() %>>
					</form>
				</div>
				<div class="col-md-1">
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8">
			<div class="tabbable" id="tabs-981611">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" href="#tab1" data-toggle="tab">课程章节</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#tab2" data-toggle="tab">问答评论</a>
					</li>
				</ul>
				<div class="head">	
						<%=list.get(0).getDeintro()%>	
				</div>
				<br>
				<div class="tab-content">
					<div class="tab-pane active divwra"  id="tab1">
						<!-- 章节目录开始 -->
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
									<a href="study.jsp?flag=0?course_id=<%=list2.get(j).getClassHourId()  %>?course_name=<%=list2.get(j).getClassHourName() %>" style="color:black;">
										<p><img src="../images/1.png">
											<span style="padding-left:8px;"><%=list2.get(j).getClassHourId() %>&nbsp;<%=list2.get(j).getClassHourName() %></span>
											<img style="float:right;padding-right:12px;" src="../images/3.png">
										</p></a>
									<%}else{ %>
										<a href="study.jsp?flag=1?course_id=<%=list2.get(j).getClassHourId()  %>?course_name=<%=list2.get(j).getClassHourName() %>" style="color:black;">
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
							<!-- "章节目录"结束 -->
					</div>
					<div class="tab-pane" id="tab2">
						<!-- 问答评论开始 -->
							<%for(int i=1;i<=number;i++){
								String chapterString=i+"-";
								int chaNum=DaoFactory.getcourseDirDaoInstance().searchClaHouNum(list.get(0).getName() , chapterString);
								for(int j=1;j<=chaNum;j++){/* 例如第一章有五个课时 */
									/* 比如1-1,2-1，1-2 */
									String chaString=chapterString+j;
									/* 1-1到第一章结束的问题，这个开始是1-1的所有问题 */
									List<note> noteList=new ArrayList<note>(); 
									noteList=DaoFactory.getnoteDaoInstance().searchQueByName(list.get(0).getName(), chaString);
									List<note> noteList1=new ArrayList<note>(); 
									for(int k=0;k<noteList.size();k++){
										if(noteList.size()!=0){
											noteList1=DaoFactory.getnoteDaoInstance().findQueAnsByTitle(noteList.get(k).getTitle(), chaString);
										%>
										<%String imgString=DaoFactory.getuserDaoInstance().userImg(noteList.get(k).getAuthor()); %>
											<div class="divwra1">
												<div class="imgdiv">
													<p><img src=<%=imgString %> width="50px" height="50px">
													<span style="padding-left:12px;font-size:22px;"><%=noteList.get(k).getAuthor() %></span></p>
												</div>
												<div class="quediv">
													<p style="padding-left:90px;padding-top:23px;font-size:18px;"><%=noteList.get(k).getTitle() %></p>
													<%if(noteList.get(k).getContent()!=null){ %>
														<p style="padding-left:90px;font-size:15px;"><%=noteList.get(k).getContent() %></p>
													<%} %>
												</div>
												<div class="footerdivd">
													<p><%=noteList.get(k).getCourse_name() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<%=noteList.get(k).getClassHour_name() %></p>
												</div>
											</div>
										<%}
									}%>
								<%}
								}%>
								<%List<note> noteList3=new ArrayList<note>();
								noteList3=DaoFactory.getnoteDaoInstance().findDirQue(list.get(0).getName());
								for(int j=0;j<noteList3.size();j++){
								String imgString=DaoFactory.getuserDaoInstance().userImg(noteList3.get(j).getAuthor());
								%>
									<div class="divwra1">
										<div class="imgdiv">
											<p><img src=<%=imgString %> width="50px" height="50px">
											<span style="padding-left:12px;font-size:22px;"><%=noteList3.get(j).getAuthor() %></span></p>
										<p></p>
										</div>
										<div class="quediv">
										<p style="padding-left:90px;padding-top:23px;font-size:18px;"><%=noteList3.get(j).getTitle() %></p>
											<%if(noteList3.get(j).getContent()!=null){ %>
												<p style="padding-left:90px;font-size:15px;"><%=noteList3.get(j).getContent() %></p>
											<%} %>
										</div>
										<div class="footerdivd">
										<p><%=noteList3.get(j).getCourse_name() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<%=noteList3.get(j).getClassHour_name() %></p>
										</div>
									</div>
								<%} %>
								<div class="row">
									<div class="col-md-6">
										<form method="post" action="../updateNoteServlet">
										  <div class="form-group row">
										    <label for="text" class="col-4 col-form-label">title</label> 
										    <div class="col-8">
										      <div class="input-group">
										        <div class="input-group-prepend">
										          <div class="input-group-text">
										            <i class="fa fa-align-center"></i>
										          </div>
										        </div> 
										        <input id="title" name="title" type="text" class="form-control">
										        <input type="hidden" id="class_name" value=<%=list.get(0).getName() %> name="class_name">
										        <input type="hidden" id="course_name" name="course_name" value=<%=list.get(0).getName() %>>
										        <input type="hidden" id="author" name="author" value=<%=name%>>
										      </div>
										    </div>
										  </div>
										  <div class="form-group row">
										    <label for="textarea" class="col-4 col-form-label">content</label> 
										    <div class="col-8">
										      <textarea id="content" name="content" cols="40" rows="5" class="form-control"></textarea>
										    </div>
										  </div> 
										  <div class="form-group row">
										    <div class="offset-4 col-8">
										      <button name="submit" type="submit" class="btn btn-primary">提交</button>
										    </div>
										  </div>
										</form>
									</div>
									<div class="col-md-4">
									</div>
								</div>
						<!-- 问答评论结束 -->
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
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
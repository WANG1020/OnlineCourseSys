<%@page import="note.vo.courseDir"%>
<%@page import="note.vo.course"%>
<%@page import="java.util.ArrayList"%>
<%@page import="note.vo.note"%>
<%@page import="java.util.List"%>
<%@page import="note.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OnlineCourse-学习界面</title>
<link rel="stylesheet" type="text/css" href="../css/study.css" charset=UTF-8>
<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../dist/css/lightbox.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"><!--内置图标，未使用，待完成  -->
<script type="text/javascript" src="../js/jquery-3.4.0.js"></script>
<script type="text/javascript" src="../bootstrap4/js/bootstrap.min.js"></script>
<script src="../dist/js/lightbox-plus-jquery.min.js"></script>
</head>
<body class="ba1">
<%String name=(String)session.getAttribute("username");
String img=DaoFactory.getuserDaoInstance().userImg(name); 
String flag=request.getParameter("flag");
String classHId=request.getParameter("course_id");
String courseName=request.getParameter("course_name");%>
<div class="container-fluid">
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
	<div class="row">
		<div class="col-md-7">
		<%
		List<courseDir> dirlist=new ArrayList<courseDir>();
		dirlist=DaoFactory.getcourseDirDaoInstance().searchByCourseName(courseName, classHId);
		%>
		<%if(flag.equals("0")||flag=="0"){ %>
			<video src=<%=dirlist.get(0).getResources() %> autoplay="autoplay" controls="controls" width="760px" height="600px">
			</video>
		<%} 
		if(flag.equals("1")||flag=="1"){
		%>
			<img src=<%=dirlist.get(0).getResources() %> width="760px" height="600px">
		<%} %>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-7">
	<h4 style="background:white;text-align:center;">评论.问答</h4>
		<%
		List<course> list=new ArrayList<course>();
		list=DaoFactory.getcourseDaoInstance().studyCourse(courseName);
		int number=DaoFactory.getcourseDirDaoInstance().searchAllChapterNum(list.get(0).getName());
		for(int i=1;i<=number;i++){
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
				<div class="col-md-10">
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
			</div>
	</div>
</div>
</body>
</html>
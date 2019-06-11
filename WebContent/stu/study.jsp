<%@page import="java.util.List"%>
<%@page import="note.factory.DaoFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-7">
		
		</div>
		<div class="col-md-5">
		<%
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
		</div>
	</div>
</div>
</body>
</html>
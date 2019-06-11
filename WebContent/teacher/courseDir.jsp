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
<title>Insert title here</title>
</head>
<body style="background:#f4f4f4;">
<center>
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
</center>
</body>
</html>
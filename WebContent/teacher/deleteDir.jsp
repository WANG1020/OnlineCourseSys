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
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

String coursename=request.getParameter("courseName");
String classHid=request.getParameter("classHId");
System.out.println("coursename为"+coursename);
System.out.println("classHid为"+classHid);
try {
	DaoFactory.getcourseDirDaoInstance().deleteDir(coursename, classHid);%>
	<script language=javascript>
	alert('删除成功！！');
	window.location.href='containStu.jsp?course_name=<%=coursename%>';</script>
<%} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</body>
</html>
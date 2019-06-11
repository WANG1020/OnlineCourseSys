<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师发布课程页面</title>
<script type="text/javascript">
function checkImgSubmit() {
	if(	document.getElementById("headpor").value==""||document.getElementById("headpor").value.length<=0){
		alert("请选择课程封面！")
		return false;
	}
	return true;
}
</script>
<style>
.infoLabel {
    width: 85px;
    height: 35px;
    background: #008573;	
    line-height: 26px;
    text-align: center;
    font-size: 14px;
    color: white;
}
</style>
</head>
<body style="background:#f4f4f4;">
<center>
<div style="background:white;width:26%;height:300px">
<br>
<em class="infoLabel">发布课程</em>
<div style="padding-left:30px;">
<form action="../publishingCourses" method="post" enctype="multipart/form-data"  onsubmit="return checkImgSubmit();">
	<p>课程封面：<input type="file" name="headpor" id="headpor"></p>
	<p>课程名:<input type="text" id="courseName" name="courseName"></p>
	<%String username=request.getParameter("name"); %>
		<!-- 授课教师 --><input type="hidden" id="name" name="name" value=<%=username %>>
	<p>简介：<input type="text" id="intro" name="intro"></p>
	<p>详细介绍：<input type="text" id="Deintro" name="Deintro"></p>
	<input type="submit" value="发布课程">
</form>
</div>
</div>
</center>
</body>
</html>
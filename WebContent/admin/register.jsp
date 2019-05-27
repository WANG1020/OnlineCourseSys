<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OnlineCourse-注册界面</title>
<link rel="stylesheet" type="text/css" href="../css/register.css">
<script>
function check_admin(form)
{
	if(form.username.value=="")
	{
		alert("请输入用户账号!");
		form.name.focus();
		return false;
	}
	if(form.password1.value=="")
	{
		alert("请输入用户密码!");
		form.password.focus();
		return false;
	}
	if (form.password2.value=="")
	{
		alert("请确认密码!");
		form.password2.focus();
		return false;
	}
	if(form.password1.value!=form.password2.value){
		alert("密码不同，请重新输入!");
		form.password2.focus();
		return false;
	}
	return true;
}
function showImg() {
	var simgsrc=document.all.head.value;
	console.log(simgsrc);
	document.getElementById('Image').src=simgsrc;
	var imgsrc=document.getElementById('imgsrc');
	imgsrc.value=simgsrc; 
}
</script>
</head>
<body>
<div class="header">
	<h4>OnlineCourse在线学习-注册界面</h4>
</div>
<div class="div1">
<form  action="../registerServlet" method="post" onSubmit="return check_admin(this)">
	<table rules=none cellspacing=0 border="2px" align="center" width="240px" height="300px" cellspacing="0" cellpadding="0">
	<tr>
		<th bgcolor=#dbdbdb colspan="6" align="center">注册</th>
	</tr>
	<tr>
		<td align="center" colspan="4">
		&nbsp;<input type="text" name="username"  placeholder="用户名">*
		</td>
	</tr>
	<tr>
		<td align="center" colspan="4"><select id="head" onchange="showImg();">
			 <option value="1" style="color: #b6b6b6" disabled selected>请选择头像</option>
			<option value="../images/faces/f1.png">Image 1</option>
			<option value="../images/faces/f2.png">Image 2</option>
			<option value="../images/faces/f3.png">Image 3</option>
			<option value="../images/faces/f4.png">Image 4</option>
			<option value="../images/faces/f5.png">Image 5</option>
			<option value="../images/faces/f6.png">Image 6</option>
			<option value="../images/faces/f7.png">Image 7</option>
			<option value="../images/faces/f8.png">Image 8</option>
			<option value="../images/faces/f9.png">Image 9</option>
			<option value="../images/faces/f10.png">Image 10</option>
		</select>
			<img id="Image"  src="../images/faces/f1.png" width="50px" height="50px">
		</td>
	</tr>
	<tr>
		<td align="center" colspan="4">&nbsp;<input type="password" name="password1"  placeholder="密码">*</td>
	</tr>
	<tr>
		<td align="center" colspan="2">&nbsp;<input type="password" name="password2" placeholder="确认密码">*</td>
	</tr>
	<tr>
		<td align="center" colspan="2">&nbsp;<input type="text" name="email" placeholder="输入你的邮箱">*</td>
	</tr>
	<tr><td><input type="hidden" id="imgsrc" name="imgsrc" value="img/头像9.png"></td>
		<td><input type="hidden" id="flag" name="flag" value="2"></td>
	</tr>
	<tr>
		<td colspan="4" align="center">
		<input type="submit" value="提交">
		&nbsp;<input type="reset" value="重填" >
		&nbsp;<a href="login.html">点此登录！</a>
		</td>
	</tr>
	</table>
</form>
</div>
<div class="footer-box">
	<p align="center">
                    <script type="text/javascript">
                        document.write("©2019 - "
                        + new Date().getFullYear()
                        + " 南京工业职业技术学院-软件1711-王喜-大二web实训项目-在线课程平台开发");//update 自动更新的年份
                    </script>
     </p>
</div>
</body>
</html>
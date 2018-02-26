<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>库存物资管理系统登录界面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<style type="text/css">  
td{color: white;}
    .text {  
        
    }  
    .userRed {  
       border: 1px solid red;  
    }  
    </style>
<script>
$(document).ready(function(){

	  $("#denglu").click(function(){

		  var islogin=false;
		  var name=document.getElementById('name');
		  var password=document.getElementById('password');
		    if(name.value!='15251102241')
			    {
                      name.className='userRed';
                      alert('账号错误');
                      
			    }else{
                            name.className='text';
                            if(password.value!='123456')
                                {
                                   password.classname='userRed';
                                   alert('密码错误');
                                }
                            else
                                {
                                   password.classname='userRed';
                                   window.location.href="index";
                                }

				    }
          		
		  });
	   
		  $("#clear").click(function(){
			  document.getElementById('password').value='';
			  document.getElementById('name').value='';
	});
});


</script>
</head>
<body style="position: static;background: black;">
<center>
<h1 style="font-size: 30px;margin-top: 50px;color: white;">库存物资管理系统登录</h1>
</center>
<div style="margin-left: 450px;margin-top: 50px">
<div style="width: 120px;height: 120px;display: inline;float: left;">
<img src="img/touxiang.jpg" style="width: 100px;height: 100px" />
</div>
<div style="margin-left: 0px;float: left;display: inline;">
<table width="300px" height="200px" border="2" >
<tr  >
<td >
&nbsp;&nbsp;&nbsp;输入用户：<input type="text" id="name" name="username" size="20" style="margin-bottom: 5px"/><br>
&nbsp;&nbsp;&nbsp;输入密码：<input type="password" id="password" name="password" size="20" style="margin-bottom: 15px"/><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="denglu" value="登录" size="12"/>&nbsp;&nbsp; 
<input type="button" id="clear"  value="清空" size="12"/>
</td>
</tr>
</table>
</div>
</div>
</body>
</html>
<%@page import="sun.print.resources.serviceui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="java.sql.*" %>
  
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<style>
ul li{text-decoration: none;list-style-type:none;margin-bottom: 10px}
body{color: white;}
a{text-decoration: none;color: white;}
</style>

<script>
$(document).ready(function () {
	 $("#search").click(function(){
		    $("#stype").slideToggle("slow");
		  });
	 $("#outmanage").click(function(){
		    $("#outtype").slideToggle("slow");
		  });
	 $("#inmanage").click(function(){
		    $("#intype").slideToggle("slow");
		  });
	 $("#outcount").click(function(){
		    $("#out").slideToggle("slow");
		  });
	 $("#incount").click(function(){
		    $("#in").slideToggle("slow");
		  });
});

</script>
</head>
<body style="position: static;background: black;">

<div id="page" style="position: relative;margin-left: 250px;">
<div id="title" style="margin-top: 50px;margin-left: 400px;">

<div style="font-size: 30px;font-weight: bold;">库存物资管理系统</div>

</div>
<div id="daohan" style=";margin-top: 50px;width:230px;margin-right:20px; font-weight: bold;float: left;border: 5px solid gray">
<ul>
<li>
<a id="search">商品查询</a>
<ul id="stype" style="display:none">
<li><a href="search?type=name">名称</a></li>
<li><a href="search?type=outtime">出库日期</a></li>
<li><a href="search?type=intime">入库日期</a></li></ul>
</li>

<li>
<a id="outmanage">出库单据的管理</a>
<ul id="outtype" style="display:none">
<li><a href="manage?type=out&action=add">添加</a></li>
<li><a href="manage?type=out&action=change">修改</a></li>
<li><a href="manage?type=out&action=delete">删除</a></li>
</ul>
</li>
<li>
<a id="inmanage">入库单据的管理</a>
<ul id="intype" style="display:none">
<li><a href="manage?type=in&action=add">添加</a></li>
<li><a href="manage?type=in&action=change">修改</a></li>
<li><a href="manage?type=in&action=delete">删除</a></li>
</ul>
</li>
<li>
<a id="outcount">出库商品数量的统计</a>
<ul id="out" style="display:none">
<li><a href="count?type=out&action==day">日</a></li>
<li><a href="count?type=out&action=mon">月</a></li>
<li><a href="count?type=out&action=year">年</a></li>
</ul>
</li>
<li>
<a id="incount">入库商品数量的统计</a>
<ul id="in" style="display:none">
<li><a href="count?type=in&action==day">日</a></li>
<li><a href="count?type=in&action=mon">月</a></li>
<li><a href="count?type=in&action=year">年</a></li>
</ul>
</li>
</ul>
</div>
<div id="show" style="border: 10px solid gray;width: 550px;height:400px; margin-top: 50px;float: left;background: #c6c6c4">
<div style="color:black;">
<h1 style="margin-left: 60px">欢迎进入库存物资管理系统</h1>
<div style="white-space:pre;font-size: 20px;font-weight: bold;">
     姓名：张乐齐
     学号：15251102241
     班级：15计算机科学与技术2班
</div>

</div>
</div>
</div>

</body>
</html>
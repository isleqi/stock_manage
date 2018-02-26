<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<style>
ul li{text-decoration: none;list-style-type:none;margin-bottom: 10px}
body{color: white;}
a{text-decoration: none;color: white;}
.inin{margin-bottom: 5px}
#product{width:100%; border-collapse:collapse;} 
#product th{background-color: #b2b2b1;}
#product th,#product td{ font-size:5px;
  border:1px solid black;
  padding:3px 7px 2px 7px;}

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
<script>


       function submit( _type,action){
    	var time;
    	  if(action=='day')
        	time=$("#day").val();
    	  else if(action=='mon')
               time=$("#mon").val();
       	  
    	  else
                 time=$("#year").val();
         	  
        var json={'type':_type,'action':action,'time':time};
        $.ajax({
            
                 data:json,
                 url:"count_time",
                 dataType: "json",
                 type:"post",
                 success:function(data){
                     var result=JSON.stringify(data);
                           alert(result);
                           $("#result").text(result);
                          
                     }


            });
        $.ajax({
            
            data:json,
            url:"get_count_info",
            dataType: "json",
            type:"post",
            success:function(data){
               display(data);
                     
                }


       });
       	
           }
   
       
     
     
       function display(data) {
           //alert("!!!!!!!");
   	    ///alert(JSON.stringify(data));
          var danju=data;
       
          var table=document.getElementById("product");
          table.style.display='';
         
         
          var childs = table.childNodes;  
          for(var i=childs.length-1; i>=2; i--){      
              table.removeChild(childs.item(i));      
          }   
        for(var i=0;i<danju.length;i++){
                var p=document.createElement("tr");
                var td=document.createElement("td");
                var tmp=danju[i].dnum;
                td.innerHTML=tmp;
                p.appendChild(td);
                td=document.createElement("td");
                
                tmp=danju[i].product.pnum;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].product.pname;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].product.modle;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].product.size;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].product.factory;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].snum;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].num;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
               
                tmp=danju[i].units;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].person;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                
                tmp=danju[i].tel;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].date;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                
                tmp=danju[i].time;
                td=document.createElement("td");
                td.innerHTML=tmp;
                p.appendChild(td);
                table.appendChild(p);
              
         
        }
         
      }   
</script>
</head>
<body style="position: static;background: black;">

<div id="page" style="position: relative;margin-left: 100px;">
<div id="title" style="margin-top: 50px;margin-left: 550px;">

<div style="font-size: 30px;font-weight: bold;">库存物资管理系统</div>

</div>
<div id="daohan" style=";margin-top: 50px;width:230px;margin-right:20px; font-weight: bold;float: left;border: 5px solid gray">
<ul>
<li>
<a id="search">商品查询</a>
<ul id="stype" style="display:none">
<li><a href="search?type=name">名称</a></li>
<li><a href="search?type=outtime">出库日期</a></li>
<li><a href="search?type=intime">入库日期</a></li>
</ul>
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
<li><a href="count?type=out&action=day">日</a></li>
<li><a href="count?type=out&action=mon">月</a></li>
<li><a href="count?type=out&action=year">年</a></li>
</ul>
</li>
<li>
<a id="incount">入库商品数量的统计</a>
<ul id="in" style="display:none">
<li><a href="count?type=in&action=day">日</a></li>
<li><a href="count?type=in&action=mon">月</a></li>
<li><a href="count?type=in&action=year">年</a></li>
</ul>
</li>
</ul>
</div>
<div id="show" style="border: 10px solid gray;width: 900px;height:400px; margin-top: 50px;float: left;background: #c6c6c4">
<div style="color:black;">

<%! String type;
    String action;
    String b="";
	String c="";
%>
<%
    type=request.getParameter("type");
    action=request.getParameter("action");
    String a="<div style=\"margin-top: 10px;margin-left: 250px\">";
	out.write(a);
    if(action.equals("day")){
    	if(type.equals("out")){
    		b="出库单位";
    		c="提货人";
    	}
    	else{
    		b="入库单位";
    		c="送货人";
    	}
    	out.write("输入日：<input class=\"inin\" type=\"text\" id=\"day\"/>");
    	out.write("&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"')\" value=\"确认\" />");
    	
    	
    }
    else if(action.equals("mon")){
    	if(type.equals("out")){
    		b="出库单位";
    		c="提货人";
    	}
    	else{
    		b="入库单位";
    		c="送货人";
    	}
    	out.write("输入月：<input class=\"inin\" type=\"text\" id=\"mon\"/>");
    	out.write("&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"')\" value=\"确认\" />");

    	
    }
    else{
    	if(type.equals("out")){
    		b="出库单位";
    		c="提货人";
    	}
    	else{
    		b="入库单位";
    		c="送货人";
    	}
    	out.write("输入年：<input class=\"inin\" type=\"text\" id=\"year\"/>");
    	out.write("&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"')\" value=\"确认\" />");
     
    }
%>
<div style="margin-left: 500px;font-weight: bold;">数量：<div id="result" style="margin-left: 10px;display: inline;"></div></div>
</div>
<div style="margin-top: 30px;overflow:auto;width: 900px;height: 300px">
<table id="product" style="">
<tr style="">
<th style="width: 9%">单据编号</th>
<th style="width: 9%">产品编号</th>
<th style="width: 6%">名称</th>
<th style="width: 5%">型号</th>
<th style="width: 5%">规格</th>
<th style="width: 9%">生产厂家</th>
<th style="width: 9%">仓库编号</th>
<th style="width: 6%">数量</th>
<th style="width: 9%"><%=b %></th>
<th style="width: 7%"><%=c %></th>
<th style="width: 8%">电话</th>
<th style="width: 10%">日期</th>
<th style="width: 8%">时间</th>
</tr>

</table>
</div>
</div>
</div>
</div>

</body>
</html>
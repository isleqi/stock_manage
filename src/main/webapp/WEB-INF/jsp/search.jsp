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
#product{width:100%; border-collapse:collapse;}
#product th{background-color: #b2b2b1;}
#product th,#product td{ font-size:1em;
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

       function submit( _type){
    	
    	   if(_type=="name"){
    		var value=$("#name").val();
    		   var json={'name':value};
    		   $.ajax({
        		    type:"GET",
                     url:"search_name",
                     data:json,
                     dataType: "json",
                     success: function(data){
                       
                    	displayResult(data);

                         }
                     

        		   }); 
    		   
        	   }
    	   else{
    		   var y=$("#year").val();
               var m=$("#mon").val();
               var d=$("#day").val();
               var json={'year':y,'mon':m,'day':d,'type':_type};
               $.ajax({
       		    type:"GET",
                    url:"search_time",
                    data:json,
                    dataType: "json",
                    success: function(data){
                      
                   	displayResult(data);

                        }
              
        	   });
    	
           }
       }
   
       
     
      
       function displayResult(data) {
           var product=data;
           var table=document.getElementById("product");
           var childs = table.childNodes;  
           for(var i=childs.length-1; i>=2; i--){      
               table.removeChild(childs.item(i));      
           }   
           for(var i=0;i<product.length;i++){
              
                 var p=document.createElement("tr");
                 var td=document.createElement("td");
                 var tmp;
                 
                 var tmp=product[i].pnum;
                 td.innerHTML=tmp;
                 p.appendChild(td);
                 
                 tmp=product[i].pname;
                 td=document.createElement("td");
                 td.innerHTML=tmp;
                 p.appendChild(td);
                 
                 tmp=product[i].modle;
                 td=document.createElement("td");
                 td.innerHTML=tmp;
                 p.appendChild(td);
                 
                 tmp=product[i].size;
                 td=document.createElement("td");
                 td.innerHTML=tmp;
                 p.appendChild(td);
                 
                 tmp=product[i].factory;
                 td=document.createElement("td");
                 td.innerHTML=tmp;
                 p.appendChild(td);
                 
                 table.appendChild(p);
               }
          
          
       }   
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

<%! String type;
%>
<%
    type=request.getParameter("type");
    if(type.equals("name")){
    	String d="<div style=\"margin-top: 20px;margin-left: 100px\">";
    	out.write(d);
    	out.write("请输入商品名称：<input type=\"text\" id=\"name\"  /><input type=\"button\" onclick=\"submit("+"'"+type+"'"+")\" value=\"确定\">");
    }
    else{
    	String d="<div style=\"margin-top: 20px;margin-left: 50px\">";
    	out.write(d);
    	String a="年份：<input type=\"text\" id=\"year\" size=\"5\"/>&nbsp;&nbsp;月份：<input type=\"text\" id=\"mon\" size=\"5\"/>&nbsp;&nbsp;日：<input type=\"text\" id=\"day\" size=\"5\"/>&nbsp;&nbsp;<input type=\"button\" onclick=\"submit("+"'"+type+"'"+")\" value=\"确认\">";
        out.write(a);   
    }

%>
</div>
<div style="margin-top: 30px;overflow:auto;width: 550px;height: 300px">
<table id="product" style="">
<tr >
<th>编号
<th>名称</th>
<th>型号</th>
<th>规格</th>
<th>生产厂家</th>
</tr>
</table>
</div>
</div>
</div>
</div>

</body>
</html>
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
  #kucun{ border-collapse:collapse;} 
#kucun th{background-color: #b2b2b1;}
#kucun th,#kucun td{ font-size:5px;
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

                  function exportExcel(type){
                     // alert("!!!!!!");
                               if(type=="in"){
                                                  
                                        $.ajax({
                                                      url:"exportExcel_in",
                                                      dataType: "json",
                                                      type:"post",
                                                          success:function(data){
                                                                   alert(JSON.stringify(data));
                                                              }


                                            });
                                   }
                               else{

                            	   $.ajax({
                                       url:"exportExcel_out",
                                       dataType: "json",
                                       type:"post",
                                           success:function(data){
                                                    alert(JSON.stringify(data));

                                               }


                             });

                                   }



                      }
                  
         




       function submit( _type,action,scope){

           if(scope=="one")
    	   {
    	   if(action=="add"){
        	   var pnum;
        	   var units;
        	   var person;
        	   var tel=$("#tel").val();
        	   var snum=$("#snum").val();
       
        	   var num=$("#num").val();
        	   if(_type=="out"){
        		   pnum=$("#pnumber").val();
        		   units=$("#outunits").val();
        		   person=$("#outperson").val();
            	   }
        	   else{
        		   pnum=$("#pnumber").val();
        		   units=$("#inunits").val();
        		   person=$("#inperson").val();

            	   }
        	   
        	   if(pnum==''||units==''||person==''||tel==''||snum==''||num=='')
            	   {alert("输入不能为空！！！！");return null;}
        	  
        	   var json={'type':_type,'pnum':pnum,'units':units,'person':person,'tel':tel,'snum':snum,'num':num};
        	   $.ajax({
                   type:"post",
                   data:json,
                   dataType: "json",
                   url:"manage_add",
                   success:function(data){
                   // alert("cnm");
                   // alert(data.massage);
                       if(data.massage!=null)
                           alert(data.massage);
                       else
                           {
                               var d=new Array;
                               d[0]=data;
                               display(d); 
                           }
                    
                   }


            	   });
        	   
        	   
        	   }
    	   else if(action=='change'){
    		   var units;
        	   var person;
        	   var dnum=$("#danju_number").val();
        	   var pnum=$("#pnumber").val();
        	   var snum=$("#snum").val();
        	   var num=$("#num").val();
        	   var tel=$("#tel").val();
        	   if(_type=="out"){
        		   units=$("#outunits").val();
        		   person=$("#outperson").val();
            	   }
        	   else{
        		   units=$("#inunits").val();
        		   person=$("#inperson").val();

            	   }
        	 
        	   var json={'type':_type,'dnum':dnum,'pnum':pnum,'units':units,'person':person,'tel':tel,'snum':snum,'num':num};
        	   $.ajax({
                   type:"post",
                   data:json,
                   dataType: "json",
                   url:"manage_change",
                   success:function(data){
                   // alert("cnm");
                   // alert(data.massage);
                       if(data.massage!=null)
                           alert(data.massage);
                       else
                           {
                               var d=new Array;
                               d[0]=data;
                               display(d); 
                           }
                    
                   }


            	   });
        	   
    	   }
        	   
    	   else{
        	    var dnum=$("#danju_number").val();
        	    var json={'type':_type,'dnum':dnum}
                $.ajax({
                    data:json,
                    url:"manage_delete",
                    dataType: "text",
                    type:"post",
                    success:function(data){
                            alert(data);
                            show_all(_type);
                       
                        }


                    });
       	    
        	   }
    	   }
           else{


              show_all(_type);

               }
    	  
           }
       function show_all(_type){

    	   var json={'type':_type}
           $.ajax({
                     data:json,
                     type:"post",
                     url:"manage_show",
                     dataType: "json",
                     success:function(data){

                         //alert("!!!@@@");
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
           document.getElementById("kucun").style.display='none';
          
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
       
       function show(data) {

    	   var item=data;
    	   
    	    var table=document.getElementById("kucun");
    	  
           var childs = table.childNodes;  
           table.style.display='';
           document.getElementById("product").style.display='none';
           for(var i=childs.length-1; i>=2; i--)   
               table.removeChild(childs.item(i));  
           
               for(var i=0;i<item.length;i++){
            	   var p=document.createElement("tr");
                   var td=document.createElement("td");
                   var tmp;
                   var tmp=item[i].pnum;
                   td.innerHTML=tmp;
                   p.appendChild(td);
                   tmp=item[i].snum;
                   td=document.createElement("td");
                   td.innerHTML=tmp;
                   p.appendChild(td);
                   tmp=item[i].count;
                   td=document.createElement("td");
                   td.innerHTML=tmp;
                   p.appendChild(td);
                   table.appendChild(p);
                   }
	}

        function show_kucun(){

      	 var json={'type':"kucun"};
      	 $.ajax({
                     data:json,
                     url:"manage_show",
                     type:"post",
                     dataType: "json",
                     success:function(data){
                         alert("kucun");
                          show(data);

                         }
       
          	 });
    	   
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
<li><a href="count?type=out&action==day">日</a></li>
<li><a href=count?type=out&action=mon">月</a></li>
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
    if(action.equals("add")){
    	String a="<div style=\"margin-top: 10px;margin-left: 180px\">";
    	out.write(a);
    	
    	if(type.equals("out")){
    		b="出库单位";
    		c="提货人";
    		out.write("产品编号：<input class=\"inin\" type=\"text\" id=\"pnumber\"/> "+"仓库编号：<input class=\"inin\" type=\"text\" id=\"snum\"/><br>"+"数量：&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"text\" id=\"num\"/> "+b+"：<input type=\"text\" class=\"inin\" id=\"outunits\"/><br>"+c+"&nbsp;&nbsp;：<input type=\"text\" class=\"inin\" id=\"outperson\"/> "+"电话：&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"text\" id=\"tel\"/><br>");
        	out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" value=\"提交\" onclick=\"submit("+"'"+type+"','"+action+"','one'"+")\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"','all'"+")\" value=\"显示全部\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"show_kucun()\" value=\"显示库存\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='导出表格' style='font-size:15px;font-weight: bold;margin-top: 10px;' onclick=\"exportExcel('"+type+"')\">");
    	}
    	else{
    		b="入库单位";
    		c="送货人";
    		out.write("产品编号：<input class=\"inin\" type=\"text\" id=\"pnumber\"/> "+"仓库编号：<input class=\"inin\" type=\"text\" id=\"snum\"/><br>"+"数量：&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"text\" id=\"num\"/> "+b+"：<input type=\"text\" class=\"inin\" id=\"inunits\"/><br>"+c+"&nbsp;&nbsp;：<input type=\"text\" class=\"inin\" id=\"inperson\"/> "+"电话：&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"text\" id=\"tel\"/><br>");
        	out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" value=\"提交\" onclick=\"submit("+"'"+type+"','"+action+"','one'"+")\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"','all'"+")\" value=\"显示全部\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"show_kucun()\" value=\"显示库存\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='导出表格' style='font-size:15px;font-weight: bold;margin-top: 10px;' onclick=\"exportExcel('"+type+"')\">");
    		
    	}
    	
    	
    }
    else if(action.equals("change")){
    	if(type.equals("out")){
    		b="出库单位";
    		c="提货人";
    		String a="<div style=\"margin-top: 10px;margin-left: 200px\">";
        	out.write(a);
        	out.write("单据编号：<input class=\"inin\" type=\"text\" id=\"danju_number\"/>&nbsp;&nbsp;&nbsp;产品编号：<input class=\"inin\" type=\"text\" id=\"pnumber\"/><br>"+b+"：<input type=\"text\" class=\"inin\" id=\"outunits\"/>&nbsp;&nbsp;&nbsp;"+c+"&nbsp;&nbsp;：<input type=\"text\" class=\"inin\" id=\"outperson\"/><br>仓库编号：<input class=\"inin\" type=\"text\" id=\"snum\"/>&nbsp;&nbsp;&nbsp;数量：&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"text\" id=\"num\"/><br>电话：&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" class=\"inin\" id=\"tel\"/>&nbsp;&nbsp;&nbsp;");
        	out.write("<input type=\"button\" style=\"font-size:15px;font-weight: bold;\" value=\"修改\" onclick=\"submit("+"'"+type+"','"+action+"','one'"+")\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;\" onclick=\"submit("+"'"+type+"','"+action+"','all'"+")\" value=\"显示全部\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;\" onclick=\"show_kucun()\" value=\"显示库存\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='导出表格' style='font-size:15px;font-weight: bold;margin-top: 10px;' onclick=\"exportExcel('"+type+"')\">");
        	
    	}
    	else{
    		b="入库单位";
    		c="送货人";
    		String a="<div style=\"margin-top: 10px;margin-left: 200px\">";
        	out.write(a);
        	out.write("单据编号：<input class=\"inin\" type=\"text\" id=\"danju_number\"/>&nbsp;&nbsp;&nbsp;产品编号：<input class=\"inin\" type=\"text\" id=\"pnumber\"/><br>"+b+"：<input type=\"text\" class=\"inin\" id=\"inunits\"/>&nbsp;&nbsp;&nbsp;"+c+"&nbsp;&nbsp;：<input type=\"text\" class=\"inin\" id=\"inperson\"/><br>仓库编号：<input class=\"inin\" type=\"text\" id=\"snum\"/>&nbsp;&nbsp;&nbsp;数量：&nbsp;&nbsp;&nbsp;&nbsp;<input class=\"inin\" type=\"text\" id=\"num\"/><br>电话：&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"text\" class=\"inin\" id=\"tel\"/>&nbsp;&nbsp;&nbsp;");
        	out.write("<input type=\"button\" style=\"font-size:15px;font-weight: bold;\" value=\"修改\" onclick=\"submit("+"'"+type+"','"+action+"','one'"+")\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;\" onclick=\"submit("+"'"+type+"','"+action+"','all'"+")\" value=\"显示全部\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;\" onclick=\"show_kucun()\" value=\"显示库存\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='导出表格' style='font-size:15px;font-weight: bold;margin-top: 10px;' onclick=\"exportExcel('"+type+"')\">");
        	
    	}
    	
    	
    }
    else{
    	if(type.equals("out")){
    		b="出库单位";
    		c="提货人";
    		String a="<div style=\"margin-top: 10px;margin-left: 230px\">";
        	out.write(a);
        	out.write("输入出库单据编号：<input class=\"inin\" type=\"text\" id=\"danju_number\"/><br>");
        	out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"','one'"+")\" value=\"删除\"/>&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"','all'"+")\" value=\"显示全部\"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='导出表格' style='font-size:15px;font-weight: bold;margin-top: 10px;' onclick=\"exportExcel('"+type+"')\">");
    	    
    	}
    	else{
    		b="入库单位";
    		c="送货人";
    		String a="<div style=\"margin-top: 10px;margin-left: 230px\">";
        	out.write(a);
        	out.write("输入入库单据编号：<input class=\"inin\" type=\"text\" id=\"danju_number\"/><br>");
        	out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"','one'"+")\" value=\"删除\"/>&nbsp;&nbsp;<input type=\"button\" style=\"font-size:15px;font-weight: bold;margin-top: 10px;\" onclick=\"submit("+"'"+type+"','"+action+"','all'"+")\" value=\"显示全部\"/><input type='button' style='font-size:15px;font-weight: bold;margin-top: 10px;margin-left:10px' onclick=\"exportExcel('"+type+"')\"  value='导出表格'>");
    	}
    }
%>
</div>
<div style="margin-top: 30px;overflow:auto;width: 900px;height: 230px">
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

<table id="kucun" style="display: none;margin-left: 360px">
<tr >
<th>商品编号</th>
<th>仓库编号</th>
<th>库存</th>
</tr>
</table>
</div>
</div>
</div>
</div>

</body>
</html>
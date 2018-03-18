package com.qi.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.annotation.XmlInlineBinaryData;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.qi.mapping.In_danjuMapper;
import com.qi.mapping.In_person_infoMapper;
import com.qi.mapping.KucunMapper;
import com.qi.mapping.Out_danjuMapper;
import com.qi.mapping.Out_person_infoMapper;
import com.qi.mapping.ProductMapper;
import com.qi.model.In_danju;
import com.qi.model.Kucun;
import com.qi.model.Out_danju;
import com.qi.model.Out_person_info;
import com.qi.model.Product;
import com.qi.service.ExportExcel_in;
import com.qi.service.ExportExcel_out;
import com.qi.service.In_danju_add;
import com.qi.service.In_danju_update;
import com.qi.service.Kucun_show;
import com.qi.service.Out_danju_add;
import com.qi.service.Out_danju_update;
import com.qi.service.Result_handle_in;
import com.qi.service.Result_handle_out;


@Controller
public class m_Controller {
	@Autowired
	ProductMapper productMapper;
	@Autowired
	In_danjuMapper in_danjuMapper;
	@Autowired
	In_person_infoMapper in_person_infoMapper;
	@Autowired
	Out_danjuMapper out_danjuMapper;
	@Autowired
	Out_person_infoMapper out_person_infoMapper;
	
	
	@Autowired
	Out_danju_add out_danju_add;
	@Autowired
	In_danju_add in_danju_add;
	@Autowired
	Kucun_show kucun_show;
	@Autowired
	Out_danju_update out_danju_update;
	@Autowired
	In_danju_update in_danju_update;
	@Autowired
	Result_handle_in result_handle_in;
	@Autowired
	Result_handle_out result_handle_out;
	@Autowired
	ExportExcel_in excel_in;
	@Autowired
	ExportExcel_out excel_out;
	
	
   {
		System.out.println("12121212!!!!!!");
	}

	@RequestMapping(value="index")
	public String index() { 
		System.out.println("!!!!!");
		return "index";
	}
	@RequestMapping(value="/search")
	public String search(HttpServletRequest request,Model model) {
		String type=request.getParameter("type");
		model.addAttribute("type", type);
		return "search";
	}
	@RequestMapping(value="/search_name",method=RequestMethod.GET)
	@ResponseBody
	public List search_name(String name) {
		List<Product> pro=productMapper.get_name(name);
		return pro;
	}
	
	@RequestMapping(value="/search_time",method=RequestMethod.GET)
	@ResponseBody
	public ArrayList<Product> search_time(String year,String mon,String day,String type) throws ParseException {
	   String d=year+"-"+mon+"-"+day;
	   DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
	   Date date=new Date(dateFormat1.parse(d).getTime());
		System.out.println(date.toString());
		ArrayList<Product> pro=new ArrayList<>();
		if(type.equals("intime")) {
			List<In_danju> result=in_danjuMapper.get_danju_time(date);
			
			for (In_danju in_danju : result) {
				pro.add(in_danju.getProduct());
				
			}
		}
		else {
                List<Out_danju> result=out_danjuMapper.get_danju_time(date);
			
			   for (Out_danju out_danju : result) {
				pro.add(out_danju.getProduct());
				
			}
		}
		return pro;
	} 
	
	@RequestMapping(value="/manage")
	public String manage(HttpServletRequest request,Model model) {
		String type=request.getParameter("type");
		String action=request.getParameter("action");
		model.addAttribute("type", type);
		model.addAttribute("action", action);
		return "manage";
	}
	
	@RequestMapping(value="/manage_show",method=RequestMethod.POST)
	@ResponseBody
	public List show_danju(String type) {
		if(type.equals("out")) {
			System.out.println("out!!!");
			List<Out_danju> out=out_danjuMapper.get_all_danju();
			for (Out_danju out_danju : out) {
				out_danju=result_handle_out.handle(out_danju);
			}
			return out;
		}
		else if(type.equals("in")){
			
			List<In_danju> in=in_danjuMapper.get_all_danju();
			for (In_danju in_danju : in) {
				in_danju=result_handle_in.handle(in_danju);
			}
			return in;
		}
		else {
			List<Kucun> kucun=kucun_show.show();
			return kucun;
		}
	}
	
	@RequestMapping(value="/manage_add",method=RequestMethod.POST)
	@ResponseBody
	
	public Object manage_add(String type,String pnum,String units,String person,String tel,int snum,int num) {
		
		if(type.equals("out")) {
			Out_danju o=new Out_danju();
			  try {
				  o=out_danju_add.add(pnum, units, person, tel, snum, num);
			} catch (Exception e) {
				  //录入发生异常！
				System.out.println("录入数据库出现异常！！！");
				o.massage="录入数据库出现异常！！！";
			}
			   
			
               if(o.massage==null) {
            	   
            	o=result_handle_out.handle(o);
            	
               }
            	
            	return o;
           
		}
		else {
			In_danju i=new In_danju();
			
			  try {
				  i=in_danju_add.add(pnum, units, person, tel, snum, num);
			} catch (Exception e) {
				System.out.println(e);
				System.out.println("录入数据库出现异常inini！！！");
				i.massage="录入数据库出现异常！！！";
			}
			   
			
             if(i.massage==null) {
          	   
          	i=result_handle_in.handle(i);
          	
             }
          	
          	return i;
			
		}
		//System.out.println(result.get("message"));
     	//return result;
	}
	
	@RequestMapping(value="/manage_change",method=RequestMethod.POST)
	@ResponseBody
	public Object manaage_change(String type,int dnum,String pnum,String units,String person,String tel,int snum,int num) {
		if(type.equals("out")) {
			Out_danju o=new Out_danju();
			 try {
				  o=out_danju_update.update(dnum,pnum, units,person, tel, snum, num);
			} catch (Exception e) {
				 System.out.println(e);
				System.out.println("录入数据库出现异常！！！");
				o.massage="录入数据库出现异常！！！";
			}
			   
			
              if(o.massage==null) {
           	   
           o=result_handle_out.handle(o);
           	
              }
           	
           	return o;
		}
		else {
			In_danju in=new In_danju();
			try {
				  in=in_danju_update.update(dnum,pnum,units,person, tel, snum, num);
			} catch (Exception e) {
				e.printStackTrace();

				  //录入发生异常！
				System.out.println("录入数据库出现异常！！！");
				in.massage="录入数据库出现异常！！！";
			}
			   
			
            if(in.massage==null) {
         	   
         	in=result_handle_in.handle(in);
         	
            }
         	
         	return in;
		}
	}
	
	@RequestMapping(value="/manage_delete",method=RequestMethod.POST,produces={"text/html;charset=UTF-8;","application/json;"})
	@ResponseBody
	public String manage_delete(String type,int dnum) {
		
		if(type.equals("out")) {
	   if(out_danjuMapper.get_danju(dnum)==null)
		   return "该单据不存在！！！";
		out_danjuMapper.delete_danju(dnum);
		return "删除成功！！！";
		}
		else {
			if(in_danjuMapper.get_danju(dnum)==null)
				return "该单据不存在！！！";
			in_danjuMapper.delete_danju(dnum);
			return "删除成功！！！";
		}
	}
	
	@RequestMapping(value="/count")
	public String count(HttpServletRequest request,Model model) {
		model.addAttribute("type", request.getAttribute("type"));
		model.addAttribute("action", request.getAttribute("action"));
		return "count";
	}
	
	@RequestMapping(value="count_time",method=RequestMethod.POST)
	@ResponseBody
	public int count_time(String type,String action,String time) {
		if(type.equals("in")) {
			int count=0;
			if(action.equals("day")) {
				count=in_danjuMapper.count_day(time);
			    return count;
			}
			else if(action.equals("mon")) {
				count=in_danjuMapper.count_mon(time);
				return count;

			}
			else {
				count=in_danjuMapper.count_year(time);
				return count;

			}
			
		}
		else {
			int count=0;
			if(action.equals("day")) {
				count=out_danjuMapper.count_day(time);
			    return count;
			}
			else if(action.equals("mon")) {
				count=out_danjuMapper.count_mon(time);
				return count;

			}
			else {
				count=out_danjuMapper.count_year(time);
				return count;

			}
		}
		
			
	}
	
	@RequestMapping(value="/get_count_info",method=RequestMethod.POST)
	@ResponseBody
	public List get_count_info(String type,String action,String time) {
		
		if(type.equals("in")) {
			
			ArrayList<In_danju> result=new ArrayList<>();
			if(action.equals("day")) {
				result=in_danjuMapper.get_count_day(time);
				for (In_danju in_danju : result) {
					in_danju=result_handle_in.handle(in_danju);
				}
				return result;
			}
				
			else if(action.equals("mon")) {
				result=in_danjuMapper.get_count_mon(time);
				for (In_danju in_danju : result) {
					in_danju=result_handle_in.handle(in_danju);
				}
				return result;
			}
               
			else {
				result=in_danjuMapper.get_count_year(time);
				for (In_danju in_danju : result) {
					in_danju=result_handle_in.handle(in_danju);
				}
				return result;
			}
				
		}
		else
		{
			ArrayList<Out_danju> result=new ArrayList<>();
			if(action.equals("day")) {
				result=out_danjuMapper.get_count_day(time);
				for (Out_danju out_danju : result) {
					out_danju=result_handle_out.handle(out_danju);
				}
				return result;
			}
				
			else if(action.equals("mon")) {
				result=out_danjuMapper.get_count_mon(time);
				for (Out_danju out_danju : result) {
					out_danju=result_handle_out.handle(out_danju);
				}
				return result;
			}
               
			else {
				result=out_danjuMapper.get_count_year(time);
				for (Out_danju out_danju : result) {
					out_danju=result_handle_out.handle(out_danju);
				}
				return result;
			}
		}
		
	}
	
	
	@RequestMapping(value="/exportExcel_out",method=RequestMethod.POST)
	@ResponseBody
	public String exportExcel_out() {
		List<Out_danju> out=out_danjuMapper.get_all_danju();
		for (Out_danju out_danju : out) {
			out_danju=result_handle_out.handle(out_danju);
		}
		String[] title= {"单据编号","产品编号","名称","型号","规格","生产产家","仓库编号","数量","出库单位","提货人","电话","日期","时间"};
		String fileName="\\出库单据";
		try {
			excel_out.export(title,out, fileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "导出失败";
		}
		
		return "导出成功";
	}
	
	
	
	
	

}

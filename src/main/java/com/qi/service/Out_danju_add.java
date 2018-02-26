package com.qi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qi.mapping.KucunMapper;
import com.qi.mapping.Out_danjuMapper;
import com.qi.mapping.Out_person_infoMapper;
import com.qi.mapping.ProductMapper;
import com.qi.model.Error;
import com.qi.model.Kucun;
import com.qi.model.Out_danju;
import com.qi.model.Out_person_info;
import com.qi.model.Product;

@Service
public class Out_danju_add {
	@Autowired
	Out_danjuMapper out_danjuMapper;
	@Autowired
	Out_person_infoMapper out_person_infoMapper;
	@Autowired
	KucunMapper kucunMapper;
	@Autowired
	ProductMapper productMapper;
	
	@Transactional
	public Out_danju add(String pnum,String units,String person,String tel,int snum,int num) throws Exception{
		Out_danju out_danju=new Out_danju();
		
		Product product=productMapper.get_pnum(pnum);   //判断商品是否存在
		if(product==null) {
			out_danju.massage="没有该商品！！！";
			return out_danju;
		}
		
		Kucun kucun=new Kucun();                             //生成库存信息
		kucun.setPnum(pnum);
		kucun.setSnum(snum);
		
		if(kucunMapper.get_kucun(kucun)!=null) {                     //判断库存存在
			System.out.println("hahhhhhhh");
			
			int count=kucunMapper.get_kucun(kucun).getCount()-num;
			
			if(count<0) {
				out_danju.massage="库存不足！！！";
				return out_danju;
			}
			kucun.setCount(count);
			kucunMapper.update_kucun(kucun);                             //update 库存
		}
		else {
			
			//System.out.println("没有该商品的库存！！！");
		    out_danju.massage="没有该商品的库存！！！！";
			return out_danju;
		}
		
		out_danju.setPnum(pnum);
		out_danju.setSnum(snum);
		out_danju.setNum(num);
		
		Out_person_info out=new Out_person_info();                           //生成提货人信息
		out.setOut_company(units);
		out.setOut_person(person);
		out.setTel(tel);
		
		if(out_person_infoMapper.get_info(out)!=null)                             //判断提货人是否存在
			out_person_infoMapper.update_info(out);                               //存在，则更新电话
		else
			out_person_infoMapper.insert_info(out);                              //不存在，插入提货人信息
		
		out_danju.setProduct(product);
	    out_danju.setOut_person_info(out);
		out_danjuMapper.insert_danju(out_danju);
		
		Out_danju oo=out_danjuMapper.get_danju(out_danju.getOut_dnum()); 
		out_danju.setTime(oo.getTime());
		out_danju.setDate(oo.getDate());
		
		
		return out_danju;
	}

}

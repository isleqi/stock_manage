package com.qi.service;

import com.qi.model.Kucun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qi.mapping.In_danjuMapper;
import com.qi.mapping.In_person_infoMapper;
import com.qi.mapping.KucunMapper;
import com.qi.mapping.Out_danjuMapper;
import com.qi.mapping.Out_person_infoMapper;
import com.qi.mapping.ProductMapper;
import com.qi.model.In_danju;
import com.qi.model.In_person_info;
import com.qi.model.Product;

@Service
public class In_danju_add {
	@Autowired
	In_danjuMapper in_danjuMapper;
	@Autowired
	In_person_infoMapper in_person_infoMapper;
	@Autowired
	KucunMapper kucunMapper;
	@Autowired
	ProductMapper productMapper;
	
	@Transactional
	public In_danju add(String pnum,String units,String person,String tel,int snum,int num) {
	In_danju in_danju=new In_danju();
	
	Product product=productMapper.get_pnum(pnum);   //判断商品是否存在
	if(product==null) {
		in_danju.massage="没有该商品！！！";
		return in_danju;
	}
	
	Kucun kucun=new Kucun();                                //生成库存信息
	kucun.setPnum(pnum);
	kucun.setSnum(snum);
	if(snum>10) {
		 in_danju.massage="该仓库不存在,请输入1-10";
		 return in_danju;
	}
	if(kucunMapper.get_kucun(kucun)!=null) {                     //判断库存存在
		
		
		int count=kucunMapper.get_kucun(kucun).getCount()+num;
		
		
		kucun.setCount(count);
		kucunMapper.update_kucun(kucun);                             //update 库存
	}
	else {
		
		kucun.setCount(num);
		kucunMapper.insert_kucun(kucun);
	}
	
	in_danju.setPnum(pnum);
	in_danju.setSnum(snum);
	in_danju.setNum(num);
	
	In_person_info in=new In_person_info();                           //生成提货人信息
	in.setIn_company(units);
	in.setIn_person(person);
	in.setTel(tel);
	
	if(in_person_infoMapper.get_info(in)!=null)                             //判断提货人是否存在
		in_person_infoMapper.update_info(in);                               //存在，则更新电话
	else
		in_person_infoMapper.insert_info(in);                              //不存在，插入提货人信息
	
	in_danju.setProduct(product);
    in_danju.setIn_person_info(in);
    
	in_danjuMapper.insert_danju(in_danju);
	
	In_danju oo=in_danjuMapper.get_danju(in_danju.getIn_dnum()); 
	in_danju.setTime(oo.getTime());
	in_danju.setDate(oo.getDate());
	
	
	return in_danju;
}

}

package com.qi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qi.mapping.In_danjuMapper;
import com.qi.mapping.In_person_infoMapper;
import com.qi.mapping.KucunMapper;

import com.qi.mapping.ProductMapper;
import com.qi.model.In_danju;
import com.qi.model.In_person_info;
import com.qi.model.Kucun;

import com.qi.model.Product;

@Service
public class In_danju_update {
	@Autowired
	In_danjuMapper in_danjuMapper;
	@Autowired
	In_person_infoMapper in_person_infoMapper;
	@Autowired
	KucunMapper kucunMapper;
	@Autowired
	ProductMapper productMapper;
	
	
	@Transactional
    public In_danju update(int dnum,String pnum, String units, String person, String tel, int snum,int  num) throws Exception{
		In_danju in=new In_danju();
    		In_danju in_=in_danjuMapper.get_danju(dnum);
    		if(in_==null) {
    			in.massage="该单据不存在！！！";
    			return in;
    		}
    		else
    			in=in_;
    		
    		Product product=productMapper.get_pnum(pnum);
    		if(product==null) {
    			in.massage="该商品不存在！！！";
    			return in;
    		}
    		
    		int old_num=in.getNum();
    		
    		Kucun kucun=new Kucun();                             //生成库存信息
    		kucun.setPnum(pnum);
    		kucun.setSnum(snum);
    		if(kucunMapper.get_kucun(kucun)!=null) {                     //判断库存存在
    			System.out.println("hahhhhhhh");
    			
    			int count=kucunMapper.get_kucun(kucun).getCount()-old_num+num;
    			
    			if(count<0) {
    				in.massage="库存修改失败！！！";
    				return in;
    			}
    			                             //update 库存
    			kucun.setCount(count);
    			kucunMapper.update_kucun(kucun);
    		
    	}
    		else {
    			kucun.setCount(num);
    			kucunMapper.insert_kucun(kucun);
    		}
    		
    		in.setPnum(pnum);
    		in.setSnum(snum);
    		in.setNum(num);
    		in.setIn_company(units);
    		in.setIn_person(person);
    		
    		In_person_info in_person=new In_person_info();                           //生成送货人信息
    		in_person.setIn_company(units);
    		in_person.setIn_person(person);
    		in_person.setTel(tel);
    		
    		if(in_person_infoMapper.get_info(in_person)!=null)                             //判断送货人是否存在
    			in_person_infoMapper.update_info(in_person);                               //存在，则更新电话
    		else
    			in_person_infoMapper.insert_info(in_person);                              //不存在，插入提货人信息
    
    		in.setProduct(product);
    	    in.setIn_person_info(in_person);
    	    
    	    in_danjuMapper.update_danju(in);
    	    
    	   
    	    return in;
    	
    	

}

}

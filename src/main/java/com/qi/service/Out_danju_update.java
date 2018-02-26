package com.qi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qi.mapping.KucunMapper;
import com.qi.mapping.Out_danjuMapper;
import com.qi.mapping.Out_person_infoMapper;
import com.qi.mapping.ProductMapper;
import com.qi.model.Kucun;
import com.qi.model.Out_danju;
import com.qi.model.Out_person_info;
import com.qi.model.Product;

@Service
public class Out_danju_update {
	@Autowired
	Out_danjuMapper out_danjuMapper;
	@Autowired
	Out_person_infoMapper out_person_infoMapper;
	@Autowired
	KucunMapper kucunMapper;
	@Autowired
	ProductMapper productMapper;
	
	
	@Transactional
    public Out_danju update(int dnum,String pnum, String units, String person, String tel, int snum,int  num) throws Exception{
		Out_danju out=new Out_danju();
    	
    		Out_danju out_=out_danjuMapper.get_danju(dnum);
    		if(out_==null) {
    			out.massage="该单据不存在！！！";
    			return out;
    		}
    		else
    			out=out_;
    		
    		Product product=productMapper.get_pnum(pnum);
    		if(product==null) {
    			out.massage="该商品不存在！！！";
    			return out;
    		}
    		
    		int old_num=out.getNum();
    		
    		Kucun kucun=new Kucun();                             //生成库存信息
    		kucun.setPnum(pnum);
    		kucun.setSnum(snum);
    		if(kucunMapper.get_kucun(kucun)!=null) {                     //判断库存存在
    			System.out.println("hahhhhhhh");
    			
    			int count=kucunMapper.get_kucun(kucun).getCount()+old_num-num;
    			
    			if(count<0) {
    				out.massage="库存不足！！！";
    				return out;
    			}
    			                             //update 库存
    			kucun.setCount(count);
    			kucunMapper.update_kucun(kucun);
    		
    	}
    		else {
    			
    			//System.out.println("没有该商品的库存！！！");
    		    out.massage="没有该商品的库存！！！！";
    			return out;
    		}
    		
    		out.setPnum(pnum);
    		out.setSnum(snum);
    		out.setNum(num);
    		out.setOut_company(units);
    		out.setOut_person(person);
    		
    		Out_person_info out_person=new Out_person_info();                           //生成提货人信息
    		out_person.setOut_company(units);
    		out_person.setOut_person(person);
    		out_person.setTel(tel);
    		
    		if(out_person_infoMapper.get_info(out_person)!=null)                             //判断提货人是否存在
    			out_person_infoMapper.update_info(out_person);                               //存在，则更新电话
    		else
    			out_person_infoMapper.insert_info(out_person);                              //不存在，插入提货人信息
    
    		out.setProduct(product);
    	    out.setOut_person_info(out_person);
    	    
    	    out_danjuMapper.update_danju(out);
    	    
    	   
    	    return out;
    	
    	

}
}

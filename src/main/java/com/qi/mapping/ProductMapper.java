package com.qi.mapping;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qi.model.Product;

@Repository
public interface ProductMapper {
	
	public List<Product> get_name(String name);
	
	public Product get_pnum(String pnum);
}

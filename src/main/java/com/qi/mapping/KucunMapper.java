package com.qi.mapping;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qi.model.Kucun;

@Repository
public interface KucunMapper {
	
	public List<Kucun> get_all_kucun();
	
	public Kucun get_kucun(Kucun kucun);
	
	public void update_kucun(Kucun kucun);
	
	public void insert_kucun(Kucun kucun);
	
	

}

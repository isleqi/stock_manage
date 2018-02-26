package com.qi.mapping;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qi.model.In_person_info;

@Repository
public interface In_person_infoMapper {
public In_person_info get_info(In_person_info in);
	
	public void insert_info(In_person_info in);
	
	public void update_info(In_person_info in);
	
	public void delete_info(In_person_info in);


}

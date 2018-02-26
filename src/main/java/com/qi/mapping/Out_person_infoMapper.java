package com.qi.mapping;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qi.model.Out_person_info;

@Repository
public interface Out_person_infoMapper {
	
	public Out_person_info get_info(Out_person_info out);
	
	public void insert_info(Out_person_info out);
	
	public void update_info(Out_person_info out);
	
	public void delete_info(Out_person_info out);

}

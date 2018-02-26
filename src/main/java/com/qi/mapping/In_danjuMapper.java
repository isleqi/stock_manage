package com.qi.mapping;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qi.model.In_danju;
import com.qi.model.Out_danju;

@Repository
public interface In_danjuMapper {
	
	public List<In_danju> get_danju_time(@Param("date")Date date);
	
	public List<In_danju> get_all_danju();

	
    public In_danju get_danju(int in_dnum);
	
	public void insert_danju(In_danju in);
	
	public void update_danju(In_danju in);
	
	public void delete_danju(int in_dnum);
	
	public int count_day(String d);
	
	public ArrayList<In_danju> get_count_day(String d);
	
	public int count_mon(String m);
	
	public ArrayList<In_danju> get_count_mon(String m);
	
	public int count_year(String y);
	
	public ArrayList<In_danju> get_count_year(String y);
	
}

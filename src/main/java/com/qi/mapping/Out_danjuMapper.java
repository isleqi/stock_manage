package com.qi.mapping;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.qi.model.In_danju;
import com.qi.model.Out_danju;

@Repository
public interface Out_danjuMapper {
	public List<Out_danju> get_danju_time(@Param("date")Date date);
	
	public List<Out_danju> get_all_danju();

	public Out_danju get_danju(int out_dnum);
	
	public void insert_danju(Out_danju out);
	
	public void update_danju(Out_danju out);
	
	public void delete_danju(int out_dnum);
	
    public int count_day(String d);
	
	public ArrayList<Out_danju> get_count_day(String d);
	
	public int count_mon(String m);
	
	public ArrayList<Out_danju> get_count_mon(String m);
	
	public int count_year(String y);
	
	public ArrayList<Out_danju> get_count_year(String y);

}

package com.qi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qi.mapping.KucunMapper;
import com.qi.model.Kucun;

@Service
public class Kucun_show {
	@Autowired
	KucunMapper kucunMapper;
      public List<Kucun> show() {
    	  List<Kucun> result=kucunMapper.get_all_kucun();
    	  return result;
    	  
      }
}

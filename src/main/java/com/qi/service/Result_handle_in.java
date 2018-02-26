package com.qi.service;

import org.springframework.stereotype.Service;

import com.qi.model.In_danju;

@Service
public class Result_handle_in {
	public In_danju handle(In_danju in_danju) {
		in_danju.dnum=in_danju.getIn_dnum();
		in_danju.units=in_danju.getIn_person_info().getIn_company();
		in_danju.person=in_danju.getIn_person_info().getIn_person();
		in_danju.tel=in_danju.getIn_person_info().getTel();
		return in_danju;
	}

}

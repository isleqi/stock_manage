package com.qi.service;

import org.springframework.stereotype.Service;

import com.qi.model.Out_danju;

@Service
public class Result_handle_out {
	public Out_danju handle(Out_danju out_danju) {
		out_danju.dnum=out_danju.getOut_dnum();
		out_danju.units=out_danju.getOut_person_info().getOut_company();
		out_danju.person=out_danju.getOut_person_info().getOut_person();
		out_danju.tel=out_danju.getOut_person_info().getTel();
		return out_danju;
	}

}

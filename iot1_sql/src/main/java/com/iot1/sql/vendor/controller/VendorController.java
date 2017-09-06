package com.iot1.sql.vendor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot1.sql.vendor.dto.VendorInfo;
import com.iot1.sql.vendor.service.VendorService;

@Controller
public class VendorController {
	@Autowired
	VendorService vs;
	
		@RequestMapping(value="/vendor/list",method=RequestMethod.POST)
	public @ResponseBody List<VendorInfo> getVendorInfoList(VendorInfo vi){
		return vs.getVendorInfoList(vi);
	}
}

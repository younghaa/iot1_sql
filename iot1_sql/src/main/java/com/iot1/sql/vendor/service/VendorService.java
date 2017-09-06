package com.iot1.sql.vendor.service;

import java.util.List;

import com.iot1.sql.vendor.dto.VendorInfo;

public interface VendorService {
	
	public VendorInfo getVendorInfo(VendorInfo vi);
	public List<VendorInfo> getVendorInfoList(VendorInfo vi);

}

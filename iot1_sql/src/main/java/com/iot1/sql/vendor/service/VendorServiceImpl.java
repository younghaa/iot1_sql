package com.iot1.sql.vendor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.vendor.dao.VendorDao;
import com.iot1.sql.vendor.dto.VendorInfo;

@Service
public class VendorServiceImpl implements VendorService{
	@Autowired
	VendorDao vDao;

	@Override
	public VendorInfo getVendorInfo(VendorInfo vi){
		return vDao.selectVendorInfo(vi);
	}
	@Override
	public List<VendorInfo> getVendorInfoList(VendorInfo vi){
		return vDao.selectVendorInfoList(vi);
	}


}

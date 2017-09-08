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
	@Override
	public List<VendorInfo> getVendorInfoCombo() {
		return vDao.selectVendorInfoCombo();
	}
	@Override
	public int insertVendorInfo(VendorInfo vi){
		return vDao.insertVendorInfo(vi);
		}
	@Override
	public int insertVendorInfoList(VendorInfo[] viList){
		int result = 0;
		for(VendorInfo vi : viList){
			result += vDao.insertVendorInfo(vi);
		}
		return result;
	}
	@Override
	public int updateVendor(VendorInfo vi){
		return vDao.updateVendorInfo(vi);
	}
	@Override
	public int deleteVendor(VendorInfo vi){
		return vDao.deleteVendorInfo(vi);
	}
}
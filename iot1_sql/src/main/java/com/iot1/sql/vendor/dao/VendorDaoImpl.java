package com.iot1.sql.vendor.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.iot1.sql.vendor.dto.VendorInfo;

@Repository
public class VendorDaoImpl extends SqlSessionDaoSupport implements VendorDao {

	@Override
	public VendorInfo selectVendorInfo(VendorInfo vi) {
		return this.getSqlSession().selectOne("vendor.SELECT_VENDOR",vi);
	}

	@Override
	public List<VendorInfo> selectVendorInfoList(VendorInfo vi) {
		return this.getSqlSession().selectList("vendor.SELECT_VENDOR",vi);
	}

}

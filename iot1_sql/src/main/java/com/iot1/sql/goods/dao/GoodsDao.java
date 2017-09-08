package com.iot1.sql.goods.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.iot1.sql.goods.dto.GoodsInfo;

public interface GoodsDao {
	
	public GoodsInfo selectGoodsInfo(GoodsInfo gi);
	
	public List<GoodsInfo> selectGoodsInfoList(GoodsInfo gi);
	
	public int insertGoodsInfo(GoodsInfo gi);
	
	public int updateGoodsInfo(GoodsInfo gi);
	
	public int deleteGoodsInfo(GoodsInfo gi);
	
}

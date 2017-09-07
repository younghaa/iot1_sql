package com.iot1.sql.goods.service;

import java.util.List;

import com.iot1.sql.goods.dto.GoodsInfo;

public interface GoodsService {
	
	public GoodsInfo getGoodsInfo(GoodsInfo gi);
	
	public List<GoodsInfo> getGoodsInfoList(GoodsInfo gi);
	
	public int insertGoodsInfoList(GoodsInfo[] gi);
	
	public int insertGoodsInfo(GoodsInfo gi);
	
	public int updateGoods(GoodsInfo gi);
	
	public int deleteGoods(GoodsInfo gi);


	
 
}

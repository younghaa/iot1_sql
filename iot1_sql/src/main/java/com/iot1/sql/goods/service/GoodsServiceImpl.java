package com.iot1.sql.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.goods.dao.GoodsDao;
import com.iot1.sql.goods.dto.GoodsInfo;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	GoodsDao gDao;

	@Override
	public GoodsInfo getGoodsInfo(GoodsInfo gi){
		return gDao.selectGoodsInfo(gi);
	}
	@Override
	public List<GoodsInfo> getGoodsInfoList(GoodsInfo gi){
		return gDao.selectGoodsInfoList(gi);
	}
	@Override
	public int  insertGoodsInfo(GoodsInfo gi){
		return gDao.insertGoodsInfo(gi);
	}
	@Override
	public int insertGoodsInfoList(GoodsInfo[] giList){
		int result = 0;
		for(GoodsInfo gi : giList){
			result += gDao.insertGoodsInfo(gi);
		}
		return result;
	}
	@Override
	public int updateGoods(GoodsInfo gi) {
		return gDao.updateGoodsInfo(gi);
	}
	@Override
	public int deleteGoods(GoodsInfo gi) {
		return gDao.deleteGoodsInfo(gi);
	}

}

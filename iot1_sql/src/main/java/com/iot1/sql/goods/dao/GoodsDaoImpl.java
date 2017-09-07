package com.iot1.sql.goods.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.iot1.sql.goods.dto.GoodsInfo;

@Repository
public class GoodsDaoImpl extends SqlSessionDaoSupport implements GoodsDao {

	@Override
	public GoodsInfo selectGoodsInfo(GoodsInfo gi) {
		return this.getSqlSession().selectOne("goods.SELECT_GOODS",gi);
	}

	@Override
	public List<GoodsInfo> selectGoodsInfoList(GoodsInfo gi) {
		return this.getSqlSession().selectList("goods.SELECT_GOODS",gi);
	}

	@Override
	public int insertGoodsInfo(GoodsInfo gi) {
		return this.getSqlSession().insert("goods.INSERT_GOODS",gi);
	}

	@Override
	public int updateGoodsInfo(GoodsInfo gi) {
		return this.getSqlSession().update("goods.UPDATE_GOODS",gi);
	}

	@Override
	public int deleteGoodsInfo(GoodsInfo gi) {
		return this.getSqlSession().delete("goods.DELETE_GOODS",gi);
	}

}

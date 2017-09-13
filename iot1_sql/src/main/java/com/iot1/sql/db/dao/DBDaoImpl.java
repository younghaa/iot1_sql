package com.iot1.sql.db.dao;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot1.sql.common.DataSourceFactory;
import com.iot1.sql.db.dto.Column;
import com.iot1.sql.db.dto.DBInfo;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.Table;

@Repository
public class DBDaoImpl extends SqlSessionDaoSupport implements DBDao{
	@Autowired
	DataSourceFactory dsf;
	
	@Override
	public List<DBInfo> selectDBInfoList(DBInfo di) {
		return this.getSqlSession().selectList("db.SELECT_DB", di);
	}

	@Override
	public DBInfo selectDBInfo(DBInfo di) {
		return this.getSqlSession().selectOne("db.SELECT_DB", di);
	}

	@Override
	public boolean isConnecteDB(DBInfo di) throws Exception {
		return dsf.isConnecteDB(di);
	}

	public List<DataBase> selectDatabaseList() throws Exception {
		DatabaseMetaData meta = dsf.getSqlSession().getConnection().getMetaData();
		ResultSet ctlgs = meta.getCatalogs();
		List<DataBase> databaseList = new ArrayList<DataBase>();
		while (ctlgs.next())
		{
			DataBase db = new DataBase();
			db.setDatabase(ctlgs.getString(1));
			databaseList.add(db);
		}
		return databaseList;
	}

	//TABLE SELECT
	public List<Table> selectTableList(DataBase di) throws Exception{
		dsf.getSqlSession().selectList("db.USE_DATABASE", di);
		return dsf.getSqlSession().selectList("db.TABLE_SELECT",di);
	}

	@Override
	public List<Column> selectTableInfo(Table table) throws Exception {
		return dsf.getSqlSession().selectList("db.TABLE_INFO_SELECT", table);
	}

}
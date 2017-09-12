package com.iot1.sql.db.dao;

import java.util.List;

import com.iot1.sql.db.dto.DBInfo;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.Table;

public interface DBDao {

	public DBInfo selectDBInfo(DBInfo di);
	public List<DBInfo> selectDBInfoList(DBInfo di);
	public boolean isConnecteDB(DBInfo di) throws Exception;
	public List<DataBase> selectDatabaseList() throws Exception;
	public List<Table> selectTableList(DataBase di) throws Exception;
}

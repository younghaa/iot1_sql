package com.iot1.sql.db.service;

import java.util.List;

import com.iot1.sql.db.dto.DBInfo;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.Table;

public interface DBService {
	
	public DBInfo getDBInfo(DBInfo di);
	
	public List<DBInfo> getDBInfoList(DBInfo di);

	public boolean isConnecteDB(DBInfo di) throws Exception;

	public List<DataBase> getDataBaseList() throws Exception;

	public List<Table> getTableList(DataBase di) throws Exception;

}

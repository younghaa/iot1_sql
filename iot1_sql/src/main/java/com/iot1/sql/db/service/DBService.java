package com.iot1.sql.db.service;

import java.util.List;
import java.util.Map;

import com.iot1.sql.db.dto.Column;
import com.iot1.sql.db.dto.DBInfo;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.Table;

public interface DBService {
	
	public List<DBInfo> getDBInfoList(DBInfo di);
	public List<DataBase> getDataBaseList() throws Exception;
	public boolean isConnecteDB(DBInfo pDi) throws Exception;
	public List<Table> getTableList(DataBase di) throws Exception;
	public List<Column> getTableInfo(Table table) throws Exception;
	public Map<String,Object> runSql(Map<String,String>pm)throws Exception;
	public Map<String,Object> runSqls(Map<String, List> pm) throws Exception;
}

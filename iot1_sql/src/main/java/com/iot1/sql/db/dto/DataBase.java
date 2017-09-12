package com.iot1.sql.db.dto;

public class DataBase {
	private String database;
	private String tableName;
	
	public String getDatabase() {
		return database;
	}
	public void setDatabase(String database) {
		this.database = database;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	@Override
	public String toString() {
		return "DataBase [database=" + database + ", tableName=" + tableName + "]";
	}

}

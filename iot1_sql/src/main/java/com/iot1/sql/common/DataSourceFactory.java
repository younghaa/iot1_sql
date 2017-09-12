package com.iot1.sql.common;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.iot1.sql.db.dto.DBInfo;

@Service
public class DataSourceFactory {
	BasicDataSource bds;
	SqlSessionFactoryBean ssf;
	SqlSession ss;
	
	private void setDataSource(DBInfo db){
		bds = new BasicDataSource();
		bds.setDriverClassName(db.getDiverName());
		bds.setUrl(db.getDbUrl()+":"+db.getPort()+"/"+db.getDbms());
		bds.setUsername(db.getId());
		bds.setPassword(db.getPwd());
	}
	private SqlSessionFactoryBean getSsf(){
		ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(bds);
		ssf.setConfigLocation(new ClassPathResource("db/mybatis-config.xml"));
		return ssf;
	}
	private void closeSession(){
		if(ss!=null){
			ss.close();
			ss=null;
		}
	}
	public SqlSession getSession() throws Exception{
		closeSession();
		ss = getSsf().getObject().openSession();
		return ss;
	}
	public boolean isConnecteDB(DBInfo db) throws Exception{
		setDataSource(db);
		ss = getSession();
		return true;
	}
	public SqlSession getSqlSession() throws Exception{
		return getSession();
	}
}

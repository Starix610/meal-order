package com.onlineorder.utils;

import java.sql.Connection;
import java.sql.SQLException;
import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class MyDataSourceUtils {
	private static ComboPooledDataSource dataSource = new ComboPooledDataSource();//使用默认配置
	//创建线程绑定ThreadLocal对象
	private static ThreadLocal<Connection> tl = new ThreadLocal<>();
	
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	public static Connection getCurrentConnection() throws SQLException {
		//从ThreadLocal中寻找当前线程是否已经绑定有Connection对象
		Connection conn = tl.get();
		if (conn == null) {
			//获得新的Connection对象
			conn = dataSource.getConnection();
			//将conn资源绑定到ThreadLocal上(底层是Map)
			tl.set(conn);
		}
		return conn;
	}
	
	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException();
		}
	}
	
	public static void startTransaction() throws SQLException {
		getCurrentConnection().setAutoCommit(false);
	}
	
	public static void commit() {
		try {
			getCurrentConnection().commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void rollback() {
		try {
			getCurrentConnection().rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

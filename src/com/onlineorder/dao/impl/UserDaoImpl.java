package com.onlineorder.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineorder.dao.UserDao;
import com.onlineorder.domain.User;
import com.onlineorder.utils.C3P0Utils;

public class UserDaoImpl implements UserDao{
	public int register(User user) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into user values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int row = queryRunner.update(sql, user.getUid(),user.getUsername(),user.getPassword(),user.getName(),user.getEmail(),user.getTelephone(),
				user.getBirthday(),user.getSex(),user.getState(),user.getCode(),user.getPoint(),user.getAge(),user.getImage(),user.getCreateTime());
		return row;
		
	}

	public int acrive(String activeCode) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update user set state = 1 where code = ?";
		int row = queryRunner.update(sql, activeCode);
		return row;
	}

	public Long checkUsername(String username) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from user where username = ?";
		Long count = (Long) queryRunner.query(sql, new ScalarHandler<>(), username);
		return count;
	}

	@Override
	public User login(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user where username = ? and password = ?";
		User user = queryRunner.query(sql, new BeanHandler<>(User.class), username,password);
		return user;
	}

	@Override
	public User getUser(String uid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from user where uid = ?";
		User user = queryRunner.query(sql, new BeanHandler<>(User.class), uid);
		return user;
	}

}

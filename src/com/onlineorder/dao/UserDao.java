package com.onlineorder.dao;

import java.sql.SQLException;

import com.onlineorder.domain.User;

public interface UserDao {
	public int register(User user) throws SQLException;

	public int acrive(String activeCode) throws SQLException;

	public Long checkUsername(String username) throws SQLException;

	public User login(String username, String password) throws SQLException;

	public User getUser(String uid) throws SQLException;
}


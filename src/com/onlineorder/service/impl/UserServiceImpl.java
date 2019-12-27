package com.onlineorder.service.impl;

import java.sql.SQLException;

import com.onlineorder.dao.UserDao;
import com.onlineorder.domain.User;
import com.onlineorder.service.UserService;
import com.onlineorder.utils.BeanFactory;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao = (UserDao) BeanFactory.getBean("userDao");	
	
	@Override
	public boolean register(User user) {
		// TODO Auto-generated method stub
		int row = 0;
		try {
			row = userDao.register(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row>0?true:false;
	}
	
	@Override
	//用户激活
	public boolean active(String activeCode) {
		// TODO Auto-generated method stub
		int row = 0;
		try {
			row = userDao.acrive(activeCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row>0?true:false;
	}
	@Override
	public boolean checkUsername(String username) {
		// TODO Auto-generated method stub
	    Long count = null;
		try {
			count = userDao.checkUsername(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count>0?true:false;
	}

	@Override
	public User login(String username, String password) throws SQLException {
		// TODO Auto-generated method stub
		return userDao.login(username,password);
	}

	@Override
	public User getUser(String uid) {
		// TODO Auto-generated method stub
		
		try {
			return userDao.getUser(uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}

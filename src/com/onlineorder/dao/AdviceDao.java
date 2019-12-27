package com.onlineorder.dao;

import java.sql.SQLException;

import com.onlineorder.domain.Message;

public interface AdviceDao {

	void addAdvice(Message message) throws SQLException;

}

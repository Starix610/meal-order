package com.onlineorder.dao.impl;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;

import com.onlineorder.dao.AdviceDao;
import com.onlineorder.domain.Message;
import com.onlineorder.utils.C3P0Utils;

public class AdviceDaoImpl implements AdviceDao {

	@Override
	public void addAdvice(Message message) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into message values(?,?,?,?,?,?)";
		queryRunner.update(sql, message.getMsg_id(),message.getName(),message.getEmail(),message.getContact(),
				message.getContent(),message.getDate());
	}

}

package com.onlineorder.service.impl;

import java.sql.SQLException;

import com.onlineorder.dao.AdviceDao;
import com.onlineorder.domain.Message;
import com.onlineorder.service.AdviceService;
import com.onlineorder.utils.BeanFactory;

public class AdviceServiceImpl implements AdviceService {

	@Override
	public void addAdvice(Message message) {
		// TODO Auto-generated method stub
		AdviceDao dao = (AdviceDao) BeanFactory.getBean("adviceDao");
		try {
			dao.addAdvice(message);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

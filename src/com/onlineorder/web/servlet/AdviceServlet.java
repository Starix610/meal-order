package com.onlineorder.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.onlineorder.domain.Message;
import com.onlineorder.service.AdviceService;
import com.onlineorder.utils.BeanFactory;

public class AdviceServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Message message=new Message();
		Map<String, String[]> map = request.getParameterMap();
        message.setMsg_id(UUID.randomUUID().toString());
        message.setDate(new Date());
        try {
			BeanUtils.populate(message, map);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        AdviceService service = (AdviceService) BeanFactory.getBean("adviceService");
        service.addAdvice(message);
        response.getWriter().write("{\"success\":\"true\"}");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
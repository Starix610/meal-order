package com.onlineorder.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineorder.service.UserService;
import com.onlineorder.utils.BeanFactory;

public class ActiveServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String activeCode = request.getParameter("activeCode");
		boolean isActive = ((UserService) BeanFactory.getBean("userService")).active(activeCode);
		if (isActive) {
			response.sendRedirect(request.getContextPath()+"/activeSuccess.jsp");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
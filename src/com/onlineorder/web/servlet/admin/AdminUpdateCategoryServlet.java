package com.onlineorder.web.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineorder.service.AdminMenuService;
import com.onlineorder.utils.BeanFactory;

public class AdminUpdateCategoryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cid = request.getParameter("cid");
		String name = request.getParameter("name");
		AdminMenuService service = (AdminMenuService) BeanFactory.getBean("adminMenuService");
		service.updateCategory(cid,name);
		response.getWriter().write("{\"success\":\"true\"}");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
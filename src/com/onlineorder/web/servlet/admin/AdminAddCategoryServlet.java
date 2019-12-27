package com.onlineorder.web.servlet.admin;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineorder.domain.Category;
import com.onlineorder.service.AdminMenuService;
import com.onlineorder.utils.BeanFactory;

public class AdminAddCategoryServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		if (name!=null) {
			Category category = new Category();
			category.setName(name);
			category.setCid(UUID.randomUUID().toString());
			AdminMenuService service = (AdminMenuService) BeanFactory.getBean("adminMenuService");
			service.addCategory(category);
			response.getWriter().write("{\"success\":\"true\"}");			
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
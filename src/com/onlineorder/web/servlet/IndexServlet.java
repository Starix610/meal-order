package com.onlineorder.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineorder.domain.Menu;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class IndexServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		List<Menu> hotMenuList = service.findHotMenuList();
		List<Menu> newMenuList = service.findNewMenuList();
		
		request.setAttribute("hotMenuList", hotMenuList);
		request.setAttribute("newMenuList", newMenuList);
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
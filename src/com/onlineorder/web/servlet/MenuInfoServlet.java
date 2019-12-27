package com.onlineorder.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineorder.domain.Menu;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class MenuInfoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mid = request.getParameter("mid");
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		Menu menu =  service.getMenuByMid(mid);
		request.setAttribute("menu", menu);
		request.setAttribute("cid", request.getParameter("cid"));
		request.setAttribute("currentPage", request.getParameter("currentPage"));
		request.getRequestDispatcher("/menu_info.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
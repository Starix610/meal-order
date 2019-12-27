package com.onlineorder.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineorder.domain.Menu;
import com.onlineorder.domain.PageBean;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class SearchMenuServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menuName = request.getParameter("menuName");
		String currentPageStr = request.getParameter("currentPage");
		if (currentPageStr==null) {
			currentPageStr = "1";
		}
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount = 12;
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		PageBean<Menu> pageBean = service.getMenuPageBeanByName(menuName,currentPage,currentCount);
		
		request.setAttribute("menuName", menuName);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/menu_search_list.jsp").forward(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
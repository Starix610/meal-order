package com.onlineorder.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineorder.domain.Order;
import com.onlineorder.domain.PageBean;
import com.onlineorder.domain.User;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class MyOrdersServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		String currentPageStr = request.getParameter("currentPage");
		if (currentPageStr==null) {
			currentPageStr = "1";
		}
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount = 5;
		
		//分页数据
		PageBean<Order> pageBean = service.getOrderPageBean(user.getUid(),currentPage,currentCount);

		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("order_list.jsp").forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
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

public class QueryOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user"); 
		
		String queryMethod = request.getParameter("queryMethod");
		String condition = request.getParameter("condition");
		String currentPageStr = request.getParameter("currentPage");
		if (currentPageStr==null) {
			currentPageStr = "1";
		}
		int currentPage = Integer.parseInt(currentPageStr);
		int currentCount = 5;
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		PageBean<Order> pageBean = service.getOrderQueryPageBean(user.getUid(),queryMethod,condition,currentPage,currentCount);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("queryMethod", queryMethod);
		request.setAttribute("condition", condition);
		if (pageBean==null) {
			request.setAttribute("notFound", "未找到相关订单信息！");
		}
		request.getRequestDispatcher("/order_query_list.jsp").forward(request, response);
	}
	

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
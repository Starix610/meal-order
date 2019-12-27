package com.onlineorder.web.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineorder.domain.Admin;
import com.onlineorder.service.AdminMenuService;
import com.onlineorder.utils.BeanFactory;

public class AdminLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String admin = request.getParameter("admin");
		String password = request.getParameter("password");
		AdminMenuService service = (AdminMenuService) BeanFactory.getBean("adminMenuService");
		Admin login = service.login(admin,password);
		if (login==null) {
			request.setAttribute("loginInfo", "登陆失败,账号或密码错误！");
			request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("login", login);
			response.sendRedirect(request.getContextPath()+"/admin/home.jsp");
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
package com.onlineorder.web.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineorder.domain.User;
import com.onlineorder.service.UserService;
import com.onlineorder.utils.BeanFactory;

public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String inputImgCode = request.getParameter("checkImg");
		String imgCode = (String) session.getAttribute("checkcode_session");
		if (!imgCode.equals(inputImgCode)) {
			request.setAttribute("loginInfo", "您输入的验证码有误,请重新输入！");
			// 错误信息回显
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else {
			
			// 1.获取用户名和密码
			String username = request.getParameter("username");
			String password = request.getParameter("password");
//			System.out.println(username + "   " + password);
			// 2.通过一个业务方法进行用户查询
			User user = null;
			try {
				user = ((UserService) BeanFactory.getBean("userService")).login(username, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (user != null) {
				//是否自动登录
				if (request.getParameter("autoLogin")!=null) {
					Cookie cookie_username = new Cookie("cookie_username", username);
					Cookie cookie_password = new Cookie("cookie_password", password);
					cookie_username.setMaxAge(60*60); //持久化cookie一个小时
					cookie_password.setMaxAge(60*60);
					cookie_username.setPath(request.getContextPath());
					cookie_password.setPath(request.getContextPath());
					response.addCookie(cookie_username);
					response.addCookie(cookie_password);
				}
				//是否保存用户名
				if (request.getParameter("saveUsername")!=null) {
					Cookie saveUsername = new Cookie("saveUsername",username);
					saveUsername.setMaxAge(60*60*24);
					response.addCookie(saveUsername);
				}
				session.setAttribute("user", user);
				response.sendRedirect(request.getContextPath());// getContextPath动态获取web应用名称
			} else {
				request.setAttribute("loginInfo", "用户名或密码错误");
				// 转发实现将错误信息回显(一次请求中,可以获取到request域中的数据)
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
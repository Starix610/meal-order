package com.onlineorder.web.filter;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.onlineorder.domain.User;
import com.onlineorder.service.UserService;
import com.onlineorder.utils.BeanFactory;

public class AutoLoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String username = null;
		String password = null;
		//获得客户端携带的cooike
		Cookie[] cookies = req.getCookies();
		if (cookies!=null) {
			for (Cookie cookie : cookies) {
				if ("cookie_username".equals(cookie.getName())) {
					username = cookie.getValue();
				}
				if ("cookie_password".equals(cookie.getName())) {
					password = cookie.getValue();
				}
			}
		}
		if (username!=null&&password!=null) {
			User user = null;
			try {
				user = ((UserService) BeanFactory.getBean("userService")).login(username, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("user", user);
		}
		//放行请求
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}

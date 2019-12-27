package com.onlineorder.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginPageFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		
		//如果在已登录的情况下访问登陆页面
		//删除客户端账号密码cookie
		Cookie cookie_username = new Cookie("cookie_username", "");
		cookie_username.setMaxAge(0);
		Cookie cookie_password = new Cookie("cookie_password", "");
		cookie_password.setMaxAge(0);
		resp.addCookie(cookie_username);
		resp.addCookie(cookie_password);
		//判断是否有保存用户名的cookie
		Cookie[] cookies = req.getCookies();
		if (cookies!=null) {
			for (Cookie cookie : cookies) {
				if ("saveUsername".equals(cookie.getName())) {
					String saveUsername = cookie.getValue();
					if (saveUsername!=null) {
						session.setAttribute("saveUsername", saveUsername);
						break;
					}
				}

			}
		}
		chain.doFilter(req, resp);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

	public void destroy() {

	}
}
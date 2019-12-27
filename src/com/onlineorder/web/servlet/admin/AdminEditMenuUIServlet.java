package com.onlineorder.web.servlet.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.onlineorder.domain.Menu;
import com.onlineorder.service.AdminMenuService;
import com.onlineorder.utils.BeanFactory;

public class AdminEditMenuUIServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid");
		AdminMenuService service = (AdminMenuService) BeanFactory.getBean("adminMenuService");
		Menu menu = service.findMenuByMid(mid);
		Gson gson = new Gson();
		String json = gson.toJson(menu);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
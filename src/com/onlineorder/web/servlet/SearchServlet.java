package com.onlineorder.web.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class SearchServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String word = request.getParameter("word");
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		List<String> menuNameList = null;
		menuNameList = service.searchWord(word);
		//使用json转换工具(gson)将对象或集合转成json格式的字符串。
		Gson gson = new Gson();
		String json = gson.toJson(menuNameList);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
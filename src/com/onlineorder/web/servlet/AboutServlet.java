package com.onlineorder.web.servlet;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineorder.domain.About;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;



public class AboutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//数据库读取About的信息
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		//可能有连锁店？用集合存
		List<About> aboutList= service.findAboutInfo();
		for (About about : aboutList) {
			//读取aboutDesc文件的内容(详细描述)
			String p = request.getServletContext().getRealPath(about.getDesc_path());
			Path path = Paths.get(p);
			List<String> allDescLines = null;
			//判断是否存在文件，防止报异常
			if (Files.exists(path)) {
				//使用Files类的方法读文件
				allDescLines = Files.readAllLines(path);
			}
			//详细描述封装About实体中
			about.setAllDescLines(allDescLines);
		}
		
		request.setAttribute("aboutList", aboutList);
		request.getRequestDispatcher("/about.jsp").forward(request, response);
	}

	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
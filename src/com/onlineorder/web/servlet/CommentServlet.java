package com.onlineorder.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.onlineorder.domain.Comment;
import com.onlineorder.domain.User;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class CommentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String content = request.getParameter("content");
		String mid = request.getParameter("mid");
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		Comment comment = new Comment();
		comment.setComment_id(UUID.randomUUID().toString());
		comment.setUsername(user.getUsername());
		comment.setContent(content);
		comment.setDate(new Date());
		comment.setMid(mid);
		service.addComment(comment);
		response.setContentType("text/html;charset=utf-8");
		Gson gson = new Gson();
		String json = gson.toJson(comment);
		response.getWriter().write(json);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
package com.onlineorder.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineorder.domain.User;
import com.onlineorder.service.MenuService;
import com.onlineorder.service.UserService;
import com.onlineorder.utils.BeanFactory;

public class SubmitOrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String name = request.getParameter("name"); //收货人姓名
		String address = request.getParameter("address");//收货地址
		String telephone = request.getParameter("telephone");//收货人电话
		String oid = request.getParameter("oid");
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		UserService service2 = (UserService) BeanFactory.getBean("userService");
		service.addConsigneeInfo(name,address,telephone,oid);

		// TODO 在线支付(第三方支付接口)


		//支付成功
		//改变支付状态
		service.updateOrderState(oid);
		response.sendRedirect(request.getContextPath()+"/submitOrderSuccess.jsp");
		
		//获得积分
		String uid = ((User)session.getAttribute("user")).getUid();
		service.updateUserPoint(oid,uid);
		session.setAttribute("user", service2.getUser(uid));//更新session中的user
		
		//原商品移出购物车内容
		session.removeAttribute("cart");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
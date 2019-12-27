package com.onlineorder.web.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineorder.domain.Cart;
import com.onlineorder.domain.CartItem;
import com.onlineorder.domain.Order;
import com.onlineorder.domain.OrderItem;
import com.onlineorder.domain.User;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class SubmitCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		//封装好一个Order对象传给service层
		Order order = new Order();
		//1.订单编号
		order.setOid(UUID.randomUUID().toString());
		//2.下单时间
		order.setOrdertime(new Date());
		//3.订单总金额
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart!=null) {
			order.setTotal_price(cart.getTotalPrice());			
		}
		//4.订单状态，1表示已付款，0表示未付款
		order.setState(0);
		//5.收获地址
		order.setAddress(null);
		//6.收货人
		order.setName(null);
		//7.收货人电话
		order.setTelephone(null);
		//8.该订单属于哪一个用户
		User user = (User) session.getAttribute("user");//已经过filter过滤
		order.setUser(user);
		//9.该订单中的订单项
		Map<String, CartItem> cartItems = cart.getCartItems();
		for (Map.Entry<String, CartItem> entry : cartItems.entrySet()) {
			OrderItem orderItem = new OrderItem();
			//订单项的id
			orderItem.setItemid(UUID.randomUUID().toString());
			//订单项的购买数量
			orderItem.setCount(entry.getValue().getBuyNum());
			//订单项小计
			orderItem.setSubtotal(entry.getValue().getSubTotal());
			//订单项内部的商品
			orderItem.setMenu(((MenuService)BeanFactory.getBean("menuService")).getMenuByMid(entry.getKey()));
			//订单项属于哪个订单
			orderItem.setOrder(order);
			
			//将订单项添加到订单项集合中
			order.getOrderItems().add(orderItem);
		}
		
		//将封装完的order对象传到service层
		MenuService service = (MenuService)BeanFactory.getBean("menuService");
		service.submitCart(order);
		
		//order对象存入session域
		session.setAttribute("order", order);
		response.sendRedirect(request.getContextPath()+"/order_info.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
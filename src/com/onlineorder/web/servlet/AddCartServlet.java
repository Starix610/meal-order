package com.onlineorder.web.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineorder.domain.Cart;
import com.onlineorder.domain.CartItem;
import com.onlineorder.domain.Menu;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;

public class AddCartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		
		String mid = request.getParameter("mid");
		//订单数量
		int buyNum = Integer.parseInt(request.getParameter("buyNum"));
		//获得Menu对象
		Menu menu= service.getMenuByMid(mid);
		//计算小计
		double subTotal = menu.getPrice()*buyNum;
		
		
		//获得购物车对象cart---判断是否在session中已经存在购物车
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart==null) {
			cart = new Cart();
		}
		
		double totalPrice = cart.getTotalPrice()+subTotal;
		
		Map<String, CartItem> cartItems = cart.getCartItems();
		//判断购物车中是否已经存在购物项cartIteam
		if (cartItems.containsKey(mid)) {
			CartItem oldCartItem = cartItems.get(mid);//取得已存在的CartItem对象
			buyNum = oldCartItem.getBuyNum()+buyNum;
			subTotal = buyNum*menu.getPrice();
		}
		//封装CartItem
		CartItem cartItem = new CartItem();
		cartItem.setMenu(menu);
		cartItem.setSubTotal(subTotal);
		cartItem.setBuyNum(buyNum);
		
		//封装购物车Cart对象
		cartItems.put(mid, cartItem);
		cart.setCartItems(cartItems);
		cart.setTotalPrice(totalPrice);
		//将cart放入session
		session.setAttribute("cart", cart);
		//重定向到购物车页面(转发会导致页面自带参数刷新)
		response.sendRedirect(request.getContextPath()+"/cart.jsp");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
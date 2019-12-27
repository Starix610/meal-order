package com.onlineorder.domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	
	//map的key用来存购物项对应的商品id
	private Map<String,CartItem> cartItems = new HashMap<>();
	private double totalPrice;

	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Map<String, CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}

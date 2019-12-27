package com.onlineorder.service;

import java.util.List;
import com.onlineorder.domain.About;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Comment;
import com.onlineorder.domain.Menu;
import com.onlineorder.domain.Order;
import com.onlineorder.domain.PageBean;
import com.onlineorder.domain.User;


public interface MenuService {

	List<Menu> findHotMenuList();

	List<Menu> findNewMenuList();

	List<About> findAboutInfo();

	List<Category> findAllCategory();

	PageBean<Menu> getMenuPageBean(String cid, int currentPage, int currentCount);

	String getCategoryNameByCid(String cid);

	Menu getMenuByMid(String mid);

	void submitCart(Order order);

	void addConsigneeInfo(String name, String address, String telephone, String oid);

	void updateOrderState(String oid);

	PageBean<Order> getOrderPageBean(String uid, int currentPage, int currentCount);

	PageBean<Order> getOrderQueryPageBean(String uid, String queryMethod, String condition, int currentPage, int currentCount);

	void updateUserInfo(User user);

	void updateUserPoint(String oid, String uid);

	List<String> searchWord(String word);

	PageBean<Menu> getMenuPageBeanByName(String menuName, int currentPage, int currentCount);

	void addComment(Comment comment);

	
}

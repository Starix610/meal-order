package com.onlineorder.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.onlineorder.domain.About;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Comment;
import com.onlineorder.domain.Menu;
import com.onlineorder.domain.Order;
import com.onlineorder.domain.User;

public interface MenuDao {

	List<Menu> findHotMenuList() throws SQLException;

	List<Menu> findNewMenuList() throws SQLException;

	List<About> findAboutInfo() throws SQLException;

	List<Category> findAllCategory() throws SQLException;

	List<Menu> findMenuListByCid(String cid, int index, int currentCount) throws SQLException;

	int getMenuCount(String cid) throws SQLException;

	String getCategoryNameByCid(String cid) throws SQLException;

	Menu getMenuByMid(String mid) throws SQLException;

	void addOrder(Order order) throws SQLException;

	void addOrderItem(Order order) throws SQLException;

	void addConsigneeInfo(String name, String address, String telephone, String oid) throws SQLException;

	void updateOrderState(String oid) throws SQLException;

	List<Order> findAllOrdersByUid(String uid, int index, int currentCount) throws SQLException;

	List<Map<String, Object>> findAllOrderItemByOid(String oid) throws SQLException;

	int getOrderCount(String cid) throws SQLException;

	List<Order> queryOrder(String uid, String queryMethod, String condition, int index, int currentCount) throws SQLException;

	int getQueryOrderCount(String uid, String queryMethod, String condition) throws SQLException;

	void updateUserInfo(User user) throws SQLException;

	void updateUserPoint(double totalPrice, String uid) throws SQLException;

	double getOrderTotalPrice(String oid) throws SQLException;

	List<String> searchWord(String word) throws SQLException;

	int getMenuCountByName(String menuName) throws SQLException;

	List<Menu> findMenuListByName(String menuName, int index, int currentCount) throws SQLException;

	void addComment(Comment comment) throws SQLException;

	List<Comment> getCommentListByMid(String mid) throws SQLException;
	
}

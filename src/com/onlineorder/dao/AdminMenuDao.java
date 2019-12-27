package com.onlineorder.dao;

import java.sql.SQLException;
import java.util.List;

import com.onlineorder.domain.Admin;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Menu;

public interface AdminMenuDao {

	List<Menu> getMenuList() throws SQLException;

	List<Category> getCategoryList() throws SQLException;

	void addMenu(Menu menu) throws SQLException;

	Menu findMenuByMid(String mid) throws SQLException;

	void updateMenu(Menu menu) throws SQLException;

	void delCategory(String cid) throws SQLException;

	void addCategory(Category category) throws SQLException;

	void updateCategory(String cid, String name) throws SQLException;

	void delMenu(String mid) throws SQLException;

	Admin login(String admin, String password) throws SQLException;

}

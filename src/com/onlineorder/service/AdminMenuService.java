package com.onlineorder.service;

import java.util.List;

import com.onlineorder.domain.Admin;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Menu;

public interface AdminMenuService {

	List<Menu> getMenuList();

	List<Category> getCategoryList();

	void addMenu(Menu menu);

	Menu findMenuByMid(String mid);

	void updateMenu(Menu menu);

	void delCategory(String cid);

	void addCategory(Category category);

	void updateCategory(String cid, String name);

	void delMenu(String mid);

	Admin login(String admin, String password);


}

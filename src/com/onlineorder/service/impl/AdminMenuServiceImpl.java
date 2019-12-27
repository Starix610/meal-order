package com.onlineorder.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.onlineorder.dao.AdminMenuDao;
import com.onlineorder.domain.Admin;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Menu;
import com.onlineorder.service.AdminMenuService;
import com.onlineorder.utils.BeanFactory;

public class AdminMenuServiceImpl implements AdminMenuService {
	
	private AdminMenuDao adminMenuDao = (AdminMenuDao) BeanFactory.getBean("adminMenuDao");

	
	@Override
	public List<Menu> getMenuList() {
		// TODO Auto-generated method stub
		List<Menu> menuList = null;
		try {
			menuList = adminMenuDao.getMenuList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menuList;
	}

	@Override
	public List<Category> getCategoryList() {
		// TODO Auto-generated method stub
		List<Category> categoryList = null;
		try {
			categoryList = adminMenuDao.getCategoryList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryList;
	}

	@Override
	public void addMenu(Menu menu) {
		// TODO Auto-generated method stub
		try {
			adminMenuDao.addMenu(menu);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Menu findMenuByMid(String mid) {
		// TODO Auto-generated method stub
		Menu menu = null;
		try {
			menu = adminMenuDao.findMenuByMid(mid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menu;
	}

	@Override
	public void updateMenu(Menu menu) {
		// TODO Auto-generated method stub
		try {
			adminMenuDao.updateMenu(menu);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delCategory(String cid) {
		// TODO Auto-generated method stub
		try {
			adminMenuDao.delCategory(cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void addCategory(Category category) {
		// TODO Auto-generated method stub
		try {
			adminMenuDao.addCategory(category);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateCategory(String cid, String name) {
		// TODO Auto-generated method stub
		try {
			adminMenuDao.updateCategory(cid,name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delMenu(String mid) {
		// TODO Auto-generated method stub
		try {
			adminMenuDao.delMenu(mid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Admin login(String admin, String password) {
		// TODO Auto-generated method stub
		Admin query = null;
		try {
			query = adminMenuDao.login(admin,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return query;
	}

}

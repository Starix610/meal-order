package com.onlineorder.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.onlineorder.dao.AdminMenuDao;
import com.onlineorder.domain.Admin;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Menu;
import com.onlineorder.utils.C3P0Utils;

public class AdminMenuDaoImpl implements AdminMenuDao {

	@Override
	public List<Menu> getMenuList() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from menu";
		List<Menu> menuList = queryRunner.query(sql, new BeanListHandler<Menu>(Menu.class));
		return menuList;
	}

	@Override
	public List<Category> getCategoryList() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from category";
		List<Category> categoryList = queryRunner.query(sql, new BeanListHandler<Category>(Category.class));
		return categoryList;
	}

	@Override
	public void addMenu(Menu menu) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into menu values(?,?,?,?,?,?,?,?)";
		queryRunner.update(sql, menu.getMid(),menu.getName(),menu.getPrice(),menu.getImage(),menu.getDate(),
				menu.getIs_hot(),menu.getDesc(),menu.getCid());
	}

	@Override
	public Menu findMenuByMid(String mid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from menu where mid = ?";
		Menu menu = queryRunner.query(sql, new BeanHandler<Menu>(Menu.class), mid);
		return menu;
	}

	@Override
	public void updateMenu(Menu menu) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update menu set name=?,price=?,image=?,date=?,is_hot=?,menu.desc=?,cid=? where mid = ?";
		queryRunner.update(sql, menu.getName(),menu.getPrice(),menu.getImage(),menu.getDate(),menu.getIs_hot(),menu.getDesc(),
				menu.getCid(),menu.getMid());
	}

	@Override
	public void delCategory(String cid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from category where cid = ?";
		queryRunner.update(sql, cid);
	}

	@Override
	public void addCategory(Category category) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into category values(?,?)";
		queryRunner.update(sql, category.getCid(),category.getName());
	}

	@Override
	public void updateCategory(String cid, String name) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update category set name = ? where cid = ?";
		queryRunner.update(sql, name,cid);
	}

	@Override
	public void delMenu(String mid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from menu where mid = ?";
		queryRunner.update(sql, mid);
	}

	@Override
	public Admin login(String admin, String password) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from admin where admin = ? and password = ?";
		Admin query = queryRunner.query(sql, new BeanHandler<Admin>(Admin.class), admin,password);
		return query;
	}

}

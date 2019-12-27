package com.onlineorder.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import com.onlineorder.dao.MenuDao;
import com.onlineorder.domain.About;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Comment;
import com.onlineorder.domain.Menu;
import com.onlineorder.domain.Order;
import com.onlineorder.domain.OrderItem;
import com.onlineorder.domain.PageBean;
import com.onlineorder.domain.User;
import com.onlineorder.service.MenuService;
import com.onlineorder.utils.BeanFactory;
import com.onlineorder.utils.MyDataSourceUtils;

public class MenuServiceImpl implements MenuService {

	private MenuDao menuDao = (MenuDao) BeanFactory.getBean("menuDao");
	
	//获得热门菜单
	@Override
	public List<Menu> findHotMenuList() {
		// TODO Auto-generated method stub
	 	List<Menu> list = null;
		try {
			list = menuDao.findHotMenuList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	//获得最新菜单(推荐菜单)
	@Override
	public List<Menu> findNewMenuList() {
		// TODO Auto-generated method stub
	 	List<Menu> list = null;
		try {
			list = menuDao.findNewMenuList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//获得简介信息
	@Override
	public List<About> findAboutInfo() {
		// TODO Auto-generated method stub
		List<About> list = null;
		try {
			list = menuDao.findAboutInfo();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//获得菜单属性列表
	@Override
	public List<Category> findAllCategory() {
		// TODO Auto-generated method stub
		List<Category> list = null;
		try {
			list = menuDao.findAllCategory();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	//通过cid获得指定属性菜单的页面pageBean对象
	@Override
	public PageBean<Menu> getMenuPageBean(String cid,int currentPage, int currentCount) {
		// TODO Auto-generated method stub
		

		//封装一个pageBean返回给web层
		PageBean<Menu> pageBean = new PageBean<>();
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		try {
			int totalCount = menuDao.getMenuCount(cid);
			pageBean.setTotalCount(totalCount);
			int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
			pageBean.setTotalPage(totalPage);
			//分页查询起始索引
			int index = (currentPage-1)*currentCount;
			List<Menu> menuList = menuDao.findMenuListByCid(cid,index,currentCount);
			pageBean.setList(menuList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pageBean;
	}

	//获得当前菜单属性名
	@Override
	public String getCategoryNameByCid(String cid) {
		// TODO Auto-generated method stub
		String categoryName = null;
		try {
			categoryName = menuDao.getCategoryNameByCid(cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryName;
	}

	//获得Menu(菜肴);
	@Override
	public Menu getMenuByMid(String mid) {
		// TODO Auto-generated method stub
		Menu menu = null;
		try {
			menu = menuDao.getMenuByMid(mid);
			List<Comment> commentList = menuDao.getCommentListByMid(mid);
			menu.setCommentList(commentList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return menu;
	}
	
	//购物车提交
	@Override
	public void submitCart(Order order) {
		
		try {
			MyDataSourceUtils.startTransaction();
			menuDao.addOrder(order);
			menuDao.addOrderItem(order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//出现异常回滚事务
			MyDataSourceUtils.rollback();
		} finally {
			MyDataSourceUtils.commit();
		}
		
	}

	//添加收货人信息
	@Override
	public void addConsigneeInfo(String name, String address, String telephone, String oid) {
		// TODO Auto-generated method stub
		try {
			menuDao.addConsigneeInfo(name,address,telephone,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//更新订单状态
	@Override
	public void updateOrderState(String oid) {
		// TODO Auto-generated method stub
		try {
			menuDao.updateOrderState(oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//获得积分
	@Override
	public void updateUserPoint(String oid, String uid) {
		// TODO Auto-generated method stub
		try {
			double totalPrice = menuDao.getOrderTotalPrice(oid);
			menuDao.updateUserPoint(totalPrice,uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//获得订单页面pageBean对象
	@Override
	public PageBean<Order> getOrderPageBean(String uid, int currentPage, int currentCount) {
		// TODO Auto-generated method stub
		PageBean<Order> pageBean = new PageBean<>();
		
		try {
			//分页起始索引
			int index = (currentPage-1)*currentCount;
			// 我的订单需要的Order集合
			List<Order> orderList = menuDao.findAllOrdersByUid(uid,index,currentCount);
			int totalCount = menuDao.getOrderCount(uid);
			int totalPage = (int)(Math.ceil(1.0*totalCount/currentCount));
			pageBean.setTotalCount(totalCount);
			pageBean.setTotalPage(totalPage);
			pageBean.setCurrentCount(currentCount);
			pageBean.setCurrentPage(currentPage);
			pageBean.setList(orderList);
			
			if (!orderList.isEmpty()) {
				for (Order order : orderList) {
					String oid = order.getOid();
					// 通过订单oid找到所有订单项,mapList封装了多个订单项的信息和订单项中的商品信息(多表查询)
					List<Map<String, Object>> mapList = menuDao.findAllOrderItemByOid(oid);
					for (Map<String, Object> map : mapList) {
						// 将mapList中的有关数据封装到Orderitem中
						OrderItem item = new OrderItem();
						Menu menu = new Menu();
						try {
							// 封装count,subtotal到Orderitem中
							BeanUtils.populate(item, map);
							// 封装image,price,name到Menu中
							BeanUtils.populate(menu, map);
						} catch (IllegalAccessException | InvocationTargetException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						// menu封装到Orderitem中
						item.setMenu(menu);
						order.getOrderItems().add(item);
					}
				}
			}else {
				pageBean = null;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pageBean;
	}

	//获得查询到的订单的页面pageBean
	@Override
	public PageBean<Order> getOrderQueryPageBean(String uid, String queryMethod, String condition, int currentPage, int currentCount) {
		// TODO Auto-generated method stub
		PageBean<Order> pageBean = new PageBean<>();
		
		try {
			//分页起始索引
			int index = (currentPage-1)*currentCount;
			List<Order> orderList = menuDao.queryOrder(uid,queryMethod,condition,index,currentCount);
			int totalCount = menuDao.getQueryOrderCount(uid,queryMethod,condition);
			int totalPage = (int)(Math.ceil(1.0*totalCount/currentCount));
			pageBean.setTotalCount(totalCount);
			pageBean.setTotalPage(totalPage);
			pageBean.setCurrentCount(currentCount);
			pageBean.setCurrentPage(currentPage);
			pageBean.setList(orderList);
			
			if (!orderList.isEmpty()) {
				for (Order order : orderList) {
					String oid = order.getOid();
					// 通过订单oid找到所有订单项,mapList封装了多个订单项的信息和订单项中的商品信息(多表查询)
					List<Map<String, Object>> mapList = menuDao.findAllOrderItemByOid(oid);
					for (Map<String, Object> map : mapList) {
						// 将mapList中的有关数据封装到Orderitem中
						OrderItem item = new OrderItem();
						Menu menu = new Menu();
						try {
							// 封装count,subtotal到Orderitem中
							BeanUtils.populate(item, map);
							// 封装image,price,name到Menu中
							BeanUtils.populate(menu, map);
						} catch (IllegalAccessException | InvocationTargetException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						// menu封装到Orderitem中
						item.setMenu(menu);
						order.getOrderItems().add(item);
					}
				}
			}else {
				pageBean = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pageBean;
	}

	//更新个人资料
	@Override
	public void updateUserInfo(User user) {
		// TODO Auto-generated method stub
		try {
			menuDao.updateUserInfo(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//获得菜肴搜索框内容
	@Override
	public List<String> searchWord(String word) {
		// TODO Auto-generated method stub
		List<String> list = null;
		try {
			list = menuDao.searchWord(word);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public PageBean<Menu> getMenuPageBeanByName(String menuName, int currentPage, int currentCount) {
		// TODO Auto-generated method stub
		
		//封装一个pageBean返回给web层
		PageBean<Menu> pageBean = new PageBean<>();
		pageBean.setCurrentPage(currentPage);
		pageBean.setCurrentCount(currentCount);
		try {
			int totalCount = menuDao.getMenuCountByName(menuName);
			int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
			//分页查询起始索引
			int index = (currentPage-1)*currentCount;
			List<Menu> menuList = menuDao.findMenuListByName(menuName,index,currentCount);
			pageBean.setTotalCount(totalCount);
			pageBean.setTotalPage(totalPage);
			pageBean.setList(menuList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pageBean;
	}
	@Override
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		try {
			menuDao.addComment(comment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}

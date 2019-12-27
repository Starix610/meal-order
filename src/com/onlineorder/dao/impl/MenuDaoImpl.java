package com.onlineorder.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.onlineorder.dao.MenuDao;
import com.onlineorder.domain.About;
import com.onlineorder.domain.Category;
import com.onlineorder.domain.Comment;
import com.onlineorder.domain.Menu;
import com.onlineorder.domain.Order;
import com.onlineorder.domain.OrderItem;
import com.onlineorder.domain.User;
import com.onlineorder.utils.C3P0Utils;
import com.onlineorder.utils.MyDataSourceUtils;

public class MenuDaoImpl implements MenuDao {

	@Override
	public List<Menu> findHotMenuList() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from menu where is_hot = ? limit ?,?";
		List<Menu> list = queryRunner.query(sql, new BeanListHandler<Menu>(Menu.class),1,0,8);
		return list;
	}

	@Override
	public List<Menu> findNewMenuList() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from menu order by date desc limit ?,?";
		List<Menu> list = queryRunner.query(sql, new BeanListHandler<Menu>(Menu.class),0,8);
		return list;
	}

	@Override
	public List<About> findAboutInfo() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from about";
		List<About> list = queryRunner.query(sql, new BeanListHandler<About>(About.class));
		return list;
	}

	@Override
	public List<Category> findAllCategory() throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from category";
		return queryRunner.query(sql, new BeanListHandler<Category>(Category.class));
	}

	@Override
	public List<Menu> findMenuListByCid(String cid,int index, int currentCount) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		StringBuffer sb = new StringBuffer();
		//首次访问或者cid=0显示全部数据,否则按cid取数据
		if (cid!=null&&!cid.equals("0")) {
			sb.append("where cid ="+cid+" limit "+index+","+currentCount);
		}else {
			sb.append("limit "+index+","+currentCount);
		}
		String sql = "select * from menu "+sb;
		List<Menu> list = queryRunner.query(sql, new BeanListHandler<Menu>(Menu.class));
		return list;
	}

	@Override
	public int getMenuCount(String cid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		StringBuffer sb = new StringBuffer();
		if (cid!=null&&!cid.equals("0")) {
			sb.append("where cid ="+cid);
		}
		String sql = "select count(*) from menu "+sb;
		Long count = queryRunner.query(sql, new ScalarHandler<>());
		return count.intValue();
	}

	@Override
	public String getCategoryNameByCid(String cid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		StringBuffer sb = new StringBuffer();
		if (cid!=null) {
			sb.append("where cid = "+cid);
		}
		String sql = "select name from category "+sb;
		String categoryName = queryRunner.query(sql, new ScalarHandler<>());
		return categoryName;
	}

	@Override
	public Menu getMenuByMid(String mid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from menu where mid = ?";
		Menu menu = queryRunner.query(sql, new BeanHandler<Menu>(Menu.class), mid);
		return menu;
	}

	@Override
	public void addOrder(Order order) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		Connection conn = MyDataSourceUtils.getCurrentConnection();//每条语句都是同一个connection对象
		queryRunner.update(conn, sql, order.getOid(),order.getOrdertime(),order.getTotal_price(),order.getState(),order.getAddress(),
				order.getName(),order.getTelephone(),order.getUser().getUid());
	}

	@Override
	public void addOrderItem(Order order) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into orderitem values(?,?,?,?,?)";
		Connection conn = MyDataSourceUtils.getCurrentConnection();//每条语句都是同一个connection对象
		List<OrderItem> orderItems = order.getOrderItems();
		for (OrderItem orderItem : orderItems) {
			queryRunner.update(conn, sql, orderItem.getItemid(),orderItem.getCount(),orderItem.getSubtotal(),
					orderItem.getMenu().getMid(),orderItem.getOrder().getOid());			
		}
	}

	@Override
	public void addConsigneeInfo(String name, String address, String telephone, String oid) throws SQLException {
		// TODO Auto-generated method stub
		
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update orders set name=?,address=?,telephone=? where oid = ?";
		queryRunner.update(sql, name,address,telephone,oid);
		
	}

	@Override
	public void updateOrderState(String oid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update orders set state = ? where oid = ?";
		queryRunner.update(sql, 1, oid);
		
	}

	@Override
	public List<Order> findAllOrdersByUid(String uid, int index, int currentCount) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from orders where uid = ? limit ?,?";
		List<Order> list = queryRunner.query(sql, new BeanListHandler<Order>(Order.class), uid,index,currentCount);
		return list;
	}
	@Override
	public int getOrderCount(String uid) throws SQLException {
		// TODO Auto-generated method stub
		
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from orders where uid = ?";
		Long count = queryRunner.query(sql, new ScalarHandler<>(), uid);
		return count.intValue();
	}

	@Override
	public List<Map<String, Object>> findAllOrderItemByOid(String oid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select o.count,o.subtotal,m.name,m.price,m.image from orderitem o,menu m where o.mid = m.mid and o.oid = ?";
		List<Map<String, Object>> list = queryRunner.query(sql,new MapListHandler(),oid);
		return list;
	}


	@Override
	public List<Order> queryOrder(String uid, String queryMethod,String condition, int index, int currentCount) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = null;
		if (queryMethod.equals("ordertime")) {
			sql = "select * from orders where ordertime like ? and uid = ? limit ?,?";
			condition = "%"+condition+"%";
		}else {
			sql = "select * from orders where oid = ?  and uid = ?  limit ?,?";								
		}
		List<Order> orderList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class), condition,uid,index,currentCount);
		return orderList;
	}

	@Override
	public int getQueryOrderCount(String uid, String queryMethod, String condition) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = null;
		if (queryMethod.equals("ordertime")) {
			sql = "select count(*) from orders where ordertime like ? and uid = ? ";
			condition = "%"+condition+"%";
		}else {
			sql = "select count(*) from orders where oid = ? and uid = ? ";								
		}
		Long count = queryRunner.query(sql, new ScalarHandler<>(),condition,uid);
		return count.intValue();
	}

	@Override
	public void updateUserInfo(User user) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update user set username=?,name=?,email=?,telephone=?,birthday=?,sex=?,age=?,image=? where uid = ?";
		queryRunner.update(sql, user.getUsername(),user.getName(),user.getEmail(),user.getTelephone(),user.getBirthday(),
				user.getSex(),user.getAge(),user.getImage(),user.getUid());
		
	}
	@Override
	public double getOrderTotalPrice(String oid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select total_price from orders where oid = ?";
		double totalPrice =  queryRunner.query(sql, new ScalarHandler<>(), oid);
		return totalPrice;
	}

	@Override
	public void updateUserPoint(double totalPrice, String uid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update user set point = point+? where uid = ?";
		queryRunner.update(sql,totalPrice,uid);
	}

	@Override
	public List<String> searchWord(String word) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from menu where name like ? limit 0,8";
		List<String> list =  queryRunner.query(sql, new ColumnListHandler<String>("name"),"%"+word+"%");
		return list;
	}

	@Override
	public int getMenuCountByName(String menuName) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select count(*) from menu where name like ?";
		Long count = queryRunner.query(sql, new ScalarHandler<>(), "%"+menuName+"%");
		return count.intValue();
	}

	@Override
	public List<Menu> findMenuListByName(String menuName, int index, int currentCount) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from menu where name like ? limit ?,?";
		List<Menu> list = queryRunner.query(sql, new BeanListHandler<Menu>(Menu.class),"%"+menuName+"%",index,currentCount);
		return list;
	}

	@Override
	public void addComment(Comment comment) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into comment values(?,?,?,?,?)";
		queryRunner.update(sql, comment.getComment_id(),comment.getUsername(),comment.getContent(),comment.getDate(),comment.getMid());
	}

	@Override
	public List<Comment> getCommentListByMid(String mid) throws SQLException {
		// TODO Auto-generated method stub
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from comment where mid = ? order by date desc";
		List<Comment> commentList = queryRunner.query(sql, new BeanListHandler<Comment>(Comment.class), mid);
		return commentList;
	}


}

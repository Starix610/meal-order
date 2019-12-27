package com.onlineorder.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import com.onlineorder.domain.User;
import com.onlineorder.service.UserService;
import com.onlineorder.utils.BeanFactory;
import com.onlineorder.utils.MailUtils;


public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static final String BASE_URL = "http://139.196.102.109:8080";

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String inputImgCode = request.getParameter("checkImg");
		String imgCode = (String) session.getAttribute("checkcode_session");
		if (!imgCode.equals(inputImgCode)) {
			request.setAttribute("registerInfo", "您输入的验证码有误,请重新输入！");
			// 转发实现将错误信息回显(一次请求中,可以获取到request域中的数据)
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}else {
			Map<String, String[]> map = request.getParameterMap();
			User user = new User();
			try {
				//自己指定一个转换器(将生日的String转成Date)
				ConvertUtils.register(new Converter() {
					@Override
					//clazz:要转成的类型
					//obj:要转的字符串
					public Object convert(@SuppressWarnings("rawtypes") Class clazz, Object obj) {
						// TODO Auto-generated method stub
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						Date date = null;
						try {
							date = format.parse(obj.toString());
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						return date;
					}
				}, Date.class);
				
				//封装实体
				BeanUtils.populate(user,map);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//uid
			user.setUid(UUID.randomUUID().toString());
			//telephone
			user.setTelephone("123456789");
			//state:是否激活
			user.setState(0);
			//code:激活码
			String code = UUID.randomUUID().toString();
			user.setCode(code);
			//初始0积分
			user.setAge(0);
			user.setPoint(0);
			user.setImage("user_image/default.jpg");
			user.setCreateTime(new Date());
			UserService service = (UserService) BeanFactory .getBean("userService");
			boolean isRegisterSuccess = service.register(user);
			//是否注册成功
			if (isRegisterSuccess) {
				response.sendRedirect(request.getContextPath()+"/registerSuccess.html");
				String subject = "网上订餐用户激活";
				String emailMsg = "恭喜您注册成功，请点击下面的链接进行账户激活<br><a href='" + BASE_URL + request.getContextPath()+"/active?activeCode="+code+"'>"
						+ BASE_URL + request.getContextPath()+"/active?activeCode="+code+"</a>";
				try {
					MailUtils.sendMail(user.getEmail(),subject, emailMsg);
				} catch (MessagingException e) {
					request.setAttribute("registerInfo", "注册失败，服务器内部错误！");
					request.getRequestDispatcher("/register.jsp").forward(request, response);
					e.printStackTrace();
				}
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
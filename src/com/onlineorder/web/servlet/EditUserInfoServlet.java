package com.onlineorder.web.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.onlineorder.domain.User;
import com.onlineorder.service.MenuService;
import com.onlineorder.service.UserService;
import com.onlineorder.utils.BeanFactory;

public class EditUserInfoServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MenuService service = (MenuService) BeanFactory.getBean("menuService");
		
		// 接收文件上传表单
		// 1.创建磁盘文件项工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();

		// 2.创建文件上传的核心类对象
		ServletFileUpload upload = new ServletFileUpload(factory);
		// 设置上传文件的名称的编码
		upload.setHeaderEncoding("UTF-8");
		InputStream in = null;
		OutputStream out = null;
		Map<String, String> map = new HashMap<>();
		try {
			// 3.解析request
			@SuppressWarnings("unchecked") // 抑制unchecked警告
			List<FileItem> parseRequest = upload.parseRequest(request);
			// 4.遍历表单项
			if (parseRequest != null) {
				for (FileItem fileItem : parseRequest) {
					// 5.判断普通表单项/文件上传项
					boolean formField = fileItem.isFormField();
					if (formField) {
						// 普通表单项
						String fieldName = fileItem.getFieldName();
						String fieldValue = fileItem.getString("UTF-8");
						map.put(fieldName, fieldValue);
					} else {
						// 文件上传项
						// 获得上传文件的名称
						String fileName = fileItem.getName();
						// 获得上传文件的内容
						if (!fileName.equals("")) {
							String path = this.getServletContext().getRealPath("user_image");
							in = fileItem.getInputStream();
							out = new FileOutputStream(path + "/" + fileName);
							// 保存上传的图片
							IOUtils.copy(in, out);
							map.put("image", "user_image/" + fileName);
						}else {
							//未选择文件则使用原来的图片地址
							User user = (User) request.getSession().getAttribute("user");
							String image = user.getImage();
							map.put("image", image);
						}
					}
				}

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
							if (!obj.equals("")) {
								date = format.parse(obj.toString());								
							}

						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						return date;
					}
				}, Date.class);
				
				User user = new User();
				//封装实体
				BeanUtils.populate(user,map);
				service.updateUserInfo(user);
				User currentUser = ((UserService)BeanFactory.getBean("userService")).getUser(user.getUid());
				request.getSession().setAttribute("user", currentUser);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (out != null) {
				out.close();
			}
			if (in != null) {
				in.close();
			}
		}
		response.sendRedirect(request.getContextPath() + "/member_center.jsp");

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
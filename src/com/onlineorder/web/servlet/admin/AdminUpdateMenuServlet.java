package com.onlineorder.web.servlet.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.onlineorder.domain.Menu;
import com.onlineorder.service.AdminMenuService;
import com.onlineorder.utils.BeanFactory;

public class AdminUpdateMenuServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminMenuService service = (AdminMenuService) BeanFactory.getBean("adminMenuService");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		InputStream in = null;
		OutputStream out = null;
		Map<String,Object> map = new HashMap<>();
		try {
			@SuppressWarnings("unchecked")// 抑制unchecked警告
			List<FileItem> parseRequest = upload.parseRequest(request);
			if (parseRequest!=null) {
				for (FileItem fileItem : parseRequest) {
					boolean formField = fileItem.isFormField();
					if (formField) {
						String fieldName = fileItem.getFieldName();
						String fieldValue = fileItem.getString("UTF-8");
						map.put(fieldName, fieldValue);
					}else {
						String fileName = fileItem.getName();
						String path = this.getServletContext().getRealPath("menu");
						//判断是否选择了上传文件
						if (!fileName.equals("")) {
							in = fileItem.getInputStream();
							out = new FileOutputStream(path+"/"+fileName);
							IOUtils.copy(in, out);
							map.put("image", "menu/"+fileName);
						}else {
							//未选择文件则使用原来的图片地址
							Menu menu = service.findMenuByMid(request.getParameter("mid"));
							String image = menu.getImage();
							map.put("image", image);
						}
					}
				}
				
				Menu menu = new Menu();
				BeanUtils.populate(menu, map);
				menu.setDate(new Date());
				menu.setMid(request.getParameter("mid"));
				service.updateMenu(menu);
				response.getWriter().write("{\"success\":\"true\"}");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (out != null) {
				out.close();
			}
			if (in != null) {
				in.close();
			}
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
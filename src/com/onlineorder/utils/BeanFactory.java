package com.onlineorder.utils;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class BeanFactory {

	public static Object getBean(String string) {
		// TODO Auto-generated method stub
		
		//生产对象---更具参数生产---配置文件----把对象的生产细节写到配置文件中
		//使用dom4j解析xml
		
		//1.创建解析器
		SAXReader reader = new SAXReader();
		
		//2.解析src下的bean.xml
		String path = BeanFactory.class.getClassLoader().getResource("bean.xml").getPath();
		try {
			Document doc = reader.read(path);
			
			//3.获得xml元素---参数是XPath规则
			Element element = (Element) doc.selectSingleNode("//bean[@id='"+string+"']");
			
			String className = element.attributeValue("class");
			//4.使用反射创建相应的对象
			Object object = Class.forName(className).newInstance();
			return object;
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
 		
		return null;
	}
	
}

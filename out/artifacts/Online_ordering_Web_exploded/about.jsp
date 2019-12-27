<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>网上订餐系统</title>
  		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 		<link href="./css/style.css" rel="stylesheet" type="text/css"  media="all" />
 		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	</head>
	<body>
		<!-- 引入页面头部 -->
		<!----start-header----->
		<jsp:include page="/header.jsp"></jsp:include>
		<!----End-header----->
		 <!---start-content---->
		 <div class="content">
		 	<!---start-about---->
		 	<div class="about-us">
		 			<div class="wrap">
						<div class="about-header">
							<h3>关于我们</h3>
							<div class="clear"> </div>
						</div>
						<div class="about-info">
							<c:forEach items="${aboutList }" var="about">
								<hr>
								<a href="#">地址：${about.address }</a>
								<p>餐厅名称：${about.name }</p>
								<p>联系人：${about.contact } &nbsp;&nbsp;${about.telephone }</p>
								<c:forEach items="${about.allDescLines }" var="para">
									<p>${para }</p>
								</c:forEach>
							</c:forEach>
						</div>
					<!-- <div class="specials">
					<div class="specials-heading">
						<h3>今日特价</h3>
						<div class="clear"> </div>
					</div>
					<div class="clear"> </div>
					<div class="specials-grids">
						<div class="special-grid">
							<img src="./images/slider2.jpg" title="image-name">
							<a href="#">Lorem ipsum dolor</a>
							<p>Lorem ipsum dolor sit amet consectetur adiing elit. In volutpat luctus eros ac placerat. Quisque erat metus facilisis non feu,aliquam hendrerit quam. Donec ut lectus vel dolor adipiscing tincnt.</p>
						</div>
						<div class="special-grid">
							<img src="./images/slider1.jpg" title="image-name">
							<a href="#">volutpat luctus</a>
							<p>Lorem ipsum dolor sit amet consectetur adiing elit. In volutpat luctus eros ac placerat. Quisque erat metus facilisis non feu,aliquam hendrerit quam. Donec ut lectus vel dolor adipiscing tincnt.</p>
						</div>
						<div class="special-grid spe-grid">
							<img src="./images/slider4.jpg" title="image-name">
							<a href="#">Quisque erat metus</a>
							<p>Lorem ipsum dolor sit amet consectetur adiing elit. In volutpat luctus eros ac placerat. Quisque erat metus facilisis non feu,aliquam hendrerit quam. Donec ut lectus vel dolor adipiscing tincnt.</p>
						</div>
						<div class="clear"> </div>
					</div>
					<div class="clear"> </div>
					</div> -->
					</div>
					<div class="mid-grid">
						<div class="wrap">
							<h1>欢迎光临我们的店铺！</h1>
							<h2>本店致力于给客户提供更好的订餐、用餐体验！</h2>
							<p>网上订餐就是互联网的深入应用。用户通过互联网，能足不出户，轻松闲逸地实现自己订购餐饮和食品（包括饭、菜、盒饭、便当等）的一种网络订餐形式。随着网上订餐平台的兴起，网上订餐已经逐渐成为了白领阶层中的一种潮流了。</p>
					<!-- <a class="button1" href="#">Read More</a> -->
						</div>
					</div>
		 	<!---End-about---->
		 </div>
		 </div>
		 <!---End-content---->
		 <!---start-footer---->
		<jsp:include page="footer.jsp"></jsp:include>
		 <!---End-footer---->
	</body>
</html>
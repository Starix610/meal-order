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
		<link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
		<link href="./css/slider.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="./js/jquery.min.js"></script>
		<script type="text/javascript" src="./js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="./js/camera.min.js"></script>
		<script type="text/javascript" src="./js/jquery.lightbox.js"></script>
		<link rel="stylesheet" type="text/css" href="./css/lightbox.css" media="screen" />
		<script type="text/javascript">
			$(function() {
				$('.gallery a').lightBox();
			});
		</script>
		<script type="text/javascript">
			jQuery(function() {
				jQuery('#camera_wrap_1').camera({
					pagination: false,
					time:100,
				});
			});
			
		</script>
	</head>

	<body>
		<!-- 引入页面头部 -->
		<!----start-header----->
		<jsp:include page="/header.jsp"></jsp:include>
		<!----End-header----->
		
		<!--start-image-slider---->
		<div class="slider">
			<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
				<div data-src="./images/slider1.jpg"> 12</div>
				<div data-src="./images/slider2.jpg"> </div>
				<div data-src="./images/slider3.jpg"> </div>
				<div data-src="./images/slider4.jpg"> </div>
			</div>
			<div class="clear"> </div>
		</div>
		<!--End-image-slider---->
		<!---start-content---->
		<div class="content">
			<div class="top-grids">
				<div class="wrap">
					<div class="top-grid">
						<a href="#"><img src="./images/icon1.png" title="icon-name"></a>
						<h3>关于</h3>
						<p>网上订餐就是互联网的深入应用。用户通过互联网，能足不出户，轻松闲逸地实现自己订购餐饮和食品（包括饭、菜、盒饭、便当等）的一种网络订餐形式。随着网上订餐平台的兴起，网上订餐已经逐渐成为了白领阶层中的一种潮流了。</p>
						<a class="button" href="${pageContext.request.contextPath }/about">查看更多</a>
					</div>
					<div class="top-grid">
						<a href="#"><img src="./images/icon2.png" title="icon-name"></a>
						<h3>我们的服务</h3>
						<p>统一订单及配送管理，提高配送效率！无忧售后，满足个性化需要。引领全新消费概念，订餐、消费拿积分！得精美礼品！</p>
						<a class="button" href="${pageContext.request.contextPath }/about">查看更多</a>
					</div>
					<div class="top-grid last-topgrid">
						<a href="#"><img src="./images/icon3.png" title="icon-name"></a>
						<h3>Location</h3>
						<p>广东省湛江市麻章区海大路1号</p>
						<p>广东海洋大学</p>
						<a class="button" href="${pageContext.request.contextPath }/about">查看更多</a>
					</div>
					<div class="clear"> </div>
				</div>
			</div>
			<div class="gallerys">
		 		<div class="wrap">
					<h3>热门菜单</h3>
					<div class="gallery-grids">
						<c:forEach items="${hotMenuList }" var="menu">
							<div class="gallery-grid">
								<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}">
									<img src="${pageContext.request.contextPath }/${menu.image}" alt="">
									<span>&yen;${menu.price}</span>
								</a>
								<h4>${menu.name}</h4>
								<span style="color: red;">&yen;${menu.price}</span>
								<div class="gallery-button">
									<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}">下单</a>
								</div>
							</div>
						</c:forEach>
					</div>					
				    <div class="clear"> </div>
				    <div class="projects-bottom-paination">
						<div class="gallery-button" style="float:right; margin-right:150px; ">
							<a style="background:#e25111;" href="${pageContext.request.contextPath }/menuListByCid">更多</a>
						</div>
					</div>
				</div>
			</div>
			<div class="gallerys">
		 		<div class="wrap">
					<h3>推荐菜单</h3>
						<div class="gallery-grids">
							<c:forEach items="${newMenuList }" var="menu">
								<div class="gallery-grid">
									<a href="#">
										<img src="${pageContext.request.contextPath }/${menu.image}" alt="">
										<span>&yen;${menu.price}</span>
									</a>
									<h4>${menu.name}</h4>
									<span style="color: red;">&yen;${menu.price}</span>
									<div class="gallery-button">
										<a href="#">下单</a>
									</div>
								</div>
							</c:forEach>
						</div>				
				    <div class="clear"> </div>
				    <div class="projects-bottom-paination">
						<div class="gallery-button" style="float:right; margin-right:150px; ">
							<a style="background:#e25111;" href="${pageContext.request.contextPath }/menuListByCid">更多</a>
						</div>
					</div>
				</div>
			</div>
			<div class="mid-grid">
				<div class="wrap">
					<h1>欢迎光临我们的店铺！</h1>
					<h2>本店致力于给客户提供更好的订餐、用餐体验！</h2>
					<p>网上订餐就是互联网的深入应用。用户通过互联网，能足不出户，轻松闲逸地实现自己订购餐饮和食品（包括饭、菜、盒饭、便当等）的一种网络订餐形式。随着网上订餐平台的兴起，网上订餐已经逐渐成为了白领阶层中的一种潮流了。</p>
				<!-- <a class="button1" href="#">Read More</a> -->
				</div>
			</div>
		</div>
		<!---End-content---->
		<!---start-footer---->
		<jsp:include page="footer.jsp"></jsp:include>
		<!---End-footer---->
	</body>
</html>
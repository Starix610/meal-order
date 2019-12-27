<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网上订餐系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		function delProFromCart(mid) {
			if (confirm("确认要从购物车中删除该商品吗？")) {
				location.href = "${pageContext.request.contextPath}/delMenuFromCart?mid="
						+ mid;
			}
		}
		function clearCart() {
			if (confirm("确认要清空购物车吗？")) {
				location.href = "${pageContext.request.contextPath}/clearCart";
			}
		}
	</script>
	<style>
	body {
		margin-top: 20px;
		margin: 0 auto;
	}

	.carousel-inner .item img {
		width: 100%;
		height: 300px;
	}

	font {
		color: #3164af;
		font-size: 18px;
		font-weight: normal;
		padding: 0 10px;
	}
	</style>
</head>
<body>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----End-header----->
	<!---start-content---->
	<div style="min-height:500px">
		<c:if test="${!empty cart.cartItems }">
			<div class="container">
				<div class="row">
					<div style="margin: 0 auto; margin-top: 25px; width: 950px;">
						<strong style="font-size: 30px; margin: 5px 0;">购物车详情</strong>
						<table class="table table-bordered">
							<tbody>
								<tr class="warning">
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
									<th>操作</th>
								</tr>

								<c:forEach items="${cart.cartItems }" var="entry">
									<tr class="active">
										<td width="100" width="40%"><input type="hidden" name="id"
										value="22"> <img src="${entry.value.menu.image }"
										width="100%"></td>
										<td width="30%"><a target="_blank">${entry.value.menu.name }</a></td>
										<td width="20%">${entry.value.menu.price }</td>
										<td width="10%"><span>${entry.value.buyNum }</span></td>
										<td width="15%"><span class="subtotal">￥${entry.value.subTotal }</span></td>
										<td><a href="javascript:;" onclick="delProFromCart('${entry.value.menu.mid}')" class="delete">删除</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>

				<div style="margin-right: 130px;">
					<div style="text-align: right;">
						<a href="${pageContext.request.contextPath}/menuListByCid" style="color: #ff6600;"> 返回继续购买&nbsp;&nbsp; </a>
						 购买后赠送积分: <em style="color: #ff6600;">${cart.totalPrice }</em>
						&nbsp; 商品金额: <strong style="color: #ff6600;">￥${cart.totalPrice }元</strong>
					</div>
					<div style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
						<a href="javascript:;" id="clear" class="clear" style="color: #19929f;" onclick="clearCart()">清空购物车</a>
						<a href="${pageContext.request.contextPath}/submitCart">
							<input type="submit" width="100" value="去付款" name="submit" class="mybutton">
						</a>
					</div>
				</div>

			</div>
		</c:if>

		<c:if test="${empty cart.cartItems }">
			<div class="container">
				<img src="${pageContext.request.contextPath}/img/cart-empty.png" style="float: left;margin-top: 60px;">
				<h2 style="margin-left: 12cm;margin-top: 130px;font-size: 170%">您的购物车还是空的！</h2>
				<span style="margin-left: 260px;"><a href="${pageContext.request.contextPath}/menuListByCid">去下单购买</a></span>
			</div>
		</c:if>
	</div>
	<!---End-content---->
	<!---start-footer---->
	<jsp:include page="footer.jsp"></jsp:include>
	<!---End-footer---->
</body>
</html>
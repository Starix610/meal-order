<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<title>我的订单</title>
	<script type="text/javascript">
		$(function () {
			$("input[type='radio']").click(function () {
				var value =  $("input[type='radio']:checked").val();
				if (value=="ordertime") {
					$("#radioSpan").replaceWith("<span id='radioSpan'>选择日期<input type='date' name='condition' /></span> ");
				}else {
					$("#radioSpan").replaceWith("<span id='radioSpan'>输入订单号<input type='text' name='condition'></span>");
				}
			});
			//如果未输入查询条件，表单不提交
			$("#queryForm").submit(function () {
				if ($("#radioSpan input").val()=="") {
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="container">
		<a href="${pageContext.request.contextPath}/index">首页&nbsp;&nbsp;&gt;</a> 
		<a href="${pageContext.request.contextPath}/myOrders">我的订单&nbsp;&nbsp;&gt;</a>
		<a href="#">订单查询</a>
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 1100px;">
				<strong style="font-size: 30px">订单查询</strong>
				<div style="margin-top: 10px;margin-bottom: 20px">
					<form id="queryForm" action="${pageContext.request.contextPath }/queryOrder" method="post">
						查询方式: 
						<input type="radio" name="queryMethod" value="ordertime" checked="checked">订单日期 
						<input type="radio" name="queryMethod" value="oid">订单号
						<br>
						<span id="radioSpan">选择日期<input type="date" name="condition"></span> 
						<input type="submit" value="查询" class="mybutton">
					</form>
				</div>
				<table class="table table-bordered">
					<c:forEach items="${pageBean.list }" var="order">
						<tbody>
							<tr class="success">
								<th colspan="5">
									<span>订单编号:${order.oid }</span>
									<span style="float: right;margin-right: 10px;">${order.state==1?"已付款":"未付款" }</span>
									<span style="float: right;margin-right: 60px;">订单总额:&yen;${order.total_price }</span>
									<span style="float: right;margin-right: 60px;"><fmt:formatDate value="${order.ordertime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
								</th>
							</tr>
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
							<c:forEach items="${order.orderItems }" var="item">
								<tr class="active">
									<td width="60" width="40%"><input type="hidden" name="id" value="22"> <img src="${pageContext.request.contextPath }/${item.menu.image }" width="100"></td>
									<td width="30%"><a target="_blank">${item.menu.name }</a></td>
									<td width="20%">${item.menu.price }</td>
									<td width="10%">${item.count }</td>
									<td width="15%"><span class="subtotal">￥${item.subtotal }</span></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:forEach>
				</table>
				<div>${notFound }</div>
			</div>
		</div>
	</div>
	<!--分页-->
	<div class="projects-bottom-paination">
		<ul>
			<c:if test="${!empty pageBean }">
				<!--上一页-->
				<c:if test="${pageBean.currentPage==1}">
					<li>
						<a href="javasrcipt:void(0)" style="cursor: not-allowed;">&laquo;</a>
					</li>
				</c:if>
				<c:if test="${pageBean.currentPage!=1}">
					<li>
						<a href="${pageContext.request.contextPath }/queryOrder?currentPage=${pageBean.currentPage-1}&queryMethod=${queryMethod}&condition=${condition}">&laquo;</a>
					</li>
				</c:if>
				<!--页数-->
				<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
					<c:if test="${page==pageBean.currentPage }">
						<li class="active">
							<a href="javascript:void(0)">${page }</a>
						</li>
					</c:if>
					<c:if test="${page!=pageBean.currentPage }">
						<li>
							<a href="${pageContext.request.contextPath }/queryOrder?currentPage=${page}&queryMethod=${queryMethod}&condition=${condition}">${page }</a>
						</li>
					</c:if>
				</c:forEach>

				<!--下一页-->
				<c:if test="${pageBean.currentPage==pageBean.totalPage }">
					<li>
						<a href="javasrcipt:void(0)" style="cursor: not-allowed;">&raquo;</a>
					</li>
				</c:if>
				<c:if test="${pageBean.currentPage!=pageBean.totalPage }">
					<li>
						<a href="${pageContext.request.contextPath }/queryOrder?currentPage=${pageBean.currentPage+1}&queryMethod=${queryMethod}&condition=${condition}">&raquo;</a>
					</li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
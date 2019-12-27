<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
	function addCart() {
		var buyNum = $("#buyNum").val();
		location.href="${pageContext.request.contextPath}/addCart?mid=${menu.mid}&buyNum="+buyNum;
	}
	function showTextarea() {
		$("#commentTextarea").toggle();
	}
	function retract() {
		$("#commentTextarea").toggle();
	}
	//ajax提交评论
	$(function() {	
		$("#commentForm").submit(function() {
			if ($("#content").val().trim()=='') {
				alert("不能发表空内容");
				return false;
			}else if ("${empty user}"=="true") {
				window.location.href="${pageContext.request.contextPath}/login.jsp"
				return false;
			}else {
				$.ajax({
					type: "post",
					async : true,
					url : "${pageContext.request.contextPath}/comment?mid=${menu.mid }",
					data :$("#commentForm").serialize(),
					dataType : "json",
					success : function(data) {
						
					}
				});
			}
			
		});
	});
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
</style>
</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div
				style="border: 1px solid #e4e4e4; width: 930px; margin-bottom: 10px; margin: 0 auto; padding: 10px; margin-bottom: 10px;">
				<a href="${pageContext.request.contextPath}/index">首页&nbsp;&nbsp;&gt;</a> <a href="${pageContext.request.contextPath}/menuListByCid">美味菜单&nbsp;&nbsp;&gt;</a>
				<a href="#">菜品详情</a>
			</div>

			<div style="margin: 0 auto; width: 950px;">
				<div class="col-md-6">
					<img style="opacity: 1; width: 400px; margin-top: 60px;" title=""
						class="medium"
						src="${pageContext.request.contextPath}/${menu.image }">
				</div>

				<div class="col-md-6">
					<div>
						<strong>${menu.name }</strong>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
						<div>编号：${menu.mid }</div>
					</div>

					<div style="margin: 10px 0 10px 0;">
						价格: <strong style="color: #ef0101;">￥：${menu.price }元/份</strong><!--  参 考 价： -->
						<%-- <del>￥${product.market_price }元/份</del> --%>
					</div>

					<div style="margin: 10px 0 10px 0;">
						促销: <a target="_blank" title="限时抢购 (2018-07-30 ~ 2018-09-01)"
							style="background-color: #f07373;">限时抢购</a>
					</div>

					<div
						style="padding: 10px; border: 1px solid #e7dbb1; width: 330px; margin: 15px 0 10px 0;; background-color: #fffee6;">
						<div style="margin: 5px 0 10px 0;"></div>

						<div
							style="border-bottom: 1px solid #faeac7; margin-top: 20px; padding-left: 10px;">
							购买数量: <input id="buyNum" name="buyNum" value="1"
								maxlength="4" size="10" type="text">
						</div>

						<div style="margin: 20px 0 10px 0;; text-align: center;">
							<a href="javascript:void(0)" onclick="addCart()"> <input
								class="mybutton"
								value="加入购物车" type="button">
							</a> &nbsp;收藏商品
						</div>
					</div>
					<div>
						<c:if test="${empty cid }">
							<a href="${pageContext.request.contextPath}/index">返回列表页面</a>
						</c:if>
						
						<c:if test="${!empty cid }">
							<a href="${pageContext.request.contextPath}/menuListByCid?cid=${cid}&currentPage=${currentPage}">返回列表页面</a>
						</c:if>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div style="width: 950px; margin: 0 auto;">
				<div
					style="background-color: #f5f5f5; width: 930px; padding: 10px 10px; margin: 10px 0 10px 0;">
					<strong>菜式详情</strong>
				</div>

				<div style="float: left;">
					<img style="opacity: 1; width: 500px; "
						src="${pageContext.request.contextPath}/${menu.image }">
				</div>
				<div style="float: left;">${menu.desc }</div>
				<div style="background-color: #d3d3d3; width: 930px;">
					<table class="table table-bordered">
						<tbody>
							<tr class="active">
								<th><strong>评论</strong></th>
							</tr>
							<c:if test="${empty menu.commentList }">
								<tr class="warning">
									<th>暂无该菜肴评论信息 <a href="javacript:void(0)" onclick="showTextarea()">[发表评论]</a></th>
								</tr>
								<tr id="commentTextarea" style="display: none">
									<td>
										<form method="post" id="commentForm">
											<textarea name="content" id="content" style="width: 100%;height: 100px" maxlength="200" placeholder="少于200字符"></textarea>								
											<a href="javascript:void(0)" onclick="retract()" >收起</a>
											<input type="submit" value="发表" class="mybutton" style="float: right;">
										</form>
									</td>
								</tr>
							</c:if>
							<c:if test="${!empty menu.commentList }">
								<tr style="background: white;">
									<th>共 ${fn:length(menu.commentList)}条评论 <a href="javacript:void(0)" onclick="showTextarea()">[发表评论]</a></th>
								</tr>
								<tr id="commentTextarea" style="display: none">
									<td>
										<form method="post" id="commentForm">
											<textarea name="content" id="content" style="width: 100%;height: 100px" maxlength="200" placeholder="少于200字符"></textarea>								
											<a href="javascript:void(0)" onclick="retract()" >收起</a>
											<input type="submit" value="发表" class="mybutton" style="float: right;">
										</form>
									</td>
								</tr>
								<c:forEach items="${menu.commentList }" var="comment">
									<tr style="background: #ebe8efab">
										<td>${comment.username }&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${comment.date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									</tr>
									<tr class="warning" id="commentRow">
										<td>${comment.content }</td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>


	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>

</html>
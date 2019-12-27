<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script type="text/javascript">
		function searchWord(obj) {
			// alert(obj.value);
			//1.获得输入框输入的内容
			var word = $(obj).val();
			var content = "";
			//2.根据输入的内容通过ajax请求去数据库中模糊查询
			$.ajax({
				type: "post",
				url : "${pageContext.request.contextPath}/search",
				data : {"word":word},
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						content += "<option value='"+data[i]+"'>"
					}	
					//3.将返回的数据的名称显示在showDiv中
					$("#menus").html(content);
				}
			});
		}
		$(function () {
			//搜索框未输入时阻止提交
			$("#searchForm").submit(function () {
				if ($("input[name='menuName']").val()=="") {
					return false;
				}				
			});
		});
	</script>
</head>
<body>
	<!----start-header----->
	<div class="header">
		<div class="wrap">
			<div class="top-header">
				<div class="logo">
					<a href="${pageContext.request.contextPath }/index">
						<img src="./images/logo1.png" title="logo" />
					</a>
				</div>
				<div class="social-icons">
					<ul>
						<c:if test="${empty user }">
							<li>
								<a href="login.jsp">登录</a>
							</li>
							<span style="color: white;">丨</span>
							<li>
								<a href="register.jsp">注册</a>
							</li>
							<span style="color: white;">丨</span>
						</c:if>
						<c:if test="${!empty user }">
							<li>
								<a href="member_center.jsp" style="color: #b6af56;">欢迎您,${user.username }</a>
								<span style="color: #ad9f9f;font-size: 80%">&nbsp;当前积分:${user.point }</span>
							</li>
							<span style="color: white;">丨</span>
							<li>
								<a href="javascript:void(0)" onclick="exist()">退出</a>
							</li>
							<span style="color: white;">丨</span>
						</c:if>
						<li>
							<a href="${pageContext.request.contextPath }/myOrders">我的订单</a>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!---start-top-nav---->
			<div class="top-nav">
				<div class="top-nav-left">
					<ul id="topbar">
						<li id="1" class="active">
							<a href="${pageContext.request.contextPath }/index">首页</a>
						</li>
						<li id="2">
							<a href="${pageContext.request.contextPath }/about">简介</a>
						</li>
						<li id="3" onclick="a()">
							<a href="${pageContext.request.contextPath }/menuListByCid">美味菜单</a>
						</li>
						<li id="4">
							<a href="cart.jsp">购物车</a>
						</li>
						<li id="5">
							<a href="${pageContext.request.contextPath }/member_center.jsp">会员中心</a>
						</li>
						<li id="6">
							<a href="advice.jsp">我要建议</a>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="top-nav-right">
					<form method="post" action="${pageContext.request.contextPath}/searchMenu" id="searchForm">
						<!-- <input type="text" placeholder="想吃什么，直接搜" style="width: 260px"> -->
						<input type="text" list="menus" name="menuName" placeholder="想吃什么，直接搜" style="width: 260px" oninput="searchWord(this)">
						<datalist id="menus">
							<!--ajax动态填充-->
						</datalist>
						<input type="submit" value="" />
					</form>
				</div>
				<div class="clear"></div>
			</div>
			<!---End-top-nav---->
		</div>
	</div>
	<!----End-header----->
	<script>
		//退出确认
		function exist() {
			if (confirm("确认要退出吗？")) {
				location.href = "${pageContext.request.contextPath}/exist";
			}
		}
		//页面加载时通过ajax异步获取首页导航栏菜单
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" type="text/css" href="css/menu_styles.css">
	<script src="js/prefixfree.min.js"></script>
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	
</head>
<body>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----End-header----->

	<div style="position: relative;min-height:700px">
		<div class="gallerys">
			<div class="wrap">
				<h3>搜索结果</h3>
				<div class="gallery-grids">
					<c:forEach items="${pageBean.list }" var="menu">
						<div class="gallery-grid">
							<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}&currentPage=${pageBean.currentPage}">
								<img src="${pageContext.request.contextPath }/${menu.image}" alt=""> <span>&yen;${menu.price}</span>
							</a>
							<h4>${menu.name}</h4>
							<span style="color: red;">&yen;${menu.price}</span>
							<div class="gallery-button" >
								<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}&currentPage=${pageBean.currentPage}">下单</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="clear"></div>
				<!--分页-->
				<div class="projects-bottom-paination">
					<ul>
						<!--上一页-->
						<c:if test="${pageBean.currentPage==1 }">
							<li>
								<a href="javasrcipt:void(0)" style="cursor: not-allowed;">&laquo;</a>
							</li>
						</c:if>
						<c:if test="${pageBean.currentPage!=1 }">
							<li>
								<a href="${pageContext.request.contextPath }/searchMenu?menuName=${menuName }&currentPage=${pageBean.currentPage-1}">&laquo;</a>
							</li>
						</c:if>
						<!--页数-->
						<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
							<c:if test="${page==pageBean.currentPage }">
								<li class="active">
									<a href="javascript:void(0)" >${page }</a>
								</li>
							</c:if>
							<c:if test="${page!=pageBean.currentPage }">
								<li>
									<a href="${pageContext.request.contextPath }/searchMenu?menuName=${menuName }&currentPage=${page}">${page }</a>
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
								<a href="${pageContext.request.contextPath }/searchMenu?menuName=${menuName }&currentPage=${pageBean.currentPage+1}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<!---End-content---->
	<!---start-footer---->
	<jsp:include page="footer.jsp"></jsp:include>
	<!---End-footer---->
</body>
</html>
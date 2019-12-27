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
	
	<script type="text/javascript">
		//menu.jsp加载完毕后通过ajax去服务端获得导航栏所有category数据
		$(function () {
			var content = "";
			$.post(
					"${pageContext.request.contextPath}/categoryList",
					function (data) {
						for (var i = 0; i < data.length; i++) {
							content +="<li><a href='${pageContext.request.contextPath}/menuListByCid?cid="+data[i].cid+"'>"
									+"<i class='fa fa-share-alt'></i><span>"+data[i].name+"</span></a></li>";
						}
						$("#categoryUI").html(content);
					},
					"json"
					);
		});
	</script>
</head>
<body>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----End-header----->

	<div style="position: relative;min-height:700px">
		<div style="position: absolute;top: 120px;height: auto;">
			<ul class="drawer" id="categoryUI" >
				<!-- <li>
					<a href="#">
						<i class="fa fa-share-alt"></i> <span>主食菜</span>
					</a>
				</li> -->
			</ul>
		</div>
		<div class="gallerys">
			<div class="wrap">
				<h3>${categoryName }</h3>
				<div class="gallery-grids">
					<c:forEach items="${pageBean.list }" var="menu">
						<div class="gallery-grid">
							<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}&cid=${cid}&currentPage=${pageBean.currentPage}">
								<img src="${pageContext.request.contextPath }/${menu.image}" alt=""> <span>&yen;${menu.price}</span>
							</a>
							<h4>${menu.name}</h4>
							<span style="color: red;">&yen;${menu.price}</span>
							<div class="gallery-button" >
								<a href="${pageContext.request.contextPath }/menuInfo?mid=${menu.mid}&cid=${cid}&currentPage=${pageBean.currentPage}">下单</a>
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
								<a href="${pageContext.request.contextPath }/menuListByCid?cid=${cid}&currentPage=${pageBean.currentPage-1}">&laquo;</a>
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
									<a href="${pageContext.request.contextPath }/menuListByCid?cid=${cid}&currentPage=${page}">${page }</a>
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
								<a href="${pageContext.request.contextPath }/menuListByCid?cid=${cid}&currentPage=${pageBean.currentPage+1}">&raquo;</a>
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
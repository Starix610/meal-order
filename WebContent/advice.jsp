<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>网上订餐系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		//ajax提交表单
		$(function() {	
			$("#form").submit(function() {
				if ($("#content").val().trim()=='') {
					alert("不能提交空内容");
					return false;
				}else {
					$.ajax({
						type: "post",
						async : false,
						url : "${pageContext.request.contextPath}/advice",
						data : $("#form").serialize(),
						dataType : "json",
						success : function(data) {
							alert("您的建议已成功提交！");
							
						}
					});
				}
				
			});
		});
	</script>
</head>
<body>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----End-header----->
	<!---start-content---->
	<div class="content">
		<!---start-contact---->
		<div class="contact">
			<div class="wrap">
				<div class="section group">
					<div class="col span_2_of_3" style="margin-left: 180px;">
						<div class="contact-form">
							<h3>你的建议</h3>
							<form id="form" method="get">
								<div>
									<span><label>姓名</label></span> 
									<span><input name="name" type="text" class="textbox" value="${user.name }"></span>
								</div>
								<div>
									<span><label>E-MAIL</label>
									</span> <span><input name="email" type="text" class="textbox"  value="${user.email }"></span>
								</div>
								<div>
									<span><label>手机/QQ/微信</label>
									</span> <span><input name="contact" type="text" class="textbox" value="${user.telephone }"></span>
								</div>
								<div>
									<span><label>建议内容</label></span> 
									<span><textarea id="content" name="content" maxlength="200" placeholder="少于200字符"> </textarea></span>
								</div>
								<div>
									<span><input type="submit" class="mybutton" value="OK，提交"></span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!---End-contact---->
	</div>
	<!---End-content---->
	<!---start-footer---->
	<jsp:include page="footer.jsp"></jsp:include>
	<!---End-footer---->
</body>
</html>
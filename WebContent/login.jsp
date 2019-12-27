<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/login_style.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>

<script type="text/javascript">
	function changeImg(obj) {
		obj.src="${pageContext.request.contextPath }/checkImgServlet?time="+new Date().getTime();
	}
	//前端的表单校验
	$(function () {
		$("form[name='login']").submit(function () {
			if ($("#username").val()=="") {
				$("#loginInfo").html("您还没有输入用户名");
				return false;
			}
			if ($("#password").val()=="") {
				$("#loginInfo").html("您还没有输入密码");
				return false;
			}
			if ($("#checkImg").val()=="") {
				$("#loginInfo").html("请输入验证码");
				return false;
			}
		});
	});
</script>
</head>
<body>

	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="background">
		<div class="loginDiv">
			<font>会员登录</font>USER LOGIN
			<div>
				<span id="loginInfo" style="color: red;">${loginInfo }</span>
			</div>
			<form class="form-horizontal" name="login" action="${pageContext.request.contextPath }/login" method="post">
				<div class="form-group">
					<label for="username" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名" value="${saveUsername }">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-2 control-label">验证码</label>
					<div class="col-sm-3" style="width: 30%">
						<input type="text" class="form-control" id="checkImg" name="checkImg" placeholder="请输入验证码">
					</div>
					<div class="col-sm-3">
						<img onclick="changeImg(this)" style="max-width:150%; cursor: pointer" src="${pageContext.request.contextPath }/checkImgServlet" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="autoLogin" value="autoLogin"> 自动登录
							</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>
								<input type="checkbox" name="saveUsername" value="saveUsername"> 记住用户名
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" width="100" value="登录" name="submit" class="mybutton">
					</div>
					<span style="float: right;margin-right: 100px;font-size: 90%;">
						<a href="register.jsp">还没有账号？点此注册</a>
					</span>
				</div>
			</form>
		</div>
	</div>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>
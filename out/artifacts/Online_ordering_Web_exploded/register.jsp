<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>

<link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />

<title>会员注册</title>
<script type="text/javascript">
	//自定义validate校验规则(ajax校验用户名是否存在)
	$.validator.addMethod(
	//规则的名称
	"isExist",
	//校验函数
	function(value, element, params) {
		//value:输入的内容
		//element:被校验的元素对象
		//params:规则对应的参数
		var flag = false;
		$.ajax({
			"async" : false, //取消异步，必须先等服务器返回数据，否则无法确定返回值的真假
			"url" : "${pageContext.request.contextPath}/checkUsername",
			"data" : {
				"username" : value
			},
			"type" : "post",
			"dataType" : "json",
			"success" : function(data) {
				flag = data.isExist;
			}
		});
		return !flag;
	});
	
	$(function() {
		$("#registerForm").validate({
			rules : {
				"username" : {
					"required" : true,
					"isExist" : true
				},
				"password" : {
					"required" : true,
					"rangelength" : [ 6, 16 ]
				},
				"repassword" : {
					"required" : true,
					"rangelength" : [ 6, 16 ],
					"equalTo" : "#password"
				},
				"email" : {
					"required" : true,
					"email" : true
				},
				"sex" : {
					"required" : true
				}
			},
			messages : {
				"username" : {
					"required" : "用户名不能为空",
					"isExist" : "用户名已存在"
				},
				"password" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-16位"
				},
				"repassword" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度6-16位",
					"equalTo" : "两次输入的密码不一致"
				},
				"email" : {
					"required" : "邮箱不能为空",
					"email" : "邮箱格式不正确"
				},
				"sex" : {
					"required" : "您没有第三种选择"
				}

			}
		});
	});
	//验证码点击切换图片
	function changeImg(obj) {
		obj.src="${pageContext.request.contextPath }/checkImgServlet?time="+new Date().getTime();
	}
</script>
<style type="text/css">
	.error {
		font-size: 90%;
		color: red;
	}
</style>
</head>
<body>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----End-header----->
	<div class="container" style="width: 100%;">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<div style="font-size: 150%">会员注册 USER REGISTER</div>
				<form id="registerForm" class="form-horizontal" style="margin-top: 5px;" action="${pageContext.request.contextPath }/register" method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="confirmpwd" name="repassword" placeholder="请输入确认密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3" name="email" placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="usercaption" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="usercaption" name="name" placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group opt">
						<label for="inlineRadio1" class="col-sm-2 control-label">性别</label>
						<div class="col-sm-6">
							<label class="radio-inline">
								<input type="radio" name="sex" id="sex1" value="male"> 男
							</label>
							<label class="radio-inline">
								<input type="radio" name="sex" id="sex2" value="female"> 女
							</label>
							<label class="error" for="sex" style="display: none;">您没有第三种选择</label>
						</div>
					</div>
					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">出生日期</label>
						<div class="col-sm-6">
							<input type="date" class="form-control" name="birthday">
						</div>
					</div>

					<div class="form-group">
						<label for="date" class="col-sm-2 control-label">验证码</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="checkImg">
						</div>
						<div class="col-sm-3">
								<img onclick="changeImg(this)" style="cursor:pointer" src="${pageContext.request.contextPath }/checkImgServlet" />
						</div>
						<span style="color: red;">${registerInfo }</span>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册" name="submit" class="mybutton">
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<!-- 引入页面头部 -->
	<!----start-header----->
	<jsp:include page="/footer.jsp"></jsp:include>
	<!----End-header----->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<title>Insert title here</title>
	<style>
		.content{
   			margin: 0 auto;
    		min-height: 800px;
    		width: 1200px;
    		height: auto;
    		background: floralwhite;
		}
		.field{
			margin-top: 60px;
			margin-left: 85px;
			
		}
		.field div{
			margin-bottom: 40px;
		}
		.inputField{
			margin-top: 60px;
			margin-left: 85px;
			display: none;
		}
		.inputField div{
			margin-bottom: 45px;
		}
	</style>
	<script type="text/javascript">
		$(function () {
			$("#edit").click(function () {
				$(".field").toggle();
				$(".inputField").toggle();
			
			});
			$("#save").click(function () {
				$("#form1").submit();
			});
 			$("#canel").click(function () {
				$(".inputField").toggle();
				$(".field").toggle();
			});
		});
	</script>
</head>
<body>
	<!-- 引入header.jsp -->
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="content">
		<div style="font-size: 30px;margin-left: 30px;padding-top: 25px">会员中心</div>
		<div class="field">
			<div>
				头像：
				<img src="${pageContext.request.contextPath}/${user.image}" style="width: 50px">
			</div>
			<div>用户名：${user.username }</div>
			<div>拥有积分：<span style="color: red;">${user.point }</span></div>
			<div>真实姓名：${user.name }</div>
			<div>绑定邮箱：${user.email }</div>
			<div>手机号码：${user.telephone }</div>
			<div>生日：${user.birthday }</div>
			<div>性别：${user.sex }</div>
			<div>年龄：${user.age }</div>
			<div id="edit">
				<a href="javascript:void(0)" class="mybutton" style="text-decoration: none; margin-left: 450px;">编辑信息</a>
			</div>
		</div>
		<div class="inputField">
			<form id="form1" action="${pageContext.request.contextPath}/editUserInfo" method="post" enctype="multipart/form-data">
				<div>
					<label>头像：</label>
					<img src="${pageContext.request.contextPath}/${user.image }" style="width: 50px"> 
					<input type="file" id="fileupload" name="image">
				</div>
				<div>
					<input type="hidden" value="${user.uid }" name="uid">
				</div>
				<div>
					<label>用户名：</label>
					<input type="text" value="${user.username }" name="username">
				</div>
				<div>
					<label>真实姓名：</label>
					<input type="text" value="${user.name }" name="name">
				</div>
				<div>
					<label>绑定邮箱：</label>
					<input type="text" value="${user.email }" name="email">
				</div>
				<div>
					<label>手机号码：</label>
					<input type="text" value="${user.telephone }" name="telephone">
				</div>
				<div>
					<label>生日：</label>
					<input type="date" value="${user.birthday }" name="birthday">
				</div>
				<div>
					<label>性别：</label>
					<input type="radio" name="sex" value="female">女
					<input type="radio" name="sex" value="male">男
				</div>
				<div>
					<label>年龄：</label>
					<input type="text" value="${user.age }" name="age">
				</div>
			</form>
			<div>
				<a href="javascript:void(0)" class="mybutton" style="text-decoration: none; margin-left: 400px;" id="save">保存</a>
				<a href="javascript:void(0)" class="mybutton" style="text-decoration: none; margin-left: 30px;" id="canel">返回</a>
			</div>
		</div>

	</div>
	<script type="text/javascript">
		$(function () {
			$("input[value='${user.sex}']").attr("checked",true);
		});
	</script>
	<!-- 引入footer.jsp -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
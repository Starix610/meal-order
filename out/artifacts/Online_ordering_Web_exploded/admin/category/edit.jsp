<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<LINK href="${pageContext.request.contextPath}/css/Style1.css" type="text/css" rel="stylesheet">
		<script src="../../js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function () {
				$("#submit").click(function () {
					if ($("#name").val()=='') {
						alert("内容不能为空！")
					}else {
						$.ajax({
							type: "post",
							url : "${pageContext.request.contextPath}/adminUpdateCategory?cid=${param.cid}",
							async : true,
							cache: false,
						    data: $("#form1").serialize(),
							dataType : "json",
							success : function(data) {
								alert("修改成功！");
							},
							error:function(err){
								alert("修改失败！");
							}
						});
					}
					
				});
			});
		</script>
	</HEAD>
	
	<body>
		<form id="form1" name="form1" method="post">
			&nbsp;
			<table cellSpacing="1" cellPadding="5" width="100%" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
						height="26">
						<strong><STRONG>编辑分类</STRONG>
						</strong>
					</td>
				</tr>

				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						分类名称：
					</td>
					<td class="ta_01" bgColor="#ffffff" colspan="3">
						<input type="text" name="name" value="${param.name }" id="name" class="bg"/>
					</td>
				</tr>
			
				<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="button" value="确定" class="button_ok" id="submit"> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<button type="reset" value="重置" class="button_cancel">&#37325;&#32622;</button> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<INPUT class="button_ok" type="button" onclick="history.go(-1)" value="返回" /> <span id="Label1"></span>
				</td>
			</tr>
			</table>
		</form>
	</body>
</HTML>
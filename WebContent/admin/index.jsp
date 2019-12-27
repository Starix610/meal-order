<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- <html xmlns="http://www.w3.org/1999/xhtml"> -->
<head>
<title>网上商城管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="${pageContext.request.contextPath }/css/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet" type="text/css" />
<script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
<style type="text/css">
body {
  color: white;
}
</style>
</head>
<body style="background: #278296">
<center></center>
<form method="post" action="${pageContext.request.contextPath }/adminLogin" target="_parent" name="theForm">
  <table cellspacing="0" cellpadding="0" style="margin-top: 100px" align="center">
  <tr>
	    <td style="color: red;padding-left: 88px;">${loginInfo }</td>	
  </tr>
  <tr>
    <td style="padding-left: 50px">
      <table>
      <tr>
        <td>管理员姓名：</td>
        <td>
        	<input type="text" name="admin" id="admin" />
        	<span id="info1" style="font-size: 80%;color: red;"></span>
        </td>
      </tr>
      <tr>
        <td>管理员密码：</td>
        <td>
        	<input type="password" name="password" id="password"/>
        	<span id="info2" style="font-size: 80%;color: red;"></span>
        </td>
      </tr>
      <tr><td>&nbsp;</td><td><input type="submit" value="进入管理中心" class="button" /></td></tr>
      </table>
    </td>
  </tr>
  </table>
</form>
<script language="JavaScript">
  /**
   * 检查表单输入
   */
	$(function () {
		$("form[name='theForm']").submit(function () {
			if ($("#admin").val()=="") {
				$("#info1").html("您还没有输入用户名");
				return false;
			}
			if ($("#password").val()=="") {
				$("#info2").html("您还没有输入密码");
				return false;
			}
		});
	});
</script>
</body>
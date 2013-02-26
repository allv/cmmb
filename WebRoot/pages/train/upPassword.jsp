<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<script type="text/javascript">
function onSubmit(){
	var obj = document.forms[0];
	
	if(check("oldpassword2","string","旧密码不能为空！"))return false;
	
	if(hex_md5(obj.oldpassword2.value) != obj.oldpassword.value){
		document.getElementById("ERROR_MSG").innerHTML = "旧密码不正确！";
		obj.oldpassword2.className = "errorInput";
		obj.oldpassword2.focus();
		return false;
	}else{
		document.getElementById("ERROR_MSG").innerHTML = "";
		obj.oldpassword2.className = "";
	}

	if(check("password","string","密码不能为空！") ||
		check("password2","string","请在次确认密码！"))return false;
	
	if(obj.password.value != obj.password2.value){
		document.getElementById("ERROR_MSG").innerHTML = "两次密码输入不一致！";
		obj.password.className = "errorInput";
		obj.password2.className = "errorInput";
		obj.password.focus();
		return false;
	}else{
		document.getElementById("ERROR_MSG").innerHTML = "";
		obj.password.className = "";
		obj.password2.className = "";
	}
	
	if(hex_md5(obj.password.value) == obj.oldpassword.value){
		document.getElementById("ERROR_MSG").innerHTML = "旧密码与新密码相同！";
		obj.oldpassword2.className = "errorInput";
		obj.password.className = "errorInput";
		obj.password2.className = "errorInput";
		obj.password.focus();
		return false;
	}else{
		document.getElementById("ERROR_MSG").innerHTML = "";
		obj.oldpassword2.className = "";
		obj.password.className = "";
		obj.password2.className = "";
	}
	
	obj.password.value = hex_md5(obj.password.value);
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>修改密码</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="uppassworddo.do" onSubmit="return onSubmit()">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  
    <input type="hidden" name="userID" value="${user.wtuserId}">
		<input type="hidden" name="oldpassword" value="${user.wtuserPassword}">
    <tr>
      <td align="right">账号</td>
      <td>${user.wtuserLoginname}</td>
    </tr>
    <tr>
      <td align="right">旧密码</td>
      <td><input type="password" name="oldpassword2"></td>
    </tr>
    <tr>
      <td align="right">新密码</td>
      <td><input type="password" name="password"></td>
    </tr>
    <tr>
      <td align="right">再次确认</td>
      <td><input type="password" name="password2"></td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td id="ERROR_MSG"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><button type="submit">修改</button></td>
    </tr>
  
</table>
</form>
</body>
</html>

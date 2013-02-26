<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<script type="text/javascript">
function onSubmit(){
	if(check("username","string","账号不能为空！") ||
		check("password","string","密码不能为空！") ||
		check("password2","string","请在次确认密码！"))return false;

	var obj = document.forms[0];
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
	
	if(check("corpName","string","公司全称不能为空！") ||
		check("corpNote","string","公司简介不能为空！") ||
		check("corpAdd","string","公司地址不能为空！") ||
		check("corpCode","code","邮编格式不正确！") ||
		check("corpTel","string","电话不能为空！") ||
		check("corpTel","tel","电话格式不正确！(xxxx-xxxxxxx)") ||
		check("corpFax","string","传真不能为空！") ||
		check("corpFax","tel","传真格式不正确！(xxxx-xxxxxxx)") ||
		check("corpAP","string","法人代表不能为空！") ||
		check("openBank","string","开户行不能为空！") ||
		check("openName","string","开户名不能为空！") ||
		check("bankID","string","银行账号不能为空！") ||
		check("bankID","bank","银行账号不正确！(19位数字)") ||
		check("linkman","string","联系人姓名不能为空！") ||
		check("linkmanTel","string","联系人手机不能为空！") ||
		check("linkmanTel","mobile","联系人手机格式不正确！(xxxx-xxxxxxx)") ||
		check("linkmanEmail","string","联系人E-mail不能为空！") ||
		check("linkmanEmail","email","联系人E-mail格式不正确！") ||
		check("linkmanAdd","string","联系人地址不能为空！"))return false;
	
	obj.password.value = hex_md5(obj.password.value);
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>用户注册</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="userregisterdo.do" onSubmit="return onSubmit()">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  
    <tr>
      <td colspan="2" bgcolor="#CBD7ED"><b>登录信息</b></td>
    </tr>
    <tr>
      <td align="right">账号</td>
      <td><input type="text" name="username" value="${username}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">密码</td>
      <td><input type="password" name="password"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">确认密码</td>
      <td><input type="password" name="password2"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="#CBD7ED"><b>基本资料</b></td>
    </tr>
    <tr>
      <td align="right">公司全称</td>
      <td><input name="corpName" type="text" value="${corpName}" size="60"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">公司简介</td>
      <td><textarea name="corpNote" cols="60" rows="4">${corpNote}</textarea><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">公司地址</td>
      <td><input name="corpAdd" type="text" value="${corpAdd}" size="60">
			邮编
		  <input name="corpCode" type="text" value="${corpCode}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">电话</td>
      <td><input name="corpTel" type="text" value="${corpTel}"><span style='color:red;'>&nbsp;*</span>
      传真
      <input name="corpFax" type="text" value="${corpFax}"><span style='color:red;'>&nbsp;*</span>
      法人代表
      <input name="corpAP" type="text" value="${corpAP}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">开户行</td>
      <td><input name="openBank" type="text" value="${openBank}"><span style='color:red;'>&nbsp;*</span>
      开户名
      <input name="openName" type="text" value="${openName}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">银行账号</td>
      <td><input name="bankID" type="text" value="${bankID}" size="60"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">联系人姓名</td>
      <td><input name="linkman" type="text" value="${linkman}"><span style='color:red;'>&nbsp;*</span>
      手机
      <input name="linkmanTel" type="text" value="${linkmanTel}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">E-mail</td>
      <td><input name="linkmanEmail" type="text" value="${linkmanEmail}" size="60"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">地址</td>
      <td><input name="linkmanAdd" type="text" value="${linkmanAdd}" size="60"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td id="ERROR_MSG">${msg}</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><button type="submit">注册</button>
			<button onClick="forward('<%=basePath%>')">返回</button></td>
    </tr>
 
</table>
 </form>
</body>
</html>

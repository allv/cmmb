<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人资料</title>
<script type="text/javascript">
function onSubmit(){
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
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>修改个人资料</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="modifyuserinfodo.do" onSubmit="return onSubmit()">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  
  <input type="hidden" name="userID" value="${user.wtuserId}">
    <tr>
      <td align="right">公司全称</td>
      <td><input name="corpName" type="text" value="${user.wtuserName}" size="60"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">公司简介</td>
      <td><textarea name="corpNote" cols="60" rows="4">${user.corpNote}</textarea><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">公司地址</td>
      <td><input name="corpAdd" type="text" value="${user.wtuserAddress}" size="60"><span style='color:red;'>&nbsp;*</span>
      邮编
      <input name="corpCode" type="text" value="${user.corpCode}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">电话</td>
      <td><input name="corpTel" type="text" value="${user.corpTel}"><span style='color:red;'>&nbsp;*</span>
      传真
      <input name="corpFax" type="text" value="${user.corpFax}"><span style='color:red;'>&nbsp;*</span>
      法人代表
      <input name="corpAP" type="text" value="${user.corpAP}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">开户行</td>
      <td><input name="openBank" type="text" value="${user.openBank}"><span style='color:red;'>&nbsp;*</span>
      开户名
      <input name="openName" type="text" value="${user.openName}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">银行账号</td>
      <td><input name="bankID" type="text" value="${user.bankID}" size="60"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">联系人姓名</td>
      <td><input name="linkman" type="text" value="${user.linkman}"><span style='color:red;'>&nbsp;*</span>
      手机
      <input name="linkmanTel" type="text" value="${user.linkmanTel}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">E-mail</td>
      <td><input name="linkmanEmail" type="text" value="${user.linkmanEmail}" size="60"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">地址</td>
      <td><input name="linkmanAdd" type="text" value="${user.linkmanAdd}" size="60"><span style='color:red;'>&nbsp;*</span></td>
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

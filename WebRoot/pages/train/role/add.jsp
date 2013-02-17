<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增角色</title>
<script type="text/javascript">
function onSubmit(){
	if(check("wtroleName","string","请输入角色名称！"))return false;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>用户管理 > 新增角色</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
<form method="post" action="addrole.do" onSubmit="return onSubmit()">
  <tr>
    <td align="right">角色名称</td>
    <td><input type="text" name="wtroleName" id="wtroleName"></td>
  </tr>
  <tr>
    <td align="right">描述</td>
    <td><input type="text" name="wtroleDescription" id="wtroleDescription"></td>
  </tr>
  <tr>
    <td align="right">权限组</td>
    <td>
   	<select name="parentrole">
		<option value="10001">管理员</option>
		<option value="10002">街道工作人员</option>
	</select>
	</td>
  </tr>
	<tr>
      <td align="right">&nbsp;</td>
      <td id="ERROR_MSG"></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td><button type="submit">提交</button> 
		<button onClick="forward('queryrole.do')">返回</button></td>
  </tr>
</form>
</table>
</body>
</html>

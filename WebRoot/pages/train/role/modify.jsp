<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改角色</title>
<script type="text/javascript">
function onSubmit(){
	if(check("wtroleName","string","请输入角色名称！"))return false;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>用户管理 > 修改角色</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
<form method="post" action="modifyrole.do" onSubmit="return onSubmit();">
	<input type="hidden" name="wtroleId" id="wtroleId" value="${role.wtroleId }" />
  <tr>
    <td align="right">角色名称</td>
    <td><input type="text" name="wtroleName" id="wtroleName" value="${role.wtroleName }"></td>
  </tr>
  <tr>
    <td align="right">角色描述</td>
    <td><input type="text" name="wtroleDescription" id="wtroleDescription" value="${role.wtroleDescription }"></td>
  </tr>
	<tr>
      <td align="right">&nbsp;</td>
      <td id="ERROR_MSG"></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td><button type="submit">提交</button> 
		<button onClick="javascript:window.close();">返回</button></td>
  </tr>
</form>
</table>
</body>
</html>

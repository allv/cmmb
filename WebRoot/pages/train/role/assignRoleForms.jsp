<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<base target="_self">
<title>分配表单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function assignRoleMember(url) {
		document.tblform.action = url;
		document.tblform.submit();
	}
</script>
<style type="text/css">
<!--

BUTTON {
	background-image: url(<%=basePath%>/pages/train/skins/img/button.gif);
	background-repeat: no-repeat;
	height: 18px;
	width: 50px;
	color: #FFFFFF;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	margin-right: 2px;
	margin-left: 2px;
}

.topLanBar {
	color: #999999;
	height: 22px;
	font-size: 12px;
}
-->
</style>
</head>
<body>
	<div class="topLanBar">
		<b>当前位置：</b>角色管理 > 角色会员分配
	</div>
	<table width="100%">
		<tr>
			<td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
		</tr>
	</table>
	<table>
		<form method="post" name="tblform">
			<input type="hidden" name="mid" id="mid"
				value="<%=request.getAttribute("mid")%>" />
			<tr>
				<td width="50%" valign="top">
					<table width="100%" border="0" cellpadding="3" cellspacing="1"
						class="tableList">
						<tr>
							<td colspan="4">角色名称：${roleName }</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<th>表单名称</th>
							<th>表单代码</th>
							<th>表单描述</th>
						</tr>
						<c:forEach items="${allForms }" var="vo">
						<tr>
							<td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" name="selecteForms" value="${vo.form.id }" <c:if test="${vo.checked }">checked</c:if> " /></td>
							<td align="center" nowrap bgcolor="#E4E4E4">${vo.form.name }</td>
							<td align="center" nowrap bgcolor="#E4E4E4">${vo.form.code }</td>
							<td align="center" nowrap bgcolor="#E4E4E4">${vo.form.description }</td>
						</tr>
						</c:forEach>
						<tr>
						</tr>
					</table>
				</td>
			</tr>
		<tr>
			<td align="center">
				<button
					onClick="assignRoleMember('<%=basePath%>/assignRoleForms.do');">提交</button>
				<button onClick="window.close();" type="reset">返回</button>
			</td>
		</tr>
		</tr>
		</form>
	</table>
</body>
</html>

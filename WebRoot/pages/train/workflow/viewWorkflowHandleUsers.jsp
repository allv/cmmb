<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分配操作人员</title>
<script type="text/javascript">
function chooseUses() {
	var obj = new Object();
	var users = '';
	var usernames = '';
	$("#tbl_curMem tr input:checked[type='checkbox']").each(function(ind, obj_tr) {
		users = users + $(obj_tr).val() + ',';
		usernames = usernames + $("[name='userName']",$(obj_tr).parent().parent()).text() + ',';
	});
	obj.userids = users;
	obj.usernames = usernames;
	window.returnValue = obj;
	window.close();
}
</script>
<base target="_self">
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		class="tableList">
		<tr>
			<td>
				<table id="tbl_curMem">
					<tr>
						<td colspan="4">拥有此角色(${currentHandleRoles })的人员可以进行操作</td>
					</tr>
					<tr>
						<th nowrap=""></th>
						<th nowrap>账号</th>
						<th nowrap>姓名</th>
						<th nowrap>注册时间</th>
					</tr>
					<c:forEach items="${currentHandleUsers }" var="user">
						<tr>
							<td nowrap="" bgcolor="#E4E4E4" align="center"><input
								type="checkbox" value="${user.wtuserId}" /></td>
							<td align="center" nowrap bgcolor="#E4E4E4">${user.wtuserLoginname }</td>
							<td align="center" nowrap bgcolor="#E4E4E4" name="userName">${user.corpName }</td>
							<td align="center" nowrap bgcolor="#E4E4E4"><fmt:formatDate
									value="${user.wtuserCreatetime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<br />
	<table width="100%" cellspacing="0" cellpadding="1">
		<tr>
			<td align="center"><button onclick="chooseUses();">确认</button><button onclick="window.close();">关闭</button>
			</td>
		</tr>
	</table>
</body>
</html>

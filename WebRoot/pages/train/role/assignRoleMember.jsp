<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wootion.idp.view.vo.FordNagativation"%>
<html>
<head>
<base target="_self">
<title>分配会员</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function left() {
		$("#tbl_allMem tr input:checked[type='checkbox']").parent().parent()
				.each(function(ind, obj_tr) {
					$("#tbl_curMem").append(obj_tr);
				});
	}

	function right() {
		$("#tbl_curMem tr input:checked[type='checkbox']").parent().parent()
				.each(function(ind, obj_tr) {
					$("#tbl_allMem").append(obj_tr);
				});
	}

	function assignRoleMember(url) {
		var users = '';
		$("#tbl_curMem tr input[type='checkbox']").each(function(ind, obj_tr) {
			users = users + $(obj_tr).val() + ',';
		});
		document.tblform.assignedUsers.value = users;
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
			<input type="hidden" name="assignedUsers" id="assignedUsers" value="" />
			<input type="hidden" name="mid" id="mid"
				value="<%=request.getAttribute("mid")%>" />
			<tr>
				<td width="50%" valign="top">
					<table width="100%" border="0" cellpadding="3" cellspacing="1"
						class="tableList">
						<tr>
							<td colspan="3">角色名称：${roleName }</td>
						</tr>
						<tr>
							<td valign="top" width="45%">
								<table id="tbl_curMem" width="100%">
									<tr><td colspan="5">当前会员</td></tr>
									<tr>
										<th nowrap=""></th>
										<th nowrap>账号</th>
										<th nowrap>姓名</th>
										<th nowrap>注册时间</th>
										<th nowrap>用户状态</th>
									</tr>
									<s:iterator value="lst" id="user">
										<tr>
											<td nowrap="" bgcolor="#E4E4E4" align="center"><input
												type="checkbox" value="${user.wtuserId}" /></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><s:property
													value="#user.wtuserLoginname" /></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><s:property
													value="#user.corpName" /></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><fmt:formatDate
													value="${user.wtuserCreatetime }"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><b> <s:if
														test="#user.wtuserIsuseable == 0">
														<font color="#ff0000">停用</font>
													</s:if> <s:else>正常</s:else>
											</b></td>
										</tr>
									</s:iterator>
								</table>
							</td>
							<td valign="middle" align="center"><input type="button"
								value="<<" onclick=" javascript:left();"/><br /> <br /> <input
								type="button" value=">>" onclick="right();" />
							</td>
							<td valign="top" width="45%">
								<table id="tbl_allMem" width="100%">
									<tr><td colspan="5">全部会员</td></tr>
									<tr>
										<th nowrap=""></th>
										<th nowrap>账号</th>
										<th nowrap>姓名</th>
										<th nowrap>注册时间</th>
										<th nowrap>用户状态</th>
									</tr>
									<s:iterator value="allUsers" id="user">
										<tr>
											<td nowrap="" bgcolor="#E4E4E4" align="center"><input
												type="checkbox" value="${user.wtuserId}"/></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><s:property
													value="#user.wtuserLoginname" /></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><s:property
													value="#user.corpName" /></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><fmt:formatDate
													value="${user.wtuserCreatetime }"
													pattern="yyyy-MM-dd HH:mm:ss" /></td>
											<td align="center" nowrap bgcolor="#E4E4E4"><b> <s:if
														test="#user.wtuserIsuseable == 0">
														<font color="#ff0000">停用</font>
													</s:if> <s:else>正常</s:else>
											</b></td>
										</tr>
									</s:iterator>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		<tr>
			<td align="center">
				<button
					onClick="assignRoleMember('<%=basePath%>/assignRoleMember.do');">提交</button>
				<button onClick="window.close();" type="reset">返回</button>
			</td>
		</tr>
		</tr>

		</form>
	</table>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wootion.idp.view.vo.FordNagativation"%>
<html>
<head>
<title>查看会员</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="StyleSheet" href="<%=basePath%>/pages/train/dtree/dtree.css"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>/pages/train/dtree/dtree.js"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
<!--
input {
	margin: 0px;
	padding: 0px;
	height: 12px;
	width: 12px;
	valign: "bottom";
}

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
		<b>当前位置：</b>角色管理 > 角色会员查看
	</div>
	<table width="100%">
		<tr>
			<td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
		</tr>
	</table>
	<table>
		<form method="post" name="tblform">
			<input type="hidden" name="funs" id="funs" value="" /> <input
				type="hidden" name="ress" id="ress" value="" /> <input
				type="hidden" name="mid" id="mid"
				value="<%=request.getAttribute("mid")%>" />
			<tr>
				<td width="50%" valign="top">

					<table width="100%" border="0" cellpadding="3" cellspacing="1"
						class="tableList">
						<tr>
							<td>角色名称：${roleName }</td>
						</tr>
						<tr>
							<th nowrap>账号</th>
							<th nowrap>姓名</th>
							<th nowrap>注册时间</th>
							<th nowrap>用户状态</th>
						</tr>
						<s:iterator value="lst" id="user">
							<tr>
								<td align="center" nowrap bgcolor="#E4E4E4"><s:property
										value="#user.wtuserLoginname" /></td>
								<td align="center" nowrap bgcolor="#E4E4E4"><s:property
										value="#user.corpName" /></td>
								<td align="center" nowrap bgcolor="#E4E4E4"><fmt:formatDate
										value="${user.wtuserCreatetime }" pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td align="center" nowrap bgcolor="#E4E4E4"><b> <s:if
											test="#user.wtuserIsuseable == 0">
											<font color="#ff0000">停用</font>
										</s:if> <s:else>正常</s:else>
								</b></td>
							</tr>
						</s:iterator>
						<tr>
					</table>

				</td>
			</tr>
			<tr>
				<td align="center">
					<button onClick="window.close();">返回</button>
				</td>
			</tr>
			</tr>

		</form>
	</table>
</body>
</html>

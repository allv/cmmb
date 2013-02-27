<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wootion.idp.view.vo.FordNagativation"%>
<html>
<head>
<base target="_self">
<title>查看表单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
							<th nowrap>表单名称</th>
							<th nowrap>表单代码</th>
							<th nowrap>表单描述</th>
						</tr>
						<c:forEach items="${currentForms }" var="form">
						<tr>
							<td align="center" nowrap bgcolor="#E4E4E4">${form.name }</td>
							<td align="center" nowrap bgcolor="#E4E4E4">${form.code }</td>
							<td align="center" nowrap bgcolor="#E4E4E4">${form.description }</td>
						</tr>
						</c:forEach>						
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

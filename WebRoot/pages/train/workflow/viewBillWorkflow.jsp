<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看工作流</title>
<script type="text/javascript">
function showHanleUsers(handleUsers) {
	var arr = handleUsers.split(',');
	var newss = '';
	for(var ind in arr) {
		newss = newss + arr[ind] +'\r\n';
	}
	alert('当前处理人：\r\n'+newss);
}
</script>
<base target="_self">
</head>
<body>
	<table width="100%" border="0" cellpadding="3" cellspacing="1"
		class="tableList">
		<tr>
			<td>表单名称：${formName } </td>
		</tr>
		<tr>
			<th nowrap align="left">工作流状态(点击红色人物可查看当前节点处理人)</th>
		</tr>
		<tr>
			<td>
				<table>
					<tr>
						<td align="center" nowrap bgcolor="#ffffff">
							<img src="<%=basePath%>/images/wf-start.png" />
						</td>
						<c:forEach items="${workflowNodes }" var="node">
							<c:set var="handleType" value="" />
							<c:set var="billStatus" value="" />
							<c:set var="imageSrc" value="" />
							<c:if test="${workflowBill.currentLevel < node.level }">
								<c:set var="billStatus" value="未到达" />
								<c:set var="imageSrc" value="wf-actor-gray.png" />
							</c:if>
							<c:if test="${workflowBill.currentLevel >= node.level }">
								<c:set var="imageSrc" value="wf-actor-green.png" />
								<c:if test="${node.nodeType == 0 }" >
									<c:set var="billStatus" value="已保存" />
								</c:if>
								<c:if test="${node.nodeType == 1 }" >
									<c:set var="billStatus" value="提交中" />
								</c:if>
								<c:if test="${node.nodeType == 2 }" >
									<c:set var="billStatus" value="待审核" />
								</c:if>
							</c:if>
							<c:if test="${workflowBill.currentLevel == node.level }">
								<c:set var="imageSrc" value="wf-actor.png" />
							</c:if>
							<c:if test="${node.nodeType == 0 }" >
								<c:set var="handleType" value="创建" />
							</c:if>
							<c:if test="${node.nodeType != 0 }" >
								<c:set var="handleType" value="提交" />
							</c:if>
							
							<td align="center" nowrap bgcolor="#ffffff"><img
								src="<%=basePath%>/images/wf-arrow.png" /><br />${handleType }</td>
							<td align="center" nowrap bgcolor="#ffffff"><img
								src="<%=basePath%>/images/${imageSrc}" 
								<c:if test="${workflowBill.currentLevel == node.level }">
									onclick="showHanleUsers('${currentHandleUsers}');" style="cursor:pointer"
								</c:if> 
								/> <br />
								<span>${billStatus }</span>
							</td>
						</c:forEach>
						<td align="center" nowrap bgcolor="#ffffff"><img
							src="<%=basePath%>/images/wf-arrow.png" /><br />审核</td>
						<td align="center" nowrap bgcolor="#ffffff">
							<img src="<%=basePath%>/images/wf-end.png" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><br />
			<br /></td>
		</tr>
		<tr>
			<th nowrap align="left">工作流操作纪录</th>
		</tr>
		<tr>
			<td>
				<table width="100%">
					<tr>
						<td align="center" nowrap bgcolor="#E4E4E4">序号</td>
						<td align="center" nowrap bgcolor="#E4E4E4">操作</td>
						<td align="center" nowrap bgcolor="#E4E4E4">操作人</td>
						<td align="center" nowrap bgcolor="#E4E4E4">操作时间</td>
						<td align="center" nowrap bgcolor="#E4E4E4">备注/驳回理由</td>
					</tr>
					<c:forEach items="${workflowRecords }" var="record">
						<tr>
						<td align="center" nowrap bgcolor="#ffffff">${record.sort }</td>
						<td align="center" nowrap bgcolor="#ffffff">${record.handleTypeDisplayValue }</td>
						<td align="center" nowrap bgcolor="#ffffff">${record.handleUser.corpName }</td>
						<td align="center" nowrap bgcolor="#ffffff">
							<fmt:formatDate value="${record.handletime }" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td align="center" nowrap bgcolor="#ffffff">${record.remark }</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
	<br />
	<table width="100%" cellspacing="0" cellpadding="1">
		<tr>
			<td align="center"><button onclick="window.close();">关闭</button>
			</td>
		</tr>
	</table>
</body>
</html>

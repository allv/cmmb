<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动保健操记录明细</title>
<script type="text/javascript">

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 保健操记录修改明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="14%" nowrap>活动名称</th>
      <th width="13%" nowrap>参加人数(会、工、自)</th>
      <th width="14%" nowrap>活动时间</th>
      <th width="16%" nowrap>活动地点</th>
      <th width="19%" nowrap>活动备注</th>
      <th width="15%" nowrap>所属项目</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="5">
	    未找到保健操记录修改明细!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="act" items="${result}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${act.aname}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${act.apeoplenum}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${act.stime}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${act.aplace}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${act.ainfo}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${act.abelongpro}</td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
  </table>
  <table width="100%">
	  <tr>
	    <td align="right">&nbsp;</td>
	    <td id="ERROR_MSG">${msg}</td>
	  </tr>
     <tr>
     <td width="100%" align="center">
		<button onClick="forward('recoveryhistory.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>感官功能康复修改明细</title>
<script type="text/javascript">

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 感官功能康复修改明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post">
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="14%" nowrap>开始时间</th>
      <th width="14%" nowrap>结束时间</th>
      <th width="17%" nowrap>参加人员</th>
      <th width="21%" nowrap>活动介绍及备注</th>
      <th width="10%" nowrap>记录人签字</th>
      <th width="15%" nowrap>所属项目</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="5">
	    未找到感官功能康复修改明细!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="sen" items="${result}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sstarttime}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sendtime}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sattend}></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sinfo}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.swrite}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sbelongpro}</td>
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
		<button onClick="forward('sensoryhistory.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

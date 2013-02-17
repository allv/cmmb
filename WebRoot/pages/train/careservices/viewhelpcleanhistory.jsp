<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>助洁记录修改明细</title>
<script type="text/javascript">

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理> 介护服务> 助洁记录修改明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="14%" nowrap>姓名</th>
      <th width="13%" nowrap>衣物件数(大、中、小)</th>
      <th width="14%" nowrap>晾晒要求(烘干、室外)</th>
      <th width="16%" nowrap>执行人员签字</th>
      <th width="19%" nowrap>备注</th>
      <th width="15%" nowrap>所属项目</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="7">
	    未找到助洁记录修改明细!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="hel" items="${result}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${hel.hname}</td>
          <td align="center" nowrap bgcolor="#E4E4E4">${hel.hclothingnum}</td>
          <td align="center" nowrap bgcolor="#E4E4E4">${hel.hrequirement}</td>
          <td align="center" nowrap bgcolor="#E4E4E4">${hel.hpeople}</td>
          <td align="center" nowrap bgcolor="#E4E4E4">${hel.hinfo}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${hel.hbelongpro}</td>
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
		<button onClick="forward('helpcleanhistory.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

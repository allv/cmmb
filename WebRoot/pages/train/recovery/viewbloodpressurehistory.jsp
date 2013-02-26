<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血压测量记录修改明细</title>
<script type="text/javascript">

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 血压测量记录修改明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th nowrap>序号</th>
      <th nowrap>姓名</th>
      <th nowrap>性别</th>
      <th nowrap>年龄</th>
      <th nowrap>电话</th>
      <th nowrap>入托时间</th>
      <th nowrap>主要疾病</th>
      <th nowrap>档案号码</th>
      <th nowrap>备注</th>
      <th nowrap>日期</th>
      <th nowrap>血压</th>
      <th nowrap>脉搏</th>
      <th nowrap>所属项目</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="12">
	    未找到血压测量记录修改明细!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="blo" items="${result}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bname}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bgender}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bage}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bphone}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bstarttime}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bdiseases}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bfilenumber}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.binfo}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bwritedate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bloodnum}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bpulse}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bbelongpro}</td>
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
		<button onClick="forward('bloodpressurehistory.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

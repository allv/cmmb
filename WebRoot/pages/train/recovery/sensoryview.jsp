<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>感官功能康复记录</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 感官功能康复记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post">
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td></td>
<td colspan="6" align="right">所属项目:<input type="text" id="sbelongpro" name="sbelongpro" value="${result[0].sbelongpro}" size="10" disabled></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" disabled/></th>
      <th width="14%" nowrap>开始时间</th>
      <th width="14%" nowrap>结束时间</th>
      <th width="17%" nowrap>参加人员</th>
      <th width="21%" nowrap>活动介绍及备注</th>
      <th width="10%" nowrap>记录人签字</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="5">
	    未找到感官功能康复记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="sen" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="sid${loopStatus.count}" value="${sen.sid}" />
          <input type="hidden" name="snumber" value="${sen.snumber}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sstarttime" value="${sen.sstarttime}" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sendtime" value="${sen.sendtime}" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="sattend" type="text" value="${sen.sattend}" size="28" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><textarea name="sinfo" cols="38" onBlur="javascript:this.style.width='202px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1" readonly>${sen.sinfo}</textarea></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="swrite" type="text" value="${sen.swrite}" size="14" disabled/></td>
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
		<button onClick="forward('sensorylist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

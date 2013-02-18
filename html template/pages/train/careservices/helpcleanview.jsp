<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>助洁记录明细</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理 >介护服务 > 助洁记录明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td></td>
<td colspan="6" align="right">所属项目:<input type="text" id="hbelongpro" name="hbelongpro" value="${result[0].hbelongpro}" size="10" disabled></td>
</tr>
</table>
<table id="tab" width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" disabled/></th>
      <th width="14%" nowrap>姓名</th>
      <th width="13%" nowrap>衣物件数(大、中、小)</th>
      <th width="14%" nowrap>晾晒要求(烘干、室外)</th>
      <th width="16%" nowrap>执行人员签字</th>
      <th width="19%" nowrap>备注</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="5">
	    未找到助洁记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="hel" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="hid${loopStatus.count}" value="${hel.hid}" />
          <input type="hidden" name="hdate" value="${hel.hdate}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="hname" type="text" value="${hel.hname}" size="22" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="hclothingnum" type="text" value="${hel.hclothingnum}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="hrequirement" type="text" value="${hel.hrequirement}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="hpeople" type="text" value="${hel.hpeople}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><textarea name="hinfo" cols="34" onBlur="javascript:this.style.width='186px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1" readonly>${hel.hinfo}</textarea></td>
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
		<button onClick="forward('helpcleanlist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

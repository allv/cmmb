<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>助浴记录明细</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理 >介护服务 > 助浴记录明细</div>
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
<td colspan="7" align="right">所属项目:<input type="text" id="pbelongpro" name="pbelongpro" value="${result[0].cbelongpro}" size="10" disabled></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="5%" nowrap><input type="type="checkbox" class="checkBox1" " onclick="checkAll(this)" disabled/></th>
      <th width="14%" nowrap>姓名</th>
      <th width="13%" nowrap>助浴级别</th>
      <th width="14%" nowrap>开始时间</th>
      <th width="16%" nowrap>完成时间</th>
      <th width="19%" nowrap>执行人员</th>
      <th width="19%" nowrap>备注</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="9">
	    未找到助浴记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="bat" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="cid${loopStatus.count}" value="${bat.cid}" />
          <input type="hidden" name="cdate" value="${bat.cdate}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="type="checkbox" class="checkBox1" " name="b_id" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="cname" type="text" value="${bat.cname}" size="22" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="clevel" type="text" value="${bat.clevel}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name=cstarttime value="${bat.cstarttime}" disabled  /></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="cendtime" value="${bat.cendtime}" disabled /></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="cpeople" type="text" value="${bat.cpeople}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4">
               <textarea name="cinfo" cols="38" onBlur="javascript:this.style.width='202px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1" readonly>${bat.cinfo}</textarea>
          </td>
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
		<button onClick="forward('bathrecordlist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

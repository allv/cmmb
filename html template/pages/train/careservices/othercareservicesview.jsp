<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>介护服务记录明细</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理 >介护服务 > 介护服务记录明细</div>
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
<td colspan="9" align="right">所属项目:<input type="text" id="obelongpro" name="obelongpro" value="${result[0].obelongpro}" size="10" disabled></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" disabled/></th>
      <th width="14%" nowrap>日期</th>
      <th width="14%" nowrap>姓名</th>
      <th width="13%" nowrap>介护服务内容</th>
      <th width="14%" nowrap>开始时间</th>
      <th width="16%" nowrap>完成时间</th>
      <th width="19%" nowrap>执行人员\单位</th>
      <th width="19%" nowrap>实施的评价</th>
      <th width="19%" nowrap>备注</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="5">
	    未找到介护服务记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="car" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="oid${loopStatus.count}" value="${car.oid}" />
          <input type="hidden" name="onumber" value="${car.onumber}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="22" name="odate" value="${car.oname}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="oname" type="text" value="${car.oname}" size="22" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="ocontent" type="text" value="${car.ocontent}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name=ostarttime value="${car.ostarttime}" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="oendtime" value="${car.oendtime}" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="opeople" type="text" value="${car.opeople}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="oevaluation" type="text" value="${car.oevaluation}" size="19" disabled/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><textarea name="oinfo" cols="34" onBlur="javascript:this.style.width='186px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1" readonly>${car.oinfo}</textarea></td>
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
		<button onClick="forward('othercareserviceslist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

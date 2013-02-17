<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血压测量记录</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 血压测量记录</div>
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
<td colspan="12" align="right">所属项目:<input type="text" id="bbelongpro" name="bbelongpro" value="${result[0].bbelongpro}" size="10" disabled></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th nowrap>序号</th>
      <th nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" disabled/></th>
      <th nowrap>姓名</th>
      <th nowrap>性别</th>
      <th nowrap>年龄</th>
      <th nowrap>电话</th>
      <th nowrap>入托时间</th>
      <th nowrap>主要疾病</th>
      <th nowrap>档案号码</th>
      <th nowrap>日期</th>
      <th nowrap>血压</th>
      <th nowrap>脉搏</th>
      <th nowrap>备注</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="13">
	    未找到血压测量记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="blo" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="bid${loopStatus.count}" value="${blo.bid}" />
          <input type="hidden" name="bdate" value="${blo.bdate}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bname" type="text" value="${blo.bname}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bgender" type="text" value="${blo.bgender}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bage" type="text" value="${blo.bage}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bphone" type="text" value="${blo.bphone}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="" name="bstarttime" value="${blo.bstarttime}" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bdiseases" type="text" value="${blo.bdiseases}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bfilenumber" type="text" value="${blo.bfilenumber}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="" name="bwritedate" value="${blo.bwritedate}" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bloodnum" type="text" value="${blo.bloodnum}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bpulse" type="text" value="${blo.bpulse}" size="" disabled/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><textarea name="binfo" cols="34" onBlur="javascript:this.style.width='186px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1" readonly>${blo.binfo}</textarea></td>
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
		<button onClick="forward('bloodpressurelist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

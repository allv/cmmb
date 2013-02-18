<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>器械康复服务记录</title>
<style type="text/css">
.txt{ 
color:#005aa7; 
border-bottom:1px solid #005aa7; /* 下划线效果 */ 
border-top:0px; 
border-left:0px; 
border-right:0px; 
background-color:transparent; /* 背景色透明 */ 
}
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 器械康复服务记录</div>
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
<td colspan="8" align="right">所属项目:<input type="text" id="mbelongpro" name="mbelongpro" value="${result[0].mbelongpro}" size="10" disabled></td>
</tr>
</table>
<table id="tab" width="100%" border="1" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>序号</th>
      <th nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" disabled/></th>
      <th nowrap>日期</th>
      <th nowrap>姓名</th>
      <th nowrap>1.按摩椅<br/>(分钟/次)</th>
      <th nowrap>2.肩关节<br/>(单臂__次/组)</th>
      <th nowrap>3.按摩带<br/>(分钟)</th>
      <th nowrap>4.哑铃<br/>(单臂__次/组)</th>
      <th nowrap>记录</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="10">
	    未找到器械康复服务记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
	<tbody id="tbody">
    <c:forEach var="ment" items="${result}" varStatus="loopStatus">
    <tr>
        <input type="hidden" name="mentid${loopStatus.count}" value="${ment.mentid}" />
        <input type="hidden" name="mnumber" value="${ment.mnumber}" />
	    <td align="center" rowspan="2"><c:out value="${loopStatus.count}"/></td>
	    <td align="center" rowspan="2"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
	    <td align="center" rowspan="2"><input type="text" size="21" name="mdate" value="${ment.mdate}" disabled/></td>
	    <td align="center"><input type="text" name="mname" value="${ment.mname}" style="border:0;text-Align:center;" disabled/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mchair" ${ment.mchair} disabled/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mjoint" ${ment.mjoint} disabled/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mbelt" ${ment.mbelt} disabled/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mdumbbell" ${ment.mdumbbell} disabled/></td>
	    <td align="center" rowspan="2">
		R<input name="mrecorder" type="text" value="${ment.mrecorder}" size="5" class="txt"/>
		S<input name="msupervisor" type="text" value="${ment.msupervisor}" size="5" class="txt"/>
		</td>
	  </tr>
	  <tr>
	    <td align="center">总计时:<input name="mtotaltime" type="text" value="${ment.mtotaltime}" size="5" class="txt" disabled/>分钟</td>
	    <td align="center"><input name="mchairchoo" type="text" value="${ment.mchairchoo}" size="5" class="txt" disabled/>分钟</td>
	    <td align="center"><input name="mjointchoo" type="text" value="${ment.mjointchoo}" size="5" class="txt" disabled/>分钟</td>
	    <td align="center"><input name="mbeltchoo" type="text" value="${ment.mbeltchoo}" size="5" class="txt" disabled/>分钟</td>
	    <td align="center"><input name="mdumbbellchoo" type="text" value="${ment.mdumbbellchoo}" size="5" class="txt" disabled/>分钟</td>
	  </tr>
    </c:forEach>
    </tbody>
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
		<button onClick="forward('instrumentlist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

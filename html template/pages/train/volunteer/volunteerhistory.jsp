<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>志愿者历史记录</title>
<style type="text/css">
body{overflow:auto}
.menu{width:1106px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
function volView(vid){
   window.location.href=basePath+"/volunteerviewacthistory.do?vid="+vid;
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>志愿者管理> 志愿者管理> 志愿者历史记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div style="height:10px;">
</div>
<form method="post" name="volform" action="volunteerhistory.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">姓名</td>
      <td><input name="vname" id="vname" value="" type="text" size="20"></td>
      <td align="right">个人特长</td>
      <td><input name="vspecialty" id="vspecialty" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>姓名</th>
      <th nowrap>年龄</th>
      <th nowrap>性别</th>
      <th nowrap>电话</th>
      <th nowrap>个人特长</th>
      <th nowrap>社区工作经历</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="10">
	    未找到活动信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="vol" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vage} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vgender} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vphone} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vspecialty}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vcommunitywork}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:volView('${vol.vid}');">明细</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
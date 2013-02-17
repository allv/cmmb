<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>器械康复历史记录</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.menu{width:1106px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';

function viewEdit(mnumber){
   window.location.href=basePath+"/instrumentviewacthistory.do?mnumber="+mnumber;
}

function setTab(name,cursel){
    var menu = document.getElementById(name+cursel);
    if(cursel == 1)
    {
        window.location.href=basePath+"/recoverylist.do";
    }
    else if(cursel == 2)
    {
        window.location.href=basePath+"/psychologylist.do";
    }
	else if(cursel == 3)
	{
	    window.location.href=basePath+"/sensorylist.do";
	}
	else if(cursel == 4)
	{
	    window.location.href=basePath+"/bloodpressurelist.do";
	}
	else
	{
	    window.location.href=basePath+"/instrumentlist.do";
	}
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理> 康复服务> 器械康复历史记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div class="menu">
	<ul>
		<li id="one1" onclick="setTab('one',1)">保健操记录表</li>
		<li id="one2" onclick="setTab('one',2)">心理康复活动记录表</li>
		<li id="one3" onclick="setTab('one',3)">感官功能康复记录表</li>
		<li id="one4" onclick="setTab('one',4)">血压测量记录表</li>
		<li id="one5" onclick="setTab('one',5)">器械康复记录表</li>
	</ul>
</div>
<div style="height:10px;">
</div>
<form method="post" name="actform" action="instrumenthistory.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">日期</td>
      <td><input type="text" size="20" id="mdate" name="mdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">老人姓名</td>
      <td><input name="mname" id="mname" value="" type="text" size="20"></td>
      
      <td align="right">记录人</td>
      <td><input name="mrecorder" id="mrecorder" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>日期</th>
      <th nowrap>姓名</th>
      <th nowrap>记录</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到器械康复历史记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="ment" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ment.mdate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ment.mname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">R:${ment.mrecorder} S:${ment.msupervisor} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:viewEdit('${ment.mnumber}');">明细</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
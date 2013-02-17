<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保健操历史记录</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.menu{width:1106px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';

function actView(anumber){
   window.location.href=basePath+"/recoveryviewacthistory.do?anumber="+anumber;
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
	    window.location.href=basePath+"/recoveryactmodify.do";
	}
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理> 康复服务> 保健操历史记录表</div>
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
<form method="post" name="actform" action="recoveryhistory.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">日期</td>
      <td><input type="text" size="20" id="atime" name="atime" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
      <td align="right">活动名称</td>
      <td><input name="aname" id="aname" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>日期</th>
      <th nowrap>活动名称</th>
      <th nowrap>参加人数(会、工、自)</th>
      <th nowrap>活动时间</th>
      <th nowrap>活动地点</th>
      <th nowrap>活动备注</th>
      <th nowrap>修改时间</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到保健操历史记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="recl" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recl.anumber} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recl.aname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recl.apeoplenum} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recl.stime} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recl.aplace}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recl.ainfo}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recl.atime} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:actView('${recl.anumber}');">明细</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
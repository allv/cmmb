<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老人介护服务计划历史记录</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.menu{width:885px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
function serView(snumber){
alert(snumber);
   window.location.href=basePath+"/serviceplanviewacthistory.do?snumber="+snumber;
}

function setTab(name,cursel){
    var menu = document.getElementById(name+cursel);
    if(cursel == 1)
    {
        window.location.href=basePath+"/bathrecordlist.do";
    }
    else if(cursel == 2)
    {
        window.location.href=basePath+"/helpcleanlist.do";
    }
	else if(cursel == 3)
	{
	    window.location.href=basePath+"/othercareserviceslist.do";
	}
	else
	{
	    window.location.href=basePath+"/serviceplanlist.do";
	}
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理> 介护服务> 老人介护服务计划历史记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div class="menu">
	<ul>
		<li id="one1" onclick="setTab('one',1)">助浴服务记录表</li>
		<li id="one2" onclick="setTab('one',2)">助洁服务记录表</li>
		<li id="one3" onclick="setTab('one',3)">其他介护服务记录表</li>
		<li id="one4" onclick="setTab('one',4)">老年人介护服务计划表</li>
	</ul>
</div>
<div style="height:10px;">
</div>
<form method="post" name="actform" action="serviceplanhistory.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">日期</td>
      <td><input type="text" size="20" id="sdate" name="sdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">老人姓名</td>
      <td><input name="sname" id="sname" value="" type="text" size="20">
      
      <td align="right">执行人员</td>
      <td><input name="speople" id="speople" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>日期</th>
      <th nowrap>姓名</th>
      <th nowrap>性别</th>
      <th nowrap>执行人员</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到老人介护服务计划历史记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="ser" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ser.sdate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ser.sname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ser.sgender} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ser.speople} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:serView('${ser.snumber}');">明细</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
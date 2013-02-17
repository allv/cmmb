<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>血压测量历史记录</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.menu{width:1106px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';

function actView(bdate){
   window.location.href=basePath+"/bloodpressureviewacthistory.do?bdate="+bdate;
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
<div class="topLanBar"><b>当前位置：</b>康复管理> 康复服务> 血压测量历史记录</div>
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
<form method="post" name="actform" action="bloodpressurehistory.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">入托时间</td>
      <td><input type="text" size="20" id="bstarttime" name="bstarttime" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">老人姓名</td>
      <td><input name="bname" id="bname" value="" type="text" size="20">
      
      <td align="right">档案号码</td>
      <td><input name="bfilenumber" id="bfilenumber" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>姓名</th>
      <th nowrap>性别</th>
      <th nowrap>年龄</th>
      <th nowrap>电话</th>
      <th nowrap>入托时间</th>
      <th nowrap>主要疾病</th>
      <th nowrap>档案号码</th>
      <th nowrap>备注</th>
      <th nowrap>日期</th>
      <th nowrap>血压</th>
      <th nowrap>脉搏</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到血压测量历史记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="blo" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bgender} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bage} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bphone} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bstarttime}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bdiseases}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bfilenumber}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.binfo}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bwritedate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bloodnum}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${blo.bpulse}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:actView('${blo.bdate}');">明细</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
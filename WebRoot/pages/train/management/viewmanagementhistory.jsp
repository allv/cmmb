<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<title>活动修改明细</title>
<link href="<%=basePath%>/css/default.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>/css/button.css" type="text/css" />
<script type="text/javascript">

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>活动管理> 活动管理> 活动修改记录明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
    <tr>
      <td align="right">活动开始时间</td>
      <td>${result.mstarttime}</td>
    </tr>
    <tr>
      <td align="right">活动结束时间</td>
      <td>${result.mendtime}</td>
    </tr>
    <tr>
      <td align="right">人数</td>
      <td>${result.mnumber}</td>
    </tr>
    <tr>
      <td align="right">地点</td>
      <td>${result.mplace}</td>
    </tr>
    <tr>
      <td align="right">活动组织者</td>
       <td>${result.morganizer}</td>
    </tr>
    
    <tr>
      <td align="right">活动编号</td>
      <td>${result.mserialnum}</td>
    </tr>
    
    <tr>
      <td align="right">所属项目</td>
      <td>${result.mbelongpro}</td>
    </tr>
   
    <tr>
      <td align="right">备注</td>
      <td>${result.minfo}</td>
    </tr>
</table>
<table width="100%">
    <tr>
      <td align="right">&nbsp;</td>
      <td id="ERROR_MSG">${msg}</td>
    </tr>
    <tr>
      <td width="100%" align="center">
	  <button onClick="forward('managementhistory.do')">返回</button></td>
    </tr>
</table>
</form>
</body>
</html>

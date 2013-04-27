<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动室基本信息</title>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>活动室管理 > 活动室基本信息</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>

<form name="myform"  method="post" action="activitymodifyHouse.do">
<input type="hidden" name="ahid" value="${ahouse.ahid}" />
<table  width="100%" border="0" cellpadding="3" cellspacing="1">
     <tr>
      <td align="right">活动室编号</td>
      <td><input type="text" name="ahnum" id="ahnum" disabled value="${ahouse.ahnum}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">管理员</td>
      <td><input type="text" name="ahmanager" id="ahmanager" disabled value="${ahouse.ahmanager}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">志愿者</td>
      <td><textarea name="ahvolunteer" id="ahvolunteer"  disabled cols="58" rows="4">${ahouse.ahvolunteer}</textarea></td>
    </tr>
    
    <tr>
      <td align="right">备注</td>
      <td><textarea name="ahplan" id="ahplan" cols="58"  disabled rows="4">${ahouse.ahplan}</textarea></td>
    </tr>
</table>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><div align="center">活动室本周活动计划</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="169"><div align="center">周一</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="545"><textarea name="arrange1" disabled id="arrange1" rows="4" cols="60">${ahouse.arrange1}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周二</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea  name="arrange2" disabled id="arrange2" rows="4" cols="60">${ahouse.arrange2}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周三</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea name="arrange3" disabled id="arrange3" rows="4" cols="60">${ahouse.arrange3}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周四</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea name="arrange4" disabled id="arrange4" rows="4" cols="60">${ahouse.arrange4}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周五</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea name="arrange5"  disabled id="arrange5" rows="4" cols="60">${ahouse.arrange5}</textarea></td>
  </tr>
</table>
<table width="60%" cellspacing="0" cellpadding="1">
    <tr><td align="center">
		<button onClick="forward('activityhouse.do')">返回</button></td>
    </tr>
</table>
</form>
</body>
</html>

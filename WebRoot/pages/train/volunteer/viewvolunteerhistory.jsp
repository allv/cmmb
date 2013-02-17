<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>志愿者修改记录</title>
<script type="text/javascript">

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>志愿者管理 >志愿者管理 > 志愿者修改记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<table width="100%" border="0" cellpadding="3" cellspacing="1">
    <tr>
      <td align="right">姓名</td>
      <td><input type="text" name="vname" value="${result.vname}" disabled/></td>
    </tr>
    <tr>
      <td align="right">年龄</td>
      <td><input type="text" name="vage" value="${result.vage}" disabled/></td>
    </tr>
    <tr>
      <td align="right">性别</td>
      <td><input type="text" name="vgender" value="${result.vgender}" disabled/></td>
    </tr>
    <tr>
      <td align="right">电话</td>
      <td><input name="vphone" type="text" value="${result.vphone}" disabled/></td>
    </tr>
    <tr>
      <td align="right">是否有学习新知识意愿</td>
      <td><input name="vstudy" type="text" value="${result.vstudy}" disabled/></td>
    </tr>
    <tr>
      <td align="right">志愿服务时间</td>
      <td><input type="text" size="" name="vtrain" value="${result.vtrain}"  disabled/></td>
    </tr>
    <tr>
      <td align="right">个人特长</td>
       <td><textarea name="vspecialty" cols="58" rows="4" disabled>${result.vspecialty}</textarea></td>
    </tr>
    
    <tr>
      <td align="right">社区工作经历</td>
      <td><textarea name="vcommunitywork" cols="58" rows="4" disabled>${result.vcommunitywork}</textarea></td>
    </tr>
   <tr>
      <td align="right">志愿服务意向</td>
      <td><textarea name="vintention" cols="58" rows="4" disabled>${result.vintention}</textarea></td>
    </tr>
  </table>
  <table width="80%">
	  <tr>
	    <td align="right">&nbsp;</td>
	    <td id="ERROR_MSG">${msg}</td>
	  </tr>
     <tr>
     <td width="80%" align="center">
		<button onClick="forward('volunteerhistory.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

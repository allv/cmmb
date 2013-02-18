<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>下载提示页面</title>
<link href="<%=basePath%>/pages/train/skins/css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
BODY {
	margin: 0px;
}
.promptPage td {
	color: #009900;
}
.promptPage font {
	color: #FF0000;
}
.promptPage td,.promptPage font {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table width="100%" height="100%" cellspacing="0">
  <tr>
    <td><table width="100%" height="180" cellspacing="0">
      <tr>
        <td class="yellow_lan"></td>
      </tr>
      <tr>
        <td align="center"><table class="promptPage" width="440" border="0" cellpadding="20" cellspacing="0">
          <tr>
            <td width="1"><img src="<%=basePath%>/pages/train/skins/img/prompt-ok.gif"></td>
            <td>您要下载的附件名称为：
						<%=request.getAttribute("fileName") %><br><br>
						<font>如果附件名称包含中文字符，可在下载保存时进行文件名的修改。</font></td>
          </tr>
          <tr>
            <td colspan="2" align="right">
						<button onclick="query('<%=request.getAttribute("ftpPath") %>');">下载</button>
						<button onClick="window.close();">取消</button></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td class="yellow_lan"></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

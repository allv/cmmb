<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>错误页面</title>
<style type="text/css">
#promptPageDIV {
	height: 30%;
	width: 37%;
	text-align:center;
	margin-left:auto;
	margin-right:auto;
	padding: 40px;
}
</style>
</head>
<body>
<div id="promptPageDIV">
  <table width="440" height="480" border="0" cellpadding="20" cellspacing="10">
    <tr>
      <td><img src="<%=basePath%>/pages/train/skins/img/prompt-err.gif"></td>
      <td align="left">浏览器错误，本系统目前只支持IE浏览器。</td>
    </tr>
  </table>
</div>
</body>
</html>

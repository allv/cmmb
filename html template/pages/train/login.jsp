<%@ page contentType="text/html;charset=utf-8" %>
<%@ include file="import.jsp"%>

<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HBJJ伙伴聚家办公平台 - 登录</title>
<style type="text/css">
<!--
BODY {
	margin: 0px;
	background-color: #66CC66;
	overflow: hidden;
	background-image: url(<%=basePath%>/pages/train/skins/img/loginback.jpg);
	background-repeat: repeat-x;
}
#login_layout {
	height: 100%;
	width: 100%;
	text-align:center;
	margin-left:auto;
	margin-right:auto;
	padding-top: 8%;
}
#login_layout #LOGO {
	width: 37%;
	margin-left:auto;
	margin-right:auto;
}
#login_layout #LOGO #font_CN {
	font-family: "黑体";
	font-size: 26px;
	font-weight: bold;
	color: #FFFFFF;
	filter: DropShadow(Color = #cccccc, OffX = 1, OffY = 1, Positive = 20);
}
#login_layout #LOGO #font_EN {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #E0E0E0;
	font-size: 14px;
	font-weight: bold;
	margin-left:auto;
	margin-right:auto;
	filter: DropShadow(Color = #cccccc, OffX = 1, OffY = 1, Positive = 20);
}
#login_layout #login_DIV {
	background-color: #99CC99;
	height: 30%;
	width: 37%;
	text-align:center;
	margin-left:auto;
	margin-right:auto;
	border: 4px solid #66CC00;
	padding: 40px;
}
#login_layout #login_DIV td {
	color: #DBDBDB;
	font-weight: bold;
}
#login_layout #login_DIV input {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	height: 24px;
	border: 1px solid #CCCCCC;
	line-height: 24px;
	font-size: 14px;
	font-weight: bold;
	color: #666666;
}
#login_layout #login_DIV button {
	height: 22px;
	width: 100px;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	cursor: hand;
	background-image: none;
}
#login_layout #login_DIV a {
	color: #CBD7ED;
	text-decoration: underline;
}
-->
</style>
<script type="text/javascript">
window.onload = function(){
	if(top != window)
		top.location.href = "<%=basePath%>";
		
}

function onSubmit(){
	if(check("username","string","用户名不能为空！") ||
		check("password","string","密码不能为空！"))return false;
		
	$("#password").val(hex_md5($("#password").val()));
}
function shownew(){
	$("#spic").attr("src", function() {
		$("#spic").removeAttr("src"); 
		return "<%=basePath%>/pages/train/random.jsp";
	}); 
}
</script>
</head>
<body>
<div id="login_layout">
<div id="LOGO">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" id="font_CN">HBJJ伙伴聚家办公平台</td>
  </tr>
  <tr>
    <td align="center" id="font_EN">HBJJ Office Management Platform</td>
  </tr>
</table>
</div><br>
<div id="login_DIV">
<form action="<%=basePath%>/login.do" method="post" onSubmit="return onSubmit()">
  <table width="100%" cellpadding="8">
    <tr>
      <td align="right"><span style="color:black">用户名</span></td>
      <td><input id="username" name="username" type="text" value="admin"></td>
    </tr>
    <tr>
      <td align="right"><span style="color:black">密码</span></td>
      <td><input id="password" name="password" type="password" value="admin"></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td><span id="ERROR_MSG">${msg }</span></td>
    </tr>
    <tr>
      <td width="120">&nbsp;</td>
      <td align="right">
			<!-- <a href="userregister.do">注册</a> ｜ -->
			<button type="submit">
			<img src="<%=basePath%>/pages/train/skins/img/logbutton.png">
			</button></td>
    </tr>
	
  </table>
  </form>
</div>
<div style="width:37%;margin-left:auto;margin-right:auto;">&copy; 2012-2013 HBJJ Corporation, All Rights Reserved.</div>
</div>
</body>
</html>

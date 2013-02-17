<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HBJJ伙伴聚家办公平台</title>
<style type="text/css">
<!--
BODY {
	margin: 0px;
	overflow: hidden;
}
#top {
	background-image: url(<%=basePath%>/pages/train/skins/img/greenline.png);
	background-repeat: repeat-x;
	height: 98px;
}
#top #top_bar_font {
	color: #FFFFFF;
}
#top #top_bar_yl {
	background-color: #FFCC00;
	height: 6px;
}
#top #logo_font_CN {
	font-family: "黑体";
	font-size: 22px;
	font-weight: bold;
	color: #FFFFFF;
	filter: DropShadow(Color = #cccccc, OffX = 1, OffY = 1, Positive = 20);
}
#top #logo_font_EN {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #E0E0E0;
	font-size: 14px;
	font-weight: bold;
	filter: DropShadow(Color = #cccccc, OffX = 1, OffY = 1, Positive = 20);
}
#top a {
	font-weight: bold;
	color: #FFCC00;
}
#top #webcome_font {
	color: #FFFFFF;
	background-color: #000000;
	text-align: center;
}
#top #webcome_font a {
	color: #FF9900;
	background-image: none;
	height: 20px;
	width: 40px;
}
#onMenuImg {
	cursor: hand;
}
#corpRight {
	background-color: #66DD00;
	text-align: center;
	height: 22px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
}
#menuBox {
	width: 180px;
}
-->
</style>
<script type="text/javascript">
function optionLanBar(){
	var menuBox = document.getElementById("menuBox");
	var imgLanBar = document.getElementById("imgLanBar");
	if(menuBox.style.display=="none"){
		menuBox.style.display="";
		imgLanBar.src="<%=basePath%>/pages/train/skins/img/lan-left.gif";
	}else{
		menuBox.style.display="none";
		imgLanBar.src="<%=basePath%>/pages/train/skins/img/lan-right.gif";
	}
}
function RunOnBeforeUnload()
{
	 var connout = new Connection();
	 connout.init("${pageContext.request.contextPath}/douserlogout.do");
	 connout.send("",null);
}
</script>
</head>
<body onbeforeunload="RunOnBeforeUnload()">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1"><table id="top" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="500" border="0" cellspacing="0" cellpadding="8">
                    <tr>
                      <td><table width="100%" border="0" cellspacing="0" cellpadding="3">
                          <tr>
                            <td id="logo_font_CN">HBJJ伙伴聚家办公平台</td>
                          </tr>
                          <tr>
                            <td id="logo_font_EN">HBJJ Office Management Platform</td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td bgcolor="#000000"><table width="100%" border="0" cellspacing="0" cellpadding="5">
              <tr>
                <td id="top_bar_font">${nowDate} ｜ ${username}，欢迎您登录系统。
                <td align="right" id="top_bar_font">
                <a target="main" href="welcome.do">首页</a> ｜
                <a target="main" href="uppassword.do">修改密码</a> ｜
                <a href="logout.do">注销</a></td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td id="top_bar_yl"></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td id="menuBox"><iframe name="menu" src="menu.do" scrolling="no"></iframe></td>
          <td width="1" background="<%=basePath%>/pages/train/skins/img/ctrl_bg.gif" id="LanBar"><img src="<%=basePath%>/pages/train/skins/img/lan-left.gif" name="imgLanBar" id="imgLanBar" onClick="optionLanBar()"></td>
          <td><iframe name="main" src="welcome.do" scrolling="yes"></iframe></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td id="corpRight">&copy; 2012-2013 HBJJ Corporation, All Rights Reserved.</td>
  </tr>
</table>
<script language="JavaScript" type="text/javascript">
       var sh;//定时器
       var num=0;
       sh = setInterval("testT()",30000);//设置定时器，此处定时每1秒钟都会调用testT()函数
       //定时器执行函数
       function testT()
       {
       		 //去掉告警功能
       }

       //$(window).unload( function () { alert("Bye now!"); } );
    </script>
</body>
</html>

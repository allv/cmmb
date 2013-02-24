<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<% String type = (String)request.getAttribute("type"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功页面</title>
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
<script type="text/javascript">
function goBack(backURL) {
	if(window.parent != null){
		window.close();
	}else {
		window.location.href = "${back }";
	}
}
</script>
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
            <td width="1"><img src="<%=basePath%>/pages/train/skins/img/<%if("ok".equals(type)){%>prompt-ok.gif<%}else{%>prompt-err.gif<%}%>"></td>
            <td>
						<font>${msg}</font><br>
              系统将在 <font id="span_dt_dt"></font> &nbsp;秒后自动返回．．．
              <script type="text/javascript">
				var time = 6;
				function show_date_time() { 
				  window.setTimeout("show_date_time()", 1000); 
				  time = time - 1;
				  var span_dt_dt = document.getElementById("span_dt_dt");
				  span_dt_dt.innerHTML = time ;
					if(time == 0){
						goBack("${back }");
					}
				} 
				show_date_time(); 
				</script></td>
          </tr>
          <tr>
            <td colspan="2" align="right"><button onClick="goBack('${back }')">返回</button></td>
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

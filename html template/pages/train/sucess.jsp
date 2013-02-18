<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功页面</title>
<link href="<%=basePath%>/pages/train/skins/css/common.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="promptPageDIV">
  <table width="440" height="220" border="0" cellpadding="20" cellspacing="0">
    <tr>
      <td width="1"><img src="<%=basePath%>/pages/train/skins/img/prompt-ok.gif"></td>
      <td>操作成功！<br>
        系统将在 <font id="span_dt_dt"></font> &nbsp;秒后自动返回．．．
        <script type="text/javascript">
				var time = 6;
				function show_date_time() { 
				  window.setTimeout("show_date_time()", 1000); 
				  time = time - 1;
				  var span_dt_dt = document.getElementById("span_dt_dt");
				  span_dt_dt.innerHTML = time ;
					if(time == 0)
						window.location.href = "<%=request.getAttribute("back")%>"; 
				} 
				show_date_time(); 
				</script></td>
    </tr>
    <tr>
      <td colspan="2" align="right"><button onClick="window.location.href='${back }'">返回</button></td>
    </tr>
  </table>
</div>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改活动室</title>
<script type="text/javascript">
	var basePath = '<%=basePath%>';
	var $2 = function(id){
        return document.getElementById(id);
    }
    //保存
    function Save() {
        var ahid = document.getElementById("ahid").value;
        var ahnum = document.getElementById("ahnum").value;
        if(ahnum==""){
       	 	alert('活动室编号不能为空');
        	return;
    	}
    	var ahmanager = document.getElementById("ahmanager").value;
    	if(ahmanager==""){
    	    alert('活动室管理员不能为空');
        	return;
    	}
    	var ahvolunteer = document.getElementById("ahvolunteer").value;
    	var ahplan = document.getElementById("ahplan").value;
    	var arrange1 = document.getElementById("arrange1").innerText;
    	var arrange2 = document.getElementById("arrange2").innerText;
    	var arrange3 = document.getElementById("arrange3").innerText;
    	var arrange4 = document.getElementById("arrange4").innerText;
    	var arrange5 = document.getElementById("arrange5").innerText;
        $.ajax({
					type : "POST",
					url : basePath + "/activitymodifyHouse.do?ahnum=" + 
					ahnum+"&ahmanager="+ahmanager+"&ahvolunteer="+ahvolunteer+"&ahplan="+ahplan+"&ahid="+ahid+"&arrange1="+arrange1
					+"&arrange2="+arrange2+"&arrange3="+arrange3+"&arrange4="+arrange4+"&arrange5="+arrange5,
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改活动室成功');
							window.location.href = basePath + "/activityhouse.do";
						} else {
							alert('修改活动室失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
    }
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>活动室管理 >活动室管理 > 修改活动室</div>
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
      <td><input type="text" name="ahnum" id="ahnum" value="${ahouse.ahnum}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">管理员</td>
      <td><input type="text" name="ahmanager" id="ahmanager" value="${ahouse.ahmanager}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">志愿者</td>
      <td><textarea name="ahvolunteer" id="ahvolunteer" cols="58" rows="4">${ahouse.ahvolunteer}</textarea></td>
    </tr>
    
    <tr>
      <td align="right">活动</td>
      <td><textarea name="ahplan" id="ahplan" cols="58" rows="4">${ahouse.ahplan}</textarea></td>
    </tr>
</table>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><div align="center">活动室本周活动计划</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="169"><div align="center">周一</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="545"><textarea name="arrange1" id="arrange1" cols="60" rows="4">${ahouse.arrange1}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周二</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea  name="arrange2" id="arrange2" cols="60" rows="4">${ahouse.arrange2}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周三</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea name="arrange3" id="arrange3" cols="60" rows="4">${ahouse.arrange3}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周四</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea name="arrange4" id="arrange4" cols="60" rows="4">${ahouse.arrange4}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">周五</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea name="arrange5" id="arrange5" cols="60" rows="4">${ahouse.arrange5}</textarea></td>
  </tr>
</table>
<table width="80%" cellspacing="0" cellpadding="1">
    <tr>
        <td align="center"><button onclick="Save()">提交</button> 
		<button onClick="forward('activityhouse.do')">返回</button></td>
    </tr>
</table>
</form>
</body>
</html>

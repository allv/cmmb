<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动室列表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function vodDel(ahid){
		 var but = window.confirm("确定删除该活动室吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/activitydeletehouse.do", 
			   data: {ahid:ahid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/activityhouse.do";
			   		}else{
			   		 	 alert('删除失败!');
			   		}
			   },
			   failure:function (){
			   		alert("未知错误！")
			   }
			});
	}
}

function achouseEdit(ahid){
   window.location.href=basePath+"/activitypremodifyHouse.do?ahid="+ahid;
}

function achouseView(ahid){
   window.location.href=basePath+"/activityviewHouse.do?ahid="+ahid;
}

function achouseInputServtime(ahid){
   window.location.href=basePath+"/activityhouseservtime.do?ahid="+ahid;
}

function achouseService(ahid){
   window.location.href=basePath+"/activityservicemanage.do?ahid="+ahid;
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>活动室管理> 活动室列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div style="height:10px;">
</div>
<form method="post" name="volform" action="activityhouse.do">
  <table width="65%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">活动室编号</td>
      <td><input name="ahnum" id="ahnum"  type="text" size="20"></td>
       <td align="right">总人次数</td>
      <td><input name="ahtotalpeo" id="ahtotalpeo"  type="text" size="20"></td>
    </tr>
    <tr>
      <td align="right">总次数</td>
      <td><input name="ahtotalnum" id="ahtotalnum"  type="text" size="20"></td>
      
      <td align="right">管理人员</td>
      <td><input name="ahmanager" id="ahmanager"  type="text" size="20"><button type="submit">搜索</button></td>
      </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('activityaddActivityhouse.do')" id="001">新建活动室</button>
    </tr>
    <tr>
      <th nowrap>活动室编号</th>
      <th nowrap>活动室管理员</th>
      <th nowrap>活动总次数</th>
      <th nowrap>活动总人次数</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到活动室信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="achouse" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4">${achouse.ahnum} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${achouse.ahmanager} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${achouse.ahtotalnum} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${achouse.ahtotalpeo} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:achouseView('${achouse.ahid}');">明细</a>&nbsp;&nbsp;<a href="javascript:achouseEdit('${achouse.ahid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:vodDel('${achouse.ahid}');">删除</a>&nbsp;&nbsp;
	         <a href="javascript:achouseInputServtime('${achouse.ahid}');">活动次数统计</a>
	         <a href="javascript:achouseService('${achouse.ahid}');">服务菜单</a>
	      </td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
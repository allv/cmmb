<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作流管理</title>
<link href="<%=basePath%>/pages/train/skins/css/common.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
function deleteWorkflow(workflowId) {
	if(confirm('确认删除?')){
		$.ajax({
			   url: "<%=basePath%>/ajaxDeleteWorkflow.htm?workflowId="+workflowId,
			   type: "POST",
			   success: function(data){
			   alert(data);
			   $("#btn_search").click();
			   }
			 });
	}else {
		void(0);
	}
}

function enableWorkflow(workflowId) {
	$.ajax({
		   url: "<%=basePath%>/ajaxEnableWorkflow.htm?workflowId="+workflowId,
		   type: "POST",
		   success: function(data){
		   alert(data);
		   $("#btn_search").click();
		   }
		 });
}

function showDialog(url,arguments) {
	var obj = new Object();
	var date  =new Date();
	url = url + '?time='+date.getTime() +'&'+ arguments;
	window.showModalDialog(url,obj,"dialogWidth=800px;dialogHeight=500px"); 
}

function modifyWorkflow(workflowId) {
	showDialog('workflowModify.do','mid=' + workflowId);
	$("#btn_search").click();
}

function createWorkflow() {
	showDialog('workflowAdd.do','1=1');
	$("#btn_search").click();
}

</script>
<body>
<div class="topLanBar"><b>当前位置：</b>基本信息管理 > 工作流管理</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="queryworkflow.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">创建开始时间</td>
      <td><input type="text" size="22" name="startDate" value="${startDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
      </td>
      <td align="right">创建结束时间</td>
      <td><input type="text" size="22" name="endDate" value="${endDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
    </tr>
    <tr>
       <td align="right">工作流名称</td>
      <td><input name="workflowName" value="${workflowName }" type="text" size="20">
       <button type="submit" id="btn_search">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <td colspan="8" class="tableList_bar">
		<button id="01" onClick="createWorkflow()">
		<img src="<%=basePath%>/pages/train/skins/img/add.gif">新增工作流</button>
       </td>
    </tr>
    <tr>
      <th nowrap>工作流名称</th>
      <th nowrap>创建时间</th>
      <th nowrap>关联表单</th>
      <th nowrap>描述</th>
      <th nowrap>状态</th>
      <th nowrap>操作</th>
    </tr>
    <c:forEach var="ftbl" items="${result.resultlist}" varStatus="loopStatus">
    	<tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ftbl.name} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><fmt:formatDate value="${ftbl.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ftbl.form.name}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ftbl.description}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ftbl.usefulDisplayValue}</td>
	      <td align="center" align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:deleteWorkflow('${ftbl.id}')">删除</a>&nbsp;&nbsp;
	      <a href="javascript:modifyWorkflow('${ftbl.id}');">编辑</a>&nbsp;&nbsp;
	      <a href="javascript:enableWorkflow('${ftbl.id}');">
	      <c:if test="${ftbl.usefulness}" >禁用</c:if>
	      <c:if test="${!ftbl.usefulness}" >启用</c:if>
	      </a>&nbsp;&nbsp;
	      </td>
    	</tr>
    </c:forEach>
  </table>
  <wt:pages />
</form>
</body>
</html>

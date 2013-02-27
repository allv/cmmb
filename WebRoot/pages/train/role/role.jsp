<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link href="<%=basePath%>/pages/train/skins/css/common.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
function showDialog(url,arguments) {
	var obj = new Object();
	var date  =new Date();
	url = url + '?time='+date.getTime() +'&'+ arguments;
	window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=250px"); 
}
function createRole() {
	showDialog('roleadd.do');
}

function modifyRole(roleid) {
	showDialog('rolemodify.do','mid=' + roleid);
	$("#btn_search").click();
}

function viewPermissions(roleid) {
	showDialog('viewPermission.do','mid=' + roleid);
	$("#btn_search").click();
}

function assignPermissions(roleid) {
	showDialog('fpermission.do','mid=' + roleid);
	$("#btn_search").click();
}

function viewMembers(roleid) {
	showDialog('viewRoleMember.do','mid=' + roleid);
	$("#btn_search").click();
}

function assignMemebers(roleid) {
	showDialog('getRoleMember.do','mid=' + roleid);
	$("#btn_search").click();
}

function viewRoleForms(roleid) {
	showDialog('viewRoleForms.do','mid=' + roleid);
	$("#btn_search").click();
}

function assignRoleForms(roleid) {
	showDialog('getRoleForms.do','mid=' + roleid);
	$("#btn_search").click();
}

function deleteRole(roleid) {
	if(confirm('确认删除?')){
		$.ajax({
			   url: "<%=basePath%>/ajaxDeleteRole.htm?roleid="+roleid,
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

function getParentRoleName(roleid) {
	var roleName = '';
	if(roleid == '10001') {
		roleName = '管理员';
	}else if(roleid == '10002') {
		roleName = '行政人员';
	}else if(roleid == '10003') {
		roleName = '经理';
	}
	document.write(roleName);
}
</script>
<body>
<div class="topLanBar"><b>当前位置：</b>基本信息管理 > 角色管理</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="queryrole.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">创建开始时间</td>
      <td><input type="text" size="22" name="startDate" value="${startDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />
      </td>
      <td align="right">创建结束时间</td>
      <td><input type="text" size="22" name="endDate" value="${endDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
    </tr>
    <tr>
       <td align="right">角色名</td>
      <td><input name="rolename" value="${rolename }" type="text" size="20">
       <button type="submit" id="btn_search">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <td colspan="8" class="tableList_bar">
		<button id="01" onClick="createRole()">
		<img src="<%=basePath%>/pages/train/skins/img/add.gif">新增角色</button>
       </td>
    </tr>
    <tr>
      <th nowrap>角色名称</th>
      <th nowrap>创建时间</th>
      <th nowrap>权限组</th>
      <th nowrap>描述</th>
      <th nowrap>操作</th>
    </tr>
    <c:forEach var="ftbl" items="${result.resultlist}" varStatus="loopStatus">
    	<tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ftbl.wtroleName} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><fmt:formatDate value="${ftbl.wtroleCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><script>getParentRoleName('${ftbl.parentRole}')</script></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${ftbl.wtroleDescription}</td>
	      <td align="center" align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:deleteRole('${ftbl.wtroleId}')">删除</a>&nbsp;&nbsp;
	      <a href="javascript:modifyRole('${ftbl.wtroleId}');">编辑</a>&nbsp;&nbsp;
	      <a href="javascript:viewMembers('${ftbl.wtroleId}');">查看会员</a>&nbsp;&nbsp;
	      <a href="javascript:assignMemebers('${ftbl.wtroleId}');">分配会员</a>&nbsp;&nbsp;
	      <a href="javascript:viewPermissions('${ftbl.wtroleId}');">查看权限</a>&nbsp;&nbsp;
	      <a href="javascript:assignPermissions('${ftbl.wtroleId}');">分配权限</a>&nbsp;&nbsp;
	      <a href="javascript:viewRoleForms('${ftbl.wtroleId}');">查看表单</a>&nbsp;&nbsp;
	      <a href="javascript:assignRoleForms('${ftbl.wtroleId}');">分配表单</a>&nbsp;&nbsp;
	      </td>
    	</tr>
    </c:forEach>
  </table>
  <wt:pages />
</form>
</body>
</html>

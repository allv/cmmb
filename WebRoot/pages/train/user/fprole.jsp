<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分配角色</title>
<script type="text/javascript">
function dofprole(url){
	var mid = "";
	 var dd = document.getElementsByTagName("input") 
	 for(i=0;i <dd.length;i++) {
	  if(dd[i].type== 'checkbox'){
	  	if(dd[i].checked==true){
	  		mid += dd[i].id +",";
	  	}
	  }
	 } 
	
	if(mid.length>2){
		mid = mid.substr(0,mid.length-1);
	}
	document.tblform.roles.value = mid;
	document.tblform.action=url;
	document.tblform.submit();
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>基本信息管理 > 用户［${userName }］角色分配</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="tblform">
	<input type="hidden" name="roles" id="roles" value="" />
	<input type="hidden" name="userName" id="userName" value="<%=request.getAttribute("userName")%>" />
	<input type="hidden" name="userID" id="userID" value="<%=request.getAttribute("mid")%>" />
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <td colspan="8" class="tableList_bar">
		<button id="01" onClick="dofprole('dofprole.do')">
		<img src="<%=basePath%>/pages/train/skins/img/add.gif">确定</button>
       	<button onClick="forward('queryuser.do')">返回</button></td>
       </td>
    </tr>
    <tr>
      <th>&nbsp;</th>
      <th nowrap>角色名称</th>
      <th nowrap>角色创建时间</th>
      <th nowrap>角色描述</th>
    </tr>
    <c:forEach var="ftbl" items="${lstRole}" varStatus="loopStatus">
    	<tr>
	       <c:choose > 
	         <c:when test="${ftbl.haveIt == 'yes'}" > 
	           <td align="center" bgcolor="#CBD7ED"><input class="checkBox" checked type="checkbox" id="${ftbl.wtroleId}"></td>
	         </c:when >
	       <c:otherwise > 
	          <td align="center" bgcolor="#CBD7ED"><input class="checkBox" type="checkbox" id="${ftbl.wtroleId}"></td>
	       </c:otherwise>
	      </c:choose> 
	      <td nowrap bgcolor="#E4E4E4">${ftbl.wtroleName}</td>
	      <td nowrap bgcolor="#E4E4E4">
	      <fmt:formatDate value="${ftbl.wtroleCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	      <td nowrap bgcolor="#E4E4E4">${ftbl.wtroleDescription} </td>
    	</tr>
    </c:forEach>
  </table>
</form>
</body>
</html>

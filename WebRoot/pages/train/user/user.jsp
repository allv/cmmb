<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帐号信息维护</title>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>基本信息管理 > 帐号管理</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="queryuser.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">创建开始时间</td>
      <td><input type="text" size="18" name="startDate" value="${startDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />      </td>
      <td align="right">创建结束时间</td>
      <td><input type="text" size="18" name="endDate" value="${endDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
    </tr>
    <tr>
      <td align="right">用户状态</td>
      <td><select name="wtuserIsuseable">
        <option value="-1"> -- 请选择 -- </option>
        <option value="1" ${wtuserIsuseable == 1 ? "selected" : ""}>  激活  </option>
        <option value="0" ${wtuserIsuseable == 0 ? "selected" : ""}>  停用  </option>
      </select>
      </td>
      
      <td align="right">账号名</td>
      <td><input name="username" value="${username }" type="text" size="18"><button type="submit">搜 索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <td colspan="10" class="tableList_bar">
			<button id="01" onClick="forward('useradd.do')">
			<img src="<%=basePath%>/pages/train/skins/img/add.gif">新增</button>
      <button id="02" onClick="onOption('usermodify.do')">
			<img src="<%=basePath%>/pages/train/skins/img/edit.gif">修改</button>
      <button id="03" onClick="onDelete('deleteuser.do')">
			<img src="<%=basePath%>/pages/train/skins/img/del.gif">删除</button>
       <button id="04" onClick="onOption('active.do')"><img src="<%=basePath%>/pages/train/skins/img/edit.gif">激活或暂停</button>
       <!--  <button id="05" onClick="onOption('fprole.do')">分配角色</button> -->  
       </td>
    </tr>
    <tr>
      <th>&nbsp;</th>
      <th nowrap>账号</th>
      <th nowrap>姓名</th>
      <th nowrap>注册时间</th>
      <th nowrap>所属部门</th>
      <th nowrap>用户状态</th>
      <th nowrap>操作</th>
    </tr>
    <c:forEach var="fuser" items="${result.resultlist}" varStatus="loopStatus">
    	<tr>
	      <td align="center" bgcolor="#CBD7ED"><input class="checkBox1" type="checkbox" id="${fuser.wtuserId}"></td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fuser.wtuserLoginname}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fuser.corpName}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">
	      <fmt:formatDate value="${fuser.wtuserCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fuser.department == 0?"业务部":fuser.department == 1?"护理部":"康复部"}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED"><b>
				${fuser.wtuserIsuseable == 0 ? "<font>停用</font>" : "激活"}</b></td>
	      <td align="center" nowrap bgcolor="#CBD7ED">
			<button onClick="forward('userview.do?userID=${fuser.wtuserId}')">
			<img src="${pageContext.request.contextPath}/pages/train/skins/img/edit.gif">详情</button></td>
    	</tr>
    </c:forEach>
  </table>
  <wt:pages />
</form>
</body>
</html>

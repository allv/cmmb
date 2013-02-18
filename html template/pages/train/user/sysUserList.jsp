<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息查看</title>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>系统管理 > 用户信息</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="userform" action="querysysuser.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
  	<!-- 
    <tr>
      <td align="right">创建开始时间</td>
      <td><input type="text" size="22" name="startDate" value="${startDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" />      </td>
      <td align="right">创建结束时间</td>
      <td><input type="text" size="22" name="endDate" value="${endDate }" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
    </tr>
     -->
    <tr>
      <td align="right">用户类型</td>
      <td><select name="userType">
      	 <option value="-1">请选择</option>
      	 <option value="A" ${userType == "A" ? "selected" : ""}>A 类用户</option>
      	 <option value="B" ${userType == "B" ? "selected" : ""}>B 类用户</option>
      	 <option value="C" ${userType == "C" ? "selected" : ""}>C 类用户</option>
      	</select></td>
      <td align="right">账号名</td>
      <td><input name="username" value="${username }" type="text" size="22"></td>
    </tr>
    <tr>
      <td align="right">客户简称</td>
      <td><input name="userShort" value="${userShort }" type="text" size="22">
      	<button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>账号</th>
      <th nowrap>客户简称</th>
      <th nowrap>客户标识</th>
      <th nowrap>扩展标识</th>
      <th nowrap>用户类型</th>
      <th nowrap>操作</th>
    </tr>
    <c:forEach var="fuser" items="${result.resultlist}" varStatus="loopStatus">
    	<tr>
	      <td nowrap bgcolor="#E4E4E4">${fuser.wtuserLoginname}</td>
	      <td nowrap bgcolor="#E4E4E4">${fuser.userShort}</td>
	      <td nowrap bgcolor="#E4E4E4">${fuser.userMark}</td>
	      <td nowrap bgcolor="#E4E4E4">${fuser.userExtendMark}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">
				${fuser.userType == "A" ? "A类用户" : (fuser.userType == "B" ? "B类用户" : (fuser.userType == "C" ? "C类用户" : "" ) ) }</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">
			<button onClick="forward('sysuserview.do?userID=${fuser.wtuserId}')">
			<img src="${pageContext.request.contextPath}/pages/train/skins/img/edit.gif">详情</button></td>
    	</tr>
    </c:forEach>
  </table>
  <wt:pages />
</form>
</body>
</html>

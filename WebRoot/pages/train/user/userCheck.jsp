<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核用户</title>
<script type="text/javascript">
function onSubmit(){
	if(check("checkNote","string","请输入审核描述！") ||
			check("userMark","string","请输入用户标识！") ||
			check("userExtendMark","string","请输入用户扩展标识！") ||
			check("userType","select","请选择用户类型！") ||
			check("userShort","string","请输入用户简称！"))return false;
	if(check("userMark","int","用户标识只能为数字型！")||
		check("userExtendMark","int","用户扩展标识只能为整形数字！") 
	)return false;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>用户管理 > 审核用户</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<c:choose>
<c:when test="${isCheck == 1}">
<b>该用户已经审核通过，如果您想将该用户停用，可以在修改该用户资料时将其停用。</b>
</c:when>
<c:otherwise>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
<form  method="post" action="usercheckdo.do" onSubmit="return onSubmit()">
  <input type="hidden" name="userID" value="${user.wtuserId}">
    <tr>
      <td align="right">公司全称</td>
      <td><input name="corpName" type="text" value="${user.wtuserName}" size="60" readonly></td>
    </tr>
    <tr>
      <td align="right">公司简介</td>
      <td><textarea name="corpNote" cols="60" rows="3" readonly>${user.corpNote}</textarea></td>
    </tr>
    <tr>
      <td align="right">公司地址</td>
      <td><input name="corpAdd" type="text" value="${user.wtuserAddress}" size="60" readonly>
        邮编
        <input name="corpCode" type="text" value="${user.corpCode}" readonly></td>
    </tr>
    <tr>
      <td align="right">电话</td>
      <td><input name="corpTel" type="text" value="${user.corpTel}" readonly>
        传真
        <input name="corpFax" type="text" value="${user.corpFax}" readonly>
        法人代表
        <input name="corpAP" type="text" value="${user.corpAP}" readonly></td>
    </tr>
    <tr>
      <td align="right">开户行</td>
      <td><input name="openBank" type="text" value="${user.openBank}" readonly>
        开户名
        <input name="openName" type="text" value="${user.openName}" readonly></td>
    </tr>
    <tr>
      <td align="right">银行账号</td>
      <td><input name="bankID" type="text" value="${user.bankID}" size="60" readonly></td>
    </tr>
    <tr>
      <td align="right">联系人姓名</td>
      <td><input name="linkman" type="text" value="${user.linkman}" readonly>
        手机
        <input name="linkmanTel" type="text" value="${user.linkmanTel}" readonly></td>
    </tr>
    <tr>
      <td align="right">E-mail</td>
      <td><input name="linkmanEmail" type="text" value="${user.linkmanEmail}" size="60" readonly></td>
    </tr>
    <tr>
      <td align="right">地址</td>
      <td><input name="linkmanAdd" type="text" value="${user.linkmanAdd}" size="60" readonly></td>
    </tr>
    <tr>
      <td align="right">审核状态</td>
      <td><div class="noInput">
          <input name="isCheck" type="radio" class="radio" value="1"> 通过
        <input name="isCheck" type="radio" class="radio" value="2" checked> 
        未通过</div></td>
    </tr>
    <tr>
      <td align="right">审核描述</td>
      <td><textarea name="checkNote" cols="60" rows="3">${user.checkNote}</textarea><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">客户标识</td>
      <td><input name="userMark" id="userMark" type="text" value="${user.userMark}"><span style='color:red;'>&nbsp;*</span>
        扩展标识
        <input name="userExtendMark" id="userExtendMark" type="text" value="${user.userExtendMark}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">客户类型</td>
      <td><select name="userType">
          <option value="-1">请选择</option>
          <option value="A" ${user.userType == "A" ? "selected" : ""}>A类客户</option>
          <option value="B" ${user.userType == "B" ? "selected" : ""}>B类客户</option>
          <option value="C" ${user.userType == "C" ? "selected" : ""}>C类客户</option>
        </select><span style='color:red;'>&nbsp;*</span>
        客户简称 <input name="userShort" type="text" value="${user.userShort}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
    	<td align="right">是否为紧急用户</td>
    	<td><div class="noInput"><input name="urgentUser" type="radio" class="radio" value="1"> 是
        	<input name="urgentUser" type="radio" class="radio" value="0" checked>否</div></td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td id="ERROR_MSG"></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><button type="submit">完成审核</button>
      <button onClick="forward('queryuser.do')">返回</button></td>
    </tr>
</form>
</table>
</c:otherwise>
</c:choose>
</body>
</html>

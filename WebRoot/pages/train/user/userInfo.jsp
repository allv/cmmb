<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户详情</title>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>用户详情</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="5">

   <tr>
      <td align="right">姓名</td>
      <td><input name="corpName" type="text" value="${user.corpName}" size="20" disabled></td>
    </tr>
    
    <tr>
      <td align="right">性别</td>
      <td>
         <c:if test="${user.corpAP eq 1}">
            <input  id="corpAP" name="corpAP" type="radio" class="radio" value="1" disabled checked><label name="corpAP" class="checked" for="corpAP">男 &nbsp;&nbsp;&nbsp;</label>
        	<input id="corpAP1" name="corpAP" type="radio" class="radio" value="2" disabled><label name="corpAP1" for="corpAP1">女</label>
         </c:if>
         
         <c:if test="${user.corpAP eq 2}">
         	<input id="corpAP"name="corpAP" type="radio" class="radio" value="1" disabled><label name="corpAP"  for="corpAP">男 &nbsp;&nbsp;&nbsp;</label>
         	<input id="corpAP1" name="corpAP" type="radio" class="radio" value="2" disabled checked><label name="corpAP1" class="checked" for="corpAP1">女</label>
         </c:if>
         
         <c:if test="${user.corpAP eq null}">
         	<input id="corpAP" name="corpAP" type="radio" class="radio" value="1" disabled><label name="corpAP" for="corpAP">男 &nbsp;&nbsp;&nbsp;</label>
         	<input id="corpAP1" name="corpAP" type="radio" class="radio" value="2" disabled><label name="corpAP1" for="corpAP1">女</label>
         </c:if>
      </td>
    </tr>
    
    <tr>
      <td align="right">手机</td>
       <td>
      <input name="linkmanTel" type="text" value="${user.linkmanTel}" disabled></td>
    </tr>
    
    <tr>
      <td align="right">住址</td>
      <td><input name="corpAdd" type="text" value="${user.corpAdd}" size="56" disabled></td>
    </tr>
    
    <tr>
      <td align="right">E-mail</td>
      <td><input name="linkmanEmail" type="text" value="${user.linkmanEmail}" size="56" disabled></td>
    </tr>
   
    <tr>
      <td align="right">工作职责简介</td>
      <td><textarea name="corpNote" cols="58" rows="4" disabled>${user.corpNote}</textarea></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td><button onClick="forward('${forward}')">返回</button></td>
    </tr>
</table>
</body>
</html>

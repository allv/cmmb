<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<link href="<%=basePath%>/pages/train/skins/css/common.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
   function hiddbutton(cid){
       if(cid=='10001'||cid=='10002'){
          document.getElementById('02').disabled="disabled" ; 
          document.getElementById('03').disabled="disabled" ; 
          document.getElementById('04').disabled="disabled" ; 
       }else{
          document.getElementById('02').disabled="" ;
          document.getElementById('03').disabled="" ;
          document.getElementById('04').disabled="" ; 
       }
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
       <button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <td colspan="8" class="tableList_bar">
		<button id="01" onClick="forward('roleadd.do')">
		<img src="<%=basePath%>/pages/train/skins/img/add.gif">新增</button>
    <button id="02" onClick="onOption('rolemodify.do')">
		<img src="<%=basePath%>/pages/train/skins/img/edit.gif">修改</button>
    <button id="03" onClick="onDelete('deleterole.do')">
		<img src="<%=basePath%>/pages/train/skins/img/del.gif">删除</button>
    <button id="04" onClick="onOption('fpermission.do')">分配权限</button>
       </td>
    </tr>
    <tr>
      <th>&nbsp;</th>
      <th nowrap>角色名称</th>
      <th nowrap>创建时间</th>
      <!-- 
      <th nowrap>是否可用</th>
       -->
      <th nowrap>描述</th>
    </tr>
    <c:forEach var="ftbl" items="${result.resultlist}" varStatus="loopStatus">
    	<tr>
	      <td align="center" bgcolor="#CBD7ED"><input class="radio" type="radio" id="${ftbl.wtroleId}" name="checkbox" value="${ftbl.wtroleId}" onclick="hiddbutton(this.value);"></td>
	      <td nowrap bgcolor="#E4E4E4">${ftbl.wtroleName}</td>
	      <td nowrap bgcolor="#E4E4E4"><fmt:formatDate value="${ftbl.wtroleCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	      <!-- 
	      <td nowrap bgcolor="#E4E4E4">
	      	 <c:choose>
		         <c:when test="${1 == ftbl.wtroleIsuseable}" >
		           可用 
		         </c:when >
		       <c:otherwise > 
		           不可用
		       </c:otherwise>
		     </c:choose>
		  </td>
		   -->
	      <td nowrap bgcolor="#E4E4E4">${ftbl.wtroleDescription}</td>
    	</tr>
    </c:forEach>
  </table>
  <wt:pages />
</form>
</body>
</html>

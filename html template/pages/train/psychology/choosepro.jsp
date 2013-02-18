<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<base target="_self" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache"/> 
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/>
</head>
<script language = "javascript">
function doClose(){
    window.returnValue="nochange";
    window.close();
}

function doComit()
{
	var cbid = "rid";
	var checkednum = 0;
	var rolesid = "";
	var cname = "";
	
	var obj1 = window.dialogArguments
    var param = obj1.name;
	var obj = document.getElementsByTagName("input");
	for (i = 0; i < obj.length; i++) {
		if (obj[i].type == "checkbox") {
			if (obj[i].checked == true) {
				rolesid = obj[i].id;
				checkednum++;
			}
		}
	}
	
    if(checkednum > 0){
       if(checkednum > 1){
          alert('只能选一个项目');
          return false;
       }else if(checkednum==1){
          window.returnValue=rolesid;
          window.close();
       }
    }else{
        alert('请选择一个项目');
        return false;
    }
}
</script>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目选择</title>

</head>
<body>

<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="proquery.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">项目名称</td>
      <td><input name="proname" value="${proname}" type="text" size="22"><button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th>&nbsp;</th>
      <th nowrap>项目编号</th>  
      <th nowrap>项目名称</th>
      <th nowrap>项目开始时间</th>  
    </tr>
    <c:forEach var="fupro" items="${result.resultlist}" varStatus="loopStatus">
    	<tr>
	      <td align="center" bgcolor="#CBD7ED"><input class="checkBox1" type="checkbox" id="${fupro.proname},${fupro.proidentity},${fupro.prostartdate},${fupro.proenddate}"></input></td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fupro.proidentity}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fupro.proname}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fupro.prostartdate}</td>
    	</tr>
    </c:forEach>
    
    <tr>
       <td colspan="6" align="center">
            <button onclick="doComit()">确定</button> 
		    <button onClick="doClose()">关闭</button>
	   </td>
    </tr>
  </table>
  <wt:pages />
</form>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<base target="_self" />
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
          alert('只能选一个人');
          return false;
       }else if(checkednum==1){
          //if(window.opener) {   
          //    fWindowText1 = window.opener.document.getElementById(param);   
          //    fWindowText1.value = rolesid;
          //}  
          
          window.returnValue=rolesid;
          window.close();
       }
    }else{
        alert('请选择一个人');
        return false;
    }
}
</script>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员选择</title>

</head>
<body>

<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="manquery.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">账号名</td>
      <td><input name="username" value="${username}" type="text" size="22"><button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th>&nbsp;</th>
      <th nowrap>账号</th>  
      <th nowrap>姓名</th>
      <th nowrap>注册时间</th>  
    </tr>
    <c:forEach var="fuser" items="${result.resultlist}" varStatus="loopStatus">
    	<tr>
	      <td align="center" bgcolor="#CBD7ED"><input class="checkBox1" type="checkbox" id="${fuser.corpName}"></input></td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fuser.wtuserLoginname}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">${fuser.corpName}</td>
	      <td align="center" nowrap bgcolor="#CBD7ED">
	      <fmt:formatDate value="${fuser.wtuserCreatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    </c:forEach>
    
    <tr>
       <td colspan="4" align="center">
            <button onclick="doComit()">确定</button> 
		    <button onClick="doClose()">关闭</button>
	   </td>
    </tr>
  </table>
  <wt:pages />
</form>
</body>
</html>

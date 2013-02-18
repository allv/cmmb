<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<base target="_self" />
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
          alert('只能选一个会员');
          return false;
       }else if(checkednum==1){
          window.returnValue=rolesid;
          window.close();
       }
    }else{
        alert('请选择一个会员');
        return false;
    }
}

function search(){
    var obj2 = window.dialogArguments;
    var form1 = document.getElementById("form1");
    form1.action="memberlist.do?chooseflag="+obj2.chooseflag;
    form1.submit();
}

</script>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员选择</title>
</head>
<body>

<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form id="form1" method="post" action="memberlist.do?chooseflag=true">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">会员名称</td>
      <td><input name="memname" value="${memname}" type="text" size="22"><button onclick="search()">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th>&nbsp;</th>
      <th nowrap>会员编号</th>
      <th nowrap>会员姓名</th>
      <th nowrap>联系电话</th> 
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到会员信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="mem" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
          <td align="center" bgcolor="#CBD7ED"><input class="checkBox1" type="checkbox" id="${mem.memid},${mem.memname},${mem.mylandlinenumber},${mem.memsex},${mem.birthday},${mem.mycellnumber},${mem.myaddress}"></input></td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memid} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.mylandlinenumber}</td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    
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

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员历史记录</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function memDel(meminfoid){
		 var but = window.confirm("确定删除该会员吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/memberdeletemem.do", 
			   data: {meminfoid:meminfoid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/memberlist.do";
			   		}else{
			   		 	 alert('删除失败!');
			   		}
			   },
			   failure:function (){
			   		alert("未知错误！")
			   }
			});
	}
}
function memView(meminfoid){
   window.location.href=basePath+"/memberviewmemhis.do?meminfoid="+meminfoid;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>会员管理> 历史记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="memform" action="memberhislist.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">修改日期</td>
      <td><input type="text" size="20" id="submitdate" name="submitdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">会员姓名</td>
      <td><input name="memname" id="memname" value="" type="text" size="20">
      
      <td align="right">会员编号</td>
      <td><input name="memid" id="memid" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
      <th nowrap>会员编号</th>
      <th nowrap>会员姓名</th>
      <th nowrap>修改日期</th>
      <th nowrap>操作</th>
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到历史记录!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="mem" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memid} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.submitdate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:memView('${mem.meminfoid}');">明细</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
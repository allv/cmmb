<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请人登记表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function memDel(meminfoid){
		 var but = window.confirm("确定删除该会员档案吗？");
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

function memEdit(meminfoid){
   window.location.href=basePath+"/memberpremodify.do?meminfoid="+meminfoid;
}
function memView(meminfoid){
   window.location.href=basePath+"/memberviewmem.do?meminfoid="+meminfoid;
}

function memStatistics(memid){
   //会员编号
   window.location.href=basePath+"/memberstatistics.do?meminfoid="+memid;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>会员管理> 申请人登记表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="memform" action="memberlist.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">会员姓名</td>
      <td><input name="memname" id="memname" value="" size="18" type="text" >
      
      <td align="right">会员编号</td>
      <td><input name="memid" id="memid" value="" size="18" type="text">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('memadd.do')" id="001">申请人新登记</button></td>
    </tr>
    <tr>
      <th nowrap>会员编号</th>
      <th nowrap>会员姓名</th>
      <th nowrap>建档日期</th>
      <th nowrap>操作</th>
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
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memid} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.asesdate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:memView('${mem.meminfoid}');">明细</a>&nbsp;&nbsp;<a href="javascript:memEdit('${mem.meminfoid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:memDel('${mem.meminfoid}');">删除</a>&nbsp;&nbsp;
		      <c:if test="${mem.isHealthEva!='0'}">
		      		<a href="javascript:memStatistics('${mem.memid}');">健康评估信息统计</a>&nbsp;&nbsp;
		      </c:if>
	      </td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心理评估列表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function healthDel(healthinfoid){
		 var but = window.confirm("确定删除该评估表吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/healthEvaldeletehealth.do", 
			   data: {healthid:healthinfoid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/healthEvallistH.do";
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

function healthEdit(healthinfoid){
   window.location.href=basePath+"/healthEvalpremodify.do?healthid="+healthinfoid;
}
function healthView(healthinfoid){
   window.location.href=basePath+"/healthEvalviewhealth.do?healthid="+healthinfoid;
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>会员管理> 健康评估列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" action="healthEvallistH.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">评估日期</td>
      <td><input type="text" id="assesdate" size="18" name="assesdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
      <td align="right">所属项目</td>
      <td><input type="text" id="belongproname" size="18" name="belongproname" value=""/>
      </td>
    </tr>
    <tr>
      <td align="right">会员姓名</td>
      <td><input name="memname" id="memname" value="" size="18" type="text" >
      
      <td align="right">评估表编号</td>
      <td><input name="healthnumber" id="healthnumber" value="" size="18" type="text">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('healthEvalgetaddpage.do')" id="001">新建健康评估</button></td>
    </tr>
    <tr>
      <th nowrap>评估表编号</th>
      <th nowrap>评估日期</th>
      <th nowrap>会员姓名</th>
      <th nowrap>所属项目</th>
      <th nowrap>操作</th>
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到评估表信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="healtheval" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${healtheval.healthnumber} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${healtheval.assesdate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${healtheval.memname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${healtheval.belongproname}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:healthView('${healtheval.healthid}');">明细</a>&nbsp;&nbsp;<a href="javascript:healthEdit('${healtheval.healthid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:healthDel('${healtheval.healthid}');">删除</a>&nbsp;&nbsp;
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
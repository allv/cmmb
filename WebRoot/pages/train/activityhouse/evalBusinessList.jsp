<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考評列表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function vodDel(ahid){
		 var but = window.confirm("确定删除该考評表吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/evaluationworkerdelthis.do", 
			   data: {ahid:ahid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/evaluationworkerlist.do";
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

function achouseEdit(ahid){
   window.location.href=basePath+"/evaluationworkerpremodifyEvalBusiness.do?ahid="+ahid;
}

function achouseView(ahid){
   window.location.href=basePath+"/evaluationworkerviewevalbusiness.do?ahid="+ahid;
}

function onSubmit(){
   window.location.href=basePath+"/evaluationworkerlist.do?evalenddate="+document.getElementById('evalenddate').value;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>機構管理> 考評列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div style="height:10px;">
</div>
<form method="post" name="volform" action="evaluationworkelist.do">
  <table width="75%" border="0" cellspacing="0" cellpadding="2">
     <tr>
      <td align="right">考評表編號</td>
      <td><input name="evaluationnumber" id="evaluationnumber"  type="text" size="20"></td>
      <td align="right">人員姓名</td>
      <td><input name="evalname" id="evalname"  type="text" size="20"></td>
    </tr>
    <tr>
      <td align="right">開始日期</td>
      <td><input name="evaldate" id="evaldate"  type="text" size="20" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
      <td align="right">結束日期</td>
      <td><input name="evalenddate" id="evalenddate"  type="text" size="20" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
      <button onClick="javascript:onSubmit();">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('evaluationworkeraddnew.do')" id="001">新建考評表</button>
    </tr>
    <tr>
      <th nowrap>考評表編號</th>
      <th nowrap>人員姓名</th>
      <th nowrap>考評表新建日期</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到考評表信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="evaluation" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
    	  <td align="center" nowrap bgcolor="#E4E4E4">${evaluation.evaluationnumber} </td>
          <td align="center" nowrap bgcolor="#E4E4E4">${evaluation.evalname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${evaluation.evaldate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:achouseView('${evaluation.evaluationid}');">明细</a>&nbsp;&nbsp;<a href="javascript:achouseEdit('${evaluation.evaluationid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:vodDel('${evaluation.evaluationid}');">删除</a>&nbsp;&nbsp;
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
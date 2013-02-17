<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康复评估列表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function recoveryDel(recoveryid){
		 var but = window.confirm("确定删除该评估表吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/revaldeleterecovery.do", 
			   data: {recoveryid:recoveryid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/revalelvalist.do";
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

function recoveryEdit(recoveryid){
   window.location.href=basePath+"/revalrecoverymodify.do?recoveryid="+recoveryid;
}
function recoveryView(recoveryid){
   window.location.href=basePath+"/revalviewrecovery.do?recoveryid="+recoveryid;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理> 康复评估列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="recoveryform" action="revalelvalist.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">评估日期</td>
      <td><input type="text" size="20" id="assessdate" name="assessdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">会员姓名</td>
      <td><input name="memname" id="memname" value="" type="text" size="20">
      
      <td align="right">评估原因</td>
      <td> <select name="a1" id="a1">
           <option value="" selected>-- 请选择 --</option>
           <option value="首次评估" >首次评估</option>
	       <option value="后续评估" >后续评估</option>
	       <option value="阶段评估" >阶段评估</option>
	       <option value="出院后评估" >出院后评估</option>
	       <option value="其他">其他</option>
      </select>
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('revalgetrecoverypage.do')" id="001">新建康复评估表</button></td>
    </tr>
    <tr>
      <th nowrap>评估表编号</th>
      <th nowrap>会员姓名</th>
      <th nowrap>评估原因</th>
      <th nowrap>评估日期</th>
      <th nowrap>操作</th>
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到康复评估表信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="recovery" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4">${recovery.recoverynumber} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recovery.memname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recovery.a1} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${recovery.assesdate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:recoveryView('${recovery.recoveryid}');">明细</a>&nbsp;&nbsp;<a href="javascript:recoveryEdit('${recovery.recoveryid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:recoveryDel('${recovery.recoveryid}');">删除</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
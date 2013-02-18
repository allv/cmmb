<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>护理评估列表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function careDel(careid){
		 var but = window.confirm("确定删除该评估表吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/caredeletecare.do", 
			   data: {careid:careid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/caremanage.do";
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

function careEdit(careid){
   window.location.href=basePath+"/carecaremodify.do?careid="+careid;
}
function careView(careid){
   window.location.href=basePath+"/careviewcare.do?careid="+careid;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理> 护理评估列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="careform" action="caremanage.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">评估日期</td>
      <td><input type="text" size="18" id="assessdate" name="assessdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">会员姓名</td>
      <td><input name="memname" id="memname" value="" type="text" size="18">
      
      <td align="right">联系电话</td>
      <td><input name="belongproname" id="belongproname" value="" type="text" size="18">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('caregetcarepage.do')" id="001">新建护理评估表</button></td>
    </tr>
    <tr>
      <th nowrap>评估表编号</th>
      <th nowrap>会员编号</th>
      <th nowrap>会员姓名</th>
      <th nowrap>联系电话</th>
      <th nowrap>评估日期</th>
      <th nowrap>操作</th>
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到护理评估表信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="care" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4">${care.carenumber} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${care.memnumber} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${care.memname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${care.belongproname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${care.assesdate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:careView('${care.careid}');">明细</a>&nbsp;&nbsp;<a href="javascript:careEdit('${care.careid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:careDel('${care.careid}');">删除</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
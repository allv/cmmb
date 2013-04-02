<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>项目列表</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
function projectDel(proid){
    var but = window.confirm("确定删除该项目吗？");
		if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/projectdeletepro.do", 
			   data: {billid:proid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/c_serieslist.do";
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

function projectView(proid){
    window.location.href=basePath+"/projectviewpro.do?billid="+proid;
}
function projectEdit(proid){
    window.location.href=basePath+"/projectpremodify.do?billid="+proid;
}

function projectTrack(proid){
    window.location.href=basePath+"/projecttrack.do?billid="+proid;
}

function projectTrackView(proid){
    window.location.href=basePath+"/projecttrack.do?billid="+proid+"&isview=true";
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>项目管理 > 项目列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="userform" action="c_serieslist.do">
  <table width="100%" class="auto" border="0" cellspacing="0" cellpadding="2">
   <tr>
      <td align="right">开始日期</td>
      <td><input type="text" size="20" name="prostartdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
       <td align="right">项目状态</td>
      <td>
      <select name="prostate" id="prostate" style="width:100px">
      	  <option value="">  --请选择-- </option>
		  <option value="申请">  申请 </option>
		  <option value="开始">  开始 </option>
		  <option value="结束">  结束 </option>
		  <option value="审计">  审计 </option>
	  </select>
      </td>
    </tr>
    <tr>
      <td align="right">项目等级</td>
      <td>
        <select name="proname" id="proname" style="width:100px">
      	  <option value="">  --请选择-- </option>
		  <option value="重要">  重要 </option>
		  <option value="次要">  次要 </option>
		  <option value="最次要">  最次要 </option>
	  </select>
      <td align="right">项目编号</td>
      <td><input name="proidentity" value="" type="text" size="13">
        <input type="submit" class="groovybutton" value="搜索"></button></td>
    </tr>	
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><input type="button" class="groovybutton" onClick="forward('projadd.do')" id="001" value="新建项目"></button></td>
    </tr>
    <tr>
      <th nowrap>项目编号</th>
      <th nowrap>项目等级</th>
      <th nowrap>开始日期</th>
      <th nowrap>结束日期</th>
      <th nowrap>项目状态</th>
      <th nowrap>操作</th>
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到项目信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="proj" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${proj.proidentity} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${proj.proname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${proj.prostartdate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${proj.proenddate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${proj.prostate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:projectView('${proj.proid}');">明细</a>&nbsp;&nbsp;<a href="javascript:projectEdit('${proj.proid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:projectTrack('${proj.proid}');">进度编辑</a>&nbsp;&nbsp;<a href="javascript:projectTrackView('${proj.proid}');">进度查看</a>&nbsp;&nbsp;<a href="javascript:projectDel('${proj.proid}');">删除</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>志愿者列表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function vodDel(vid){
		 var but = window.confirm("确定删除该活动吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/volunteerdelchoosevol.do", 
			   data: {vid:vid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/volunteerlist.do";
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

function volEdit(vid){
   window.location.href=basePath+"/volunteervolmodify.do?vid="+vid;
}

function volView(vid){
   window.location.href=basePath+"/volunteervolview.do?vid="+vid;
}

function volInputServtime(vid){
   window.location.href=basePath+"/volunteerservtime.do?vid="+vid;
}

function volPic(vid){
   window.location.href=basePath+"/volunteershowpic.do?vid="+vid;
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>志愿者管理> 志愿者列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div style="height:10px;">
</div>
<form method="post" name="volform" action="volunteerlist.do">
  <table width="65%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">编号</td>
      <td><input name="vcallno" id="vcallno"  type="text" size="20"></td>
       <td align="right">加入时间</td>
      <td><input name="vtime" id="vtime"  type="text" size="20" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
    </tr>
    <tr>
      <td align="right">姓名</td>
      <td><input name="vname" id="vname"  type="text" size="20"></td>
      <td align="right">性别</td>
      <td>  
        <select name="vgender" id="vgender">
           <option value="" selected>   --未选择--  </option>
	       	<option value="男" >   男  </option>
	       	<option value="女">   女  </option>
	    </select> <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('volunteeradd.do')" id="001">新建志愿者</button>
       <button onClick="forward('volunteerallbir.do')" id="002">生日簿</button></td>
    </tr>
    <tr>
      <th nowrap>编号</th>
      <th nowrap>姓名</th>
      <th nowrap>年龄</th>
      <th nowrap>性别</th>
      <th nowrap>加入时间</th>
      <th nowrap>累计服务总时数</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到志愿者信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="vol" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4">${vol.vcallno} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vage} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vgender} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vtrain} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${vol.vtotal}(小时) </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:volView('${vol.vid}');">明细</a>&nbsp;&nbsp;<a href="javascript:volEdit('${vol.vid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:vodDel('${vol.vid}');">删除</a>&nbsp;&nbsp;
	         <a href="javascript:volInputServtime('${vol.vid}');">服务时间录入</a>
	         <a href="javascript:volPic('${vol.vid}');">服务时间曲线图</a>
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
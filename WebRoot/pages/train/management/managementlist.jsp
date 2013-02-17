<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动列表</title>
<style type="text/css">
*{list-style:none;margin:0;overflow:hidden}
body{overflow:auto}
.menu{width:1106px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function manDel(mid){
		 var but = window.confirm("确定删除该活动吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/managementdelchooseman.do", 
			   data: {mid:mid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/managementlist.do";
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

function manEdit(mid){
   window.location.href=basePath+"/managementmanmodify.do?mid="+mid;
}

function manView(mid){
   window.location.href=basePath+"/managementviewman.do?mid="+mid;
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>活动管理> 活动管理> 活动列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div style="height:10px;">
</div>
<form method="post" name="actform" action="managementlist.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">活动开始时间</td>
      <td><input type="text" size="20" id="mstarttime" name="mstarttime" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">活动组织者</td>
      <td><input name="morganizer" id="morganizer" value="" type="text" size="20">
      
      <td align="right">活动编号</td>
      <td><input name="mserialnum" id="mserialnum" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('managementadd.do')" id="001">新建活动</button></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <!--<td align="right"><button onClick="forward('managementhistory.do')" id="001">历史记录</button></td>-->
    </tr>
    <tr>
      <th nowrap>活动开始时间</th>
      <th nowrap>活动结束时间</th>
      <th nowrap>人数</th>
      <th nowrap>活动组织者</th>
      <th nowrap>活动编号</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到活动信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="man" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${man.mstarttime} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${man.mendtime} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${man.mnumber} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${man.morganizer} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${man.mserialnum}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:manView('${man.mid}');">明细</a>&nbsp;&nbsp;<a href="javascript:manEdit('${man.mid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:manDel('${man.mid}');">删除</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
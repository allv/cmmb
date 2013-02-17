<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>感官功能康复记录表</title>
<style type="text/css">
*{list-style:none;margin:0;overflow:hidden}
body{overflow:auto}
.menu{width:1106px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function psyDel(snumber){
		 var but = window.confirm("确定删除该感官功能康复记录吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/sensorydeletesen.do", 
			   data: {snumber:snumber},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/sensorylist.do";
			   		}else{
			   		 	 alert('删除失败!');
			   		}
			   },
			   failure:function (){
			   		alert("未知错误！");
			   }
			});
	}
}

function psyEdit(snumber){
   window.location.href=basePath+"/sensorysenmodify.do?snumber="+snumber;
}

function psyView(snumber){
   window.location.href=basePath+"/sensorysenview.do?snumber="+snumber;
}

function setTab(name,cursel){
    var menu = document.getElementById(name+cursel);
    if(cursel == 1)
    {
        window.location.href=basePath+"/bloodpressurelist.do";
    }
    else if(cursel == 2)
    {
        window.location.href=basePath+"/psychologylist.do";
    }
	else if(cursel == 3)
	{
	    menu.className="off";
	}
	else if(cursel == 4)
	{
	    window.location.href=basePath+"/recoverylist.do";
	}
	else
	{
	    window.location.href=basePath+"/instrumentlist.do";
	}
}

onload=function(){
   setTab('one',3);
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理> 康复服务> 感官功能康复记录表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div class="menu">
	<ul>
		<li id="one1" onclick="setTab('one',1)">血压测量记录表</li>
		<li id="one2" onclick="setTab('one',2)">心理康复活动记录表</li>
		<li id="one3" onclick="setTab('one',3)">感官功能康复记录表</li>
		<li id="one4" onclick="setTab('one',4)">保健操记录表</li>
		<li id="one5" onclick="setTab('one',5)">器械康复记录表</li>
	</ul>
</div>
<div style="height:10px;">
</div>
<form method="post" name="senform" action="sensorylist.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">日期</td>
      <td><input type="text" size="20" id="sdate" name="sdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">参加人员</td>
      <td><input name="sattend" id="sattend" value="" type="text" size="20"></td>
      
      <td align="right">记录人</td>
      <td><input name="swrite" id="swrite" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
       <td><button onClick="forward('sensoryadd.do')" id="001">新建感官功能康复记录</button></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <!--<td align="right"><button onClick="forward('sensoryhistory.do')" id="001">历史记录</button></td>-->
    </tr>
    <tr>
      <th nowrap>日期</th>
      <th width="14%" nowrap>开始时间</th>
      <th width="14%" nowrap>结束时间</th>
      <th width="10%" nowrap>记录人签字</th>
      <th width="10%" nowrap>所属项目</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到感官功能康复记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="sen" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sdate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sstarttime} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sendtime} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.swrite} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${sen.sbelongpro} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:psyView('${sen.snumber}');">明细</a>&nbsp;&nbsp;<a href="javascript:psyEdit('${sen.snumber}');">编辑</a>&nbsp;&nbsp;<a href="javascript:psyDel('${sen.snumber}');">删除</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
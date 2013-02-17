<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>其他介护服务列表</title>
<style type="text/css">
*{list-style:none;margin:0;overflow:hidden}
body{overflow:auto}
.menu{width:885px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function carDel(onumber){
		 var but = window.confirm("确定删除该介护服务记录吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/othercareservicesdeletecar.do", 
			   data: {onumber:onumber},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/othercareserviceslist.do";
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

function carEdit(onumber){
   window.location.href=basePath+"/othercareservicescarmodify.do?onumber="+onumber;
}

function carView(onumber){
   window.location.href=basePath+"/othercareservicescarview.do?onumber="+onumber;
}

function setTab(name,cursel){
    var menu = document.getElementById(name+cursel);
    if(cursel == 1)
    {
        window.location.href=basePath+"/bathrecordlist.do";
        
    }
    else if(cursel == 2)
    {
        window.location.href=basePath+"/helpcleanlist.do";
    }
	else if(cursel == 3)
	{
	    menu.className="off";
	}
	else
	{
	    window.location.href=basePath+"/serviceplanlist.do";
	}
}

onload=function(){
   setTab('one',3);
}

</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理> 介护服务> 其他介护服务列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div class="menu">
	<ul>
		<li id="one1" onclick="setTab('one',1)">助浴服务记录表</li>
		<li id="one2" onclick="setTab('one',2)">助洁服务记录表</li>
		<li id="one3" onclick="setTab('one',3)">其他介护服务记录表</li>
		<li id="one4" onclick="setTab('one',4)">老年人介护服务计划表</li>
	</ul>
</div>
<div style="height:10px;">
</div>
<form method="post" name="actform" action="othercareserviceslist.do">
  <table width="100%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">日期</td>
      <td><input type="text" size="20" id="odate" name="odate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">老人姓名</td>
      <td><input name="oname" id="oname" value="" type="text" size="20">
      
      <td align="right">执行人员</td>
      <td><input name="opeople" id="opeople" value="" type="text" size="20">
        <button type="submit">搜索</button></td>
    </tr>
  </table>
  <div style="height:10px;">
</div>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('othercareservicesadd.do')" id="001">新建介护服务记录</button></td>
       <td></td>
       <td></td>
       <td></td>
       <!--<td align="right"><button onClick="forward('othercareserviceshistory.do')" id="001">历史记录</button></td>-->
    </tr>
    <tr>
      <th nowrap>日期</th>
      <th nowrap>姓名</th>
      <th nowrap>所属项目</th>
      <th nowrap>操作</th>
    </tr>
	<c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="5">
	    未找到其他介护服务记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="car" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${car.odate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${car.oname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${car.obelongpro} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:carView('${car.onumber}');">明细</a>&nbsp;&nbsp;<a href="javascript:carEdit('${car.onumber}');">编辑</a>&nbsp;&nbsp;<a href="javascript:carDel('${car.onumber}');">删除</a>&nbsp;&nbsp;</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
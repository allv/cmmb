<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康复统计</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
function onSubmit(){
   var startdate = document.getElementById('startDate').value;
   var enddate = document.getElementById('endDate').value;
   var memname = document.getElementById('memname').value;
   window.location.href=basePath+"/workerstatistic.do?workername="+memname+"&startDate="+startdate+"&endDate="+enddate+"&careflag=recovermem";
}

function changeState(){
   var arr = document.getElementsByTagName('span');
   if(arr.length==0){
      alert('没有数据可供提交');
      return;
   }else{
      var ids='';
      for(var arindex=0;arindex<arr.length;arindex++){
         if(ids.indexOf(arr[arindex].innerText)!=-1){
            continue;
         }
        if(arindex==arr.length-1){
            ids+="'"+arr[arindex].innerText+"'";
         }else{
         	ids+="'"+arr[arindex].innerText+"'"+",";
         }
      }
      
      var startdate = document.getElementById('startDate').value;
      var enddate = document.getElementById('endDate').value;
   }
   
   $.ajax({
				   type: "POST",
				   url: basePath + "/carechangeStateForData.do?names="+encodeURI(ids)+"&startdate="+startdate+"&enddate="+enddate+"&careflag=member2",
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('数据提交成功');
				   			//window.location.href=basePath+"/workerstatistic.do?careflag=recovermem";
				   		}
				   		else{
				   			alert('数据提交失败');
				   			return;
				   		}
				   },
				   failure:function (){
				   		alert("未知错误！");
				   		return;
				   }	   
			   });
}

function reset1(){
   document.getElementById('startDate').value = '';
   document.getElementById('endDate').value='';
   document.getElementById('memname').value='';
}

function cancelState(){
    var arr = document.getElementsByTagName('span');
   if(arr.length==0){
      alert('没有数据可取消');
      return;
   }else{
      var ids='';
      for(var arindex=0;arindex<arr.length;arindex++){
         if(ids.indexOf(arr[arindex].innerText)!=-1){
            continue;
         }
         if(arindex==arr.length-1){
            ids+="'"+arr[arindex].innerText+"'";
         }else{
         	ids+="'"+arr[arindex].innerText+"'"+",";
         }
      }
      var startdate = document.getElementById('startDate').value;
      var enddate = document.getElementById('endDate').value;
   }
   
   $.ajax({
				   type: "POST",
				   url: basePath + "/carechangeStateForData.do?names="+encodeURI(ids)+"&startdate="+startdate+"&enddate="+enddate+"&careflag=member2"+"&isCancel=true",
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('数据已取消提交');
				   			//window.location.href=basePath+"/getworkerdata.do?careflag=false";
				   		}
				   		else{
				   			alert('数据取消失败');
				   			return;
				   		}
				   },
				   failure:function (){
				   		alert("未知错误！");
				   		return;
				   }	   
			   });
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理> 康复统计列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="careform" action="workerstatistic.do">
  <table width="70%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">开始日期</td>
      <td><input type="text" size="18" id="startDate" name="startDate" value="${startDate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
      <td align="right">结束日期</td>
      <td><input type="text" size="18" id="endDate" name="endDate" value="${endDate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
      </td>
    </tr>
    <tr>
      <td align="right">姓名</td>
      <td><input name="memname" id="memname" value="${workername}" type="text" size="18">
        <button onClick="onSubmit();" >搜索</button><button onClick="reset1();" >重置</button></td>
    </tr>
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <c:if test="${ismanager=='0'}">
    <tr>
       <td><button onClick="changeState()" id="001">经理确认</button> <button onClick="cancelState()" id="002">取消确认</button></td>
    </tr>
    </c:if>
    <tr>
      <th nowrap>会员姓名</th>
      <th nowrap>联系电话</th>
      <th nowrap>会员住址</th>
      <th nowrap>起始服务日期</th>
      <th nowrap>截止服务日期</th>
      <th nowrap>接受服务时长数(分钟)</th>
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="7">
	    未找到相关统计信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="statistic" items="${result.resultlist}" varStatus="loopStatus">
     <span style="display:none">${statistic.membername}</span>
    <tr>
          <td align="center" nowrap bgcolor="#E4E4E4">${statistic.membername} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${statistic.mylandlinenumber} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${statistic.myaddress} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${statistic.startservedate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${statistic.endservedate} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${statistic.totaltime}</td>
    </tr>
    </c:forEach>
    <wt:pages />
    </c:otherwise>
    </c:choose>
  </table>
</form>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请人登记表</title>
<script type="text/javascript">
 var basePath = '<%=basePath%>';
 function memDel(meminfoid){
		 var but = window.confirm("确定删除该会员档案吗？");
		 if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/memberdeletemem.do", 
			   data: {meminfoid:meminfoid},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/memberlist.do";
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

function memEdit(meminfoid){
   window.location.href=basePath+"/memberpremodify.do?meminfoid="+meminfoid;
}
function memView(meminfoid){
   window.location.href=basePath+"/memberviewmem.do?meminfoid="+meminfoid;
}

function memStatistics(memid){
   //会员编号
   window.location.href=basePath+"/memberstatistics.do?meminfoid="+memid;
}

function search(){
    var adlmarks = document.getElementById('adlmarks').value;
    var adlmarks2 = document.getElementById('adlmarks2').value;
    var listen = document.getElementById('listen').value;
    var view = document.getElementById('view').value;
    var smoke = document.getElementById('smoke').value;
    
    var memname = document.getElementById('memname').value;
    var memid = document.getElementById('memid').value;
    var memsex = document.getElementById('memsex').value;
    var culture = document.getElementById('culture').value;
    var reside = document.getElementById('reside').value;
    var financial = document.getElementById('financial').value;
    var myaddress = document.getElementById('myaddress').value;
    var drink = document.getElementById('drink').value;
    
    var mycity = document.getElementById('mycity').value;
    
    if(parseInt(adlmarks)>parseInt(adlmarks2)){
       alert('ADL分数自左向右从小到大填写');
       return;
    }
    if(adlmarks!=""&&!is_positiveInteger(adlmarks)){
		  alert('ADL分数只能为正整数');
		  document.getElementById('adlmarks').className = "errorInput";
		  document.getElementById('adlmarks').focus();
		  return;
	}
	
	if(adlmarks2!=""&&!is_positiveInteger(adlmarks2)){
		  alert('ADL分数只能为正整数');
		  document.getElementById('adlmarks2').className = "errorInput";
		  document.getElementById('adlmarks2').focus();
		  return;
	}
	
	var swage = document.getElementById('swage').value;
    var ewage = document.getElementById('ewage').value;
	
	if(swage!=""&&!is_positiveInteger(swage)){
		  alert('月收入只能为正整数');
		  document.getElementById('swage').className = "errorInput";
		  document.getElementById('swage').focus();
		  return;
	}
	
	if(ewage!=""&&!is_positiveInteger(ewage)){
		  alert('月收入只能为正整数');
		  document.getElementById('ewage').className = "errorInput";
		  document.getElementById('ewage').focus();
		  return;
	}
	
    window.location.href=basePath+"/memberlist.do?adlmarks="+adlmarks+"&listen="+listen+"&view="+view+"&smoke="+smoke
    +"&drink="+drink+"&memname="+memname+"&memid="+memid+"&memsex="+memsex+"&culture="+culture+"&reside="+reside+
    "&adlmarks2="+adlmarks2+"&financial="+financial+"&myaddress="+myaddress+"&drink="+drink+"&mycity="+mycity+"&swage="+swage+"&ewage="+ewage;
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>会员管理 > 申请人登记表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post" name="memform" action="memberlist.do">
  <table width="80%" border="0" cellspacing="0" cellpadding="2">
    <tr>
      <td align="right">会员姓名</td>
      <td><input name="memname" id="memname" value="" size="18" type="text" ></td>
      
      <td align="right">会员编号</td>
      <td><input name="memid" id="memid" value="" size="18" type="text"></td>
      
      <td align="right">项目编号</td>
      <td><input name="mycity" id="mycity" value="" size="18" type="text"></td>
    </tr>
    
    <tr>
      <td align="right">性别</td>
      <td> <select name="memsex" id="memsex" style="width:100px">
      	  <option value="">  --请选择-- </option>
		  <option value="男">  男 </option>
		  <option value="女">  女 </option>
	  </select></td>
      
      <td align="right">文化程度</td>
      <td>
      <select name="culture" id="culture" style="width:100px">
        <option value="" selected> -- 请选择 -- </option>
      	<option value="无">  无  </option>
      	<option value="小学">  小学  </option>
      	<option value="初中">  初中  </option>
      	<option value="高中">  高中  </option>
      	<option value="大学及以上">  大学及以上  </option>
      </select>
      </td>
         <td align="right">居住情况</td>
         <td>
            <select name="reside" id="reside" style="width:180px">
                <option value="" selected> -- 请选择 -- </option>
		        <option value="独居">  独居  </option>
		        <option value="只与配偶及其他人同住">  只与配偶及其他人同住  </option>
		        <option value="与子女同住(无配偶)">  与子女同住(无配偶)  </option>
		        <option value="与其他人同住(非子女或配偶)">  与其他人同住(非子女或配偶)  </option>
		        <option value="与非亲属关系的其他人同住">  与非亲属关系的其他人同住  </option>
		    </select>
         </td>
      </tr>
      
       <tr>
         <td align="right">经济情况</td>
         <td>
	         <select name="financial" id="financial" style="width:100px">
	            <option value="" selected> -- 请选择 -- </option>
	            <option value="退休金">  退休金  </option>
	        	<option value="子女补贴">  子女补贴  </option>
		        <option value="低保及困难家庭">  低保及困难家庭  </option>
		        <option value="其他">  其他  </option>
	      	 </select>
         </td>
         <td align="right">听力</td>
         <td>  <select name="listen" id="listen" style="width:100px">
                    <option value="-1" selected> -- 请选择 -- </option>
		       		<option value="0">能够听到</option>
			   		<option value="1">听力减退</option>
			   		<option value="2">弱听</option>
		       </select>
         </td>
         <td align="right">视力</td>
         <td>  <select name="view" id="view" style="width:100px">
                 <option value="-1" selected> -- 请选择 -- </option>
		         <option value="0">正常</option>
			     <option value="1">轻微障碍</option>
			     <option value="2">弱视</option>
			     <option value="3">严重弱视</option>
		       </select>
         </td>
      </tr>
      
      <tr>
         <td align="right">是否吸烟</td>
         <td>
             <select name="smoke" id="smoke" style="width:100px">
	            <option value="-1" selected>  -- 请选择 --  </option>
	        	<option value="0">  是  </option>
		        <option value="1">  否  </option>
	      	 </select>
         </td>
         <td align="right">是否饮酒</td>
         <td> 
            <select name="drink" id="drink" style="width:100px">
	            <option value="-1" selected>  -- 请选择 --  </option>
	        	<option value="0">  是  </option>
		        <option value="1">  否  </option>
	      	 </select>
         </td>
         <td align="right">家庭地址</td>
         <td><input name="myaddress" id="myaddress" value="" size="18" type="text">
         </td>
      </tr>
      
      <tr>
         <td align="right">ADL分数</td>
         <td>从<input name="adlmarks" id="adlmarks" value="" size="6" type="text">
           --到<input name="adlmarks2" id="adlmarks2" value="" size="6" type="text">
         </td>
         
          <td align="right">月收入(元)</td>
         <td>从<input name="swage" id="swage" value="" size="6" type="text">
           --到<input name="ewage" id="ewage" value="" size="6" type="text">
         	 <button onclick="search();">搜索</button>
         </td>
      </tr>
      
      
  </table>
  <table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
     <tr>
       <td><button onClick="forward('memadd.do')" id="001">申请人登记</button></td>
    </tr>
    <tr>
      <th nowrap>会员编号</th>
      <th nowrap>会员姓名</th>
      <th nowrap>所属项目</th>
      <th nowrap>性别</th>
      <th nowrap>文化程度</th>
      <th nowrap>居住情况</th>
      <th nowrap>经济情况</th>
      <th nowrap>建档日期</th>
      <th nowrap>操作</th>
    </tr>
    <c:choose>
    <c:when test="${empty result.resultlist}">
	<tr>
	<td align="center" colspan="9">
	    未找到会员信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="mem" items="${result.resultlist}" varStatus="loopStatus">
    <tr>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memid} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memname} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.mycity} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.memsex} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.culture} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.reside} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.financial} </td>
	      <td align="center" nowrap bgcolor="#E4E4E4">${mem.asesdate}</td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><a href="javascript:memView('${mem.meminfoid}');">明细</a>&nbsp;&nbsp;<a href="javascript:memEdit('${mem.meminfoid}');">编辑</a>&nbsp;&nbsp;<a href="javascript:memDel('${mem.meminfoid}');">删除</a>&nbsp;&nbsp;
		      <c:if test="${mem.isHealthEva!='0'}">
		      		<a href="javascript:memStatistics('${mem.memid}');">健康评估信息统计</a>&nbsp;&nbsp;
		      </c:if>
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
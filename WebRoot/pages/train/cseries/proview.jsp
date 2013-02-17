<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目详细</title>
<style type="text/css">
<!--
.myInput{border:1px solid green;}
.myInput1{border:1px solid blue;}
-->
</style>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>项目管理 > 项目详情</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
    <tr>
      <td colspan="5" bgcolor="#CBD7ED"><b>项目信息</b></td>
    </tr>
    <tr>
      <td align="left">项目编号：<input type="text" name="proidentity" value="${pro.proidentity}" disabled></td>
      <td align="justify">项目等级：<input type="text" name="proname" value="${pro.proname}" disabled></td>
      <td align="justify">项目状态：<input type="text" name="prostate" value="${pro.prostate}" disabled></td>
    </tr>
    <tr>
      <td align="left">总负责人：<input type="text" name="proresponsor" value="${pro.proresponsor}" disabled></td>
      <td align="justify">招标单位：<input type="text" name="proagency" value="${pro.proagency}" disabled></td>
      <td align="justify">项目权限：<input type="text" name="proauthority" value="${pro.proauthority}" disabled></td>
    </tr>
    <tr>
      <td align="left">招标结果：<input type="text" name="proresult" value="${pro.proresult}" disabled></td>
      <td align="justify">合同编号：<input type="text" name="procontract" value="${pro.procontract}" disabled></td>
      <td align="justify">开始日期：<input value="${pro.prostartdate}" disabled type="text" size="20" name="prostartdate"/></td>
    </tr>
    
    <tr>
      <td align="left">项目金额：<input type="text" name="probudget" value="${pro.probudget}" disabled></td>
      <td align="justify">拨款次数：<input type="text" name="protimes" value="${pro.protimes}" disabled></td>
      <td align="justify">结束日期：<input value="${pro.proenddate}" disabled type="text" size="20" name="proenddate" /></td>
    </tr>
    <tr>
      <td align="justify" colspan="5">项目简介：
         <textarea rows="4" cols="90" name="prodesc" disabled>${pro.prodesc}</textarea>
      </td>
    </tr>
    
    <tr>    
		<table cellpadding="1" cellspacing="2" >
		    <tr>
		        <th style="width:40px">序列号</th>
		        <th style="width:20px"><input disabled type="checkbox" class="checkBox1" onclick="checkAll(this)" /></th>
		        <th style="width:60px;color:green">标的名称</th>
        		<th style="width:90px;color:blue">子标的名称</th>
		    </tr>
		    <tbody id="tbody">
		    </tbody>
		</table>
    </tr>
    <tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </tr>
    <tr>
	    <td align="right">&nbsp;</td>
	    <td id="ERROR_MSG">${msg}</td>
    </tr>
  <tr>
    <td>
		<button onClick="forward('c_serieslist.do')">返回</button></td>
  </tr>
</table>
</form>
</body>
<script type="text/javascript">
var basePath = '<%=basePath%>';
<%
    String trdata =(String)request.getAttribute("trdata"); 
    String tddata =(String)request.getAttribute("tddata"); 
%>
var alltrdata='<%=trdata%>';
var alltddata='<%=tddata%>';


function init(){
   //如果有标的和统计项
   if(alltrdata!=null&&alltrdata!=''){
        for(var trindex=0;trindex<alltrdata.split(',').length;trindex++){
   			AddRow(alltrdata.split(',')[trindex],alltddata.split('|')[trindex]);
   	    }
   }
}
    var $1 = function(id){
        return document.getElementById(id);
    }

     function AddRow(trname,alltdsofthistr) {
        //alltdsofthistr:该行所有数据 
        
        var tbody = $1("tbody");
        var row = tbody.insertRow(tbody.rows.length);
         
        row.insertCell(row.cells.length);
        row.insertCell(row.cells.length).innerHTML = '<input type="checkbox" class="checkBox1"  name="b_id" disabled/>';
        //生成填空
        for(var index=0;index<alltdsofthistr.split(',').length+1;index++){
            var cellVariable = row.insertCell(row.cells.length);
            cellVariable.setAttribute("width","0px");
            if(index==0){
               cellVariable.innerHTML = '<input disabled type="text" value='+trname+' class="myInput"/>';
            }else{
               var tdval=alltdsofthistr.split(',')[index-1];
               tdval=tdval.replace('计划','');
               cellVariable.innerHTML = '<input disabled type="text" value='+tdval+' class="myInput1"/>';
            }
            index++;
        }
    }
   
    
//去掉空格
function trim(szStr){
  //去掉字符串头部的空格
  while(szStr.length > 0){
	    if( szStr.substring(0, 1) != ' '){
	      break;
	    }else{
	      szStr = szStr.substring(1);
	    }
  }

  //去掉字符串尾部的空格
  while(szStr.length > 0){
	    if( szStr.substring(szStr.length - 1, szStr.length) != ' '){
	      break;
	    }else{
	      szStr = szStr.substring(0,szStr.length - 1);
	    }
  }
  return szStr;
}
init();
</script>
</html>

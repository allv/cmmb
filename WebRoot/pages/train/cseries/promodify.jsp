<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑项目</title>
<style type="text/css">
<!--
.myInput{border:1px solid green;}
.myInput1{border:1px solid blue;}
-->
</style>
</head>
<body>
<div class="topLanBar"><b><br><br>当前位置：</b>项目管理 > 编辑项目</div>
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
      <input type="hidden" name="proid" value="${pro.proid}" />
      <td align="left">项目编号：<input type="text" name="proidentity" value="${pro.proidentity}" ><span style='color:red;'>&nbsp;*</span></td>
      <td align="justify">项目等级：
       <select name="proname" id="proname" style="width:100px">
		  <option value="重要"  ${pro.proname == '重要' ? "selected" : ""}>  重要 </option>
		  <option value="次要"  ${pro.proname== '次要' ? "selected" : ""}>  次要 </option>
		  <option value="最次要"  ${pro.proname == '最次要' ? "selected" : ""}>  最次要 </option>
	    </select>
      <span style='color:red;'>&nbsp;*</span></td>
      <td align="justify">项目状态：
      <select name="prostate" id="prostate" style="width:100px">
		  <option value="申请" ${pro.prostate == '申请' ? "selected" : ""}>  申请 </option>
		  <option value="开始" ${pro.prostate == '开始' ? "selected" : ""}>  开始 </option>
		  <option value="结束" ${pro.prostate == '结束' ? "selected" : ""}>  结束 </option>
		  <option value="审计" ${pro.prostate == '审计' ? "selected" : ""}>  审计 </option>
	  </select></td>
    </tr>
    <tr>
      <td align="left">总负责人：<input type="text" name="proresponsor" value="${pro.proresponsor}" ></td>
      <td align="justify">招标单位：<input type="text" name="proagency" value="${pro.proagency}" ></td>
      <td align="justify">项目权限：<input type="text" name="proauthority" value="${pro.proauthority}" ></td>
    </tr>
    <tr>
      <td align="left">招标结果：
       <select name="proresult" id="proresult" style="width:100px">
		  <option value="成功" ${pro.proresult == '成功' ? "selected" : ""}>  成功 </option>
		  <option value="失败" ${pro.proresult == '失败' ? "selected" : ""}>  失败 </option>
		  <option value="延迟" ${pro.proresult == '延迟' ? "selected" : ""}>  延迟 </option>
	  </select></td>
      <td align="justify">合同编号：<input type="text" name="procontract" value="${pro.procontract}" ></td>
      <td align="justify">开始日期：<input value="${pro.prostartdate}"  type="text" size="20" name="prostartdate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" /><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="left">项目金额：<input type="text" name="probudget" value="${pro.probudget}" ></td>
      <td align="justify">拨款次数：<input type="text" name="protimes" value="${pro.protimes}" ></td>
      <td align="justify">结束日期：<input value="${pro.proenddate}"  type="text" size="20" name="proenddate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" /><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="justify" colspan="5">项目简介：
         <textarea rows="4" cols="90" name="prodesc" >${pro.prodesc}</textarea>
      </td>
    </tr>
    
   <tr>    
		<table cellpadding="1" cellspacing="2" >
		    <tr>
		        <td>
		        	<input type="button" onclick="AddRow()" value="增加标的" />
		        </td>
		        <td>
	        		<input type="button" onclick="DelRow()" value="删除标的" />
	            </td>
		    </tr>
		   <tr>
		        <th style="width:40px">序列号</th>
		        <th style="width:20px"><input type="checkbox" class="checkBox1" onclick="checkAll(this)" /></th>
		        <th style="width:60px;color:green">标的名称</th>
        		<th style="width:90px;color:blue">子标的名称</th>
		    </tr>
		    <tbody id="tbody">
		    </tbody>
		</table>
    </tr>
    
     <tr>
       备注：(请对照项目进度表格,每个标的需要统计的项从上到下,依次从左到右顺序对照颜色提示填好.)
    </tr>
    
    <tr>
	    <td align="right">&nbsp;</td>
	    <td id="ERROR_MSG">${msg}</td>
    </tr>
  <tr align="right">
    <td>&nbsp;</td>
    <td><button onClick="Save()">提交</button> 
		<button onClick="forward('c_serieslist.do')">返回</button></td>
  </tr>
</table>
<div class="foreverTop">
<table style="float:right">
<tr>
<td align="center"><b>工作流管理</b></td>
</tr>
<tr align="center"><td><input type="button" value="查看工作流" /></td></tr>
<tr align="center"><td><input type="button" value="提交" /></td></tr>
</table>
</div>
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

function AddRow() {
        var tbody = $1("tbody");
        var row = tbody.insertRow(tbody.rows.length);
        row.insertCell(row.cells.length);
        row.insertCell(row.cells.length).innerHTML = '<input type="checkbox" class="checkBox1" name="b_id" />';
        //生成填空
        for(var index=0;index<2;index++){
            var cellVariable = row.insertCell(row.cells.length);
            cellVariable.setAttribute("width","0px");
            if(index==0){
               cellVariable.innerHTML = '<input type="text" class="myInput"/>';
            }else{
               cellVariable.innerHTML = '<input type="text" class="myInput1"/>';
            }
        }
        
        var buttonAdd=row.insertCell(row.cells.length);
        buttonAdd.setAttribute("width","20px");
        buttonAdd.innerHTML = '<input type="button" name="add" onclick="addCol()" value="增加统计项"/> <input type="button" name="del" onclick="delCol()" value="删除统计项"/>';

        refreshRowNo();
    }

function init(){
   //如果有标的和统计项
   if(alltrdata!=null&&alltrdata!=''){
        for(var trindex=0;trindex<alltrdata.split(',').length;trindex++){
   			initRow(alltrdata.split(',')[trindex],alltddata.split('|')[trindex]);
   	    }
   }
}
    var $1 = function(id){
        return document.getElementById(id);
    }

    function checkAll(target) {
        var checkeds = document.getElementsByName("b_id");
        for (var i = 0; i < checkeds.length; i++) {
            checkeds[i].checked = target.checked;
        }
    }

    function refreshRowNo() {
        var tbody = $1("tbody");
        for (var i = 0; i < tbody.rows.length; i++) {
            tbody.rows[i].cells[0].innerHTML = i + 1;
        }
    }

    function delCol(){
    	var currRowIndex=event.srcElement.parentNode.parentNode.rowIndex;//get current index
    	var tbody = $1("tbody");
    	var allcols = tbody.rows[currRowIndex-2].cells.length;
    	if(allcols<6){
           alert('再删该标的没有统计项');
           return ;
        }
    	//alert(tbody.rows[currRowIndex-1].cells.length);
    	tbody.rows[currRowIndex-2].deleteCell(allcols-2);
    }

    function addCol(){
    	var currRowIndex=event.srcElement.parentNode.parentNode.rowIndex;//get current index
    	var tbody = $1("tbody");
    	
    	var allcols = tbody.rows[currRowIndex-2].cells.length;
    	tbody.rows[currRowIndex-2].insertCell(allcols-1).innerHTML='<input type="text" class="myInput1"/>';
    }
    
    function initRow(trname,alltdsofthistr) {
        //alltdsofthistr:该行所有数据 
        //alltdsofthistr=alltdsofthistr.replace('实际');
        //alert(alltdsofthistr);
        var tbody = $1("tbody");
        var row = tbody.insertRow(tbody.rows.length);
         
        row.insertCell(row.cells.length);
        row.insertCell(row.cells.length).innerHTML = '<input type="checkbox" class="checkBox1"  name="b_id" />';
        //生成填空
        for(var index=0;index<alltdsofthistr.split(',').length+1;index++){
            var cellVariable = row.insertCell(row.cells.length);
            cellVariable.setAttribute("width","0px");
            if(index==0){
               cellVariable.innerHTML = '<input type="text" value='+trname+' class="myInput"/>';
            }else{
               var tdval=alltdsofthistr.split(',')[index-1];
               tdval=tdval.replace('实际','');
               cellVariable.innerHTML = '<input type="text" value='+tdval+' class="myInput1"/>';
            }
            index++;
        }
        
        var buttonAdd=row.insertCell(row.cells.length);
        buttonAdd.setAttribute("width","20px");
        buttonAdd.innerHTML = '<input type="button" name="add" onclick="addCol()" value="增加统计项"/> <input type="button" name="del" onclick="delCol()" value="删除统计项"/>';

        refreshRowNo();
    }
   
    
    function DelRow() {
        var checkeds = document.getElementsByName("b_id");
        var ischeck = false;
        for (var i = checkeds.length - 1; i >= 0; i--) {
            if (checkeds[i].checked) {
                ischeck = true;
                break;
            }
        }
        if (ischeck) {
            if (confirm("确定删除吗?")) {
                for (var i = checkeds.length - 1; i >= 0; i--) {
                    if (checkeds[i].checked) {
                        var index = checkeds[i].parentNode.parentNode.rowIndex;
                        $1("tbody").deleteRow(index-2);
                    }
                }
                refreshRowNo();
            }
        } else {
            alert("请至少选中一行!");
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

    function Save() {
        var trdata = '';
        var tddata = '';
        var tbody = $1("tbody");
       
        if(check("proidentity","string","项目编号不能为空！")||check("proname","string","项目名字不能为空！")||check("prostartdate","string","项目开始日期不能为空！")
		  ||check("proenddate","string","项目结束日期不能为空！")){
		      return false;
		  }
		  
		  if(prostartdate>proenddate){
		      alert('开始日期必须小于结束日期');
		      return false;
		  }
       
       for (var i = 0; i < tbody.rows.length; i++) {
           var temptd='';
           for(var j=3;j<tbody.rows[i].cells.length-1;j++){
              //得到每行每列的值
              if(tbody.rows[i].cells[j].childNodes[0].value==null||trim(tbody.rows[i].cells[j].childNodes[0].value)==''){
                  //不允许空行出现
                  alert('第'+(i+1)+'行,第'+(j-1)+'列不允许为空');
                  return;
              }
                  if(j!=tbody.rows[i].cells.length-2){
	                  //收集每行的统计项
	              	  temptd+=tbody.rows[i].cells[j].childNodes[0].value+'计划'+','+tbody.rows[i].cells[j].childNodes[0].value+'实际'+',';
              	  }else{
              	      //alert(tbody.rows[i].cells.length-2);
              	      //收集每行的统计项
	              	  temptd+=tbody.rows[i].cells[j].childNodes[0].value+'计划'+','+tbody.rows[i].cells[j].childNodes[0].value+'实际';
              	  }
           }
           //如果这一行的列数为奇数 则不通过
           //if(tbody.rows[i].cells.length%2!=0){
           //   alert('第'+(i+1)+'行统计项总数必须为偶数');
           //   return;
           //}
           
           if(i!=tbody.rows.length-1){
              trdata+=tbody.rows[i].cells[2].childNodes[0].value+',';
              tddata+=temptd+'|';
           }else{
              trdata+=tbody.rows[i].cells[2].childNodes[0].value;
              tddata+=temptd;
           }
        }
          var proidentity = document.getElementById("proidentity").value;	
          var proid = document.getElementById("proid").value;
		  var proname = document.getElementById("proname").value;
		  var prostate = document.getElementById("prostate").value;
		  var proresponsor = document.getElementById("proresponsor").value;
		  var proagency = document.getElementById("proagency").value;
		  var proauthority = document.getElementById("proauthority").value;
		  var proresult = document.getElementById("proresult").value;
		  var procontract = document.getElementById("procontract").value;
		  var probudget = document.getElementById("probudget").value;
		  var protimes = document.getElementById("protimes").value;
		  var proenddate = document.getElementById("proenddate").value;
		  var prostartdate = document.getElementById("prostartdate").value;
		  var prodesc = document.getElementById("prodesc").value;  
		  
		  if(is_empty(proidentity)){
		      alert('项目编号不能为空');
		      return false;
		  }
		  
		  if(is_empty(prostartdate)){
		      alert('项目开始日期不能为空');
		      return false;
		  }
		  
		  if(is_empty(proenddate)){
		      alert('项目结束日期不能为空');
		      return false;
		  }
		  if(prostartdate>proenddate){
		      alert('开始日期必须小于结束日期');
		      return false;
		  }
		  
		  
		  $.ajax({
					   type: "POST",
					   url: basePath + "/projectmodifypro.do?proidentity="+encodeURI(proidentity)+"&proname="+encodeURI(proname)+
					   "&prostate="+encodeURI(prostate)+"&proresponsor="+encodeURI(proresponsor)+"&proagency="+encodeURI(proagency)+
					   "&proauthority="+encodeURI(proauthority)+"&proresult="+encodeURI(proresult)+"&procontract="+
					   encodeURI(procontract)+"&prostartdate="+prostartdate+"&probudget="+encodeURI(probudget)+"&protimes="+
					   encodeURI(protimes)+"&proenddate="+proenddate+"&prodesc="+encodeURI(prodesc)+"&trdata="+encodeURI(trdata)+"&tddata="+encodeURI(tddata)+"&proid="+proid,
					   success:function (msg){
					   		var result = msg;
					   		if('success'==result){
					   		 	alert('修改项目成功');
					   			window.location.href=basePath+"/c_serieslist.do";
					   		}else if('sameid'==result){
					   		    alert('项目编号不能与之前的项目重复');
					   		}
					   		else{
					   			alert('修改项目失败');
					   		}
					   },
					   failure:function (){
					   		alert("未知错误！");
					   }	   
		   }); 
    }
    init();
</script>
</html>

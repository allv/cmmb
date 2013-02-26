<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cmmb.persistenc.po.bean.Volunteerinfo"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>志愿者服务时间录入</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';
var $2 = function(id){
        return document.getElementById(id);
    }

    //全选
    function checkAll(target) {
        var checkeds = document.getElementsByName("b_id");
        for (var i = 0; i < checkeds.length; i++) {
            checkeds[i].checked = target.checked;
        }
    }

    //刷新行号
    function refreshRowNo() {
        var tbody = $2("tbody");
        for (var i = 0; i < tbody.rows.length; i++) {
            tbody.rows[i].cells[0].innerHTML = i + 1;
        }
    }

    //添加行
    function AddRow() {
        var tbody = $2("tbody");
        var row = tbody.insertRow(tbody.rows.length);
        row.insertCell(row.cells.length);
        row.setAttribute("align","center");
        row.insertCell(row.cells.length).innerHTML = "<input type='checkbox' class='checkBox1' name='b_id' />";
        row.insertCell(row.cells.length).innerHTML = "<input type='text' size='21' id='servdate' name='servdate' class=\"Wdate\" onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})\" />";
        row.insertCell(row.cells.length).innerHTML = "<input type='text' name='timelen' value='${timelen}' size='28'/>";
        row.insertCell(row.cells.length).innerHTML = "<textarea name='vinfo' cols='38' onBlur=\"javascript:this.style.width='210px';this.style.height='21px';\" onFocus=\"javascript:this.style.width='210px';this.style.height='90px';\" rows='1'>${sinfo}</textarea>";
        
        refreshRowNo();
    }

    //删除行
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
            if (confirm("确定删除选中行?")) {
                for (var i = checkeds.length - 1; i >= 0; i--) {
                    if (checkeds[i].checked) {
                        var index = checkeds[i].parentNode.parentNode.rowIndex;
                        $2("tbody").deleteRow(index - 1);
                    }
                }
                refreshRowNo();
            }
        } else {
            alert("请选中需要删除的行!");
        }
    } 

 function choosePro(){
    var pname = "sbelongpro";
    var wWidth = 1040;
    var wHeight = 510;
    var wTop = (window.screen.height - wHeight)/2;
    var wLeft = (window.screen.width - wWidth)/2;
    var obj = new Object();
    obj.name=pname;
    
    var url =  basePath + "/proquery.do";
    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px"); 
    arr = str.split(",");
    //window.open(url,"","Height=400px,Width=500px");
    if(typeof(str)=="undefined"){
        document.getElementById(pname).value="";
    }else if(str=="nochange"){
        //document.getElementById(cid).value
    }else{
    	document.getElementById(pname).value=arr[0];
    	document.getElementById("startdate").value=arr[2];
    	document.getElementById("enddate").value=arr[3];
    }
  }  

    Date.prototype.format = function(format)
	{
	    var o =
	    {
	        "M+" : this.getMonth()+1, //month
	        "d+" : this.getDate(),    //day
	        "h+" : this.getHours(),   //hour
	        "m+" : this.getMinutes(), //minute
	        "s+" : this.getSeconds(), //second
	        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
	        "S" : this.getMilliseconds() //millisecond
	    }
	    if(/(y+)/.test(format))
	    format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
	    for(var k in o)
	    if(new RegExp("("+ k +")").test(format))
	    format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
	    return format;
	}

    //保存
    function Save() {
        var tbody = $2("tbody");
        var servdateitem = '' ;
        var servlenitem = '' ;
        var servbakitem = '' ;
        var servtotal=0;
        for (var i = 0; i < tbody.rows.length; i++) {
            var servdate = tbody.rows[i].cells[2].childNodes[0].value;
            var servlen = tbody.rows[i].cells[3].childNodes[0].value;
            var servbak = tbody.rows[i].cells[4].childNodes[0].value;
            if(servdate==''){
                alert('第'+(i+1)+'行日期不能为空');
                return;
            }else if(servlen==''){
                alert('第'+(i+1)+'行服务时长不能为空');
                return;
            }else if(!is_positiveInteger(servlen)){
                alert('第'+(i+1)+'行服务时长必须为正数字');
                return;
            }
            servdateitem += servdate + "#" ;
            servlenitem += servlen + "#" ;
            servbakitem += servbak + "#" ;
             
            servtotal+=parseInt(servlen);
        }
          $.ajax({
					type : "POST",
					url : basePath + "/volunteerServtimeSubmit.do?volid="+document.getElementById('vid').value+"&servdateitem=" + servdateitem+"&servlenitem="+servlenitem+"&servbakitem="+servbakitem+
					"&servtotal="+servtotal,
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('操作成功');
							window.location.href = basePath + "/volunteerlist.do";
						} else {
							alert('操作失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
        }
function istimeConflict(times){
        for (var i = 0; i < times.length-1; i++){
            for(var j=i+1;j<times.length; j++){
                 if(times[i].split(',')[0]>times[j].split(',')[1]||times[i].split(',')[1]<times[j].split(',')[0]){
                       continue;
                 }else{
                     alert('第'+(i+1)+'与'+(j+1)+'行时间有冲突');
                     return false;
                 }
            }
        }
        return true;
}
   
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>志愿者管理 >志愿者管理 > 志愿者服务累计时间</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr> 
</table>
<form name="myform" method="post" action="volunteerServtimeSubmit.do">
<input type="hidden" id="detail" name="detail" />
<input type="hidden" id="vid" name="vid" value="${volid}"/>
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td><button onClick="AddRow()" id="001">增加一行</button><button onClick="DelRow()" id="001">删除</td>
</tr>
</table>
<table  width="100%" border="1" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
        <th width="4%" nowrap>序号</th>
        <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
        <th width="14%" nowrap>服务日期</th>
        <th width="14%" nowrap>服务时长(小时)</th>
        <th width="21%" nowrap>备注</th>
    </tr>
    <tbody id="tbody">
    <tr>
     <td align="center">1</td>
     <td align="center"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
     <td align="center"><input type="text" size="21" id="servdate" name="servdate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
     <td align="center"><input type="text" size="28" id="timelen" name="timelen" /></td>
     <td align="center">
        <textarea name="vinfo" cols="38" onBlur="javascript:this.style.width='210px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1"></textarea>
     </td>
    </tr>
    </tbody>
</table>
<table width="100%">
     <tr>
     <td width="100%" align="center"><button onclick="Save()">提交</button> 
		<button onClick="forward('volunteerlist.do')">返回</button></td>
    </tr>
</table>
</form>
<script type="text/javascript">
<%
   Volunteerinfo vol = (Volunteerinfo)request.getAttribute("volObj");
   String servdate = vol.getServedate();
   String serlen = vol.getServetime();
   String serbak = vol.getA5();
%>
var servdate = '<%=servdate%>' ;
var serlen = '<%=serlen%>' ;
var serbak = '<%=serbak%>' ;

function init(){
  var tbody = $2("tbody");
  //init all rows 
  for(var rowi=0;rowi<servdate.split('#').length-1;rowi++){
      if(rowi==0){
	      //归零
	      $2("tbody").deleteRow(0); 
      }
      
      AddRow();
       //give val to table
	  for (var i = 0; i < tbody.rows.length; i++) {
	      tbody.rows[i].cells[2].childNodes[0].value = servdate.split('#')[i];
	      tbody.rows[i].cells[3].childNodes[0].value = serlen.split('#')[i];
	      tbody.rows[i].cells[4].childNodes[0].value = serbak.split('#')[i];
	  }
  }
}
init();
</script>
</body>
</html>

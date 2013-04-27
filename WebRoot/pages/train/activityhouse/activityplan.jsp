<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cmmb.persistenc.po.bean.Activityhouse"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动室活动计划</title>
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
        row.insertCell(row.cells.length).innerHTML = "<input type=\"text\" size=\"21\" id=\"ahservicename\" name=\"ahservicename\"/>";
        row.insertCell(row.cells.length).innerHTML = "<input type=\"text\" size=\"22\" id=\"ahservicestart\" name=\"ahservicestart\" class=\"Wdate\" onClick=\"WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm:ss\',readOnly:true})\"/>";
        row.insertCell(row.cells.length).innerHTML = "<input type=\"text\" size=\"22\" id=\"ahserviceend\" name=\"ahserviceend\" class=\"Wdate\" onClick=\"WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm:ss\',readOnly:true})\"/>";
        row.insertCell(row.cells.length).innerHTML = "<textarea name='ahservicestop' cols='38' onBlur=\"javascript:this.style.width='210px';this.style.height='21px';\" onFocus=\"javascript:this.style.width='210px';this.style.height='90px';\" rows='1'>${sinfo}</textarea>";
        
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
    }
  }  

    //保存
    function Save() {
        var tbody = $2("tbody");
        var servdateitem = '' ;
        var activityitem2 = '' ;
        var activityitem3 = '' ;
        var servbakitem = '' ;
        var times = new Array();
        for (var i = 0; i < tbody.rows.length; i++) {
            var ahservicename = tbody.rows[i].cells[2].childNodes[0].value;
            var ahservicestart = tbody.rows[i].cells[3].childNodes[0].value;
            var ahserviceend = tbody.rows[i].cells[4].childNodes[0].value;
            var ahservicestop = tbody.rows[i].cells[5].childNodes[0].value;
            if(ahservicename==''){
                alert('第'+(i+1)+'行服务名称不能为空');
                return;
            }else if(ahservicestart>ahserviceend){
                alert('第'+(i+1)+'行服务开始时间不能大于结束时间');
                return;
            }
            
            times.push(ahservicestart+","+ahserviceend);
            servdateitem += ahservicename + "#" ;
            activityitem2 += ahservicestart + "#" ;
            activityitem3 += ahserviceend + "#" ;
            servbakitem += ahservicestop + "#" ;
        }
         
        //判断时间点之间的交错
        if(!istimeConflict(times)){
             return;
        }
          $.ajax({
					type : "POST",
					url : basePath + "/activityservicesubmit.do?ahid="+document.getElementById('ahid').value+"&servdateitem=" + servdateitem+"&activityitem2="+activityitem2+"&activityitem3="+activityitem3+
					"&servbakitem="+servbakitem,
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('操作成功');
							window.location.href = basePath + "/activityhouse.do";
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
<div class="topLanBar"><b>当前位置：</b>活动室管理  > 活动室活动计划</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr> 
</table>
<form name="myform" method="post" action="activityservicesubmit.do">
<input type="hidden" id="ahid" name="ahid" value="${ahid}"/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td><button onClick="AddRow()" id="001">增加一行</button><button onClick="DelRow()" id="001">删除</td>
</tr>
</table>
<table  width="100%" border="1" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
        <th width="4%" nowrap>序号</th>
        <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
        <th width="14%" nowrap>活动日期</th>
        <th width="14%" nowrap>服务开始时间</th>
        <th width="14%" nowrap>服务结束时间</th>
        <th width="21%" nowrap>服务停止原因</th>
    </tr>
    <tbody id="tbody">
    <tr>
     <td align="center">1</td>
     <td align="center"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
     <td align="center"><input type="text" size="21" id="ahservicename" name="ahservicename"/></td>
     <td align="center"><input type="text" size="22" id="ahservicestart" name="ahservicestart" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"/></td>
     <td align="center"><input type="text" size="22" id="ahserviceend" name="ahserviceend" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"/></td>
     <td align="center">
        <textarea name="ahservicestop" cols="38" onBlur="javascript:this.style.width='210px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1"></textarea>
     </td>
    </tr>
    </tbody>
</table>
<table width="100%">
     <tr>
     <td width="100%" align="center"><button onclick="Save()">提交</button> 
		<button onClick="forward('activityhouse.do')">返回</button></td>
    </tr>
</table>
</form>
<script type="text/javascript">
<%
   Activityhouse house = (Activityhouse)request.getAttribute("activity");
   String ahservicename = house.getAhservicename();
   String ahservicestart = house.getAhservicestart();
   String ahserviceend = house.getAhserviceend();
   String ahservicestop = house.getAhservicestop();
%>
var ahservicename = '<%=ahservicename%>' ;
var ahservicestart = '<%=ahservicestart%>' ;
var ahserviceend = '<%=ahserviceend%>' ;
var ahservicestop = '<%=ahservicestop%>' ;

function init(){
  var tbody = $2("tbody");
  //init all rows 
  for(var rowi=0;rowi<ahservicename.split('#').length-1;rowi++){
      if(rowi==0){
	      //归零
	      $2("tbody").deleteRow(0); 
      }
      
      AddRow();
      //give val to table
	  for (var i = 0; i < tbody.rows.length; i++) {
	      tbody.rows[i].cells[2].childNodes[0].value = ahservicename.split('#')[i];
	      tbody.rows[i].cells[3].childNodes[0].value = ahservicestart.split('#')[i];
	      tbody.rows[i].cells[4].childNodes[0].value = ahserviceend.split('#')[i];
	      tbody.rows[i].cells[5].childNodes[0].value = ahservicestop.split('#')[i];
	  }
  }
}
init();
</script>
</body>
</html>

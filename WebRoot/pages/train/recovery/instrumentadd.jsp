<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增器械康复服务</title>
<style type="text/css">
.txt{ 
color:#005aa7; 
border-bottom:1px solid #005aa7; /* 下划线效果 */ 
border-top:0px; 
border-left:0px; 
border-right:0px; 
background-color:transparent; /* 背景色透明 */ 
} 
</style>
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
        for (var i = 0; i < tbody.rows.length/2; i++) {
            tbody.rows[2*i].cells[0].innerHTML = i + 1;
        }
    }

    //添加行
    function AddRow() {
        var tbody = $2("tbody");
        var row = tbody.insertRow(tbody.rows.length);
        row.setAttribute("align","center");
        row.insertCell(row.cells.length);
        row.cells[0].rowSpan = 2;
        row.insertCell(row.cells.length).innerHTML = "<input type='checkbox' class='checkBox1' name='b_id' />";
        row.cells[1].rowSpan = 2;
        row.insertCell(row.cells.length).innerHTML = "<input type='text' size='21' name='mdate' value='' class='Wdate' onClick=\"WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})\" />";
        row.cells[2].rowSpan = 2;
        row.insertCell(row.cells.length).innerHTML = "<input type='text' name='${mname}' onclick='chooseElders()' readonly style='border:0;text-align:center;'/>";
        row.insertCell(row.cells.length).innerHTML = "<input type='checkbox' class='checkBox1'  name='mchair' />";
        row.insertCell(row.cells.length).innerHTML = "<input type='checkbox' class='checkBox1'  name='mjoint' />";
        row.insertCell(row.cells.length).innerHTML = "<input type='checkbox' class='checkBox1'  name='mbelt' />";
        row.insertCell(row.cells.length).innerHTML = "<input type='checkbox' class='checkBox1'  name='mdumbbell' />";
        row.insertCell(row.cells.length).innerHTML = "R<input name='mrecorder' type='text' value='${mrecorder}' size='5' class='txt'/>S<input name='msupervisor' type='text' value='${msupervisor}' size='5' class='txt'/>";
        row.cells[8].rowSpan = 2;
        var row2 = tbody.insertRow(tbody.rows.length);
        row2.setAttribute("align","center");
        row2.insertCell(row2.cells.length).innerHTML = "总计时:<input name='mtotaltime' type='text' value='${mtotaltime}' size='5' class='txt'/>分钟";
        row2.insertCell(row2.cells.length).innerHTML = "<input name='mchairchoo' type='text' value='${mchairchoo}' size='5' class='txt'/>分钟";
        row2.insertCell(row2.cells.length).innerHTML = "<input name='mjointchoo' type='text' value='${mjointchoo}' size='5' class='txt'/>分钟";
        row2.insertCell(row2.cells.length).innerHTML = "<input name='mbeltchoo' type='text' value='${mbeltchoo}' size='5' class='txt'/>分钟";
        row2.insertCell(row2.cells.length).innerHTML = "<input name='mdumbbellchoo' type='text' value='${mdumbbellchoo}' size='5' class='txt'/>分钟";
        
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
                        for (var k = 0; k<2; k++)
                        {
                           $2("tbody").deleteRow(index - k);
                        }
                    }
                }
                refreshRowNo();
            }
        } else {
            alert("请选中需要删除的行!");
        }
    } 

 function choosePro(){
    var pname = "mbelongpro";
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
        var detail = [],
            tbody = $2("tbody");
        for (var i = 0; i < tbody.rows.length/2; i++) {
            var mdate = tbody.rows[2*i].cells[2].childNodes[0].value;
            var mname = tbody.rows[2*i].cells[3].childNodes[0].value;
            var mchair = tbody.rows[2*i].cells[4].childNodes[0].checked;
            if(mchair == true)
            {
                mchair = "checked";
            }
            else
            {
                mchair = "";
            }
            var mjoint = tbody.rows[2*i].cells[5].childNodes[0].checked;
            if(mjoint == true)
            {
                mjoint = "checked";
            }
            else
            {
                mjoint = "";
            }
            var mbelt = tbody.rows[2*i].cells[6].childNodes[0].checked;
            if(mbelt == true)
            {
                mbelt = "checked";
            }
            else
            {
                mbelt = "";
            }
            var mdumbbell = tbody.rows[2*i].cells[7].childNodes[0].checked;
            if(mdumbbell == true)
            {
                mdumbbell = "checked";
            }
            else
            {
                mdumbbell = "";
            }
            var mrecorder = tbody.rows[2*i].cells[8].childNodes[1].value;
            var msupervisor = tbody.rows[2*i].cells[8].childNodes[3].value;
            var mbelongpro = document.getElementById("mbelongpro").value;
            var mtotaltime = tbody.rows[2*i+1].cells[0].childNodes[1].value;
            var mchairchoo = tbody.rows[2*i+1].cells[1].childNodes[0].value;
            var mjointchoo = tbody.rows[2*i+1].cells[2].childNodes[0].value;
            var mbeltchoo = tbody.rows[2*i+1].cells[3].childNodes[0].value;
            var mdumbbellchoo = tbody.rows[2*i+1].cells[4].childNodes[0].value;
            var item = mdate + "^" + mname + "^" + mchair + "^" + mjoint + "^" + mbelt + "^" + mdumbbell + "^" + mrecorder + "^" + msupervisor + "^" + mbelongpro + "^" + mtotaltime + "^" + mchairchoo + "^" + mjointchoo + "^" + mbeltchoo + "^" + mdumbbellchoo;
            detail.push(item);
        }
        var detailstr = detail.join("|");
        $2("detail").value = detailstr;
        
        var stddate = document.getElementById("startdate").value;
        var endate = document.getElementById("enddate").value;
        var dateTime = new Date();
        var thisdate = dateTime.format('yyyy-MM-dd');
        var date1 = dateTime.setFullYear(thisdate.split('-').join(','));
        var date2 = dateTime.setFullYear(stddate.split('-').join(','));
        var date3 = dateTime.setFullYear(endate.split('-').join(','));
        var a1 = thisdate.split("-");
        var b1 = stddate.split("-");
        var c1 = endate.split("-");
        var d1 = new Date(a1[0],a1[1],a1[2]);
        var d2 = new Date(b1[0],b1[1],b1[2]);
        var d3 = new Date(c1[0],c1[1],c1[2]);
        if (mbelongpro == "")
        {
            alert("请选择一个项目!");
        }
        else
        {
             $.ajax({
				   type: "POST",
				   url: basePath + "/instrumentsaveInstrument.do?detail="+encodeURI(detailstr),
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('新增器械康复记录成功');
				   			window.location.href = basePath + "/instrumentlist.do"
				   		}
				   		else{
				   			alert('新增器械康复记录失败');
				   		}
				   },
				   failure:function (){
				   		alert("未知错误！");
				   }	   
			   });
        }
    }
    
  function chooseElders(){
			var mname = "mname";
				    var obj = new Object();
				    obj.memname=mname;
				    obj.chooseflag="recoveryserve";
				    var tab1 = document.getElementById("tab");
		    		var rindex = event.srcElement.parentNode.parentNode.rowIndex;
				    
				    var url =  basePath + "/memberlist.do?chooseflag=recoveryserve";
				    //window.open(url);
				    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px"); 
				    if(str!=null&&str!='') 
				    	arr = str.split(",");
				    if(typeof(str)=="undefined"){
				        document.getElementById(mname).value="";
				    }else if(str=="nochange"){
				        //nothing to do
				    }else{
				    	tab1.rows[rindex].cells[3].innerHTML="<input name='mname' type='text' value="+arr[1]+" onclick='chooseElders()' readonly size='22' style='border:0;text-align:center;'/>";
				    } 	
	   }  
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 新增器械康复服务记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form name="myform"  method="post" action="instrumentsaveInstrument.do">
<input type="hidden" id="detail" name="detail" />
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td><button onClick="AddRow()" id="001">增加一行</button><button onClick="DelRow()" id="001">删除</td>
<td colspan="8" align="right">所属项目:<input type="text" id="mbelongpro" name="mbelongpro" size="18" onclick="choosePro()" readonly></td>
</tr>
</table>
<table id="tab" width="100%" border="1" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
        <th nowrap>序号</th>
        <th nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
        <th nowrap>日期</th>
        <th nowrap>姓名</th>
        <th nowrap>1.按摩椅<br/>(分钟/次)</th>
        <th nowrap>2.肩关节<br/>(单臂__次/组)</th>
        <th nowrap>3.按摩带<br/>(分钟)</th>
        <th nowrap>4.哑铃<br/>(单臂__次/组)</th>
        <th nowrap>记录</th>
    </tr>
    <tbody id="tbody">
      <tr>
	    <td align="center" rowspan="2">1</td>
	    <td align="center" rowspan="2"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
	    <td align="center" rowspan="2"><input type="text" size="21" name="mdate" value="" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
	    <td align="center"><input type="text" name="mname" value="${mname}" onclick="chooseElders()" readonly style="border:0;text-align:center"/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mchair" /></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mjoint" /></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mbelt" /></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mdumbbell" /></td>
	    <td align="center" rowspan="2">
		R<input name="mrecorder" type="text" value="${mrecorder}" size="5" class="txt"/>
		S<input name="msupervisor" type="text" value="${msupervisor}" size="5" class="txt"/>
		</td>
	  </tr>
	  <tr>
	    <td align="center">总计时:<input name="mtotaltime" type="text" value="${mtotaltime}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mchairchoo" type="text" value="${mchairchoo}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mjointchoo" type="text" value="${mjointchoo}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mbeltchoo" type="text" value="${mbeltchoo}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mdumbbellchoo" type="text" value="${mdumbbellchoo}" size="5" class="txt"/>分钟</td>
	  </tr>
    </tbody>
</table>
<table width="100%">
     <tr>
     <td width="100%" align="center"><button onclick="Save()">提交</button> 
		<button onClick="forward('instrumentlist.do')">返回</button></td>
    </tr>
</table>
</form>
</body>
</html>

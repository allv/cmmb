<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增助洁记录</title>
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
        row.insertCell(row.cells.length).innerHTML = "<input name='hname' type='text' value='${hname}' onclick='chooseElders()' readonly size='22'/>";
        row.insertCell(row.cells.length).innerHTML = "<input name='hclothingnum' type='text' value='${hclothingnum}' size='19'/>";
        row.insertCell(row.cells.length).innerHTML = "<input name='hrequirement' type='text' value='${hrequirement}' size='19'/>";
        row.insertCell(row.cells.length).innerHTML = "<input name='hpeople' type='text' value='${hpeople}' size='19'/>";
        row.insertCell(row.cells.length).innerHTML = "<textarea name='hinfo' cols='34' onBlur=\"javascript:this.style.width='186px';this.style.height='21px';\" onFocus=\"javascript:this.style.width='186px';this.style.height='90px';\" rows='1'>${hinfo}</textarea>";
        
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
    var pname = "hbelongpro";
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
        for (var i = 0; i < tbody.rows.length; i++) {
            var hname = tbody.rows[i].cells[2].childNodes[0].value;
            var hclothingnum = tbody.rows[i].cells[3].childNodes[0].value;
            var hrequirement = tbody.rows[i].cells[4].childNodes[0].value;
            var hpeople = tbody.rows[i].cells[5].childNodes[0].value;
            var hinfo = tbody.rows[i].cells[6].childNodes[0].value;
            var hbelongpro = document.getElementById("hbelongpro").value;
            var item = hname + "^" + hclothingnum + "^" + hrequirement + "^" + hpeople + "^" + hinfo + "^" + hbelongpro;
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
        if (hbelongpro == "")
        {
            alert("请选择一个项目!");
        }
        else
        {
	             $.ajax({
				   type: "POST",
				   url: basePath + "/helpcleansaveHelpclean.do?detail="+encodeURI(detailstr),
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('新增助洁记录成功');
				   			window.location.href=basePath+"/helpcleanlist.do";
				   		}
				   		else{
				   			alert('新增助洁记录失败');
				   		}
				   },
				   failure:function (){
				   		alert("未知错误！");
				   }	   
			   });
        }
    }
    
	function chooseElders(){
		    var mname = "hname";
		    var obj = new Object();
		    obj.memname=mname;
		    obj.chooseflag="careserve";
		    var tab1 = document.getElementById("tab");
		    var rindex = event.srcElement.parentNode.parentNode.rowIndex;
		    var url =  basePath + "/memberlist.do?chooseflag=careserve";
		    //window.open(url);
		    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px");
		    if(str!=null&&str!='') 
		    	arr = str.split(",");
		    if(typeof(str)=="undefined"){
		        tab1.rows[rindex].innerText="";
		    }else if(str=="nochange"){
		        //nothing to do
		    }else{
		    	tab1.rows[rindex].cells[2].innerHTML="<input name='hname' type='text' value="+arr[1]+" onclick='chooseElders()' readonly size='22'/>";
		    } 	
	   } 
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理 >介护服务 > 新增助洁记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form name="myform"  method="post" action="helpcleansaveHelpclean.do">
<input type="hidden" id="detail" name="detail" />
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td><button onClick="AddRow()" id="001">增加一行</button><button onClick="DelRow()" id="001">删除</td>
<td colspan="6" align="right">所属项目:<input type="text" id="hbelongpro" name="hbelongpro" size="18" onclick="choosePro()" readonly></td>
</tr>
</table>
<table  id="tab" width="100%" border="1" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
        <th width="4%" nowrap>序号</th>
        <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
        <th width="14%" nowrap>姓名</th>
        <th width="13%" nowrap>衣物件数(大、中、小)</th>
        <th width="14%" nowrap>晾晒要求(烘干、室外)</th>
        <th width="16%" nowrap>执行人员签字</th>
        <th width="19%" nowrap>备注</th>
    </tr>
    <tbody id="tbody">
    <tr>
     <td align="center">1</td>
     <td align="center"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
     <td align="center"><input name="hname" type="text" value="${hname}" size="22" onclick="chooseElders()" readonly/></td>
     <td align="center"><input name="hclothingnum" type="text" value="${hclothingnum}" size="19"/></td>
     <td align="center"><input name="hrequirement" type="text" value="${hrequirement}" size="19"/></td>
     <td align="center"><input name="hpeople" type="text" value="${hpeople}" size="19"/></td>
     <td align="center"><textarea name="hinfo" cols="34" onBlur="javascript:this.style.width='186px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1">${hinfo}</textarea></td>
    </tr>
    </tbody>
</table>
<table width="100%">
     <tr>
     <td width="100%" align="center"><button onclick="Save()">提交</button> 
		<button onClick="forward('helpcleanlist.do')">返回</button></td>
    </tr>
</table>
</form>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老年人介护服务记录</title>
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

function shows()
{
  var tbody = tbody = document.getElementById("tbody");
  for (var i = 0; i < tbody.rows.length; i++) {
      if (i == 0)
      {
          document.getElementById("sid0").value = "${result[0].sid}";
	      document.getElementById("sname").value = "${result[0].sname}";
	      document.getElementById("sgender").value = "${result[0].sgender}";
	      document.getElementById("sage").value = "${result[0].sage}";
	      document.getElementById("sbelongpro").value = "${result[0].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[0].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[0].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[0].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[0].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[0].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[0].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[0].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[0].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[0].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[0].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[0].speople}";
	      document.getElementById("status").value = "${result[0].status}";
      }
      else if(i == 1)
      {
          document.getElementById("sid1").value = "${result[1].sid}";
          document.getElementById("sname").value = "${result[1].sname}";
	      document.getElementById("sgender").value = "${result[1].sgender}";
	      document.getElementById("sage").value = "${result[1].sage}";
	      document.getElementById("sbelongpro").value = "${result[1].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[1].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[1].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[1].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[1].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[1].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[1].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[1].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[1].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[1].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[1].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[1].speople}";
	      document.getElementById("status").value = "${result[1].status}";
      }
      else if(i == 2)
      {
          document.getElementById("sid2").value = "${result[2].sid}";
          document.getElementById("sname").value = "${result[2].sname}";
	      document.getElementById("sgender").value = "${result[2].sgender}";
	      document.getElementById("sage").value = "${result[2].sage}";
	      document.getElementById("sbelongpro").value = "${result[2].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[2].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[2].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[2].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[2].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[2].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[2].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[2].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[2].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[2].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[2].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[2].speople}";
	      document.getElementById("status").value = "${result[2].status}";
      }
      else if(i == 3)
      {
          document.getElementById("sid3").value = "${result[3].sid}";
          document.getElementById("sname").value = "${result[3].sname}";
	      document.getElementById("sgender").value = "${result[3].sgender}";
	      document.getElementById("sage").value = "${result[3].sage}";
	      document.getElementById("sbelongpro").value = "${result[3].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[3].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[3].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[3].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[3].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[3].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[3].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[3].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[3].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[3].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[3].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[3].speople}";
	      document.getElementById("status").value = "${result[3].status}";
      }
      else if(i == 4)
      {
          document.getElementById("sid4").value = "${result[4].sid}";
          document.getElementById("sname").value = "${result[4].sname}";
	      document.getElementById("sgender").value = "${result[4].sgender}";
	      document.getElementById("sage").value = "${result[4].sage}";
	      document.getElementById("sbelongpro").value = "${result[4].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[4].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[4].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[4].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[4].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[4].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[4].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[4].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[4].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[4].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[4].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[4].speople}";
	      document.getElementById("status").value = "${result[4].status}";
      }
      
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
    function onSubmit() {
        var detail = [],
            tbody = document.getElementById("tbody");
        for (var i = 0; i < tbody.rows.length; i++) {
            var sid = document.getElementById("sid"+i).value;
            var sname = document.getElementById("sname").value;
            var sgender = document.getElementById("sgender").value;
            var sage = document.getElementById("sage").value;
            var sbelongpro = document.getElementById("sbelongpro").value;
            var sdate = tbody.rows[i].cells[0].childNodes[0].value;
            var sproject1 = tbody.rows[i].cells[1].childNodes[0].checked;
            if(sproject1 == false)
            {
                sproject1 = "";
            }
            var sproject2 = tbody.rows[i].cells[2].childNodes[0].checked;
            if(sproject2 == false)
            {
                sproject2 = "";
            }
            var sproject3 = tbody.rows[i].cells[3].childNodes[0].checked;
            if(sproject3 == false)
            {
                sproject3 = "";
            }
            var sproject4 = tbody.rows[i].cells[4].childNodes[0].checked;
            if(sproject4 == false)
            {
                sproject4 = "";
            }
            var sproject5 = tbody.rows[i].cells[5].childNodes[0].checked;
            if(sproject5 == false)
            {
                sproject5 = "";
            }
            var sproject6 = tbody.rows[i].cells[6].childNodes[0].checked;
            if(sproject6 == false)
            {
                sproject6 = "";
            }
            var sproject7 = tbody.rows[i].cells[7].childNodes[0].checked;
            if(sproject7 == false)
            {
                sproject7 = "";
            }
            var sproject8 = tbody.rows[i].cells[8].childNodes[0].checked;
            if(sproject8 == false)
            {
                sproject8 = "";
            }
            var sother = tbody.rows[i].cells[9].childNodes[0].value;
            var speople = tbody.rows[i].cells[10].childNodes[0].value;
            var status = document.getElementById("status").value;
            if (status == "")
            {
                status = " ";
            }
            var item = sid + "^" + sname + "^" + sgender + "^" + sage + "^" + sdate + "^" + sproject1 + "^" + sproject2 + "^" + sproject3 + "^" + sproject4 + "^" + sproject5 + "^" + sproject6 + "^" + sproject7 + "^" + sproject8 + "^" + sother + "^" + speople + "^" + status + "^" + sbelongpro;
            detail.push(item);
        }
        var detailstr = detail.join("|");
        
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
        if (stddate == "")
        {
            $.ajax({
				type : "POST",
				url : basePath + "/serviceplanmodifyser.do?detail=" + encodeURI(detailstr),
				success : function(msg) {
					var result = msg;
					if ('success' == result) {
						alert('修改老年人介护服务记录成功');
						window.location.href = basePath + "/serviceplanlist.do";
					} else {
						alert('修改老年人介护服务记录失败');
					}
				},
				failure : function() {
					alert("未知错误！");
				}
			});
        }
        else
        {
	        if (Date.parse(d1) > Date.parse(d2) && Date.parse(d1) < Date.parse(d3))
	        {
	            $.ajax({
					type : "POST",
					url : basePath + "/serviceplanmodifyser.do?detail=" + encodeURI(detailstr),
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改老年人介护服务记录成功');
							window.location.href = basePath + "/serviceplanlist.do";
						} else {
							alert('修改老年人介护服务记录失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
	        }
	        else{
	            alert("项目不在有效期内");
	        }
        }
    }
    
    function chooseElders(){
		    var mname = "sname";
		    var obj = new Object();
		    obj.memname=mname;
		    
		    var url =  basePath + "/memberlist.do?chooseflag=true";
		    //window.open(url);
		    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px"); 
		    arr = str.split(",");
		    if(typeof(str)=="undefined"){
		        document.getElementById(mname).value="";
		    }else if(str=="nochange"){
		        //nothing to do
		    }else{
		    	document.getElementById(mname).value=arr[1];
		    	document.getElementById("sgender").value=arr[3];
		    	document.getElementById("sage").value=arr[4];
		    } 	
	   }
</script>
</head>
<body onload="shows()">
<div class="topLanBar"><b>当前位置：</b>护理管理 >介护服务 > 老年人介护服务记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<div>
老人姓名:<input name="sname" type="text" value="" class="txt" disabled/>
性别:<input name="sgender" type="text" value="" class="txt" disabled/>
年龄:<input name="sage" type="text" value="" class="txt" disabled/>
所属项目:<input type="text" id="sbelongpro" name="sbelongpro" size="10" disabled/>
</div>
<table  width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
        <th nowrap>日期</th>
        <th nowrap>助浴</th>
        <th nowrap>洗衣</th>
        <th nowrap>理发</th>
        <th nowrap>剪甲</th>
        <th nowrap>按摩</th>
        <th nowrap>足疗</th>
        <th nowrap>代配药</th>
        <th nowrap>喂饭</th>
        <th nowrap>其他(需列明)</th>
        <th nowrap>记录人</th>
        <th nowrap>老人本周状况</th>
    </tr>
    <tbody id="tbody">
    <tr>
     <input type="hidden" name="sid0" value="" />
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4" rowspan="5"><textarea name="status" cols="50" rows="9" disabled></textarea></td>
    </tr>
    <tr>
    <input type="hidden" name="sid1" value="" />
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    <tr>
    <input type="hidden" name="sid2" value="" />
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    <tr>
    <input type="hidden" name="sid3" value="" />
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled /></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    <tr>
    <input type="hidden" name="sid4" value="" />
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    </tbody>
</table>
<table width="100%">
  <tr>
    <td align="right">&nbsp;</td>
    <td id="ERROR_MSG">${msg}</td>
  </tr>
    <tr>
    <td width="100%" align="center">
	<button onClick="forward('serviceplanlist.do')">返回</button></td>
    </tr>
</table>
</form>
</body>
</html>

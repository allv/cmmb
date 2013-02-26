<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改器械康复服务记录</title>
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

//全选
function checkAll(target) {
    var checkeds = document.getElementsByName("b_id");
    for (var i = 0; i < checkeds.length; i++) {
        checkeds[i].checked = target.checked;
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

function onSubmit()
{
   var detail = [], mnumber,
      tbody = document.getElementById("tbody");
       for (var i = 1; i < tbody.rows.length/2+1; i++) {
            var mentid = document.getElementById("mentid"+i).value;
            mnumber = document.getElementById("mnumber").value;
            var mdate = tbody.rows[2*i-2].cells[2].childNodes[0].value;
            var mname = tbody.rows[2*i-2].cells[3].childNodes[0].value;
            var mchair = tbody.rows[2*i-2].cells[4].childNodes[0].checked;
            if(mchair == true)
            {
                mchair = "checked";
            }
            else
            {
                mchair = "";
            }
            var mjoint = tbody.rows[2*i-2].cells[5].childNodes[0].checked;
            if(mjoint == true)
            {
                mjoint = "checked";
            }
            else
            {
                mjoint = "";
            }
            var mbelt = tbody.rows[2*i-2].cells[6].childNodes[0].checked;
            if(mbelt == true)
            {
                mbelt = "checked";
            }
            else
            {
                mbelt = "";
            }
            var mdumbbell = tbody.rows[2*i-2].cells[7].childNodes[0].checked;
            if(mdumbbell == true)
            {
                mdumbbell = "checked";
            }
            else
            {
                mdumbbell = "";
            }
            var mrecorder = tbody.rows[2*i-2].cells[8].childNodes[1].value;
            var msupervisor = tbody.rows[2*i-2].cells[8].childNodes[3].value;
            var mbelongpro = document.getElementById("mbelongpro").value;
            var mtotaltime = tbody.rows[2*i-1].cells[0].childNodes[1].value;
            var mchairchoo = tbody.rows[2*i-1].cells[1].childNodes[0].value;
            var mjointchoo = tbody.rows[2*i-1].cells[2].childNodes[0].value;
            var mbeltchoo = tbody.rows[2*i-1].cells[3].childNodes[0].value;
            var mdumbbellchoo = tbody.rows[2*i-1].cells[4].childNodes[0].value;
            var item = mentid + "^" + mdate + "^" + mname + "^" + mchair + "^" + mjoint + "^" + mbelt + "^" + mdumbbell + "^" + mrecorder + "^" + msupervisor + "^" + mbelongpro + "^" + mtotaltime + "^" + mchairchoo + "^" + mjointchoo + "^" + mbeltchoo + "^" + mdumbbellchoo + "^" + mnumber;
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
        if (mbelongpro == "")
        {
             alert("请选择一个项目!");
        }
        else
        {
	            $.ajax({
					type : "POST",
					url : basePath + "/instrumentmodifyment.do?detail=" + encodeURI(detailstr),
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改器械康复记录成功');
							window.location.href = basePath + "/instrumentlist.do";
						} else {
							alert('修改器械康复记录失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
        }
}

//删除行
function psyDel(mnumber){
      var mnumber = document.getElementById("mnumber").value;
      var detail = [];
      var checkeds = document.getElementsByName("b_id");
      var ischeck = false;
      for (var i = checkeds.length - 1; i >= 0; i--) {
          if (checkeds[i].checked) {
              ischeck = true;
              break;
          }
      }
      if (ischeck) {
          for (var i = checkeds.length - 1; i >= 0; i--) {
              if (checkeds[i].checked) {
                 var num = i +1; 
                 var mentid = document.getElementById("mentid"+num).value;
                 var item = mentid;
                 detail.push(item);
              }
          }
          var detailstr = detail.join("|");
		  var but = window.confirm("确定删除该活动吗？");
		  if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/instrumentdelchoosement.do", 
			   data: {mentid:detailstr},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/instrumentmentmodify.do?mnumber="+mnumber;
			   		}else{
			   		 	 alert('删除失败!');
			   		}
			   },
			   failure:function (){
			   		alert("未知错误！");
			   }
			});
		   }
      } else {
          alert("请选中需要删除的行!");
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
				    	tab1.rows[rindex].cells[3].innerHTML="<input name='mname' type='text' value="+arr[1]+" onclick='chooseElders()' readonly style='border:0;text-align:center;'/>";
				    } 	
	   }  
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 修改器械康复服务记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td><button onClick="psyDel()" id="001">删除</button></td>
<td colspan="8" align="right">所属项目:<input type="text" id="mbelongpro" name="mbelongpro" value="${result[0].mbelongpro}" size="18" onclick="choosePro()" readonly></td>
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
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="10">
	    未找到器械康复服务记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
	<tbody id="tbody">
    <c:forEach var="ment" items="${result}" varStatus="loopStatus">
    <tr>
        <input type="hidden" name="mentid${loopStatus.count}" value="${ment.mentid}" />
        <input type="hidden" name="mnumber" value="${ment.mnumber}" />
	    <td align="center" rowspan="2"><c:out value="${loopStatus.count}"/></td>
	    <td align="center" rowspan="2"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
	    <td align="center" rowspan="2"><input type="text" size="21" name="mdate" value="${ment.mdate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
	    <td align="center"><input type="text" name="mname" value="${ment.mname}" readonly onclick="chooseElders()" style="border:0;text-Align:center;"/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mchair" ${ment.mchair}/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mjoint" ${ment.mjoint}/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mbelt" ${ment.mbelt}/></td>
	    <td align="center"><input type="checkbox" class="checkBox1"  name="mdumbbell" ${ment.mdumbbell}/></td>
	    <td align="center" rowspan="2">
		R<input name="mrecorder" type="text" value="${ment.mrecorder}" size="5" class="txt"/>
		S<input name="msupervisor" type="text" value="${ment.msupervisor}" size="5" class="txt"/>
		</td>
	  </tr>
	  <tr>
	    <td align="center">总计时:<input name="mtotaltime" type="text" value="${ment.mtotaltime}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mchairchoo" type="text" value="${ment.mchairchoo}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mjointchoo" type="text" value="${ment.mjointchoo}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mbeltchoo" type="text" value="${ment.mbeltchoo}" size="5" class="txt"/>分钟</td>
	    <td align="center"><input name="mdumbbellchoo" type="text" value="${ment.mdumbbellchoo}" size="5" class="txt"/>分钟</td>
	  </tr>
    </c:forEach>
    </tbody>
    </c:otherwise>
    </c:choose>
  </table>
  <table width="100%">
	  <tr>
	    <td align="right">&nbsp;</td>
	    <td id="ERROR_MSG">${msg}</td>
	  </tr>
     <tr>
     <td width="100%" align="center"><button onclick="onSubmit()">提交</button> 
		<button onClick="forward('instrumentlist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

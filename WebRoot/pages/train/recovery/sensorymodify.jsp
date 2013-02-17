<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改感官功能康复记录</title>
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

function onSubmit()
{
   var snumber;
   var detail = new Array();
   var times = new Array();
   var tbody = document.getElementById("tbody");
   for (var i = 1; i < tbody.rows.length; i++) {
            var sid = document.getElementById("sid"+i).value;
                snumber = document.getElementById("snumber").value;
            var sstarttime = tbody.rows[i].cells[2].childNodes[0].value;
            var sendtime = tbody.rows[i].cells[3].childNodes[0].value;
            if(sstarttime==''||sendtime==''){
                alert('第'+(i+1)+'行时间不能为空');
                return;
            }else if(sstarttime>sendtime){
                alert('第'+(i+1)+'行结束时间必须大于开始时间');
                return;
            }
            times.push(sstarttime+","+sendtime);
            var sattend = tbody.rows[i].cells[4].childNodes[0].value;
            var sinfo = tbody.rows[i].cells[5].childNodes[0].value;
            var swrite = tbody.rows[i].cells[6].childNodes[0].value;
            var sbelongpro = document.getElementById("sbelongpro").value;
            var item = sid + "^" + snumber + "^" + sstarttime + "^" + sendtime + "^" + sattend + "^" + sinfo + "^" + swrite + "^" + sbelongpro;
            detail.push(item);
        }
        //判断时间点之间的交错
        if(!istimeConflict(times)){
             return;
        }
        
        var detailstr = encodeURI(detail.join("|"));
        
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
        if (sbelongpro == "")
        {
             alert("请选择一个项目!");
        }
        else
        {
	           $.ajax({
					type : "POST",
					url : basePath + "/sensorymodifysen.do?detail=" + detailstr,
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改康复记录成功');
							window.location.href = basePath + "/sensorylist.do";
						} else {
							alert('修改康复记录失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
        }
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

//删除行
function senDel(snumber){
      var snumber = document.getElementById("snumber").value;
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
                 var sid = document.getElementById("sid"+num).value;
                 var item = sid;
                 detail.push(item);
              }
          }
          var detailstr = detail.join("|");
		  var but = window.confirm("确定删除该康复记录吗？");
		  if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/sensorydelchoosesen.do", 
			   data: {sid:detailstr},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/sensorysenmodify.do?snumber="+snumber;
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
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 修改感官功能康复记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form method="post">
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" cellpadding="0" cellspacing="0">
<tr>
<td><button onClick="senDel()" id="001">删除</button></td>
<td colspan="6" align="right">所属项目:<input type="text" id="sbelongpro" name="sbelongpro" value="${result[0].sbelongpro}" size="18" onclick="choosePro()" readonly></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
      <th width="14%" nowrap>开始时间</th>
      <th width="14%" nowrap>结束时间</th>
      <th width="17%" nowrap>参加人员</th>
      <th width="21%" nowrap>活动介绍及备注</th>
      <th width="10%" nowrap>记录人签字</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="5">
	    未找到感官功能康复记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="sen" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="sid${loopStatus.count}" value="${sen.sid}" />
          <input type="hidden" name="snumber" value="${sen.snumber}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sstarttime" value="${sen.sstarttime}" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})" /></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sendtime" value="${sen.sendtime}" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})" /></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="sattend" type="text" value="${sen.sattend}" size="28"/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><textarea name="sinfo" cols="38" onBlur="javascript:this.style.width='202px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1">${sen.sinfo}</textarea></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="swrite" type="text" value="${sen.swrite}" size="14"/></td>
	</tr>
    </c:forEach>
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
		<button onClick="forward('sensorylist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

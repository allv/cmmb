<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改保健操记录</title>
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
    var pname = "abelongpro";
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
   var detail = [], anumber,
      tbody = document.getElementById("tbody");
   for (var i = 1; i < tbody.rows.length; i++) {
            var aid = document.getElementById("aid"+i).value;
                anumber = document.getElementById("anumber").value;
            var aname = tbody.rows[i].cells[2].childNodes[0].value;
            var apeoplenum = tbody.rows[i].cells[3].childNodes[0].value;
            var stime = tbody.rows[i].cells[4].childNodes[0].value;
            var aplace = tbody.rows[i].cells[5].childNodes[0].value;
            var ainfo = tbody.rows[i].cells[6].childNodes[0].value;
            var abelongpro = document.getElementById("abelongpro").value;
            var item = aid + "^" + anumber + "^" + aname + "^" + apeoplenum + "^" + stime + "^" + aplace + "^" + ainfo + "^" + abelongpro;
            detail.push(item);
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
        if (abelongpro == "")
        {
            alert("请选择一个项目!");
        }
        else
        {
	            $.ajax({
					type : "POST",
					url : basePath + "/recoverymodifyact.do?detail=" + detailstr,
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改保健操记录成功');
							window.location.href = basePath + "/recoverylist.do";
						} else {
							alert('修改保健操记录失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
        }
}

//删除行
function psyDel(anumber){
      var anumber = document.getElementById("anumber").value;
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
                 var aid = document.getElementById("aid"+num).value;
                 var item = aid;
                 detail.push(item);
              }
          }
          var detailstr = detail.join("|");
		  var but = window.confirm("确定删除该保健操记录吗？");
		  if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/recoverydelchooseact.do", 
			   data: {aid:detailstr},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/recoveryactmodify.do?anumber="+anumber;
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
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 修改保健操记录</div>
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
<td colspan="6" align="right">所属项目:<input type="text" id="abelongpro" name="abelongpro" value="${result[0].abelongpro}" size="18" onclick="choosePro()" readonly></td>
</tr>
</table>
<table width="100%" border="1" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
      <th width="14%" nowrap>活动名称</th>
      <th width="13%" nowrap>参加人数(会、工、自)</th>
      <th width="14%" nowrap>活动时间</th>
      <th width="16%" nowrap>活动地点</th>
      <th width="19%" nowrap>活动备注</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="5">
	    未找到保健操记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="act" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="aid${loopStatus.count}" value="${act.aid}" />
          <input type="hidden" name="anumber" value="${act.anumber}" />
          <td align="center"><c:out value="${loopStatus.count}"/></td>
          <td align="center"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
	      <td align="center"><input name="aname" type="text" value="${act.aname}" size="22"/></td>
	      <td align="center"><input name="apeoplenum" type="text" value="${act.apeoplenum}" size="19"/></td>
	      <td align="center"><input type="text" size="21" name="stime" value="${act.stime}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
	      <td align="center"><input name="aplace" type="text" value="${act.aplace}" size="26"/></td>
	      <td align="center"><textarea name="ainfo" cols="34" onBlur="javascript:this.style.width='190px';this.style.height='21px';" onFocus="javascript:this.style.width='190px';this.style.height='90px';" rows="1">${act.ainfo}</textarea></td>
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
		<button onClick="forward('recoverylist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

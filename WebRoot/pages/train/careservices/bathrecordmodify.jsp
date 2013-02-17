<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改助浴记录</title>
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
    var pname = "pbelongpro";
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
   var detail = new Array();
   var times = new Array();
   var cdate ;
   var tbody = document.getElementById("tbody");
   for (var i = 1; i < tbody.rows.length; i++) {
            var cid = document.getElementById("cid"+i).value;
                cdate = document.getElementById("cdate").value;
            var cname = tbody.rows[i].cells[2].childNodes[0].value;
            var clevel = tbody.rows[i].cells[3].childNodes[0].value;
            var cstarttime = tbody.rows[i].cells[4].childNodes[0].value;
            var cendtime = tbody.rows[i].cells[5].childNodes[0].value;
            if(cname==''){
                alert('第'+(i+1)+'行姓名不能为空');
                return;
            }
            
            if(cstarttime==''||cendtime==''){
                alert('第'+(i+1)+'行时间不能为空');
                return;
            }else if(cstarttime>cendtime){
                alert('第'+(i+1)+'行结束时间必须大于开始时间');
                return;
            }
            times.push(cstarttime+","+cendtime);
            var cpeople = tbody.rows[i].cells[6].childNodes[0].value;
            var cinfo = tbody.rows[i].cells[7].childNodes[0].value;
            var cbelongpro = document.getElementById("pbelongpro").value;
            var item = cid + "^" + cdate + "^" + cname + "^" + clevel + "^" + cstarttime + "^" + cendtime + "^" + cpeople + "^" + cinfo + "^" + cbelongpro;
            detail.push(item);
        }
        
        //判断时间点之间的交错
        if(!istimeConflict(times)){
             return;
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
        if (cbelongpro == "")
        {
            alert("请选择一个项目!");
        }
        else
        {
	            $.ajax({
					type : "POST",
					url : basePath + "/bathrecordmodifybat.do?detail=" + encodeURI(detailstr),
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改助浴记录成功');
							window.location.href = basePath + "/bathrecordlist.do";
						} else {
							alert('修改助浴记录失败');
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
function batDel(){
      var cdate = document.getElementById("cdate").value;
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
                 var cid = document.getElementById("cid"+num).value;
                 var item = cid;
                 detail.push(item);
              }
          }
          var detailstr = detail.join("|");
		  var but = window.confirm("确定删除该记录吗？");
		  if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/bathrecorddelchoosebat.do", 
			   data: {cid:detailstr},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/bathrecordbatmodify.do?cdate="+cdate;
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
			var mname = "cname";
				    var obj = new Object();
				    obj.memname=mname;
				    obj.chooseflag="careserve";
				    var tab1 = document.getElementById("tbody");
		    		var rindex = event.srcElement.parentNode.parentNode.rowIndex;
				    
				    var url =  basePath + "/memberlist.do?chooseflag=careserve";
				    //window.open(url);
				    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px"); 
				    if(str!=null&&str!='') 
				    	arr = str.split(",");
				    if(typeof(str)=="undefined"){
				        document.getElementById(mname).value="";
				    }else if(str=="nochange"){
				        //nothing to do
				    }else{
				    	tab1.rows[rindex].cells[2].innerHTML="<input name='hname' type='text' value="+arr[1]+" onclick='chooseElders()' readonly size='22'/>";
				    } 	
	   }  
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>护理管理 >介护服务 > 修改助浴记录</div>
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
<td><button onClick="batDel()" id="001">删除</button></td>
<td colspan="7" align="right">所属项目:<input type="text" id="pbelongpro" name="pbelongpro" value="${result[0].cbelongpro}" size="18" onclick="choosePro()" readonly></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th width="4%" nowrap>序号</th>
      <th width="5%" nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
      <th width="14%" nowrap>姓名</th>
      <th width="13%" nowrap>助浴级别</th>
      <th width="14%" nowrap>开始时间</th>
      <th width="16%" nowrap>完成时间</th>
      <th width="19%" nowrap>执行人员</th>
      <th width="19%" nowrap>备注</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="9">
	    未找到助浴记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="bat" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="cid${loopStatus.count}" value="${bat.cid}" />
          <input type="hidden" name="cdate" value="${bat.cdate}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="cname" type="text" value="${bat.cname}" size="22" onclick="chooseElders()" readonly/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="clevel" type="text" value="${bat.clevel}" size="19"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name=cstarttime value="${bat.cstarttime}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="cendtime" value="${bat.cendtime}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input name="cpeople" type="text" value="${bat.cpeople}" size="19"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4">
               <textarea name="cinfo" cols="38" onBlur="javascript:this.style.width='202px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1">${bat.cinfo}</textarea>
          </td>
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
		<button onClick="forward('bathrecordlist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

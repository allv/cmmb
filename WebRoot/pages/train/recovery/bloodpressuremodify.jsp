<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改血压测量记录</title>
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
    var pname = "bbelongpro";
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
   var detail = [], bdate,
      tbody = document.getElementById("tbody");
   for (var i = 1; i < tbody.rows.length; i++) {
            var bid = document.getElementById("bid"+i).value;
                bdate = document.getElementById("bdate").value;
            var bname = tbody.rows[i].cells[2].childNodes[0].value;
            var bgender = tbody.rows[i].cells[3].childNodes[0].value;
            var bage = tbody.rows[i].cells[4].childNodes[0].value;
            var bphone = tbody.rows[i].cells[5].childNodes[0].value;
            var bstarttime = tbody.rows[i].cells[6].childNodes[0].value;
            var bdiseases = tbody.rows[i].cells[7].childNodes[0].value;
            var bfilenumber = tbody.rows[i].cells[8].childNodes[0].value;
            var binfo = tbody.rows[i].cells[12].childNodes[0].value;
            var bwritedate = tbody.rows[i].cells[9].childNodes[0].value;
            var bloodnum = tbody.rows[i].cells[10].childNodes[0].value;
            var bpulse = tbody.rows[i].cells[11].childNodes[0].value;
            var bbelongpro = document.getElementById("bbelongpro").value;
            var item = bid + "^" + bdate + "^" + bname + "^" + bgender + "^" + bage + "^" + bphone + "^" + bstarttime + "^" + bdiseases + "^" + bfilenumber + "^" + binfo + "^" + bwritedate + "^" + bloodnum + "^" + bpulse + "^" + bbelongpro;
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
        if (bbelongpro == "")
        {
            alert("请选择一个项目!");
        }
        else
        {
	            $.ajax({
					type : "POST",
					url : basePath + "/bloodpressuremodifyblo.do?detail=" + encodeURI(detailstr),
					success : function(msg) {
						var result = msg;
						if ('success' == result) {
							alert('修改血压测量记录成功');
							window.location.href = basePath + "/bloodpressurelist.do";
						} else {
							alert('修改血压测量记录失败');
						}
					},
					failure : function() {
						alert("未知错误！");
					}
				});
        }
}

//删除行
function psyDel(){
      var bdate = document.getElementById("bdate").value;
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
                 var bid = document.getElementById("bid"+num).value;
                 var item = bid;
                 detail.push(item);
              }
          }
          var detailstr = detail.join("|");
		  var but = window.confirm("确定删除该血压测量记录吗？");
		  if(but){
		       $.ajax({
			   type: "POST",
			   url: basePath + "/bloodpressuredelchooseblo.do", 
			   data: {bid:detailstr},
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   			 alert('删除成功!');
			   			 window.location.href=basePath+"/bloodpressureblomodify.do?bdate="+bdate;
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
	    var mname = "bname";
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
		        tab1.rows[rindex].innerText="";
		    }else if(str=="nochange"){
		        //nothing to do
		    }else{
		    	tab1.rows[rindex].cells[2].innerHTML="<input name='bname' type='text' value="+arr[1]+" onclick='chooseElders()' readonly size='22'/>";
		        tab1.rows[rindex].cells[3].innerHTML="<input name='bgender' type='text' value="+arr[3]+" readonly size='22'/>";
		        var dateTime = new Date();
		        var thisdate = dateTime.format('yyyy-MM-dd');
		        var nyear = parseInt(thisdate.split('-')[0]);
		        var eyear = parseInt(arr[4].split('-')[0]);
		        tab1.rows[rindex].cells[4].innerHTML="<input name='bage' type='text' value="+(nyear-eyear)+" readonly size=''/>";
		        tab1.rows[rindex].cells[6].innerHTML="<input name='bstarttime' type='text' value="+arr[2]+" readonly size='22'/>";
		        tab1.rows[rindex].cells[5].innerHTML="<input name='bphone' type='text' value="+arr[5]+" readonly size='22'/>";
		    } 	
    }
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 >康复服务 > 修改血压测量记录</div>
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
<td colspan="12" align="right">所属项目:<input type="text" id="bbelongpro" name="bbelongpro" value="${result[0].bbelongpro}" onclick="choosePro()" size="18" readonly></td>
</tr>
</table>
<table width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList" id="tbody">
    <tr>
      <th nowrap>序号</th>
      <th nowrap><input type="checkbox" class="checkBox1"  onclick="checkAll(this)" /></th>
      <th nowrap>姓名</th>
      <th nowrap>性别</th>
      <th nowrap>年龄</th>
      <th nowrap>电话</th>
      <th nowrap>入托时间</th>
      <th nowrap>主要疾病</th>
      <th nowrap>档案号码</th>
      <th nowrap>日期</th>
      <th nowrap>血压</th>
      <th nowrap>脉搏</th>
      <th nowrap>备注</th>
    </tr>
	<c:choose>
    <c:when test="${empty result}">
	<tr>
	<td align="center" colspan="13">
	    未找到血压测量记录信息!
	</td>
	</tr>
	</c:when>
	<c:otherwise>
    <c:forEach var="blo" items="${result}" varStatus="loopStatus">
    <tr>
          <input type="hidden" name="bid${loopStatus.count}" value="${blo.bid}" />
          <input type="hidden" name="bdate" value="${blo.bdate}" />
          <td align="center" nowrap bgcolor="#E4E4E4"><c:out value="${loopStatus.count}"/></td>
          <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" /></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bname" type="text" value="${blo.bname}" size="" onclick="chooseElders()" readonly/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bgender" type="text" value="${blo.bgender}" size="" readonly/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bage" type="text" value="${blo.bage}" size="" readonly/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bphone" type="text" value="${blo.bphone}" size="" readonly/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="" name="bstarttime" value="${blo.bstarttime}" readonly/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bdiseases" type="text" value="${blo.bdiseases}" size=""/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bfilenumber" type="text" value="${blo.bfilenumber}" size=""/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="" name="bwritedate" value="${blo.bwritedate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" /></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bloodnum" type="text" value="${blo.bloodnum}" size=""/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><input name="bpulse" type="text" value="${blo.bpulse}" size=""/></td>
	      <td align="center" nowrap bgcolor="#E4E4E4"><textarea name="binfo" cols="34" onBlur="javascript:this.style.width='186px';this.style.height='21px';" onFocus="javascript:this.style.width='210px';this.style.height='90px';" rows="1">${blo.binfo}</textarea></td>
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
		<button onClick="forward('bloodpressurelist.do')">返回</button></td>
     </tr>
</table>
</form>
</body>
</html>

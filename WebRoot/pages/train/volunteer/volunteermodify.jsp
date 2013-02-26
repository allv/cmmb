<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改志愿者信息</title>
<script type="text/javascript">
var basePath = '<%=basePath%>';

function onSubmit()
{
    var vid = document.getElementById("vid").value;
    var vname = document.getElementById("vname").value;
    if(vname==""){
        alert('姓名不能为空');
        return;
    }
    var vcallno = document.getElementById("vcallno").value;
    	if(vcallno==""){
    	    alert('编号不能为空');
        	return;
    	}
   	var vage = document.getElementById("vage").value;
   	var vgender = document.getElementById("vgender").value;
   	var vgender = '男';
		if(document.getElementById("vgender1").checked==true){
		    vgender='女';
		}
   	var vphone = document.getElementById("vphone").value;
   	var vspecialty = document.getElementById("vspecialty").value;
   	var vcommunitywork = document.getElementById("vcommunitywork").value;
    var vstudy = '是';
		if(document.getElementById("vstudy1").checked==true){
		    vstudy='否';
		}
   	var vintention = document.getElementById("vintention").value;
   	var vtrain = document.getElementById("vtrain").value;
   	
   	var vbirthday = document.getElementById("vbirthday").value;
    	var vpriority = document.getElementById("vpriority").value;
    	var vservewill = document.getElementById("vservewill").value;
    	//var vtotal = document.getElementById("vtotal").value;
    var item = vid + "|" + vname + "|" + vage + "|" + vgender + "|" + vphone + "|" + vspecialty + "|" + vcommunitywork + "|" + vstudy + "|" + vintention + "|" + vtrain+'|'+vcallno+'|'+vbirthday+'|'+vpriority+'|'+vservewill;;
       $.ajax({
			type : "POST",
			url : basePath + "/volunteermodifyvol.do?detail=" + encodeURI(item),
			success : function(msg) {
				var result = msg;
				if ('success' == result) {
					alert('修改志愿者成功');
					window.location.href = basePath + "/volunteerlist.do";
				} else {
					alert('修改志愿者失败');
				}
			},
			failure : function() {
				alert("未知错误！");
			}
		});
}


</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>志愿者管理 >志愿者管理 > 修改增志愿者信息</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<table width="100%" border="0" cellpadding="3" cellspacing="1" id="tbody">
    <tr>
      <td align="right">志愿者编号</td>
      <td><input type="text" name="vcallno" id="vcallno" value="${result.vcallno}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
    <input type="hidden" name="vid" value="${result.vid}" />
      <td align="right">姓名</td>
      <td><input type="text" name="vname" value="${result.vname}"/><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">年龄</td>
      <td><input type="text" name="vage" value="${result.vage}"/></td>
    </tr>
     <tr>
      <td align="right">生日</td>
      <td><input type="text" name="vbirthday" id="vbirthday" value="${result.vbirthday}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
      </td>
    </tr>
     <tr>
      <td align="right">志愿者级别</td>
      <td>
        <select name="vpriority" id="vpriority">
	       <option value="1星" ${result.vpriority == '1星' ? "selected" : ""}>   1星  </option>
	       <option value="2星" ${result.vpriority == '2星' ? "selected" : ""}>   2星  </option>
		   <option value="3星" ${result.vpriority == '3星' ? "selected" : ""}>   3星  </option>
	    </select>
      </td>
    </tr>
     <tr>
      <td align="right">服务意向时间段</td>
      <td>
          <input type="text" id="vservewill" name="vservewill" value="${result.vservewill}"/>
      </td>
    </tr>
    <tr>
      <td align="right">性别</td>
      <td>
          <c:if test="${result.vgender eq '男'}">
		             		<input id="vgender" name="vgender" type="radio" class="radio" value="男"  checked><label class="checked" value="60" name="vgender" for="vgender">男 &nbsp;&nbsp;&nbsp;</label>
		        	 		<input id="vgender1" name="vgender" type="radio" class="radio" value="女" ><label class="" value="61" name="vgender1" for="vgender1">女</label>
		                </c:if>
		         
		                <c:if test="${result.vgender eq '女'}">
		         	    	<input id="vgender" name="vgender" type="radio" class="radio" value="男" ><label class="" value="60" name="vgender" for="vgender">男 &nbsp;&nbsp;&nbsp;</label>
		         			<input id="vgender1" name="vgender" type="radio" class="radio" value="女" checked><label class="checked" value="61" name="vgender1" for="vgender1">女</label>
		        	    </c:if>
      </td>
    </tr>
    <tr>
      <td align="right">电话</td>
      <td><input name="vphone" type="text" value="${result.vphone}"/></td>
    </tr>
    <tr>
      <td align="right">是否有学习新知识意愿</td>
      <td>
         <c:if test="${result.vstudy eq '是'}">
		             		<input id="vstudy" name="vstudy" type="radio" class="radio" value="是"  checked><label class="checked" value="62" name="vstudy" for="vstudy">是 &nbsp;&nbsp;&nbsp;</label>
		        	 		<input id="vstudy1" name="vstudy" type="radio" class="radio" value="否" ><label class="" value="63" name="vstudy1" for="vstudy1">否</label>
		                </c:if>
		         
		                <c:if test="${result.vstudy eq '否'}">
		         	    	<input id="vstudy" name="vstudy" type="radio" class="radio" value="是" ><label class="" value="62" name="vstudy" for="vstudy">是 &nbsp;&nbsp;&nbsp;</label>
		         			<input id="vstudy1" name="vstudy" type="radio" class="radio" value="否" checked><label class="checked" value="63" name="vstudy1" for="vstudy1">否</label>
		        	    </c:if>
      </td>
    </tr>
    <tr>
      <td align="right">加入志愿服务日期</td>
      <td><input type="text" size="" name="vtrain" value="${result.vtrain}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" /></td>
    </tr>
    <tr>
      <td align="right">个人特长</td>
       <td><textarea name="vspecialty" cols="58" rows="4">${result.vspecialty}</textarea></td>
    </tr>
    
    <tr>
      <td align="right">社区工作经历</td>
      <td><textarea name="vcommunitywork" cols="58" rows="4">${result.vcommunitywork}</textarea></td>
    </tr>
   <tr>
      <td align="right">志愿服务意向</td>
      <td><textarea name="vintention" cols="58" rows="4">${result.vintention}</textarea></td>
    </tr>
  </table>
 <table width="80%" cellspacing="0" cellpadding="1">
     <tr>
     <td align="center"><button onclick="onSubmit()">提交</button> 
		<button onClick="forward('volunteerlist.do')">返回</button></td>
     </tr>
</table>
</form>
<script type="text/javascript">
var labels=document.getElementsByTagName('label');
var radios=new Array();
//得到所有radio类型的input
var allr=document.getElementsByTagName('input');
for(ir=0;ir<allr.length;ir++){
    if(allr[ir].type=='radio'){
        radios.push(allr[ir]);
    }
}
function initClass(labesindex,labeindex){
   for(i=labesindex,j=labeindex ; i<j ; i++)
   {
       labels[i].onclick=function() 
       {
		       for(k=labesindex,l=labeindex ; k<l ; k++)
		       {
		          labels[k].className='';
		     	  radios[k].checked = false;
		       }
		       this.className='checked';
		       try{
		    	   document.getElementById(this.name).checked = true;
		       }catch (e) {
		           alert(e.getMessage());
		       }
	    }   
   }
}
initClass(0,2);
initClass(2,4);
</script>
</body>
</html>

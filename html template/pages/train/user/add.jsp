<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册用户</title>
<script type="text/javascript">
function onSubmit(){
	if(check("username","string","账号不能为空！") ||
		check("password","string","密码不能为空！") ||
		check("password2","string","请在次确认密码！")
		)return false;
    
	var obj = document.forms[0];
	if(obj.password.value != obj.password2.value){
		document.getElementById("ERROR_MSG").innerHTML = "两次密码输入不一致！";
		obj.password.className = "errorInput";
		obj.password2.className = "errorInput";
		obj.password.focus();
		return false;
	}
	if(check("corpName","string","姓名不能为空！")){
        return false;
    }
	obj.password.value = hex_md5(obj.password.value);
	//obj.password2.value = hex_md5(obj.password2.value);
	var typeobj = document.getElementsByName("type");
	var type;
    for(i=0;i<typeobj.length;i++){
		  if(typeobj[i].checked==true){
		    type = typeobj[i].value;
		}
	}
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>帐号管理 > 新增帐号</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post" action="adduser.do" onSubmit="return onSubmit()">
<table width="100%" border="0" cellspacing="0" cellpadding="5">

  <tr>
      <td colspan="2" bgcolor="#66DD00"><b>快速注册</b></td>
    </tr>
    <tr>
      <td align="right">账号</td>
      <td><input type="text" name="username" value="${username}"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">密码</td>
      <td><input type="password" name="password"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    <tr>
      <td align="right">确认密码</td>
      <td><input type="password" name="password2"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <!-- 
    <tr>
        <td align="right">帐号类型</td>
	    <td nowrap class="TableData" colspan="3">
	    	<input type="radio" name="type" id="type" value="x" checked="checked" /> 行政人员&nbsp;&nbsp;
			<input type="radio" name="type" id="type" value="h" /> 医生&nbsp;&nbsp;
			<input type="radio" name="type" id="type" value="k" /> 康复人员
	    </td>
    </tr>
     -->
    <tr>
      <td colspan="2" bgcolor="#66DD00"><b>人员详情</b></td>
    </tr>
    <tr>
      <td align="right">姓名</td>
      <td><input name="corpName" type="text" value="${corpName}" size="20"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">性别</td>
      <td>
         <input id="corpAP" name="corpAP" type="radio" class="radio"  value="1" checked><label name="corpAP" class="checked" for="corpAP">男 &nbsp;&nbsp;&nbsp;</label>
         <input id="corpAP1" name="corpAP" type="radio" class="radio"  value="2"><label name="corpAP1" for="corpAP1">女</label>
      </td>
    </tr>
    
    <tr>
      <td align="right">联系电话</td>
       <td>
      <input name="linkmanTel" type="text" value="${linkmanTel}"></td>
    </tr>
    
    <tr>
      <td align="right">住址</td>
      <td><input name="corpAdd" type="text" value="${corpAdd}" size="56"></td>
    </tr>
    
    <tr>
      <td align="right">E-mail</td>
      <td><input name="linkmanEmail" type="text" value="${linkmanEmail}" size="56"></td>
    </tr>
   
    <tr>
      <td align="right">工作职责简介</td>
      <td><textarea name="corpNote" cols="58" rows="4">${corpNote}</textarea></td>
    </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td id="ERROR_MSG">${msg}</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><button type="submit">提交</button> 
		<button onClick="forward('queryuser.do')">返回</button></td>
  </tr>

</table>
</form>
<script type="text/javascript">
var labels=document.getElementsByTagName('label');
var radios=document.getElementsByName('corpAP');
function initClass(labesindex,labeindex){
   for(i=labesindex,j=labeindex ; i<j ; i++)
   {
       labels[i].onclick=function() 
       {
		    if(this.className == '') {
		       for(k=labesindex,l=labeindex ; k<l ; k++)
		       {
		          labels[k].className='';
		     	  radios[k].checked = false;
		       }
		       this.className='checked';
		       try{
		    	   document.getElementById(this.name).checked = true;
		       }catch (e) {}
		    }
       }
   }
   labels[labesindex].click();
}

initClass(0,2);
</script>
</body>
</html>

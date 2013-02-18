<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>修改用户</title>
		<script type="text/javascript">
function onSubmit(){
	var obj = document.forms[0];
	
	if(check("username","string","账号不能为空！")||check("corpName","string","姓名不能为空！")){
        return false;
    }
	obj.password2.value = hex_md5(obj.password2.value);
	var obj = document.forms[0];
}	  

</script>
	</head>
	<body>
		<div class="topLanBar">
			<b>当前位置：</b>帐号管理 > 修改帐号
		</div>
		<table width="100%">
			<tr>
				<td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">
					&nbsp;
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="5">
			<form method="post" action="modifyuser.do"
				onsubmit="return onSubmit();">
				<input type="hidden" name="userID" value="${user.wtuserId}">
	    <tr>
      	<td align="right">账号</td>
     	 	<td><input type="text" name="username" value="${user.wtuserLoginname}"><span style='color:red;'>&nbsp;*</span></td>
    	</tr>
   		<tr>
      <td colspan="2" bgcolor="#CBD7ED"><b>人员详情</b></td>
    </tr>
    <tr>
      <td align="right">姓名</td>
      <td><input name="corpName" type="text" value="${user.corpName}" size="20"><span style='color:red;'>&nbsp;*</span></td>
    </tr>
    
    <tr>
      <td align="right">性别</td>
      <td>
         <c:if test="${user.corpAP eq 1}">
            <input  id="corpAP" name="corpAP" type="radio" class="radio" value="1"  checked><label name="corpAP" class="checked" for="corpAP">男 &nbsp;&nbsp;&nbsp;</label>
        	<input id="corpAP1" name="corpAP" type="radio" class="radio" value="2" ><label name="corpAP1" for="corpAP1">女</label>
         </c:if>
         
         <c:if test="${user.corpAP eq 2}">
         	<input id="corpAP"name="corpAP" type="radio" class="radio" value="1" ><label name="corpAP"  for="corpAP">男 &nbsp;&nbsp;&nbsp;</label>
         	<input id="corpAP1" name="corpAP" type="radio" class="radio" value="2"  checked><label name="corpAP1" class="checked" for="corpAP1">女</label>
         </c:if>
         
         <c:if test="${user.corpAP eq null}">
         	<input id="corpAP" name="corpAP" type="radio" class="radio" value="1" ><label name="corpAP" for="corpAP">男 &nbsp;&nbsp;&nbsp;</label>
         	<input id="corpAP1" name="corpAP" type="radio" class="radio" value="2" ><label name="corpAP1" for="corpAP1">女</label>
         </c:if>
      </td>
    </tr>
    
    <tr>
      <td align="right">手机</td>
       <td>
      <input name="linkmanTel" type="text" value="${user.linkmanTel}"></td>
    </tr>
    
    <tr>
      <td align="right">住址</td>
      <td><input name="corpAdd" type="text" value="${user.corpAdd}" size="56"></td>
    </tr>
    
    <tr>
      <td align="right">E-mail</td>
      <td><input name="linkmanEmail" type="text" value="${user.linkmanEmail}" size="56"></td>
    </tr>
   
    <tr>
      <td align="right">工作职责简介</td>
      <td><textarea name="corpNote" cols="58" rows="4">${user.corpNote}</textarea></td>
    </tr>
    
   		
			<tr>
				<td align="right">
					&nbsp;
				</td>
				<td id="ERROR_MSG"></td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td>
					<button type="submit">
						修改
					</button>
					<button onClick="forward('queryuser.do')">
						返回
					</button>
				</td>
			</tr>
			</form>
		</table>
	</body>
	<script>
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
   //labels[labesindex].click();
}
initClass(0,2);
</script>
</html>

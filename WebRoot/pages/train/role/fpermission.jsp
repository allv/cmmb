<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wootion.idp.view.vo.FordNagativation"%>
<html>
<head>
<title>分配权限</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="StyleSheet" href="<%=basePath%>/pages/train/dtree/dtree.css" type="text/css" />
<script type="text/javascript" src="<%=basePath%>/pages/train/dtree/dtree.js"></script>
<script type="text/javascript">
function checkStatus(no,chkBox){
	checkPar(chkBox);
	chechChi(no,chkBox);
}

function chechChi(no,chkBox){
	var chks = document.getElementsByTagName('input');
	for(var i=0;i <chks.length;i++){
		//if(chks[i].name.toLowerCase() == 'check'){//
			if(chks[i].className == no){//
				//alert(chks[i].value);
				chks[i].checked = chkBox.checked;//
				chechChi(chks[i].value,chks[i]);//
			}
		//}
	}
}

function checkPar(chkBox) {
    //chkBox.name.toLowerCase() == 'check' &&
	if( chkBox.checked && chkBox.className != 0) {
		var chkObject = document.getElementById("ch"+chkBox.className);
		chkObject.checked=true;
		checkPar(chkObject);
	}
}

function getAll(){		
	var chks = document.getElementsByTagName('input');
	for(var i=0;i <chks.length;i++){
		if(chks[i].checked){
			alert(i);
		}			
	}
}
function fpermission(url){
	var tempFun = "";
	var tempRes = "";
	var temA = 0;
	var temB = 0;
	var chks = document.getElementsByTagName('input');
	for(var i=0;i <chks.length;i++){
		if(chks[i].checked){
			if(chks[i].name.toLowerCase() == 'checkp'){
				tempFun += chks[i].value+",";
			}else if(chks[i].name.toLowerCase() == 'checkc'){
				tempRes += chks[i].value+",";
			}
		}
	}
	if(tempRes.length>2){
		tempRes = tempRes.substr(0,tempRes.length-1);
	}
	if(tempFun.length>2){
		tempFun = tempFun.substr(0,tempFun.length-1);
	}
	
	document.tblform.funs.value = tempFun;
	document.tblform.ress.value = tempRes;
	document.tblform.action=url;
	document.tblform.submit();
}
</script>
<style type="text/css">
<!--
input {
	 margin: 0px;
	padding: 0px;
	height:12px;
	width:12px;
	valign:"bottom";
}
BUTTON {
	background-image: url(<%=basePath%>/pages/train/skins/img/button.gif);
	background-repeat: no-repeat;
	height: 18px;
	width: 50px;
	color: #FFFFFF;
	border-top-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 0px;
	border-left-width: 0px;
	margin-right: 2px;
	margin-left: 2px;
}
.topLanBar {
	color: #999999;
	height: 22px;
	font-size: 12px;
}
-->
</style>
<base target="_self">
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>角色管理 > 角色权限分配</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<table>
  <form  method="post" name="tblform">
    <input type="hidden" name="funs" id="funs" value="" />
    <input type="hidden" name="ress" id="ress" value="" />
    <input type="hidden" name="mid" id="mid" value="<%=request.getAttribute("mid")%>" />
    <tr>
      <td width="50%" valign="top"><script type="text/javascript"> 
	dd = new dTree( 'dd ','<%=basePath%>');
	dd.add(0,-1, '权限列表(<font color="red">请给角色：&nbsp;<%=request.getAttribute("roleName")%>&nbsp;分配相应权限)</font>');
	
	<%
	    List<FordNagativation> lst = (List<FordNagativation>)request.getAttribute("lst");
		List<FordNagativation> parentlst = (List<FordNagativation>)request.getAttribute("parentlst");
		for(int i=0;i<lst.size();i++)
		{
			FordNagativation fnFir = lst.get(i);
			FordNagativation roleFir = parentlst.get(i);
			if("yes".equals(roleFir.getHaveIt().trim())){
				if("yes".equals(fnFir.getHaveIt().trim())){
				%>
				dd.add(<%=fnFir.getNagativeID()%>,0, '<input type="checkbox" checked name="checkp" value="<%=fnFir.getNagativeID()%>" class="0" id="ch<%=fnFir.getNagativeID()%>" onClick="checkStatus(<%=fnFir.getNagativeID()%>,this)" >&nbsp;<%=fnFir.getNagativeName()%> ');
				<%}else{
				%>
				dd.add(<%=fnFir.getNagativeID()%>,0, '<input type="checkbox" name="checkp" value="<%=fnFir.getNagativeID()%>" class="0" id="ch<%=fnFir.getNagativeID()%>" onClick="checkStatus(<%=fnFir.getNagativeID()%>,this)" >&nbsp;<%=fnFir.getNagativeName()%> ');
				<%}
			}else{%>
			    dd.add(<%=fnFir.getNagativeID()%>,0, '<input type="checkbox" name="checkp1" value="<%=fnFir.getNagativeID()%>" class="fakech" id="fakech<%=fnFir.getNagativeID()%>" onClick="checkStatus(<%=fnFir.getNagativeID()%>,this)" disabled="disabled">&nbsp;<%=fnFir.getNagativeName()%> ');
			<%}
			List<FordNagativation> lstSec = fnFir.getLst();
			List<FordNagativation> rolelstSec = roleFir.getLst();
			for(int j=0;j<lstSec.size();j++)
			{
				FordNagativation fnSec = lstSec.get(j);
				FordNagativation roleSec = rolelstSec.get(j);
				if("yes".equals(roleSec.getHaveIt().trim())){
					if("yes".equals(fnSec.getHaveIt().trim())){
					%>
						dd.add(<%=fnSec.getNagativeID()%>,<%=fnSec.getParentID()%>, '<input type="checkbox" name="checkp" checked value="<%=fnSec.getNagativeID()%>" class="<%=fnSec.getParentID()%>" id="ch<%=fnSec.getNagativeID()%>" onClick="checkStatus(<%=fnSec.getNagativeID()%>,this)">&nbsp;<%=fnSec.getNagativeName()%> ');
					<%}else{
					%>
						dd.add(<%=fnSec.getNagativeID()%>,<%=fnSec.getParentID()%>, '<input type="checkbox" name="checkp" value="<%=fnSec.getNagativeID()%>" class="<%=fnSec.getParentID()%>" id="ch<%=fnSec.getNagativeID()%>" onClick="checkStatus(<%=fnSec.getNagativeID()%>,this)">&nbsp;<%=fnSec.getNagativeName()%> ');
					<%}
				}else{%>
				        dd.add(<%=fnSec.getNagativeID()%>,<%=fnSec.getParentID()%>, '<input type="checkbox" name="checkp1" value="<%=fnSec.getNagativeID()%>" class="fakech<%=fnSec.getParentID()%>" id="fakech<%=fnSec.getNagativeID()%>" onClick="checkStatus(<%=fnSec.getNagativeID()%>,this)" disabled="disabled">&nbsp;<%=fnSec.getNagativeName()%> ');
				<%}
			}
		}
	%>
	
	document.write(dd);
</script>
      </td>
    </tr>
    <tr align="center">
      <td><button onClick="fpermission('<%=basePath%>/dofpermission.do');">提交</button>
        <button onClick="window.close();" type="reset">返回</button></td>
    </tr>
    </tr>
    
  </form>
</table>
</body>
</html>

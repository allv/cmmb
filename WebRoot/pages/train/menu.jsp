<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="import.jsp"%>
<HTML>
<HEAD>
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE>菜单</TITLE>
<LINK href="<%=basePath%>/pages/train/skins/css/common.css" rel="stylesheet" type="text/css" />
<STYLE type="text/css">
<!--
BODY {
	margin: 0px;
	background-color: #F0F0F0;
}
#menuTable {
}
#menuTable a,#menuTable a:hover {
	text-align: center;
	height: 30px;
	width: 180px;
	line-height: 30px;
	font-weight: bold;
	color: #FFFFFF;
}
#menuTable a {
	background-image: url(<%=basePath%>/pages/train/skins/img/green.png);
	background-repeat: no-repeat;
}
#menuTable a:hover {
	background-image: url(<%=basePath%>/pages/train/skins/img/menu-move1.gif);
	background-repeat: no-repeat;
}
#menuTable ul {
	list-style-image: url(<%=basePath%>/pages/train/skins/img/c-right.gif);
	list-style-position: inside;
	margin: 0px;
	padding-left: 1pc;
}
#menuTable ul a,#menuTable ul a:hover {
	height: 24px;
	width: 160px;
	text-align: left;
	line-height: 24px;
	padding: 3px;
	background-image: none;
	color: #000000;
}
#menuTable ul a:hover {
	background-color: #E6F9EA;
}
-->
</STYLE>
<SCRIPT type="text/javascript">
function onMenu(n){
	var obj = document.getElementById("menu"+n);
	if(obj.style.display == "none"){
		closeMenu();
		obj.style.display = "";
	}else{
		obj.style.display = "none";
	}
}
function closeMenu(){
	for(i=1;i<=13;i++){
		var obj = document.getElementById("menu"+i);
		if(obj && obj.style.display == "")
			obj.style.display = "none";
	}
}
</SCRIPT>
</HEAD>
<BODY>
<TABLE width="180" border="0" cellpadding="0" cellspacing="0" id="menuTable">
  <c:forEach var="firmenu" items="${menu}" varStatus="loopStatus">
  	 <TR>
	    <TD><A href="#" onClick="onMenu(${loopStatus.count });return false;">${firmenu.nagativeName }</A></TD>
	 </TR>
	 <TD id="menu${loopStatus.count }">
		<UL>
		 <c:forEach var="secmenu" items="${firmenu.lst}" varStatus="loopStatus2">
				<LI><A target="main" href="${pageContext.request.contextPath}/${secmenu.nagativeURL }">${secmenu.nagativeName }</A></LI>
		 </c:forEach>
	 	</UL>
	</TD>
  </c:forEach>
</TABLE>
<SCRIPT type="text/javascript">closeMenu();</SCRIPT>
</BODY>
</HTML>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有志愿者生日簿</title>
</script>
</head>
<body>
<div class="topLanBar"><b><br>当前位置：</b>志愿者管理> 所有志愿者生日簿</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div align="center">
<table width="530" border="1" class="tab1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div align="center">所有志愿人员生日簿</div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="114"><div align="center">1月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="400"><textarea id="textarea1" name="textarea1" cols="70" rows="7" readonly>
    </textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">2月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea2" name="textarea2" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">3月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea3" name="textarea3" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">4月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea4" name="textarea4" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">5月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea5" name="textarea5" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">6月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea6" name="textarea6" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">7月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea7" name="textarea7" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">8月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea8" name="textarea8" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">9月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea9" name="textarea9" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">10月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea10" name="textarea10" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">11月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea11" name="textarea11" cols="70" rows="7" readonly></textarea></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">12月</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea id="textarea12" name="textarea12" cols="70" rows="7" readonly></textarea></td>
  </tr>
</table>
</div>
<div align="center">
<table width="80%" cellspacing="0" cellpadding="0">
     <tr>
     <td align="center">
		<button onClick="forward('volunteerlist.do')">返回</button></td>
     </tr>
</table>
</div>
</body>
<script type="text/javascript">
 <%
    //获取所有出生日期
    String[] allbir = (String[])request.getAttribute("allbir");
    String month1=allbir[0];
    String month2=allbir[1];
    String month3=allbir[2];
    String month4=allbir[3];
    String month5=allbir[4];
    String month6=allbir[5];
    String month7=allbir[6];
    String month8=allbir[7];
    String month9=allbir[8];
    String month10=allbir[9];
    String month11=allbir[10];
    String month12=allbir[11];
 %>
 
 var allbir1 = '<%=month1%>';
 var allbir2 = '<%=month2%>';
 var allbir3 = '<%=month3%>';
 var allbir4 = '<%=month4%>';
 var allbir5 = '<%=month5%>';
 var allbir6 = '<%=month6%>';
 var allbir7 = '<%=month7%>';
 var allbir8 = '<%=month8%>';
 var allbir9 = '<%=month9%>';
 var allbir10 = '<%=month10%>';
 var allbir11 = '<%=month11%>';
 var allbir12 = '<%=month12%>';
 
 for(i=1;i<=12;i++){
    var  str=eval('allbir'+i);
	oA=document.createElement('A');
	oA.innerHTML=str;
	document.all('textarea'+i).appendChild(oA);
 }
</script>
</html>
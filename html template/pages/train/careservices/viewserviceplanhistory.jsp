<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老人介护服务记录修改明细</title>
<style type="text/css">
.txt{ 
color:#005aa7; 
border-bottom:1px solid #005aa7; /* 下划线效果 */ 
border-top:0px; 
border-left:0px; 
border-right:0px; 
background-color:transparent; /* 背景色透明 */ 
} 
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';

function shows()
{
  var tbody = tbody = document.getElementById("tbody");
  for (var i = 0; i < tbody.rows.length; i++) {
      if (i == 0)
      {
	      document.getElementById("sname").value = "${result[0].sname}";
	      document.getElementById("sgender").value = "${result[0].sgender}";
	      document.getElementById("sage").value = "${result[0].sage}";
	      document.getElementById("sbelongpro").value = "${result[0].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[0].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[0].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[0].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[0].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[0].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[0].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[0].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[0].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[0].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[0].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[0].speople}";
	      document.getElementById("status").value = "${result[0].status}";
      }
      else if(i == 1)
      {
          document.getElementById("sname").value = "${result[1].sname}";
	      document.getElementById("sgender").value = "${result[1].sgender}";
	      document.getElementById("sage").value = "${result[1].sage}";
	      document.getElementById("sbelongpro").value = "${result[1].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[1].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[1].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[1].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[1].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[1].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[1].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[1].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[1].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[1].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[1].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[1].speople}";
	      document.getElementById("status").value = "${result[1].status}";
      }
      else if(i == 2)
      {
          document.getElementById("sname").value = "${result[2].sname}";
	      document.getElementById("sgender").value = "${result[2].sgender}";
	      document.getElementById("sage").value = "${result[2].sage}";
	      document.getElementById("sbelongpro").value = "${result[2].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[2].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[2].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[2].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[2].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[2].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[2].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[2].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[2].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[2].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[2].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[2].speople}";
	      document.getElementById("status").value = "${result[2].status}";
      }
      else if(i == 3)
      {
          document.getElementById("sname").value = "${result[3].sname}";
	      document.getElementById("sgender").value = "${result[3].sgender}";
	      document.getElementById("sage").value = "${result[3].sage}";
	      document.getElementById("sbelongpro").value = "${result[3].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[3].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[3].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[3].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[3].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[3].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[3].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[3].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[3].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[3].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[3].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[3].speople}";
	      document.getElementById("status").value = "${result[3].status}";
      }
      else if(i == 4)
      {
          document.getElementById("sname").value = "${result[4].sname}";
	      document.getElementById("sgender").value = "${result[4].sgender}";
	      document.getElementById("sage").value = "${result[4].sage}";
	      document.getElementById("sbelongpro").value = "${result[4].sbelongpro}";
	      tbody.rows[i].cells[0].childNodes[0].value = "${result[4].sdate}";
	      tbody.rows[i].cells[1].childNodes[0].checked = "${result[4].sproject1}";
	      tbody.rows[i].cells[2].childNodes[0].checked = "${result[4].sproject2}";
	      tbody.rows[i].cells[3].childNodes[0].checked = "${result[4].sproject3}";
	      tbody.rows[i].cells[4].childNodes[0].checked = "${result[4].sproject4}";
	      tbody.rows[i].cells[5].childNodes[0].checked = "${result[4].sproject5}";
	      tbody.rows[i].cells[6].childNodes[0].checked = "${result[4].sproject6}";
	      tbody.rows[i].cells[7].childNodes[0].checked = "${result[4].sproject7}";
	      tbody.rows[i].cells[8].childNodes[0].checked = "${result[4].sproject8}";
	      tbody.rows[i].cells[9].childNodes[0].value = "${result[4].sother}";
	      tbody.rows[i].cells[10].childNodes[0].value = "${result[4].speople}";
	      document.getElementById("status").value = "${result[4].status}";
      }
      
  }
}
 
</script>
</head>
<body onload="shows()">
<div class="topLanBar"><b>当前位置：</b>护理管理> 介护服务> 老人介护服务记录修改明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<div>
老人姓名:<input name="sname" type="text" value="" class="txt" disabled/>
性别:<input name="sgender" type="text" value="" class="txt" disabled/>
年龄:<input name="sage" type="text" value="" class="txt" disabled/>
所属项目:<input type="text" id="sbelongpro" name="sbelongpro" size="10" disabled/>
</div>
<table  width="100%" border="0" cellpadding="3" cellspacing="1" class="tableList">
    <tr>
        <th nowrap>日期</th>
        <th nowrap>助浴</th>
        <th nowrap>洗衣</th>
        <th nowrap>理发</th>
        <th nowrap>剪甲</th>
        <th nowrap>按摩</th>
        <th nowrap>足疗</th>
        <th nowrap>代配药</th>
        <th nowrap>喂饭</th>
        <th nowrap>其他(需列明)</th>
        <th nowrap>记录人</th>
        <th nowrap>老人本周状况</th>
    </tr>
    <tbody id="tbody">
    <tr>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4" rowspan="5"><textarea name="status" cols="50" rows="9" disabled></textarea></td>
    </tr>
    <tr>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    <tr>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    <tr>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    <tr>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="text" size="21" name="sdate" value="" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input type="checkbox" class="checkBox1"  name="b_id" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="sother" type="text" value="" size="22" disabled/></td>
     <td align="center" nowrap bgcolor="#E4E4E4"><input name="speople" type="text" value="" size="22" disabled/></td>
    </tr>
    </tbody>
</table>
<table width="100%">
  <tr>
    <td align="right">&nbsp;</td>
    <td id="ERROR_MSG">${msg}</td>
  </tr>
    <tr>
    <td width="100%" align="center">
	<button onClick="forward('serviceplanhistory.do')">返回</button></td>
    </tr>
</table>
</form>
</body>
</html>

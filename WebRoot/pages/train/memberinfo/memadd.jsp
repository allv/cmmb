<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建申请人登记表</title>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../install_lodop32.exe"></embed>
</object>
<style type="text/css"> 
.fixed_div{ 
position:absolute; 
left:562px; 
bottom:0; 
width:400px; 
top:139px;
} 

.fixed_div3{ 
position:absolute; 
left:212px; 
bottom:0; 
width:400px; 
top:939px;
} 
.fixed_div0{ 
position:absolute; 
left:162px; 
bottom:0; 
width:400px; 
top:109px;
} 
.fixed_div2{ 
position:absolute; 
left:162px; 
bottom:0; 
width:400px; 
top:339px;
} 
</style> 
</head>
<script type="text/javascript">
var basePath = '<%=basePath%>';
function onSubmit(){
  if(check("memname","string","姓名不能为空！")||check("memid","string","档案编号不能为空！")||check("creditid","string","身份证号码不能为空！")||check("conpost","string","社保号码不能为空！")
		  ||check("mylandlinenumber","string","联系电话不能为空！")||check("mycity","string","项目名称不能为空！")||check("assessment","string","填表人不能为空！")||check("asesdate","string","填表日期不能为空！")||check("birthday","string","出生年月不能为空！")||check("myaddress","string","家庭地址不能为空！")){
	  return false;
  }
  
  
  var memname = document.getElementById("memname").value;	
  var memid = document.getElementById("memid").value;
  
  var memsex = '男';
  if(document.getElementById("memsex1").checked==true){
      memsex='女';
  }
  var creditid = document.getElementById("creditid").value;
  var birthday = document.getElementById("birthday").value;
  //出生年月不能大于当前时间
  var dateTime = new Date();
  var thisdate = dateTime.format('yyyy-MM-dd');
  if(thisdate<birthday){
      alert('出生年月不能大于当前日期');
      return;
  }
  
 
  var culture = document.getElementById("culture").value;
  var professor = '';
  var financial = document.getElementById("financial").value;
  var marry = document.getElementById("marry").value;;
  var kids = '';
  var ways = document.getElementById("ways").value;
  var enterdate = '';
  var reside = document.getElementById("reside").value;
  
  var fees = '';
  var beizhu = document.getElementById("beizhu").value;
   if(!is_positiveInteger(beizhu)){
     alert('收入金额只能为正整数');
     return;
  }
  var mycellnumber = document.getElementById("mycellnumber").value;
  var mylandlinenumber = document.getElementById("mylandlinenumber").value;
  var myaddress = document.getElementById("myaddress").value;
  var mycounty = document.getElementById("mycounty").value;
  var mystreet = document.getElementById("mystreet").value;
  var mycity = document.getElementById("mycity").value;
  var myemail = document.getElementById("myemail").value;
  var mynation = document.getElementById("mynation").value;
  var coname = document.getElementById("coname").value;
  var relationship = document.getElementById("relationship").value;
  var concellnumber = document.getElementById("concellnumber").value;
  var connumber = document.getElementById("connumber").value;
  var conaddress = document.getElementById("conaddress").value;
  var concity = document.getElementById("concity").value;
  var conpost = document.getElementById("conpost").value;
  var concountry = document.getElementById("concountry").value;
  
  var assessment = document.getElementById("assessment").value;
  var asesdate = document.getElementById("asesdate").value;
  
  $.ajax({
			   type: "POST",
			   url: basePath + "/memberaddmem.do?memname="+encodeURI(memname)+"&memid="+encodeURI(memid)+
			   "&memsex="+encodeURI(memsex)+"&creditid="+encodeURI(creditid)+"&birthday="+encodeURI(birthday)+
			   "&culture="+encodeURI(culture)+"&professor="+encodeURI(professor)+"&financial="+
			   encodeURI(financial)+"&marry="+encodeURI(marry)+"&kids="+encodeURI(kids)+"&ways="+
			   encodeURI(ways)+"&enterdate="+enterdate+"&reside="+encodeURI(reside)
			   +"&fees="+encodeURI(fees)+"&mycellnumber="+encodeURI(mycellnumber)+"&mylandlinenumber="+encodeURI(mylandlinenumber)+"&myaddress="+encodeURI(myaddress)+
			   "&mycounty="+encodeURI(mycounty)+"&mystreet="+encodeURI(mystreet)+"&mycity="+encodeURI(mycity)+"&myemail="+
			   encodeURI(myemail)+"&mynation="+encodeURI(mynation)+"&coname="+encodeURI(coname)+"&relationship="+encodeURI(relationship)+"&concellnumber="+encodeURI(concellnumber)
			   +"&connumber="+encodeURI(connumber)+"&conaddress="+encodeURI(conaddress)+"&concity="+encodeURI(concity)+"&conpost="+encodeURI(conpost)+"&concountry="+encodeURI(concountry)+
			   "&assessment="+encodeURI(assessment)+"&asesdate="+encodeURI(asesdate)+"&beizhu="+beizhu,
			   success:function (msg){
			   		var result = msg;
			   		if('success'==result){
			   		 	alert('建表成功');
			   			window.location.href=basePath+"/memberlist.do";
			   		}else if('sameid'==result){
			   		    alert('档案编号不能与之前的会员重复');
			   		}
			   		else{
			   			alert('建表失败');
			   		}
			   },
			   failure:function (){
			   		alert("未知错误！");
			   }	   
   }); 
}
   
</script>
<body>
<div class="topLanBar"><b><br>当前位置：</b>会员管理 > 申请人登记表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form>
   <div id="tab1" align="left" class="fixed_div0">
   <h1>G1.申请人登记表</h1>
   <table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;" >
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="32" colspan="3">AA.申请人姓名及证件号</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="7" ><div align="left">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="75"><div align="left">姓名<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="40"><input type="text"   id="memname"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="7" ><div align="left">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="75" ><div align="left">档案编号<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="40" ><input type="text"   id="memid"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="7" rowspan="4"><div align="left">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="75"  rowspan="4"><div align="left">
      身份证,社保(医保)号码<span style="color:red;">*</span>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >身份证号码</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><input type="text" id="creditid"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >社保(医保)号码</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><input type="text"   id="conpost"/></td>
  </tr>
</table>
</div>
<p></p>
<p></p>
<div id="tab2" align="left" class="fixed_div2">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="32" colspan="3">BB.个人信息</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="17"><div align="left">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="100"><div align="left">性别<span style="color:red;">*</span></div></td>
     <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
		<input id="memsex" name="memsex" type="radio"  class="radio" value="男" checked><label name="memsex" class="checked" for="memsex">男 &nbsp;&nbsp;&nbsp;</label>
        <input id="memsex1" name="memsex" type="radio" class="radio" value="女"><label name="memsex1" for="memsex1">女</label>
     </td>
  </tr>	
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">出生年月<span style="color:red;">*</span></div></td>
     <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" id="birthday" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" /></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">联系电话<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text"   id="mylandlinenumber"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">家庭地址<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea rows="2" cols="20" id="myaddress"></textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">文化程度</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="culture" id="culture" style="width:100px">
      <option value="无" selected>  无  </option>
      <option value="小学">  小学  </option>
      <option value="初中">  初中  </option>
      <option value="高中">  高中  </option>
      <option value="大学及以上">  大学及以上  </option>
    </select><div>1.无 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.小学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.初中 <br/>4.高中 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.大学及以上</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">现居住地</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="mystreet" id="mystreet" style="width:150px">
        <option value="私人住房无护理服务" selected>  私人住房无护理服务  </option>
        <option value="私人住房有护理服务">  私人住房有护理服务  </option>
        <option value="日间中心">  日间中心  </option>
        <option value="养老院">  养老院  </option>
        <option value="其他">  其他  </option>
    </select><div>
        1.私人住房无护理服务<br/> 2.私人住房有护理服务 <br/>3.日间中心<br/> 4.养老院<br/> 5.其他
    </div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">7.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">居住情况</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="reside" id="reside" style="width:180px">
        <option value="独居" selected>  独居  </option>
        <option value="只与配偶及其他人同住">  只与配偶及其他人同住  </option>
        <option value="与子女同住(无配偶)">  与子女同住(无配偶)  </option>
        <option value="与其他人同住(非子女或配偶)">  与其他人同住(非子女或配偶)  </option>
        <option value="与非亲属关系的其他人同住">  与非亲属关系的其他人同住  </option>
    </select><div>
        1.独居 <br/>  2.只与配偶及其他人同住 <br/>3.与子女同住(无配偶)<br/> 4.与其他人同住(非子女或配偶) <br/>5.与非亲属关系的其他人同住   
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">8</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">经济情况</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div><select name="financial" id="financial" style="width:100px">
            <option value="退休金" selected>  退休金  </option>
        	<option value="子女补贴">  子女补贴  </option>
	        <option value="低保及困难家庭">  低保及困难家庭  </option>
	        <option value="其他">  其他  </option>
      </select>
      <div>1.退休金 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.子女补贴 <br/>3.低保及困难家庭 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.其他 </div>
      </div>
      <div>
      金额：
      <input type="text" id="beizhu" size="8" value="0"/>
      RMB</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">9</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">其他联系人</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>姓名：
      <input type="text"   id="coname" size="12"/></div>
      <div>关系：
      <input type="text"   id="relationship" size="12"/>
      </div>
      <div>
    联系地址：
    <input type="text"   id="concellnumber" size="22"/>
   </div>
   <div>
    电话：
    <input type="text"   id="conaddress" size="15"/></div></td>
  </tr>
</table>
</div>
<div></div>
<div></div>
<div align="left" class="fixed_div" id="tab3">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="31" colspan="3">CC.申请人需求</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="17"><div align="left">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="100"><div align="left">申请/再申请时间</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" id="concity" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" /></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">申请原因</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="ways" id="ways" style="width:100px">
         <option value="出院后护理" selected>  出院后护理  </option>
         <option value="社区长期护理">  社区长期护理  </option>
	     <option value="居家服务需求">  居家服务需求  </option>
	     <option value="日间中心">  日间中心  </option>
	     <option value="其他">  其他  </option>
    </select><div>
         1.出院后护理 <br> 2.社区长期护理<br> 3.居家服务需求 <br> 4.日间中心<br> 5.其他
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">服务目标</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="concountry" id="concountry" style="width:130px">
          <option value="专业护理服务">  专业护理服务  </option>
         <option value="定期监护避免意外">  定期监护避免意外  </option>
	     <option value="康复服务">  康复服务  </option>
	     <option value="尊重家人选择">  尊重家人选择  </option>
	     <option value="喘息式照料">  喘息式照料  </option>
    </select>
      <div>
         1.专业护理服务 <br> 2.定期监护避免意外<br> 3.康复服务 <br> 4.尊重家人选择<br> 5.喘息式照料
      </div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">最近一次住院</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="connumber" id="connumber" style="width:100px">
         <option value="180天内住院" selected>  180天内住院  </option>
         <option value="最近一周内">  最近一周内  </option>
	     <option value="最近8-14天内">  最近8-14天内  </option>
	     <option value="15-30天内">  15-30天内  </option>
	     <option value="超过30天">  超过30天  </option>
    </select>
       <div>
         1.180天内住院 <br> 2.最近一周内<br> 3.最近8-14天内 <br> 4.15-30天内<br> 5.超过30天
      </div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">近期内是否入住养老院</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="mynation" id="mynation" style="width:100px">
         <option value="是" selected>  是  </option>
         <option value="否">  否  </option>
    </select>
      <div>
         近两年内是否入住养老院 <br> 1.是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.否
      </div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">是否参与机构项目</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="myemail" id="myemail" style="width:100px">
         <option value="是" selected>  是  </option>
         <option value="否">  否  </option>
    </select><div>
         1.是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.否
      </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">7.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">项目名称</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" id="mycity" /><input type="button" value="选择" onclick="choosePro();"></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">8.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">项目提供服务内容</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><select name="mycounty" id="mycounty" style="width:100px">
         <option value="护理服务" selected>  护理服务  </option>
         <option value="康复服务">  康复服务  </option>
         <option value="日间中心体检">  日间中心体检  </option>
         <option value="其他">  其他  </option>
    </select> <div>
         1.护理服务 <br> 2.康复服务<br> 3.日间中心体检 <br> 4.其他
      </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">9.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">是否免费体验</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div><select name="marry" id="marry" style="width:100px">
           <option value="是" selected>  是  </option>
           <option value="否">  否  </option>
    </select><div>
         1.是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.否
      </div>
    <div>
      次数:
      <input type="text"   id="mycellnumber" size="5"/></div></td>
  </tr>
</table>
<p>
<div><span style="color:red;">*</span>填表人：   
  <input type="text" id="assessment"/>
  </div>
  <div>
<span style="color:red;">*</span>日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" id="asesdate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" /></div>
</p>
</div>

<div align="center" class="fixed_div3" id="tab3">
<table width="100%" border="0">
  <tr align="right">
    <td>&nbsp;</td>
    <td><button onClick="onSubmit()">提交</button> 
		<button onClick="forward('memberlist.do')">返回</button></td>
  </tr>  
  <tr>
    <td align="right">&nbsp;</td>
    <td id="ERROR_MSG">${msg}</td>
  </tr>
</table>
</div>
</form>
<script type="text/javascript">
var labels=document.getElementsByTagName('label');
var radios=document.getElementsByName('memsex');
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

function choosePro(){
    var pname = "mycity";
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
    	document.getElementById(pname).value=arr[1];
    }
  }  
</script>
</body>
</html>

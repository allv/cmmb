<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.wootion.cimp.vo.data.Memberhistory"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员明细</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:901px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}
.menu{width:900px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:301px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.menudiv{width:899px;height:350px;border-left:#A8C29F solid 1px;border-right:#A8C29F solid 1px;border-top:0;background:#fefefe;overflow:auto}
.menudiv div{padding:0px;line-height:15px;}
.off{background:#E0E2EB;color:#336699;font-weight:bold}


.tab2{width:861px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 20px;}
.submenu{width:860px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;}
li{float:left;width:214px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:hidden}
.submenudiv{width:859px;height:170px;border-left:#A8C29F solid 1px;border-right:#A8C29F solid 1px;border-top:0;background:#fefefe}
.submenudiv div{padding:0px;line-height:15px;}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<%
   Memberhistory meb = (Memberhistory)request.getAttribute("mem");
   String issugury = meb.getIssugury();
   String history = meb.getHistory();
   String charactor = meb.getCharactor();
%>
<script type="text/javascript">
var basePath = '<%=basePath%>';
var issugury = '<%=issugury%>';
var history = '<%=history%>';
var charactor = '<%=charactor%>';
function onSubmit(){
 
}

//如果过去史选无，则禁止其他选项
function enableno(){
   var his = document.getElementsByName("history");
   if(his[2].disabled==false){
	   for(i=1;i<his.length;i++){
	       his[i].checked=false;
	       his[i].disabled=true;
	   }
   }else{
       for(i=1;i<his.length-1;i++){
	       his[i].disabled=false;
	   }
   }
}
//如果有其他病史，则选项 " 无 " 应不被勾选
function diablewu(){
   var his = document.getElementsByName("history");
   his[0].checked=false;
}


function disablearea(){
   var no = document.getElementById("nosicked");
   var il = document.getElementById("illhistory");
   var ye = document.getElementById("sicked");
   
   if(no.checked==true&&il.disabled==false){
      il.value="";
      il.disabled = true;
   }else if(no.checked==false&&il.disabled==true){
      il.disabled = false;
   }
   
   ye.checked=false;
}

function enablearea(){
   var no = document.getElementById("nosicked");
   var ye = document.getElementById("sicked");
   var il = document.getElementById("illhistory");
   no.checked=false;
   if(ye.checked==true&&il.disabled==true){
      il.disabled = false;
   }else if(ye.checked==false&&il.disabled==false){
      il.disabled = true;
   }
}

function enabletext(){
   var ch = document.getElementById("checkcharactor");
   var ta = document.getElementById("othercharactor");
   if(ch.checked==true&&ta.disabled==true){
      ta.disabled = false;
   }else if(ch.checked==false&&ta.disabled==false){
      ta.value="";
      ta.disabled = true;
   }
}
var links_len2;
onload=function(){
    setTab('one',1);
	
	var links2 = document.getElementById("tab2").getElementsByTagName('li')
	links_len2=links2.length;
	setTab2('two',1);
	if(issugury==''||typeof(issugury)=='undefined'){
	   document.getElementById('nosicked').checked=true;
	}else{
	   document.getElementById('sicked').checked=true;
	}
	
	var his = document.getElementsByName('history');
	if(history!=''&&typeof(history)!='undefined'){
		var arr = history.split(' ');
		for(i=0;i<arr.length;i++){
		   his[arr[i]-1].checked=true;
		}
	}
	
	var char = document.getElementsByName('charactor');
	var crr = charactor.split(' ');
	if(charactor!=''&&typeof(charactor)!='undefined'){
		for(k=0;k<crr.length-1;k++){
		   char[crr[k]-1].checked=true;
		}
		
		if(crr[crr.length-1]=='5'){
       		document.getElementById('checkcharactor').checked=true;
    	}
	}
	
}

function setTab(name,cursel){
	var cursel_0=cursel;
	for(var i=1; i<=3; i++){
		var menu = document.getElementById(name+i);
		var menudiv = document.getElementById("con_"+name+"_"+i);
		if(i==cursel){
			menu.className="off";
			menudiv.style.display="block";
		}
		else{
			menu.className="";
			menudiv.style.display="none";
		}
	}
}

function setTab2(name,cursel){
	var cursel_0=cursel;
	for(var i=1; i<=links_len2; i++){
		var menu = document.getElementById(name+i);
		var menudiv = document.getElementById("con_"+name+"_"+i);
		if(i==cursel){
			menu.className="off";
			menudiv.style.display="block";
		}
		else{
			menu.className="";
			menudiv.style.display="none";
		}
	}
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>会员管理 > 历史记录</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form>
<div class="tab1" id="tab1">
		<div class="menu">
			<ul>
				<li id="one1" onclick="setTab('one',1)">一.基本信息</li>
				<li id="one2" onclick="setTab('one',2)">二.生活习惯</li>
				<li id="one3" onclick="setTab('one',3)">三.健康状况</li>
			</ul>
		</div>
		<div class="menudiv">
			<div id="con_one_1">
            <table width="899" border="0">
				  <tr>
				    <td width="12%"><div align="right">姓名：</div></td>
				    <td width="15%"><input type="text" id="memname" value="${mem.memname}" disabled/></td>
				    <td width="12%"><div align="right">会员编号：</div></td>
				    <td width="15%"><input type="text" id="memid" value="${mem.memid}" disabled/></td>
				    <td width="46%">备注：</td>
				  </tr>
				  <tr>
				    <td><div align="right">性别：</div></td>
				    <td><input type="text" id="memsex" value="${mem.memsex}" disabled/></td>
				    <td><div align="right">身份证号码：</div></td>
				    <td><input type="text" id="creditid" value="${mem.creditid}" disabled/></td>
				    <td rowspan="6"><div align="left">
				      <textarea name="textarea" cols="50" rows="9" id="beizhu" disabled>${mem.beizhu}</textarea>
				    </div></td>
				  </tr>
				  <tr>
				    <td><div align="right">出生年月：</div></td>
				    <td><input type="text" id="birthday" value="${mem.birthday}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/></td>
				    <td><div align="right">文化程度：</div></td>
				    <td><input type="text" id="culture" value="${mem.culture}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right">曾从事职业：</div></td>
				    <td><input type="text" id="professor" value="${mem.professor}" disabled/></td>
				    <td><div align="right">经济情况：</div></td>
				    <td><input type="text" id="financial" value="${mem.financial}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right">婚姻情况：</div></td>
				    <td><input type="text" id="marry" value="${mem.marry}" disabled/></td>
				    <td><div align="right">生育情况：</div></td>
				    <td><input type="text" id="kids" value="${mem.kids}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right">入会方式：</div></td>
				    <td><input type="text" id="ways" value="${mem.ways}" disabled/></td>
				    <td><div align="right">入会时间：</div></td>
				    <td><input type="text" id="enterdate" value="${mem.enterdate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right">居住情况：</div></td>
				    <td><input type="text" id="reside" value="${mem.reside}" disabled/></td>
				    <td><div align="right">医疗付费：</div></td>
				    <td><input type="text" id="fees" value="${mem.fees}" disabled/></td>
				  </tr>
			</table>
			<div class="tab2" id="tab2">
			<div class="submenu">
				<ul>
					<li id="two1" onclick="setTab2('two',1)">联系方式</li>
					<li id="two2" onclick="setTab2('two',2)">参与项目情况</li>
					<li id="two3" onclick="setTab2('two',3)">康复情况</li>
					<li id="two4" onclick="setTab2('two',4)">护理情况</li>
				</ul>
			</div>
			<div class="submenudiv">
				<div id="con_two_1">
                  <table width="859" border="0">
					  <tr>
					    <td colspan="4">本人联系方式</td>
					    <td colspan="4">紧急联系方式</td>
					  </tr>
					  <tr>
					    <td width="9%"><div align="right">手机：</div></td>
					    <td width="15%"><input type="text" id="mycellnumber" value="${mem.mycellnumber}" disabled/></td>
					    <td width="11%"><div align="right">家庭电话：</div></td>
					    <td width="18%"><input type="text" id="mylandlinenumber" value="${mem.mylandlinenumber}" disabled/></td>
					    <td width="6%"><div align="right">姓名：</div></td>
					    <td width="15%"><input type="text" id="coname" value="${mem.coname}" disabled/></td>
					    <td width="10%"><div align="right">关系：</div></td>
					    <td width="18%"><input type="text" id="relationship" value="${mem.relationship}" disabled/></td>
					  </tr>
					  <tr>
					    <td><div align="right">地址：</div></td>
					    <td colspan="3"><input type="text" size="40" id="myaddress" value="${mem.myaddress}" disabled/></td>
					    <td><div align="right">手机：</div></td>
					    <td><input type="text" id="concellnumber" value="${mem.concellnumber}" disabled/></td>
					    <td><div align="right">电话：</div></td>
					    <td><input type="text" id="connumber" value="${mem.connumber}" disabled/></td>
					  </tr>
					  <tr>
					    <td><div align="right">居/村委：</div></td>
					    <td><input type="text" id="mycounty" value="${mem.mycounty}" disabled/></td>
					    <td><div align="right">街道/镇：</div></td>
					    <td><input type="text" id="mystreet" value="${mem.mystreet}" disabled/></td>
					    <td><div align="right">地址：</div></td>
					    <td colspan="3"><input type="text" size="40" id="conaddress" value="${mem.conaddress}" disabled/></td>
					  </tr>
					  <tr>
					    <td><div align="right">城市：</div></td>
					    <td><input type="text" id="mycity" value="${mem.mycity}" disabled/></td>
					    <td><div align="right">邮箱：</div></td>
					    <td><input type="text" id="myemail" value="${mem.myemail}" disabled/></td>
					    <td><div align="right">城市：</div></td>
					    <td><input type="text" id="concity" value="${mem.concity}" disabled/></td>
					    <td><div align="right">邮编：</div></td>
					    <td><input type="text" id="conpost" value="${mem.conpost}" disabled/></td>
					  </tr>
					  <tr>
					    <td><div align="right">国家：</div></td>
					    <td colspan="3"><input type="text" size="40" id="mynation" value="${mem.mynation}" disabled/></td>
					    <td><div align="right">国家：</div></td>
					    <td colspan="3"><input type="text" size="40" id="concountry" value="${mem.concountry}" disabled/></td>
					  </tr>
					</table>
                </div>
				<div id="con_two_2" style="display:none;"><table width="811" border="0">
				<tr>
				    <td height="70"><div align="left">描述：
				        <textarea name="textarea7" id="procondition" cols="100" rows="5" disabled>${mem.procondition}</textarea>
				    </div></td>
				  </tr>
				</table>
				
				</div>
				<div id="con_two_3" style="display:none;">
				<table width="811" border="0">
				  <tr>
				    <td width="257"><div align="right">康复评估次数：
				      <input type="text" id="kfestimatetimes" value="${mem.kfestimatetimes}" disabled/>
				    </div></td>
				    <td width="255"><div align="right">康复评估时间：
				      <input type="text" id="kfestimatedate" value="${mem.kfestimatedate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/>
				    </div></td>
				    <td width="285"><div align="right">康复起止时间：
				      <input type="text" id="kfstartdate" value="${mem.kfstartdate}" size="12" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/>
				      -
				      <input type="text" id="kfenddate" value="${mem.kfenddate}" size="12" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/>
				    </div></td>
				  </tr>
				  <tr>
				    <td><div align="right">康复次数：
				      <input type="text" id="kfservicetimes" value="${mem.kfservicetimes}" disabled/>
				    </div></td>
				    <td><div align="right">康复方式：
				      <input type="text" id="kfways" value="${mem.kfways}" disabled/>
				    </div></td>
				    <td><div align="right">康复效果：
				      <input type="text" id="kfeffect" value="${mem.kfeffect}" disabled/>
				    </div></td>
				  </tr>
				  <tr>
				    <td height="25"><div align="right">收费情况：
				      <input type="text" id="kffee" value="${mem.kffee}" disabled/>
				    </div></td>
				    <td><div align="right">康复治疗师：
				      <input type="text" id="kfcarer" value="${mem.kfcarer}" disabled/>
				    </div></td>
				    <td><div align="right">康复医生：
				      <input type="text" id="kfdoctor" value="${mem.kfdoctor}" disabled/>
				    </div></td>
				  </tr>
				  <tr>
				    <td height="70" colspan="3"><div align="left">备注：
				        <textarea name="textarea7" cols="100" rows="5" id="kfbeizhu" disabled>${mem.kfbeizhu}</textarea>
				    </div></td>
				  </tr>
				</table>
				</div>
				<div id="con_two_4" style="display:none;">
				<table width="811" border="0">
				  <tr>
				    <td width="257"><div align="right">护理评估次数：
				      <input type="text" id="hlesttimes" value="${mem.hlesttimes}" disabled/>
				    </div></td>
				    <td width="255"><div align="right">护理评估时间：
				      <input type="text" id="hlestdate"  value="${mem.hlestdate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/>
				    </div></td>
				    <td width="285"><div align="right">护理起止时间：
				      <input type="text" size="12"  value="${mem.hlstartdate}" id="hlstartdate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/>
				      -
				      <input type="text" size="12" value="${mem.hlenddate}" id="hlenddate" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" disabled/>
				    </div></td>
				  </tr>
				  <tr>
				    <td><div align="right">护理次数：
				      <input type="text" id="hltimes" value="${mem.hltimes}" disabled/>
				    </div></td>
				    <td><div align="right">护理方式：
				      <input type="text" id="hlways" value="${mem.hlways}" disabled/>
				    </div></td>
				    <td><div align="right">护理效果：
				      <input type="text" id="hleffect" value="${mem.hleffect}" disabled/>
				    </div></td>
				  </tr>
				  <tr>
				    <td height="25"><div align="right">收费情况：
				      <input type="text" id="hlfee" value="${mem.hlfee}" disabled/>
				    </div></td>
				    <td><div align="right">护理人员：
				      <input type="text" id="hlemployee" value="${mem.hlemployee}" disabled/>
				    </div></td>
				    <td><div align="right">
				     
				    </div></td>
				  </tr>
				  <tr>
				    <td height="70" colspan="3"><div align="left">备注：
				        <textarea name="textarea7" id="hlbeizhu"  cols="100" rows="5" disabled>${mem.hlbeizhu}</textarea>
				    </div></td>
				  </tr>
				</table>
				</div>
			</div>
			</div>
            </div>
			<div id="con_one_2" style="display:none;">
			  <table width="899" border="0">
				  <tr>
				    <td width="14%"><div align="left">性格特征</div></td>
				    <td width="36%">&nbsp;</td>
				    <td width="18%">吸烟史</td>
				    <td width="32%">&nbsp;</td>
				  </tr>
				  <tr>
				    <td><div align="right">性格描述：</div></td>
				    <td><p>
				        <input type="checkbox" class="checkBox1"  id="charactor" name="charactor" disabled/>
				      	稳重
				        <input type="checkbox" class="checkBox1"  id="charactor" name="charactor" disabled/>
				         开朗
				        <input type="checkbox" class="checkBox1"  id="charactor" name="charactor" disabled/>
						易急躁
						<input type="checkbox" class="checkBox1"  id="charactor" name="charactor" disabled/>
						易怒
						</p>
						      <p>
				    <input type="checkbox" class="checkBox1"  id="checkcharactor" name="checkcharactor" disabled/>
				        其他<input type="text" name="othercharactor" id="othercharactor" value="${mem.othercharactor}" disabled />
				    </p></td>
				    <td><div align="right">吸烟史：</div></td>
				    <td><input type="text" id="smoke" value="${mem.smoke}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right">兴趣爱好：</div></td>
				    <td rowspan="3"><textarea name="textarea2" cols="50" rows="3" id="interest" disabled>${mem.interest}</textarea></td>
				    <td><div align="left">睡眠状况</div></td>
				    <td>&nbsp;</td>
				  </tr>
				  <tr>
				    <td><div align="right"></div></td>
				    <td><div align="right">睡眠状况：</div></td>
				    <td><input type="text" id="sleep" value="${mem.sleep}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right"></div></td>
				    <td><div align="right"></div></td>
				    <td>&nbsp;</td>
				  </tr>
				  <tr>
				    <td><div align="left">饮食习惯</div></td>
				    <td>&nbsp;</td>
				    <td><div align="left">锻炼情况</div></td>
				    <td>&nbsp;</td>
				  </tr>
				  <tr>
				    <td><div align="right">食物烹饪要求：</div></td>
				    <td><input type="text" id="apetite" value="${mem.apetite}" disabled/></td>
				    <td><div align="right">锻炼状况：</div></td>
				    <td><input type="text" id="execise" value="${mem.execise}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right">饮食禁忌：</div></td>
				    <td><input type="text" id="contraband" value="${mem.contraband}" disabled/></td>
				    <td><div align="left">就医方式</div></td>
				    <td>&nbsp;</td>
				  </tr>
				  <tr>
				    <td><div align="left">饮酒史</div></td>
				    <td>&nbsp;</td>
				    <td><div align="right">就医方式：</div></td>
				    <td><input type="text" id="medicalcare" value="${mem.medicalcare}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right">饮酒史：</div></td>
				    <td><input type="text" id="drunk" value="${mem.drunk}" disabled/></td>
				    <td><div align="right">习惯就诊医院：</div></td>
				    <td>1)
				    <input type="text" id="hospital1" value="${mem.hospital1}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right"></div></td>
				    <td>&nbsp;</td>
				    <td><div align="right"></div></td>
				    <td>2)
				      <input type="text" id="hospital2" value="${mem.hospital2}" disabled/></td>
				  </tr>
				  <tr>
				    <td><div align="right"></div></td>
				    <td>&nbsp;</td>
				    <td><div align="right"></div></td>
				    <td>3)
				      <input type="text" id="hospital3" value="${mem.hospital3}" disabled/></td>
				  </tr>
				  </table>
			</div>
			<div id="con_one_3" style="display:none;">
			  <table width="899" border="0">
			  <tr>
			    <td width="11%">个人史：<br><br></td>
			    <td colspan="3">&nbsp;<br><br></td>
			    <td colspan="2">过去史：<br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">血型：</div><br><br></td>
			    <td colspan="3"><input type="text" size="50" id="blood" value="${mem.blood}" disabled/><br><br></td>
			    <td colspan="2"><input type="checkbox" class="checkBox1"  id="history" name="history" onclick="enableno()" disabled/>
			无
			  <input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			脑血管疾病
			<input type="checkbox" class="checkBox1" id="history" name="history" onclick="diablewu()" disabled/>
			慢性疼痛病<br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">过敏史：</div><br><br></td>
			    <td colspan="3"><input type="text" size="50" id="allergic" value="${mem.allergic}" disabled/><br><br></td>
			    <td colspan="2"><input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			高血压
			  <input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			心血管疾病
			<input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			白内障<br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">过敏史说明：</div><br><br></td>
			    <td colspan="3" rowspan="3"><textarea name="textarea4" cols="40" rows="3" id="allergicdesc" disabled>${mem.allergicdesc}</textarea><br><br></td>
			    <td colspan="2"><input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			便秘
			  <input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			老年性脑萎缩(ADL)
			<input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			弱视<br><br></td>
			  </tr>
			  <tr>
			    <td>&nbsp;<br><br></td>
			    <td colspan="2"><input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			糖尿病
			  <input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			帕金森症
			<input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			弱听<br><br></td>
			  </tr>
			  <tr>
			    <td>&nbsp;<br><br></td>
			    <td colspan="2"><input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			心脏病
			  <input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			骨关节疾病
			<input type="checkbox" class="checkBox1"  id="history" name="history" onclick="diablewu()" disabled/>
			其他...<br><br></td>
			  </tr>
			  <tr>
			    <td>一般检查：<br><br></td>
			    <td colspan="2">&nbsp;<br><br></td>
			    <td width="23%">&nbsp;<br><br></td>
			    <td colspan="2">过去史备注：<br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">心率：</div><br><br></td>
			    <td width="15%"><input type="text" id="heartbeat" value="${mem.heartbeat}" disabled/><br><br></td>
			    <td width="12%"><div align="right">脉搏：</div><br><br></td>
			    <td><input type="text" id="pulse" value="${mem.pulse}" disabled/><br><br></td>
			    <td colspan="2" rowspan="3"><textarea name="textarea5" cols="40" rows="3" id="historybak" disabled>${mem.historybak}</textarea><br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">呼吸 ：</div><br><br></td>
			    <td><input type="text" id="breath" value="${mem.breath}" disabled/><br><br></td>
			    <td><div align="right">血压：</div><br><br></td>
			    <td><input type="text" id="bloodpressure"  value="${mem.bloodpressure}" disabled/><br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">空腹血糖：</div><br><br></td>
			    <td><input type="text" id="bloodsugar" value="${mem.bloodsugar}" disabled/><br><br></td>
			    <td><div align="right">血脂：</div><br><br></td>
			    <td><input type="text" id="bloodfat" value="${mem.bloodfat}" disabled/><br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">视力：</div><br><br></td>
			    <td><input type="text" id="view" value="${mem.view}" disabled/><br><br></td>
			    <td><div align="right">听力：</div><br><br></td>
			    <td><input type="text" id="hear" value="${mem.hear}" disabled/><br><br></td>
			    <td colspan="2">手术史：<br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">骨密度检查：</div><br><br></td>
			    <td><input type="text" id="bone" value="${mem.bone}" disabled/><br><br></td>
			    <td><div align="right">心电图：</div><br><br></td>
			    <td><input type="text" id="heartelec" value="${mem.heartelec}" disabled/><br><br></td>
			    <td colspan="2"><div align="left">
			        <input type="radio" class="radio" name="nosicked" id="nosicked" disabled/>
			        无
			    </div><br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">肝功能检查：</div><br><br></td>
			    <td colspan="3"><input type="text" size="50" id="liver" value="${mem.liver}" disabled/><br><br></td>
			    <td colspan="2" rowspan="3"><div align="left">
			        <input type="radio" class="radio" id="sicked" name="sicked" disabled/>
			        有
			        <textarea name="textarea6" id="illhistory" name="illhistory" cols="40" rows="3" disabled>${mem.issugury}</textarea>
			    </div><br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">乙肝表杭检查：</div><br><br></td>
			    <td colspan="3"><input type="text" size="50" id="yiliver" value="${mem.yiliver}" disabled/><br><br></td>
			  </tr>
			  <tr>
			    <td><div align="right">肾功能检查：</div><br><br></td>
			    <td colspan="3"><input type="text" size="50" id="kidney" value="${mem.kidney}" disabled/><br><br></td>
			  </tr>
			</table>			
			</div>
		</div>
</div>

<table width="100%" border="0">
  <tr>
    <td width="7%"><div align="right">评估人：</div></td>
    <td width="13%"><div align="left">
      <input type="text" id="assessment" value="${mem.assessment}" disabled/>
    </div></td>
    <td width="8%"><div align="right">评估日期：</div></td>
    <td width="13%"><div align="left">
      <input type="text" class="Wdate" id="asesdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" value="${mem.asesdate}" disabled/>
    </div></td>
    <td width="7%"><div align="right">修改人：</div></td>
    <td width="13%"><div align="left">
      <input type="text" id="submitman" value="${mem.submitman}" disabled/>
    </div></td>
    <td width="8%"><div align="right">修改日期：</div></td>
    <td width="13%"><div align="left">
      <input type="text" class="Wdate" id="submitdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',disabled:true})" value="${mem.submitdate}" disabled/>
    </div></td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="forward('memberhislist.do')">返回</button></td>
  </tr>  
</table>
</form>
</body>
</html>

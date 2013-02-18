<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cmmb.persistenc.po.bean.recoveryAssess"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康复评估系列表</title>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../install_lodop32.exe"></embed>
</object>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:885px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}

.fixed_div1{ 
position:absolute; 
left:162px; 
top:60px;
width:730px; 
bottom:0;
}

.fixed_div2{ 
position:absolute; 
left:162px; 
top:240px;
width:730px; 
bottom:0;
}
.fixed_div3{ 
position:absolute; 
left:162px; 
top:440px;
width:410px; 
bottom:0;
}
.fixed_div4{ 
position:absolute; 
left:542px; 
top:457px;
width:410px; 
bottom:0;
}
.fixed_div5{ 
position:absolute; 
left:162px; 
top:860px;
width:410px; 
bottom:0;
}
.fixed_div6{ 
position:absolute; 
left:542px; 
top:860px;
width:410px; 
bottom:0;
}
.fixed_div7{ 
position:absolute; 
left:162px; 
top:1660px;
width:410px; 
bottom:0;
}

.fixed_div8{ 
position:absolute; 
left:542px; 
top:1660px;
width:410px; 
bottom:0;
}
.fixed_div9{ 
position:absolute; 
left:312px; 
top:5240px;
width:410px; 
bottom:0;
}
.fixed_div10{ 
position:absolute; 
left:162px; 
top:2280px;
width:730px; 
bottom:0;
}
.fixed_div11{ 
position:absolute; 
left:162px; 
top:2480px;
width:730px; 
bottom:0;
}
.fixed_div12{ 
position:absolute; 
left:162px; 
top:3140px;
width:730px; 
bottom:0;
}

.fixed_div13{ 
position:absolute; 
left:162px; 
top:3630px;
width:730px; 
bottom:0;
}
.fixed_div14{ 
position:absolute; 
left:162px; 
top:3760px;
width:730px; 
bottom:0;
}

.fixed_div15{ 
position:absolute; 
left:162px; 
top:4360px;
width:730px; 
bottom:0;
}

.divadd1{ 
position:absolute; 
left:162px; 
top:4690px;
width:130px; 
bottom:0;
}

.fixed_div16{ 
position:absolute; 
left:162px; 
top:4710px;
width:730px; 
bottom:0;
}



.divadd{ 
position:absolute; 
left:162px; 
top:3740px;
width:130px; 
bottom:0;
}
</style>
</head>
<body>

<div class="topLanBar"><b>当前位置：</b>康复管理 > 康复评估系列表</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div id="floatdiv" style="width:120px;height:40px;position:absolute;right:20px;top:80px;background:#FFCC00;border:1px solid #999;">
   <table>
    <tr>
        <td>
   			<a href="javascript:document.getElementById('div1').focus();"><span style="color:blue">G4.1</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('div10').focus();"><span style="color:blue">G4.2</span></a>
   		</td>
   		 <td>
   			<a href="javascript:document.getElementById('div13').focus();"><span style="color:blue">G4.3</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('div15').focus();"><span style="color:blue">H4</span></a>
   		</td>
   </table>
</div>
<script type="text/javascript">
<!--
  var div = document.getElementById("floatdiv");
  var y = parseInt(div.style.top);
  setInterval(function(){
  var cy = parseInt(div.style.top);
  var dy = document.body.scrollTop || document.documentElement.scrollTop;
  div.style.top = (cy + (dy -(cy-y))*0.1) + "px";
 },10);
//-->
</script>
<table>
   <tr>
      <td>
         <a href="javascript:prn1_preview()"><span style="color:blue">打印预览</span></a>,其布局风格可<a href="javascript:prn1_manage();"><span style="color:blue">打印维护</span></a>调整,或者也可以<a href="javascript:printit()"><span style="color:blue">直接打印</span></a>
      </td>
   </tr>
</table>
<form  method="post">
<div align="left" id="div1" class="fixed_div1">
<div>G4.1康复评估与康复计划</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="127">姓名</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="205"><input type="text" name="memname" id="memname" value="${recovery.memname}" readonly/><input type="button" value="选择" onclick="chooseElders();"></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="130" rowspan="4"><div align="center">评估原因</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="240" rowspan="4"><div>评估类型：
         <select name="a1" id="a1">
           <option value="首次评估" ${recovery.a1 == '首次评估' ? "selected" : ""}>首次评估</option>
	       <option value="后续评估" ${recovery.a1 == '后续评估' ? "selected" : ""}>后续评估</option>
	       <option value="阶段评估" ${recovery.a1 == '阶段评估' ? "selected" : ""}>阶段评估</option>
	       <option value="出院后评估" ${recovery.a1 == '出院后评估' ? "selected" : ""}>出院后评估</option>
	       <option value="其他" ${recovery.a1 == '其他' ? "selected" : ""}>其他</option>
      </select>
    </div>
    <div>1、首次评估</div>
    <div>2、后续评估(如：项目终期)</div>
    <div>3、阶段评估(更新最近一次评估)</div>
    <div>4、出院后评估</div>
    <div>5、其他</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">档案编号</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text"  name="recoverynumber" id="recoverynumber" value="${recovery.recoverynumber}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">会员编号(如有)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="memgender" id="memgender" value="${recovery.memgender}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="47">评估人员签字</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="assesman" id="assesman" value="${recovery.assesman}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员职务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="memage" id="memage" value="${recovery.memage}"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">评估日期</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="assesdate" id="assesdate" value="${recovery.assesdate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
      (年/月/日)</td>
  </tr>
</table>
</div>
<div align="left" id="div2" class="fixed_div2">
<div>A、健康情况（根据G2.健康评估表 I.疾病诊断）</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;"> 
  <tr>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   width="218"><div>骨科疾病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a2" id="a2"/>
    关节病变和损伤</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a3" id="a3"/>
      骨折恢复</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a4" id="a4"/>
      颈椎病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a5" id="a5"/>
      腰椎病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a6" id="a6"/>
      骨质疏松症
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   width="161"><div>神经疾病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a7" id="a7"/>
      脑卒中</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a8" id="a8"/>
      帕金森症</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a9" id="a9"/>
      老年性脑萎缩</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a10" id="a10"/>
      脑外伤
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   width="148"><div>内科疾病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a11" id="a11"/>
      高血压</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a12" id="a12"/>
      糖尿病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a13" id="a13"/>
      慢性支气管炎</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a14" id="a14"/>
      哮喘
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   width="175"><div>其他疾病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a15" id="a15"/>
      癌症康复</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a16" id="a16"/>
      心理与精神疾病
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   colspan="4"><div>备注：(对以上未列入疾病进行描述或对某项疾病进行详细补充)</div>
    <div>
      <textarea name="a17" id="a17" cols="100" rows="3" >${recovery.a17}</textarea>
    </div></td>
  </tr>
</table>
</div>

<div align="left" id="div3" class="fixed_div3">
<div>B、康复评定项目</div>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="23" rowspan="2"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="101" rowspan="2"><div align="center">意识</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="204">填写与意识情况相关编号
      <select name="a18" id="a18" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
      </select>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>0、清晰</div>
    <div>1、嗜睡</div>
    <div>2、昏迷</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">认知功能</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>根据G2健康评估表/B认知功能评定内容填写：0、正常 1、异常</div>
    <div>记忆力
      <select name="a19" id="a19" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      注意力
       <select name="a20" id="a20" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">感觉功能</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>选择以下编号填写下方感觉检查0、正常 1、异常</div>
    <div>a.浅感觉检查</div>
    <div>触觉
       <select name="a21" id="a21" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      温度觉
     <select name="a22" id="a22" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>痛觉
      <select name="a23" id="a23" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      压觉
     <select name="a24" id="a24" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>b.深感觉检查</div>
    <div>运动觉
      <select name="a25" id="a25" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      振动觉
      <select name="a26" id="a26" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>位置觉
       <select name="a27" id="a27" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>c.符合感觉检查</div>
    <div>皮肤定位觉
      <select name="a28" id="a28" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      </div>
    <div>图形觉
 <select name="a29" id="a29" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    实体觉
    <select name="a30" id="a30" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>两点辨别觉
        <select name="a31" id="a31" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>其他大脑皮质感觉
       <select name="a32" id="a32" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div></td>
  </tr>
</table>
</div>
<div  align="left" id="div4" class="fixed_div4">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="25"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="98"><div align="center">疼痛</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="205"><div>根据G2健康评估表/J健康干预/4.疼痛内容进行打钩</div>
    <div>a.疼痛部位</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a33" id="a33"/>
      头部  
      <input type="checkbox" class="checkBox1"  name="a34" id="a34"/>
      肩关节</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a35" id="a35"/>
      颈椎
      <input type="checkbox" class="checkBox1"  name="a36" id="a36"/>
      髋关节</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a37" id="a37"/>
      腰部
      <input type="checkbox" class="checkBox1"  name="a38" id="a38"/>
      膝关节</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a39" id="a39"/>
      其他
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><div align="center">平衡功能</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>选择以下编号填写下方检查：</div>
    <p>0、I级平衡是指在静态下不借助外力，患者可以保持坐位或站立位平衡</p>
    <p>1、II级平衡是指在支撑面不动(坐位或站立位)身体某个或几个部位运动时可以保持平衡</p>
    <p>2、III级平衡是指患者在外力作用或外来干扰下仍可以保持坐位或站立平衡</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>坐位平衡：
        <select name="a40" id="a40">
            <option value="0" selected>0</option>
	        <option value="1">1</option>
	        <option value="2">2</option>
        </select>
    </div>
    <div>站位平衡：
      <select name="a41" id="a41">
            <option value="0" selected>0</option>
	        <option value="1">1</option>
	        <option value="2">2</option>
        </select>
    </div></td>
  </tr>
</table>
</div>
<div align="left" id="div5" class="fixed_div5">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="25"><div align="center">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="91"><div align="center">肢体肿胀</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="212"><div>在以下肿胀部位打钩</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a42" id="a42"/>
      左上肢
      <input type="checkbox" class="checkBox1"  name="a43" id="a43"/>
右上肢</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a44" id="a44"/>
左下肢
     <input type="checkbox" class="checkBox1"  name="a45" id="a45"/>
右下肢</div>
    <div>
    <input type="checkbox" class="checkBox1"  name="a46" id="a46"/>
其他
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">7.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">关节活动度</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>根据G4.2关节活动度及徒手肌力评定表内容填写：0.正常</div>
      <div>1.异常</div>
      <div>
       <select name="a47" id="a47" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
肩关节
<select name="a48" id="a48" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
髋关节</div>
      <div>
       <select name="a49" id="a49" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
肘关节
<select name="a50" id="a50" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
膝关节</div>
      <div>
      <select name="a51" id="a51" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
腕关节
<select name="a99" id="a99" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
</select>
踝关节 </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">8.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">肌肉力量</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>根据G4.2关节活动度及徒手肌力评定表内容填写：0、正常 1、减弱</div>
    <div>
      <select name="a100" id="a100" style="width:50px">
       <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
上肢 
<select name="a52" id="a52" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
下肢</div>
    <div>
    <select name="a53" id="a53" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      肱二头肌
     <select name="a54" id="a54" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      髂腰肌</div>
    <div>
     <select name="a55" id="a55" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    肱三头肌
  <select name="a56" id="a56" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    股四头肌</div>
    <div>
     <select name="a57" id="a57" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      前臂伸腕肌群
    <select name="a58" id="a58" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      股二头肌</div>
    <div>
     <select name="a59" id="a59" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      前臂屈腕肌群
    <select name="a60" id="a60" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      胫前肌
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">9.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">转移能力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>选择以下编号填写：0、正常1、异常</div>
    <div>床-椅，轮椅
     <select name="a61" id="a61" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>浴缸、沐浴
     <select name="a62" id="a62" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>入厕
     <select name="a63" id="a63" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      卧床翻身
       <select name="a64" id="a64" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="6"><div align="center">10.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="6"><div align="center">步态检查</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择以下编号填写：
      <select name="a65" id="a65" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >0.正常</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >1.常见的异常步态：足内翻、足外翻、足下垂、足趾卷曲、拇指背伸、膝塌陷步态、膝僵直、膝过伸、髋过屈、髋内收过度、髋屈曲不足</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >2.外周神经损伤导致的异常步态：臀大肌步态、臀中肌步态、屈髋肌无力步态、股四头肌无力步态、踝背屈肌无力步态、腓肠肌/比目鱼肌无力步态</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>3.中枢神经疾病常见的异常步态：</div>
    <div>偏瘫：划圈步态</div>
    <div>脑性瘫痪：剪刀步态</div>
    <div>帕金森病：慌张步态</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >4.卧床</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">11.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">辅助工具</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在以下选项中打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>
         <input type="checkbox" class="checkBox1"  name="a66" id="a66"/>
    不需要 
     <input type="checkbox" class="checkBox1"  name="a67" id="a67"/>
    拐杖</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a68" id="a68"/>
      手仗 
       <input type="checkbox" class="checkBox1"  name="a69" id="a69"/>
      矫形器</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a70" id="a70"/>
      辅助器 
     <input type="checkbox" class="checkBox1"  name="a71" id="a71"/>
      轮椅</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a72" id="a72"/>
      假肢 
      <input type="checkbox" class="checkBox1"  name="a73" id="a73"/>
      平车</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a74" id="a74"/>
      手仗 
      <input type="checkbox" class="checkBox1"  name="a75" id="a75"/>
      其他
    </div></td>
  </tr>
</table>
</div>

<div align="left" id="div6" class="fixed_div6">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="24"><div align="center">12.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="102"><div align="center">言语功能</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="202"><p>填写与意识情况相关编号：
      <select name="a76" id="a76" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </p>
    <p>0、正常 1、异常</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">13.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">工具性日常活动能力评定</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >根据G2健康评估表/G身体机能/IADL分值填写
    <input type="text" size="7" name="a77" id="a77"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">14.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">生活自理能力评定</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >根据G2健康评估表/G身体机能/ADL分值填写
    <input type="text" size="7" name="a78" id="a78"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="3"><p>15.特殊评估：</p>
    <p>针对偏瘫、截瘫、痉挛症状评定</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="5">15.1</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div align="center">Brunstrom运动功能评定(偏瘫)</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">a.手
     <select name="a79" id="a79" style="width:50px">
          <option value="1" selected>1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
	      <option value="6">6</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><p>填写与以下手部特点相似编号</p>
    <div>1、无随意运动，无任何运动</div>
    <div>2、引起联合反应、共同运动：仅有极细微的屈曲</div>
    <div>3、随意出现的共同运动：可有钩状抓握，但不能伸指</div>
    <div>4、共同运动模式打破，开始出现分离运动：能侧捏及松开拇指，手指有半随意的小范围伸展</div>
    <div>5、肌张力逐渐恢复，有分离精细运动：可作球状和圆柱状抓握，手指同时伸展，但不能单独伸展</div>
    <div>6、运动接近正常水平：所有抓握均能完成，但速度和准确比健侧差</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">b.上肢
      <select name="a80" id="a80" style="width:50px">
          <option value="1" selected>1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
	      <option value="6">6</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div>填写与以下手部特点相似编号</div>
    <div>1.无随意运动，无任何运动</div>
    <div>2.引起联合反应、共同运动：仅出现协同运动模式</div>
    <div>3.随意出现的共同运动：可随意发起协同运动</div>
    <div>4.共同运动模式打破，开始出现分离运动：出现脱离协同运动的活动：肩0度,肘屈90度的条件下,前臂可旋前,旋后;肘伸直的情况下,肩可前屈90度;手臂可触及腰骶部</div>
    <div>5.肌张力逐渐恢复,有分离精细运动:出现相对独立于协同运动的活动:肘伸直,肩前屈30度-90度时,前臂可旋前旋后;肘伸直,前臂中立位,上肢可举过头</div>
     <div>6.运动接近正常水平:运动协调近于正常,手指指鼻无明显辨距不良,但速度比健侧慢(<=5秒)</div></td>
  </tr>
</table>
</div>

<div align="left" id="div7" class="fixed_div7">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="28" rowspan="2"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">c.下肢
      <select name="a81" id="a81" style="width:50px">
          <option value="1" selected>1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
	      <option value="6">6</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div>填写与以下手部特点相似编号</div>
    <div>1.无随意运动,无任何运动</div>
    <div>2.引起联合反应,共同运动:仅有极少的随意运动</div>
    <div>3.随意出现的共同运动:在坐和站立位上,有髋,膝,踝的协同性屈曲</div>
    <div>4.共同运动模式打破,开始出现分离运动:出现脱离协同运动的活动:在坐位上,可屈膝90度以上,足可向后滑动.在足跟不离地的情况下踝能背屈</div>
    <div>5.肌张力逐渐恢复,有分离精细运动:健腿站立,病腿可先屈膝,后伸髋;伸膝下,踝可背屈</div>
    <div>6.运动接近正常水平:在站立位可使髋外展到抬起该侧骨盆所能达到的范围;坐位下,伸直膝可内外旋下肢,合并足内外翻</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3"><div align="center">15.2</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div align="center">ASIA残损分级(偏瘫)</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">a.残损程度
      <select name="a82" id="a82" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><p>填写与以下手部特点相似编号</p>
    <div>0.正常,感觉和运动功能正常</div>
    <div>1.不完全性损伤,损伤平面下存在运动功能,平面以下至少一半关键肌力&gt;=3级</div>
    <div>2.不完全性损伤,损伤平面下存在运动功能,平面以下一半以上关键肌力&lt;3级</div>
    <div>3.不完全性损伤,损伤平面下,包括S4-S5,有感觉功能但无运动功能</div>
    <div>4.完全性损伤,S4-S5无感觉和运动功能</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3"><div align="center">15.3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div align="center">Ashworth痉挛评定</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="132">上肢
        <select name="a83" id="a83" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
      </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="168">下肢
      <select name="a84" id="a84" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><p>填写与以下手部特点相似编号</p>
    <div>0.0级:无肌张力的增加</div>
    <div>1.1级:肌张力轻微增加:受累部分被动屈伸时,ROM之末出现突然的卡住然后释放或出现最小的阻力</div>
    <div>2.1+级:肌张力轻度增加:被动屈伸时,在ROM后50%范围内突然出现卡住,当继续把ROM检查进行到底时,始终有小的阻力</div>
    <div>3.II级:肌张力较明显增加:通过ROM的大部分时,阻力均较明显地增加,但受累部分仍能较容易地移动</div>
    <div>4.III级:肌张力严重增高:进行PROM检查有困难</div>
	<div>5.IV级:僵直:受累部分被动屈伸时呈现僵直状态,不能活动</div>
    </td>
  </tr>
</table>
</div>
<div align="left" id="div8" class="fixed_div8">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="26" rowspan="2"><div align="center">16.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="82" rowspan="2"><div align="center">理疗禁忌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="220">在以下选项中打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><p>
        <input type="checkbox" class="checkBox1"  name="a85" id="a85"/>
      恶性肿瘤</p>
      <p>
       <input type="checkbox" class="checkBox1"  name="a86" id="a86"/>
      肝功能严重障碍</p>
      <p>
       <input type="checkbox" class="checkBox1"  name="a87" id="a87"/>
      心力衰竭</p>
      <p>
         <input type="checkbox" class="checkBox1"  name="a88" id="a88"/>
      理疗部位化脓或出血</p>
      <p>
         <input type="checkbox" class="checkBox1"  name="a89" id="a89"/>
      肺结核</p>
      <p>
         <input type="checkbox" class="checkBox1"  name="a90" id="a90"/>
        其他
      </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">17.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">康复需求</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >是否需要康复服务:
      <select name="a91" id="a91" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >0.不需要 1.需要</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">18.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">医生评估建议</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><textarea name="a92" id="a92" cols="30">${recovery.a92}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="5"><div align="center">19.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="5"><div align="center">康复服务计划</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >在以下康复方式选项中打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  > <input type="checkbox" class="checkBox1"  name="a101" id="a101"/>
      上门康复
      <input type="checkbox" class="checkBox1"  name="a93" id="a93"/>
      定点康复</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >在以下康复内容选项中打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><p>
       <input type="checkbox" class="checkBox1"  name="a94" id="a94"/>
      理疗 
    <input type="checkbox" class="checkBox1"  name="a95" id="a95"/>
      器械康复</p>
      <p>
       <input type="checkbox" class="checkBox1"  name="a96" id="a96"/>
        功能训练
       <input type="checkbox" class="checkBox1"  name="a97" id="a97"/>
        言语治疗
      </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div>康复计划补充:</div>
    <div>
      <textarea name="a98" id="a98" cols="30">${recovery.a98}</textarea>
    </div></td>
  </tr>
</table>
</div>
<div align="left" id="div10" class="fixed_div10">
<p>G4.2关节活动度及徒手肌力评定</p>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="127">姓名</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="205"><input type="text" name="a276" id="a276" value="${recovery.a276}"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="130" rowspan="4"><div align="center">评估原因</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width ="240" rowspan="4"><div>评估类型：
         <select name="a102" id="a102">
           <option value="首次评估" ${recovery.a102 == '首次评估' ? "selected" : ""}>首次评估</option>
	       <option value="后续评估" ${recovery.a102 == '后续评估' ? "selected" : ""}>后续评估</option>
	       <option value="阶段评估" ${recovery.a102 == '阶段评估' ? "selected" : ""}>阶段评估</option>
	       <option value="出院后评估" ${recovery.a102 == '出院后评估' ? "selected" : ""}>出院后评估</option>
	       <option value="其他" ${recovery.a102 == '其他' ? "selected" : ""}>其他</option>
      </select>
    </div>
    <div>1、首次评估</div>
    <div>2、后续评估(如：项目终期)</div>
    <div>3、阶段评估(更新最近一次评估)</div>
    <div>4、出院后评估</div>
    <div>5、其他</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">档案编号</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text"  name="a103" id="a103" value="${recovery.a103}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">会员编号(如有)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a104" id="a104" value="${recovery.a104}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="47">评估人员签字</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a105" id="a105" value="${recovery.a105}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员职务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a106" id="a106" value="${recovery.a106}"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">评估日期</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a107" id="a107" value="${recovery.a107}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
      (年/月/日)</td>
  </tr>
</table>
</div>

<div align="left" id="div11" class="fixed_div11">
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="9"><div align="center">上肢ROM(关节活动度)及徒手肌力(MM-T)</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div align="center">右侧</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="60" rowspan="2"><div align="center">部位</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="73" rowspan="2"><div align="center">检查项目</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="101" rowspan="2"><div align="center">ROM正常值</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="163" rowspan="2"><div align="center">参与收缩的主要肌肉</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="61" rowspan="2"><div align="center">神经支配节段</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div align="center">左侧
    </div>      <div align="center"></div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="53">MM-T</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="55">ROM-T</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="56">ROM-T</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="50">MM-T</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a108" id="a108" value="${recovery.a108}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a109" id="a109" value="${recovery.a109}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="4"><div align="center">颈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">前屈
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">60</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">胸锁乳突肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a110" id="a110" value="${recovery.a110}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a111" id="a111" value="${recovery.a111}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a112" id="a112" value="${recovery.a112}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a113" id="a113" value="${recovery.a113}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">后伸</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">70</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">头最长肌、头颈半棘肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a114" id="a114" value="${recovery.a114}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a115" id="a115" value="${recovery.a115}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a116" id="a116" value="${recovery.a116}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a117" id="a117" value="${recovery.a117}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">旋转</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">60</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a118" id="a118" value="${recovery.a118}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a119" id="a119" value="${recovery.a119}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a120" id="a120" value="${recovery.a120}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a121" id="a121" value="${recovery.a121}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">侧屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">45</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a122" id="a122" value="${recovery.a122}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a123" id="a123" value="${recovery.a123}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a124" id="a124" value="${recovery.a124}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a125" id="a125" value="${recovery.a125}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="4"><div align="center">躯干</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">后伸
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">20</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">背伸肌群</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-5</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a126" id="a126" value="${recovery.a126}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a127" id="a127" value="${recovery.a127}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a128" id="a128" value="${recovery.a128}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a129" id="a129" value="${recovery.a129}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">屈曲</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">60</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">背屈肌群</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-5</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a130" id="a130" value="${recovery.a130}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a131" id="a131" value="${recovery.a131}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a132" id="a132" value="${recovery.a132}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a133" id="a133" value="${recovery.a133}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">侧屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">40</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">棘旁肌群</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-5</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a134" id="a134" value="${recovery.a134}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a135" id="a135" value="${recovery.a135}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a136" id="a136" value="${recovery.a136}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a137" id="a137" value="${recovery.a137}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">旋转</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">30</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">肋间肌、腹内外斜肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C1-5</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a138" id="a138" value="${recovery.a138}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a139" id="a139" value="${recovery.a139}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a140" id="a140" value="${recovery.a140}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a141" id="a141" value="${recovery.a141}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="5"><div align="center">肩</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">前屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">180</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">三角肌前部，喙肱肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a142" id="a142" value="${recovery.a142}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a143" id="a143" value="${recovery.a143}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a144" id="a144" value="${recovery.a144}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a145" id="a145" value="${recovery.a145}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">后伸</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">50</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">三角肌前部，背阔肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a146" id="a146" value="${recovery.a146}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a147" id="a147" value="${recovery.a147}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a148" id="a148" value="${recovery.a148}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a149" id="a149" value="${recovery.a149}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">外展</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">180</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">三角肌中部，岗上肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a150" id="a150" value="${recovery.a150}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a151" id="a151" value="${recovery.a151}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a152" id="a152" value="${recovery.a152}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a153" id="a153" value="${recovery.a153}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">内旋</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">90</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">大圆肌，肩胛下肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a154" id="a154" value="${recovery.a154}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a155" id="a155" value="${recovery.a155}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a156" id="a156" value="${recovery.a156}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a157" id="a157" value="${recovery.a157}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">外旋</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">90</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">小圆肌，岗下肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a158" id="a158" value="${recovery.a158}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a159" id="a159" value="${recovery.a159}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a160" id="a160" value="${recovery.a160}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a161" id="a161" value="${recovery.a161}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">肘</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">屈曲</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">150</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">肱二头肌，肱肌，桡侧腕屈肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5,6</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a162" id="a162" value="${recovery.a162}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a163" id="a163" value="${recovery.a163}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a164" id="a164" value="${recovery.a164}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a165" id="a165" value="${recovery.a165}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">伸展</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">肱三头肌，肘肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C6,8</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a166" id="a166" value="${recovery.a166}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a167" id="a167" value="${recovery.a167}"/>
    </div></td>
  </tr>
  
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a168" id="a168" value="${recovery.a168}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a169" id="a169" value="${recovery.a169}"/>
    </div></td>
    <td rowspan="2" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">前臂</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">旋前</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">90</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">旋前圆肌、旋前方肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a170" id="a170" value="${recovery.a170}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a171" id="a171" value="${recovery.a171}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a172" id="a172" value="${recovery.a172}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a173" id="a173" value="${recovery.a173}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">旋后</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">90</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">旋后肌、桡侧腕长伸肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a174" id="a174" value="${recovery.a174}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a175" id="a175" value="${recovery.a175}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a176" id="a176" value="${recovery.a176}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a177" id="a177" value="${recovery.a177}"/>
    </div></td>
    <td rowspan="4" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">腕</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">掌屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">90</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">桡尺侧腕屈肌，掌长肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C7,8</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a178" id="a178" value="${recovery.a178}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a179" id="a179" value="${recovery.a179}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a180" id="a180" value="${recovery.a180}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a181" id="a181" value="${recovery.a181}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">背屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">70</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">桡尺侧伸肌，指伸肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a182" id="a182" value="${recovery.a182}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a183" id="a183" value="${recovery.a183}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a184" id="a184" value="${recovery.a184}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a185" id="a185" value="${recovery.a185}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">桡偏</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">25</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">桡侧腕屈伸肌，腕长短伸肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C5-7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a186" id="a186" value="${recovery.a186}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a187" id="a187" value="${recovery.a187}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a188" id="a188" value="${recovery.a188}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a189" id="a189" value="${recovery.a189}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">尺偏</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">30</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">尺侧腕屈肌、伸肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C8,T1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a190" id="a190" value="${recovery.a190}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a191" id="a191" value="${recovery.a191}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a192" id="a192" value="${recovery.a192}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a193" id="a193" value="${recovery.a193}"/>
    </div></td>
    <td rowspan="3" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">四指</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">MP屈曲</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">90</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">蚓状肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C8,T1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a194" id="a194" value="${recovery.a194}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a195" id="a195" value="${recovery.a195}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a196" id="a196" value="${recovery.a196}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a197" id="a197" value="${recovery.a197}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">PIP屈曲</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">100</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">指浅屈肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C7-8,T1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a198" id="a198" value="${recovery.a198}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a199" id="a199" value="${recovery.a199}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a200" id="a200" value="${recovery.a200}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a201" id="a201" value="${recovery.a201}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">DIP屈曲</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">80</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">批深屈肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C8,T1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a202" id="a202" value="${recovery.a202}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a203" id="a203" value="${recovery.a203}"/>
    </div></td>
  </tr>
</table>
</div>
<div align="left" id="div12" class="fixed_div12">
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a204" id="a204" value="${recovery.a204}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a205" id="a205" value="${recovery.a205}"/>
    </div></td>
    <td rowspan="4" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">拇指</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">MP伸屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">60</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">拇指屈肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C8,T1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a206" id="a206" value="${recovery.a206}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a207" id="a207" value="${recovery.a207}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a208" id="a208" value="${recovery.a208}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a209" id="a209" value="${recovery.a209}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">DIP伸屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">80</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">拇长屈肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C8,T1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a210" id="a210" value="${recovery.a210}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a211" id="a211" value="${recovery.a211}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a212" id="a212" value="${recovery.a212}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a213" id="a213" value="${recovery.a213}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">掌侧伸张</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">90</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">拇长短展肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C7,8</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a214" id="a214" value="${recovery.a214}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a215" id="a215" value="${recovery.a215}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a216" id="a216" value="${recovery.a216}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a217" id="a217" value="${recovery.a217}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">掌侧内收</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">拇长屈肌、对掌肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">C8,T1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a218" id="a218" value="${recovery.a218}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a219" id="a219" value="${recovery.a219}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="9"><div align="center">下肢ROM(关节活动度)及徒手肌力(MM-T)</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a220" id="a220" value="${recovery.a220}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a221" id="a221" value="${recovery.a221}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="6"><div align="center">髋</div>      <div align="center"></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">屈曲</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">125</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">髂腰肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a222" id="a222" value="${recovery.a222}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a223" id="a223" value="${recovery.a223}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a224" id="a224" value="${recovery.a224}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a225" id="a225" value="${recovery.a225}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">伸展</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">15</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">臀大肌、股二头肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L5,S2</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a226" id="a226" value="${recovery.a226}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a227" id="a227" value="${recovery.a227}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a228" id="a228" value="${recovery.a228}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a229" id="a229" value="${recovery.a229}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">外展</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">45</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">臀中肌、缝匠肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L4,S1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a230" id="a230" value="${recovery.a230}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a231" id="a231" value="${recovery.a231}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a232" id="a232" value="${recovery.a232}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a233" id="a233" value="${recovery.a233}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">内收</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">45</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">内收肌、长短收肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L2,3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a234" id="a234" value="${recovery.a234}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a235" id="a235" value="${recovery.a235}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a236" id="a236" value="${recovery.a236}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a237" id="a237" value="${recovery.a237}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">外旋</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">45</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">臀大肌梨状肌闭孔内外肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L5,S2</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a238" id="a238" value="${recovery.a238}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a239" id="a239" value="${recovery.a239}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <div align="center">
        <input type="text" size="5" name="a240" id=a240 value="${recovery.a240}"/>
      </div>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a241" id="a241" value="${recovery.a241}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">内旋</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">45</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">臀小肌、阔筋膜张肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L4,S1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a242" id="a242" value="${recovery.a242}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a243" id="a243" value="${recovery.a243}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a244" id="a244" value="${recovery.a244}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a245" id="a245" value="${recovery.a245}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">膝</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">屈伸</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">150</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">腘绳肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L5,S12</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a246" id="a246" value="${recovery.a246}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a247" id="a247" value="${recovery.a247}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a248" id="a248" value="${recovery.a248}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a249" id="a249" value="${recovery.a249}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">伸展</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">股四头肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L2-4</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a250" id="a250" value="${recovery.a250}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a251" id="a251" value="${recovery.a251}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a252" id="a252" value="${recovery.a252}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a253" id="a253" value="${recovery.a253}"/>
    </div></td>
    <td rowspan="4" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">踝</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">背屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">20</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">胫骨前肌，拇指长伸肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L4,,S1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a254" id="a254" value="${recovery.a254}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a255" id="a255" value="${recovery.a255}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a256" id="a256" value="${recovery.a256}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a257" id="a257" value="${recovery.a257}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">趾屈</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">45</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">腓肠肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">S1,2</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a258" id="a258" value="${recovery.a258}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a259" id="a259" value="${recovery.a259}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a260" id="a260" value="${recovery.a260}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a261" id="a261" value="${recovery.a261}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">内翻</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">35</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">腓骨后肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L5,S1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a262" id="a262" value="${recovery.a262}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a263" id="a263" value="${recovery.a263}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a264" id="a264" value="${recovery.a264}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a265" id="a265" value="${recovery.a265}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">外翻</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">25</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">腓骨长短肌</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L4,S1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a266" id="a266" value="${recovery.a266}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a267" id="a267" value="${recovery.a267}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a268" id="a268" value="${recovery.a268}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a269" id="a269" value="${recovery.a269}"/>
    </div></td>
    <td rowspan="2" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">趾</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">屈伸</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">50</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">拇趾屈肌群</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L5,S1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a270" id="a270" value="${recovery.a270}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a271" id="a271" value="${recovery.a271}"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a272" id="a272" value="${recovery.a272}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a273" id="a273" value="${recovery.a273}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">伸展</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">50</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">拇趾伸肌群</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">L5,S1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a274" id="a274" value="${recovery.a274}"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div align="center">
      <input type="text" size="5" name="a275" id="a275" value="${recovery.a275}"/>
    </div></td>
  </tr>
</table>
</div>
<div align="left" id="div13" class="fixed_div13">
<p>G4.3 VAS目测类比疼痛评定</p>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="134">姓名</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="216"><input type="text" name="a277" id="a277" value="${recovery.a277}"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="175" rowspan="3"><div align="center">是否服药</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="177" rowspan="3"><p>请根据以下编号填写：0、否 1、是 
      <select name="a278" id="a278">
           <option value="0" ${recovery.a278 == '0' ? "selected" : ""}>0</option>
	       <option value="1" ${recovery.a278 == '1' ? "selected" : ""}>1</option>
      </select>
    </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >档案编号</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><input type="text" name="a279" id="a279" value="${recovery.a277}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >会员编号(如有)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><input type="text" name="a280" id="a280" value="${recovery.a278}"/></td>
  </tr>
</table>
</div>
<div align="left" id="divadd" class="divadd">
<input type="button" onclick="AddRow()" value="增加" />&nbsp;
<input type="button" onclick="delRow('tbody1')" value="删除" />
</div>
<div align="left" id="div14" class="fixed_div14">
<table id="tbody1" width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="35"><div align="center" >日期</div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="138"><div align="center">
      <div>评估部位</div>
      <div>1、头部 2、颈椎3、肩关节4、腰部5、髋关节6、膝关节7、其他部位    </div>
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="149"><div align="center">
      <div>疼痛情况</div>
      <div>0、无 1、酸疼2、针刺样疼痛3、裂开样疼4、放射疼5、钝疼6、剧烈地疼7、使人难受的疼8、无法忍受的疼</div>
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="150"><div align="center">
      <div>疼痛模式</div>
      <div>0、无1、持续的2、间歇的3、经常不断的4、瞬息的5、有节律的</div>
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="140"><div align="center">
      <div>疼痛伴随症</div>
      <div>0、无1、恶心2、头疼、3、晕眩4、排尿5、便秘6、腹泻7、其他</div>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="48"><div align="center">评估人员</div></td>
  </tr>
  <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286"/></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'0');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div>
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'1');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
   <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'2');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
   <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'3');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
   <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'4');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
   <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'5');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
   <tr onclick="resetTr('tbody2')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'6');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
   <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="5">6</option>
	   <option value="5">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'7');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
   <tr onclick="resetTr('tbody1')" >
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a282" id="a282">
	   <option value="1" selected>1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a283" id="a283">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
	   <option value="8">8</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
     <select name="a284" id="a284">
       <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a285" id="a285">
      <option value="0" selected>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
	   <option value="3">3</option>
	   <option value="4">4</option>
	   <option value="5">5</option>
	   <option value="6">6</option>
	   <option value="7">7</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <input type="text" size="10" name="a286" id="a286" /></td>
  </tr>
  <tr onclick="resetTr('tbody1')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >不疼</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4" align="left"><div id="colordiv" onclick="changeCss(this,event,'8');" >
    <input type="hidden" size="70" name="a287" id="a287" value="0"/>
    <img name="img" id="img1" src='<%=basePath%>/pages/train/skins/img/redline2.png' style='width:0px;height=13px;' border='0' hspace='1'/></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >非常疼</td>
  </tr>
</table>
</div>
<div align="left" id="div15" style="position:absolute; left:162px; top:4290px;width:730px;">
<div>H4 康复服务实施记录表</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="94">姓名</td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="144"><input type="text" name="a304" id="a304"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="103" rowspan="3"><div align="center">康复服务计划</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="361" rowspan="3"><div>根据G4.1康复评估表/康复计划填写</div>
    <div>
      <textarea name="a288" id="a288" cols="40" rows="4">${recovery.a288}</textarea>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >档案编号</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" name="a289" id="a289" size="10" /></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >会员编号(如有)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a290" id="a290"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2">康复方式</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">
      <div>
        <input type="checkbox" class="checkBox1" name="a291" id="a291"/>
        定点康复</div>
      <div>
        <input type="checkbox" class="checkBox1" name="a292" id="a292" />
        上门康复
      </div>
      <div>&nbsp;</div>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">康复地址1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>&nbsp;
      </div>
      <div>
        <textarea name="a293" id="a293" rows="3" cols="40">${recovery.a293}</textarea>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">康复地址2</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><textarea name="a294" id="a294" rows="3" cols="40">${recovery.a294}</textarea></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4"><div>注意事项：</div>
    <div>
      <textarea name="a295" id="a295" cols="70" rows="4" >${recovery.a295}</textarea>
    </div></td>
  </tr>
</table>
</div>
<div align="left" id="divadd1" style="position:absolute; left:162px; top:4620px;width:130px; ">
<input type="button" onclick="AddRowH4()" value="增加" />&nbsp;
<input type="button" onclick="delRow('tbody2')" value="删除" />
</div>
<div align="left" id="div16" style="position:absolute; left:162px; top:4640px;width:730px;">
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;" id="tbody2">
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="71"><div align="center">日期</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="56"><div align="center">开始时间</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="56"><div align="center">结束时间</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="51"><div align="center">服务时间(min)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="58"><div align="center">服务地址(填写编号)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="155"><div align="center">康复内容</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="77"><div align="center">会员签字</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="73"><div align="center">康复师签字</div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="5" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a300" id="a300">
         <option value="1" selected>1</option>
	     <option value="2">2</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="10" name="a303" id="a303"/></td>
  </tr>
</table>
</div>
<input name="recoveryid" id="recoveryid" type="hidden" value="${recovery.recoveryid}"/>
<div align="center" id="div9" style="position:absolute;left:312px;top:5150px;width:410px;">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button  onClick="onSubmit()">确定</button><button id="backButton" onClick="forward('revalelvalist.do')">返回</button></td>
  </tr>  
</table>
</div>
</form>
<script type="text/javascript">
var basePath = '<%=basePath%>';
//待删除行下标,只删除后面新增的行，默认预留9*2行
var delindex=-1;
var delindex2=-1;
var addcountdiv14=0;
var addcountdiv16=0;
 var LODOP; //声明为全局变量 
	function prn1_preview() {	
		CreateOneFormPage();	
		LODOP.PREVIEW();	
	};
	function prn1_print() {		
		CreateOneFormPage();
		LODOP.PRINT();	
	};
	function prn1_printA() {		
		CreateOneFormPage();
		LODOP.PRINTA(); 	
	};	
	function CreateOneFormPage(){
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		//LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_表单一");
		LODOP.SET_PRINT_STYLE("FontSize",18);
		LODOP.SET_PRINT_STYLE("Bold",1);
		//LODOP.ADD_PRINT_TEXT(50,231,260,39,"打印页面部分内容");
		//第一页
		LODOP.ADD_PRINT_HTM(8,10,570,495,document.getElementById("div1").innerHTML);
		LODOP.ADD_PRINT_HTM(213,10,570,500,document.getElementById("div2").innerHTML);
		LODOP.ADD_PRINT_HTM(475,10,370,900,document.getElementById("div3").innerHTML);
		LODOP.ADD_PRINT_HTM(492,380,370,500,document.getElementById("div4").innerHTML);
		LODOP.NEWPAGE();
		//第二页
		LODOP.ADD_PRINT_HTM(8,10,370,1100,document.getElementById("div5").innerHTML);
		LODOP.ADD_PRINT_HTM(8,380,350,1100,document.getElementById("div6").innerHTML);
		
		LODOP.NEWPAGE();
		//第三页
		LODOP.ADD_PRINT_HTM(18,5,380,1100,document.getElementById("div7").innerHTML);
		LODOP.ADD_PRINT_HTM(18,380,380,1100,document.getElementById("div8").innerHTML);
		
		LODOP.NEWPAGE();
		//第四页
		LODOP.ADD_PRINT_HTM(18,5,570,500,document.getElementById("div10").innerHTML);
		LODOP.ADD_PRINT_HTM(238,5,570,1100,document.getElementById("div11").innerHTML);
		
		LODOP.NEWPAGE();
		//第五页
		LODOP.ADD_PRINT_HTM(18,5,570,1100,document.getElementById("div12").innerHTML);
		
		//计算是否分页
		LODOP.NEWPAGE();
		//第六页
		LODOP.ADD_PRINT_HTM(18,5,570,1100,document.getElementById("div13").innerHTML);
		LODOP.ADD_PRINT_HTM(158,5,570,1100,document.getElementById("div14").innerHTML);
		//翻页，如果新增的行数超过一页纸,一般不会超过二页纸，超过再说
		if(addcountdiv14>5){
		    LODOP.NEWPAGE();
		}
		LODOP.NEWPAGE();
		//第七页
		LODOP.ADD_PRINT_HTM(18,5,570,1100,document.getElementById("div15").innerHTML);
		LODOP.ADD_PRINT_HTM(398,5,570,1100,document.getElementById("div16").innerHTML);
		if(addcountdiv16>5){
		    LODOP.NEWPAGE();
		}
	};	                     
	function prn1_manage(){
	    CreateOneFormPage();
	    LODOP.PRINT_SETUP();
	}
    
    function printit(){
        LODOP.PRINT();
    }



function chooseTr(tname,obj){
   var tbody1 = document.getElementById(tname);
   obj.style.backgroundColor='gray';
   if(tname=='tbody1')
      startindex=18;
   if(tname=='tbody2')
      startindex=17;
   for(var yy=startindex;yy<tbody1.rows.length;yy++){
      if(yy==obj.rowIndex){continue;}
      tbody1.rows[yy].style.backgroundColor='';
   }
   if(tname=='tbody1')
     delindex=obj.rowIndex;
     
   if(tname=='tbody2')
     {delindex2=obj.rowIndex;}
   
}

function resetTr(tname){
   var tbody1 = document.getElementById(tname);
   if(tname=='tbody1')
      startindex=18;
   if(tname=='tbody2')
      startindex=17;
   for(var yy=startindex;yy<tbody1.rows.length;yy++){
      tbody1.rows[yy].style.backgroundColor='';
   }
}

function AddRowH4(){
   var tbody2 = document.getElementById('tbody2');
   var row = tbody2.insertRow(tbody2.rows.length);
   row.onclick = function(){   
                chooseTr('tbody2',row);   
   				}; 
   var ftd = row.insertCell(row.cells.length);   
   ftd.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd.innerHTML='<input type="text" size="10" name="a296" id="a296" class="Wdate" onClick="WdatePicker({dateFmt:\'yyyy-MM-dd\',readOnly:true})"/>';
    
   var ftd1 = row.insertCell(row.cells.length);   
   ftd1.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd1.innerHTML='<input type="text" size="6" name="a297" id="a297" class="Wdate" onClick="WdatePicker({dateFmt:\'HH:mm:ss\',readOnly:true})"/>';
   
   var ftd2 = row.insertCell(row.cells.length);   
   ftd2.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd2.innerHTML='<input type="text" size="6" name="a298" id="a298" class="Wdate" onClick="WdatePicker({dateFmt:\'HH:mm:ss\',readOnly:true})"/>';
   
   
   var ftd3 = row.insertCell(row.cells.length);   
   ftd3.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd3.innerHTML='<input type="text" size="5" name="a299" id="a299"/>';
   
   
   var ftd4 = row.insertCell(row.cells.length);   
   ftd4.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd4.innerHTML=' <select name="a300" id="a300">'
         +'<option value="1" selected>1</option>'
	     +'<option value="2">2</option>'
   		 +'</select>';
   
   
   var ftd5 = row.insertCell(row.cells.length);   
   ftd5.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd5.innerHTML='<input type="text" size="20" name="a301" id="a301"/>';
   
   
   var ftd6 = row.insertCell(row.cells.length);   
   ftd6.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd6.innerHTML='<input type="text" size="10" name="a302" id="a302"/>';
   
   
   var ftd7 = row.insertCell(row.cells.length);   
   ftd7.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd7.innerHTML='<input type="text" size="10" name="a303" id="a303"/>';
   
   readjustPos('div9',25);
   addcountdiv16++;
}

function delRow(trname){
   var tbody1 = document.getElementById(trname);
   if(trname=='tbody1'){
       if(delindex==-1){
	      alert('请选择要删除的行(点击要删除的行)!');
	      return;
	   }
   	   tbody1.deleteRow(delindex);
   	   tbody1.deleteRow(delindex);
   	   readjustPos('div15',-42);
	   readjustPos('div16',-42);
	   readjustPos('div9',-42);
	   readjustPos('divadd1',-42);
   	   addcountdiv14--;
   }else if(trname=='tbody2'){
       if(delindex2==-1){
	      alert('请选择要删除的行(点击要删除的行)!');
	      return;
	   }
   	   tbody1.deleteRow(delindex2);
   	   readjustPos('div9',-25);
   	   addcountdiv16--;
   }
}

function AddRow(){
   var tbody1 = document.getElementById('tbody1');
   var row = tbody1.insertRow(tbody1.rows.length);
   row.onclick = function(){   
                chooseTr('tbody1',row);   
   				}; 
   //row.onmouseout = function(){   
   //             resetTr('tbody1');   
   //				}; 
   var ftd = row.insertCell(row.cells.length);   
   ftd.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd.innerHTML='<input type="text" size="10" name="a281" id="a281"  class="Wdate" onClick="WdatePicker({dateFmt:\'yyyy-MM-dd\',readOnly:true})"/>';
   
   var ftd1 = row.insertCell(row.cells.length);  
    
   //ftd1.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;');
   ftd1.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd1.innerHTML=' <select name="a282" id="a282">'
	   +'<option value="1" selected>1</option>'
	   +'<option value="2">2</option>'
	   +'<option value="3">3</option>'
	   +'<option value="4">4</option>'
	   +'<option value="5">5</option>'
	   +'<option value="6">6</option>'
	   +'<option value="7">7</option>'
       +'</select>';
       
    var ftd2 = row.insertCell(row.cells.length);   
    //ftd2.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;');
    ftd2.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
    ftd2.innerHTML='<select name="a284" id="a284">'
       +'<option value="0" selected>0</option>'
	   +'<option value="1">1</option>'
	   +'<option value="2">2</option>'
	   +'<option value="3">3</option>'
	   +'<option value="4">4</option>'
	   +'<option value="5">5</option>'
	   +'<option value="6">6</option>'
	   +'<option value="7">7</option>'
	   +'<option value="8">8</option>'
       +'</select>';
       
     var ftd3 = row.insertCell(row.cells.length);   
     //ftd3.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;');
     ftd3.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
     ftd3.innerHTML='<select name="a284" id="a284">'
       +'<option value="0" selected>0</option>'
	   +'<option value="1">1</option>'
	   +'<option value="2">2</option>'
	   +'<option value="3">3</option>'
	   +'<option value="4">4</option>'
	   +'<option value="5">5</option>'
	   +'</select>';
	   
	 var ftd4 = row.insertCell(row.cells.length);   
	 //ftd4.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;');
	 ftd4.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
     ftd4.innerHTML='<select name="a284" id="a284">'
       +'<option value="0" selected>0</option>'
	   +'<option value="1">1</option>'
	   +'<option value="2">2</option>'
	   +'<option value="3">3</option>'
	   +'<option value="4">4</option>'
	   +'<option value="5">5</option>'
	   +'<option value="6">6</option>'
	   +'<option value="7">7</option>'
	   +'</select>';
	   
	 var ftd5 = row.insertCell(row.cells.length);  
	 //ftd5.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;'); 
	 ftd5.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
     ftd5.innerHTML='<input type="text" size="10" name="a286" id="a286" />';
     
     //第二行
     var row1 = tbody1.insertRow(tbody1.rows.length);
     
     var ftd6 = row1.insertCell(row1.cells.length);   
     //ftd6.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;');
     ftd6.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
	 ftd6.innerHTML='不疼';
	 
	 var ftd7 = row1.insertCell(row1.cells.length);  
	 //ftd7.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;'); 
	 ftd7.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
     ftd7.setAttribute('colSpan','4');
	 ftd7.innerHTML='<div id="colordiv" onclick="changeCss(this,event,\''+((tbody1.rows.length-1)/2-1)+'\');" >'
        +'<input type="hidden" size="70" name="a287" id="a287" value="0"/>'
        +'<img name="img" id="img1" src="'+basePath+'/pages/train/skins/img/redline2.png" style="width:0px;height=13px;" border="0" hspace="1"/></div>';

     var ftd8 = row1.insertCell(row1.cells.length);   
     //ftd8.setAttribute('style','border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;');
     ftd8.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
	 ftd8.innerHTML='非常疼';
	 
	 readjustPos('div15',42);
	 readjustPos('div16',42);
	 readjustPos('div9',42);
	 readjustPos('divadd1',42);
	 
	 addcountdiv14++;
}

function readjustPos(divid,val){
     var top1=document.getElementById(divid).style.top;
	 var topindex = top1.indexOf('px');
	 var topval = parseInt(top1.substring(0,topindex));
	 var curtop=(topval+val)+'px';
	 document.getElementById(divid).style.top=curtop;
}

function changeCss(obj,e,index){
   //obj.style.backgroundColor='red';
   //alert(getCursorPosition(obj));
   //alert(111);
   var e1 = e || window.event;
   var imgobj = document.getElementsByName('img');
   var inputarray = document.getElementsByName('a287');
   //alert(obj.scrollWidth);
   imgobj[index].style.width=(parseInt(e1.clientX)-250)+'px';
   //保存图片长度，以便下次加载时用
   inputarray[index].value=(parseInt(e1.clientX)-250)+'';
   //alert(e1.clientX);
}
var recoveryid = document.getElementById("recoveryid").value;
//此处为独立函数
function LTrim(str)
{
    var i;
    for(i=0;i<str.length;i++)
    {
        if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break;
    }
    str=str.substring(i,str.length);
    return str;
}
function RTrim(str)
{
    var i;
    for(i=str.length-1;i>=0;i--)
    {
        if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break;
    }
    str=str.substring(0,i+1);
    return str;
}
function Trim(str)
{
    return LTrim(RTrim(str));
}

function onSubmit(){
      var memgender = document.getElementById('memgender').value;
      var memname = document.getElementById('memname').value;
      var memage = document.getElementById('memage').value;
      var assesman = document.getElementById('assesman').value;
      var assesdate = document.getElementById('assesdate').value;
      var recoverynumber = document.getElementById('recoverynumber').value;
      var belongproname = "";
      var belongproid = "";
      
      var paraurl = '';
      for(i=1;i<=304;i++){
         //281-287批量操作
         if(i>=281&&i<=287){
                var arr = document.getElementsByName("a"+i);
	            var tempa='';
	            if(arr.length>0){
	            	for(var ii=0;ii<arr.length;ii++){
	            	    tempa+=arr[ii].value+'#';
	            	}
	            	paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(tempa);
	            	continue;
	            }
         }
         
         if(i>=296&&i<=303){
                var arr = document.getElementsByName("a"+i);
	            var tempa='';
	            if(arr.length>0){
	            	for(var ii=0;ii<arr.length;ii++){
	            	    tempa+=arr[ii].value+'#';
	            	}
	            	paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(tempa);
	            	continue;
	            }
         }
         
         if(document.getElementById("a"+i).type=='checkbox'){
         	eval("var a" + i + "=" + document.getElementById("a"+i).checked+";");
         	paraurl = paraurl+'&'+('a'+i)+'='+document.getElementById("a"+i).checked;
         }else if(document.getElementById("a"+i).nodeName=='SELECT'){
             var b = document.getElementById("a"+i).value;
             if(Trim(b)==''){
                //此处不能为空，要给个默认值
                b='';
             }
            
             eval("var a" + i + "='" + b+"';");
             paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
         }else if(document.getElementById("a"+i).type=='text'){
            var b = document.getElementById("a"+i).value;
            if(Trim(b)==''){
                //此处不能为空，要给个默认值
                b='';
            }
            
            eval("var a" + i + "='" + b+"';");
            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
         }else if(document.getElementById("a"+i).type=='textarea'){
            var b1 = document.getElementById("a"+i).value;
            if(Trim(b1)==''){
                //此处不能为空，要给个默认值
                b1='';
            }
            
            eval("var a" + i + "='" + b1+"';");
            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b1);
         }
      }
        
        if(memname==""){
            alert('请选择一个会员');
            return;
        }else if(recoverynumber==""){
            alert('档案编号不能为空');
            return;
        }else if(assesdate==""){
            alert('评估日期不能为空');
            return;
        }
        else if(recoveryid!='null'&&recoveryid!=""){
           $.ajax({
				   type: "POST",
				   url: basePath + "/revalmodifyRecovery.do?recoveryid="+recoveryid+"&recoverynumber="+recoverynumber+"&memage="+encodeURI(memage)+"&memname="+encodeURI(memname)+"&assesman="+encodeURI(assesman)+"&assesdate="+assesdate+"&memgender="+encodeURI(memgender)+"&belongproname="+encodeURI(belongproname)+"&belongproid="+encodeURI(belongproid)+paraurl,
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('康复评估表修改成功');
				   			window.location.href=basePath+"/revalelvalist.do";
				   		}
				   		else{
				   			alert('康复评估表修改失败');
				   		}
				   },
				   failure:function (){
				   		alert("未知错误！");
				   }	   
		   });
        }else
        {
           $.ajax({
					  type: "POST",
					  url: basePath + "/revaladdrecovery.do?recoverynumber="+recoverynumber+"&memage="+encodeURI(memage)+"&memname="+encodeURI(memname)+"&assesman="+encodeURI(assesman)+"&assesdate="+assesdate+"&memgender="+encodeURI(memgender)+"&belongproname="+encodeURI(belongproname)+"&belongproid="+encodeURI(belongproid)+paraurl,
					  success:function (msg){
					  var result = msg;
					  if('success'==result){
					  	alert('康复评估表新增成功');
					  	window.location.href=basePath+"/revalelvalist.do";
					  }
					  else{
					  	alert('康复评估表新增失败');
					  }
				  },
					  failure:function (){
					  	alert("未知错误！");
					  }   
				  });
		}
}

function choosePro(){
    var pname = "belongproname";
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
        //nothing to do
    }else{
     document.getElementById(pname).value=arr[0];
     document.getElementById("belongproid").value=arr[1];
     document.getElementById("startdate").value=arr[2];
     document.getElementById("enddate").value=arr[3];
    } 
 } 
 
function chooseElders(){
    var mname = "memname";
    var obj = new Object();
    obj.memname=mname;
    
    var url =  basePath + "/memberlist.do?chooseflag=true";
    //window.open(url);
    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px"); 
    arr = str.split(",");
    if(typeof(str)=="undefined"){
        document.getElementById(mname).value="";
    }else if(str=="nochange"){
        //nothing to do
    }else{
    	document.getElementById(mname).value=arr[1];
    	document.getElementById("memgender").value=arr[0];
    } 	
 }
 
 <%
   recoveryAssess ca = (recoveryAssess)request.getAttribute("recovery");
   String isView = (String)request.getAttribute("view");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=304;methodi++){
    	 String methodname = "getA"+methodi;
    	 //动态调用方法k
         parasb.append(ca.getClass().getMethod(methodname, new Class[]{}).invoke(ca, new Object[]{})).append(",");
   }
   String parstr = parasb.toString();
%>
var paras = '<%=parstr%>' ;
var isView = '<%=isView%>';
function fillBlank(){
     var strs= new Array(); 
     strs = paras.split(',');
     //return;
     //initRow for tbody1
     var len = parseInt(strs[280].split('#').length-1-(document.getElementById('tbody1').rows.length-1)/2);
     for(y=0;y<len;y++){
         AddRow();
     }
     
     //initRpow for tbody2
     var len1 = parseInt(strs[295].split('#').length-1-(document.getElementById('tbody2').rows.length-1));
     for(y1=0;y1<len1;y1++){
         AddRowH4();
     }
     
     for(i=0;i<strs.length-1;i++){
            if(strs[i]=='null'){
               strs[i]='';
            }
            
            if(i<=286&&i>=280){
               //butch init
               for(var uu=0;uu<strs[i].split('#').length-1;uu++){
                   if(strs[i].split('#')[uu]=='null'){strs[i].split('#')[uu]='';}
                   if(document.getElementsByName("a"+(i+1))[uu].type=='text'){
                      //if 'text'
                      document.getElementsByName("a"+(i+1))[uu].value=strs[i].split('#')[uu];
                   }else if(document.getElementsByName("a"+(i+1))[uu].nodeName=='SELECT'){
		              jsSelectIsExitItem(document.getElementsByName("a"+(i+1))[uu],strs[i].split('#')[uu]);
		           }else if(document.getElementsByName("a"+(i+1))[uu].type=='hidden'){
		              document.getElementsByName("a"+(i+1))[uu].value=strs[i].split('#')[uu];
		              var imgobj = document.getElementsByName('img');
		              imgobj[uu].style.width=strs[i].split('#')[uu]+'px';
		           }
               }
               continue;
            }
            
            if(i<=302&&i>=295){
               //butch init
               for(var uu=0;uu<strs[i].split('#').length-1;uu++){
                   if(strs[i].split('#')[uu]=='null'){strs[i].split('#')[uu]='';}
                   if(document.getElementsByName("a"+(i+1))[uu].type=='text'){
                      //if 'text'
                      document.getElementsByName("a"+(i+1))[uu].value=strs[i].split('#')[uu];
                   }else if(document.getElementsByName("a"+(i+1))[uu].nodeName=='SELECT'){
		              jsSelectIsExitItem(document.getElementsByName("a"+(i+1))[uu],strs[i].split('#')[uu]);
		           }
               }
               continue;
            }
            if(document.getElementById("a"+(i+1)).type=='checkbox'){
               if(strs[i]=='false'){
                   document.getElementById("a"+(i+1)).checked=false;
               }else{
                   document.getElementById("a"+(i+1)).checked=true; 
               }
            }else if(document.getElementById("a"+(i+1)).type=='text'){
                document.getElementById("a"+(i+1)).value=strs[i];
            }else if(document.getElementById("a"+(i+1)).type=='textarea'){
                document.getElementById("a"+(i+1)).value=strs[i];
            }else if(document.getElementById("a"+(i+1)).nodeName=='SELECT'){
                jsSelectIsExitItem(document.getElementById("a"+(i+1)),strs[i]);
            }
     }
}
function jsSelectIsExitItem(objSelect, objItemValue) {        
    for (var i = 0; i < objSelect.options.length; i++) {        
        if (objSelect.options[i].value == objItemValue) {        
            objSelect.options[i].selected = true;       
            break;        
        }        
    }        
} 
//如果有recoveryid 那么是编辑页面
if(recoveryid!='null'&&recoveryid!=""){
	fillBlank();
}
//如果view==yes 那么是详细页面
if(isView=='yes'){
    fillBlank();
    disableAll();
    enableButton();
}

function enableButton(){
    //当为view页面时，重启返回按钮
    document.getElementById('backButton').disabled=false;
}

function disableAll(){
     //禁止所有控件
     $("#:input").attr('disabled', true);
     //disable onclick for colordiv
     var colorarr = document.getElementsByName('colordiv');
     for(var hh=0;hh<colorarr.length;hh++){
        colorarr[hh].onclick="";
     }
}
</script>
</body>
</html>
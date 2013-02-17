<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>  
<%@page import="com.wootion.cmmb.persistenc.po.bean.CareAssess"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>护理详情</title>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../install_lodop32.exe"></embed>
</object>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}

.fixed_div{ 
position:absolute; 
left:232px; 
bottom:0; 
width:450px; 
top:409px;
} 

.fixed_div1{ 
position:absolute; 
left:593px; 
bottom:0; 
width:410px; 
top:424px;
} 

.fixed_div2{ 
position:absolute; 
left:232px; 
bottom:0; 
width:420px; 
top:785px;
}

.fixed_div3{ 
position:absolute; 
left:593px; 
bottom:0; 
width:410px; 
top:786px;
}

.fixed_div4{ 
position:absolute; 
left:232px; 
bottom:0; 
width:410px; 
top:1005px;
}
.fixed_div5{ 
position:absolute; 
left:593px; 
bottom:0; 
width:410px; 
top:1020px;
}
.fixed_div0{ 
position:absolute; 
left:232px; 
bottom:0; 
width:700px; 
top:70px;
}
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<script type="text/javascript">
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
		LODOP.ADD_PRINT_HTM(8,10,720,495,document.getElementById("tab1").innerHTML);
		LODOP.ADD_PRINT_HTM(465,10,410,500,document.getElementById("tab2").innerHTML);
		LODOP.ADD_PRINT_HTM(485,370,410,500,document.getElementById("tab3").innerHTML);
		
		LODOP.NEWPAGE();
		//第二页
		LODOP.ADD_PRINT_HTM(8,10,410,500,document.getElementById("tab4").innerHTML);
		LODOP.ADD_PRINT_HTM(8,370,410,500,document.getElementById("tab5").innerHTML);
		LODOP.ADD_PRINT_HTM(225,10,410,700,document.getElementById("tab6").innerHTML);
		LODOP.ADD_PRINT_HTM(264,370,410,700,document.getElementById("tab7").innerHTML);
	};	                     
	function prn1_manage(){
	    CreateOneFormPage();
	    LODOP.PRINT_SETUP();
	}
    
    function printit(){
        LODOP.PRINT();
    }
</script>
<div class="topLanBar"><b>当前位置：</b>护理管理 > 护理明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div id="floatdiv" style="width:30px;height:50px;position:absolute;right:20px;top:80px;background:#FFCC00;border:1px solid #999;">
   <table>
    <tr>
        <td>
   			<a href="javascript:document.getElementById('tab1').focus();"><span style="color:blue">A</span></a>
   		</td>
    </tr>
     <tr>
   		<td>
   			<a href="javascript:document.getElementById('tab2').focus();"><span style="color:blue">B</span></a>
   		</td>
    </tr>
     <tr>
   		<td>
   			<a href="javascript:document.getElementById('tab6').focus();"><span style="color:blue">C</span></a>
   		</td>
    </tr>
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
<br>
<form  method="post">
<p>	<div align="left" id="tab1" class="fixed_div0">
	<h4>G5 护理评估与计划</h4></p>
<table width="700" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="161">姓名<span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="187"><div style="font-weight:bold">${care.memname}&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="184" rowspan="2"><div align="center">联系方式<span style='color:red;'>&nbsp;*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="230" rowspan="2"><div style="font-weight:bold">${care.belongproname}&nbsp;</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >档案编号 <span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div style="font-weight:bold">${care.carenumber}&nbsp;</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >会员编号(如有)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div style="font-weight:bold">${care.memnumber}&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><div align="center">家庭地址</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><div style="font-weight:bold">${care.a1}&nbsp;</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >评估人员签字<span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div style="font-weight:bold">${care.assesman}&nbsp;</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >评估人员职务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div style="font-weight:bold">${care.a2}</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">评估日期<span style='color:red;'>&nbsp;*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <div style="font-weight:bold">${care.assesdate}&nbsp;</div>
      (年/月/日)</td>
  </tr>
</table>
A. 健康情况(根据G2.健康评估表 I.疾病诊断)
<table width="700" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="192">心脑血管疾病
      <div><input type="checkbox" disabled class="checkBox1"  name="a3" id="a3"/>
    脑血管疾病(如中风)</div>
    <div>
         <input type="checkbox" disabled class="checkBox1" name="a4" id="a4"/>
          心力衰竭
    </div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a5" id="a5"/>
    冠心病(如心肌梗塞)</div>
    
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a6" id="a6"/>
      高血压</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a7" id="a7"/>
      心率不齐
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="230">神经疾病
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a8" id="a8"/>
      老年性脑萎缩</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a9" id="a9"/>
      老年性脑萎缩以外痴呆症</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a10" id="a10"/>
      头部创伤</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a11" id="a11"/>
      脑卒中</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a12" id="a12"/>
      帕金森氏症
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="174">骨科疾病
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a13" id="a13"/>
      关节炎</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a14" id="a14"/>
      骨折</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a15" id="a15"/>
      骨质疏松症
    </div></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="156">其他疾病
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a16" id="a16"/>
      白内障</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a17" id="a17"/>
      精神疾病</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a18" id="a18"/>
      尿路感染</div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a19" id="a19"/>
      癌症
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4"> 备注：(对以上未列入疾病进行描述或对某项疾病进行详细补充)
     <div> <span style="font-weight:bold">${care.a20}&nbsp;</span>
    </div></td>
  </tr>
</table>
<br/>
</div>

<div align="left" id="tab2" class="fixed_div">
B.护理评定项目
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="12" rowspan="3">1.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="76" rowspan="3">失能评定(IADL)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">根据G2健康评估表/G身体机能/IADL评定分数</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="141">根据分值分类，选择以下编号填写(男性IADL评估中，做饭，洗衣，做家事三项不计分)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="153">
        <div style="font-weight:bold">${care.a21}&nbsp;</div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"    colspan="2"><div>0.健康老人：女性，IADL得分8分;男性得分IADL5分。</div>
    <div>1.轻度失能:女性，IADL得分7-5分;男性得分4-3分;</div>
    <div>2.失能老人：女性IADL得分4分及以下;男性IADL得分2分以下</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3">2.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3">护理依赖程度评定(ADL)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">根据G2健康评定表/G身体机能/ADL评定分数</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >根据分值分类，选择以下编号填写：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
   		 <div style="font-weight:bold">${care.a22}</div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div>0、完全能够自理：75分以上</div>
     <div>1、轻度护理依赖：75-60分</div>
     <div>2、中度护理依赖：40-60分</div>
     <div>3、重度护理依赖：40分以下</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">以下选项为可能造成ADL能力下降的风险</td>
  </tr>
</table>
</div>

<div class="fixed_div1" id="tab3">
<table width="340" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="20">3.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="99">护理预估评分 </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="268"><div>因素 ，在相应选项后打钩</div>
      <div>
        <input type="checkbox" disabled class="checkBox1" name="a23" id="a23"/>
      a、男性</div>
      <div>
        <input type="checkbox" disabled class="checkBox1" name="a24" id="a24"/>
      b、80岁以上</div>
      <div>
        <input type="checkbox" disabled class="checkBox1" name="a25" id="a25"/>
        c、行走困难 
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >4.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >二便护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>根据G2健康评估表/H.七天内二便情况，在以下相应项目打钩<div>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a26" id="a26"/>
    a、不需要特别护理</div>
    <br>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a27" id="a27"/>
      b、小便失禁，需提醒用厕或协助更换尿片</div> <br>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a28" id="a28"/>
      c、大便失禁，需提醒用厕或协助更换尿片</div> <br>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a29" id="a29"/>
      d、使用尿袋，导尿管护理清洁</div> <br>
    <div>
      <input type="checkbox" disabled class="checkBox1" name="a30" id="a30"/>
      e、造口护理
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >5.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >皮肤护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>根据G2健康评估表/M皮肤状态评定内容填写：
      <span style="font-weight:bold">${care.a31}</span>
    </div> 
    <div>
  0、不需要褥疮护理</div> 
    <div>
    1、需要褥疮护理
    </div></td>
  </tr>
</table>
</div>

<div class="fixed_div2" id="tab4">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="13">6.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="79">饮食护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="295">根据G2健康评估表/K.营养与水份，选择以下编号填写：
    <div>0、不需要服务或提醒</div>
    <div>1、需要服务或提醒</div>
      喂水:<span style="font-weight:bold">${care.a32}</span>
      浓稠液体加工:<span style="font-weight:bold">${care.a33}</span>
      食物加工:<span style="font-weight:bold">${care.a34}</span>
      糖尿病:<span style="font-weight:bold">${care.a35}</span>
      食管进食:<span style="font-weight:bold">${care.a36}</span>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >7.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >口腔护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
       <div style="font-weight:bold">根据G2健康评估表/L.口腔健康评定内容填写：${care.a37}</div>
    <div>0、不需要口腔护理</div>
    <div>1、需要口腔护理</div></td>
  </tr>
</table>
</div>

<div class="fixed_div3" id="tab5">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="12">8.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="81">服药提醒</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="293"><p>
      <div style="font-weight:bold">根据G2健康评估表/o.用药评定内容填写：${care.a38}</div>
    </p>
    <p>0、不需要服药提醒与协助</p>
    <p>1、需要服药提醒与协助</p></td>
  </tr>
</table>
</div>
<div class="fixed_div4"  id="tab6">
<p>C.护理服务计划</p>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="20" rowspan="2">9.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="95" rowspan="2">护理方式</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="271">
      <div style="font-weight:bold">选择填写护理方式编号：${care.a39}</div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >1.定点服务 2.上门护理 3.不需要</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">10.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">服务时间</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
        <div style="font-weight:bold">选择填写护理服务时间编号：${care.a40}</div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >1.日间照料(周一至周五，不包括双休日、节假日) 2.陪夜服务 3.住家护理(365天)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2">11.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">个人卫生(生活护理)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
        <input type="checkbox" disabled class="checkBox1"  name="a41" id="a41"/>
      个人(修饰) 
      <input type="checkbox" disabled class="checkBox1"  name="a42" id="a42"/>
      生活起居护理
        <input type="checkbox" disabled class="checkBox1"  name="a43" id="a43"/>
        理发 
        <input type="checkbox" disabled class="checkBox1"  name="a44" id="a44"/>
      扦脚
  		<input type="checkbox" disabled class="checkBox1" name="a45" id="a45" />
        长期卧床老人床铺管理解
        <input type="checkbox" disabled class="checkBox1" name="a46" id="a46" />
        灌肠 
        <input type="checkbox" disabled class="checkBox1" name="a47" id="a47" />
        协助如厕
        <input type="checkbox" disabled class="checkBox1" name="a48" id="a48" />
        清理排泄漏
        <input type="checkbox" disabled class="checkBox1" name="a49" id="a49" />
        不需要
      </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">12.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助餐服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >
        <input type="checkbox" disabled class="checkBox1" name="a50" id="a50" />
    三餐烹饪
    <input type="checkbox" disabled class="checkBox1" name="a51" id="a51" />
    送餐服务
        <input type="checkbox" disabled class="checkBox1" name="a52" id="a52" />
        喂饭
        <input type="checkbox" disabled class="checkBox1" name="a53" id="a53" />
        食物加工     
        <input type="checkbox" disabled class="checkBox1" name="a54" id="a54" />
    不需要</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   rowspan="2">13.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助浴服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" disabled class="checkBox1" name="a55" id="a55" />
    洗浴
    <input type="checkbox" disabled class="checkBox1" name="a56" id="a56" />
    擦浴
    <input type="checkbox" disabled class="checkBox1" name="a57" id="a57" />
    洗头
    <input type="checkbox" disabled class="checkBox1" name="a58" id="a58" />
    不需要</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">14.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">家政及清洁</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >
        <input type="checkbox" disabled class="checkBox1" name="a59" id="a59" />
    家居卫生
    <input type="checkbox" disabled class="checkBox1" name="a60" id="a60" />
    厨房清洁
        <input type="checkbox" disabled class="checkBox1" name="a61" id="a61" />
        清洁
        <input type="checkbox" disabled class="checkBox1" name="a62" id="a62" />
      衣物洗涤
  <input type="checkbox" disabled class="checkBox1" name="a63" id="a63" />
    不需要</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   rowspan="2">15.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助行及待办服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >
        <input type="checkbox" disabled class="checkBox1" name="a64" id="a64" />
    陪同外出散步
    <input type="checkbox" disabled class="checkBox1" name="a65" id="a65" />
    陪同外出
  <input type="checkbox" disabled class="checkBox1" name="a66" id="a66" />
        代缴费用
        <input type="checkbox" disabled class="checkBox1" name="a67" id="a67" />
        代购物品     
        <input type="checkbox" disabled class="checkBox1" name="a68" id="a68" />
        代领物品
        <input type="checkbox" disabled class="checkBox1" name="a69" id="a69" />
    不需要</td>
  </tr>
</table>
</div>
<p>&nbsp;</p> 
<div class="fixed_div5"  id="tab7">
<table width="350" height="490" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="20"  rowspan="2">16.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="95" rowspan="2">相谈及陪伴服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="221" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><p>
        <input type="checkbox" disabled class="checkBox1" name="a70" id="a70" />
      心理咨询
      <input type="checkbox" disabled class="checkBox1" name="a71" id="a71" />
      志愿者探访</p>
      <p>
        <input type="checkbox" disabled class="checkBox1" name="a72" id="a72" />
        社工探访
        <input type="checkbox" disabled class="checkBox1" name="a73" id="a73" />
        不需要
      </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   rowspan="2">17.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助医服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><p>
        <input type="checkbox" disabled class="checkBox1" name="a74" id="a74" />
      全科医生上门评估
      <input type="checkbox" disabled class="checkBox1" name="a75" id="a75" />
      护士上门指导</p>
      <input type="checkbox" disabled class="checkBox1" name="a84" id="a84" />
      陪伴就医
      <p>
  <input type="checkbox" disabled class="checkBox1" name="a76" id="a76" />
        护理耗材代购
        <input type="checkbox" disabled class="checkBox1" name="a77" id="a77" />
      不需要</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"   rowspan="2">18.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">其他服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><p>
        <input type="checkbox" disabled class="checkBox1" name="a78" id="a78" />
      网络代购
      <input type="checkbox" disabled class="checkBox1" name="a79" id="a79" />
      家居设施检查</p>
      <p>
        <input type="checkbox" disabled class="checkBox1" name="a80" id="a80" />
        衣物缝补
        <input type="checkbox" disabled class="checkBox1" name="a81" id="a81" />
      家具设施维修</p>
      <p>
        <input type="checkbox" disabled class="checkBox1" name="a82" id="a82" />
        不需要
      </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  >19.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >护理计划补充说明</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="left">
      <div style="font-weight:bold">${care.a83}&nbsp;</div>
    </div></td>
  </tr>
</table>
<p>&nbsp;</p>
</div>
</form>
</body>
<script type="text/javascript">
<%
   CareAssess ca = (CareAssess)request.getAttribute("care");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=84;methodi++){
    	 String methodname = "getA"+methodi;
    	 //动态调用方法
    	 //ca.getClass().getMethod(methodname, new Class[]{String.class}).invoke(ca, new Object[]{});   
         parasb.append(ca.getClass().getMethod(methodname, new Class[]{}).invoke(ca, new Object[]{})).append(",");
   }
   String parstr = parasb.toString();
%>
var paras = '<%=parstr%>' ;
function fillBlank(){
    var strs= new Array(); 
    strs = paras.split(',');
    for(i=2;i<strs.length-1;i++){
        var obj = document.getElementById("a"+(i+1));
        if(obj!=null&&obj.type=='checkbox'){
             if(strs[i]=='false')
                 document.getElementById("a"+(i+1)).checked=false;
             else
                 document.getElementById("a"+(i+1)).checked=true;
        }
    }
}	

fillBlank();
</script>
</html>

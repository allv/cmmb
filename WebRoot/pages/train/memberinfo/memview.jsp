<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.wootion.cimp.vo.data.Member"%>
<%@ include file="../import.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请人登记表明细</title>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../install_lodop32.exe"></embed>
</object>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
</style>
<style type="text/css">
.fixed_div{ 
position:absolute; 
left:542px; 
bottom:0; 
width:400px; 
top:85px;
} 

.fixed_div3{ 
position:absolute; 
left:212px; 
bottom:0; 
width:400px; 
top:749px;
} 
.fixed_div0{ 
position:absolute; 
left:162px; 
bottom:0; 
width:400px; 
top:69px;
} 
.fixed_div2{ 
position:absolute; 
left:162px; 
bottom:0; 
width:400px; 
top:239px;
} 
</style>
<%
   Member mem = (Member)request.getAttribute("mem");
%>
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
		LODOP.ADD_PRINT_TEXT(50,231,260,39,"打印页面部分内容");
		LODOP.ADD_PRINT_HTM(88,200,500,600,document.getElementById("tab1").innerHTML);
	};	                     
	function prn2_preview() {	
		CreateTwoFormPage();	
		LODOP.PREVIEW();	
	};
	function prn2_manage() {	
		CreateTwoFormPage();
		LODOP.PRINT_SETUP();	
	};	
	
	function prn1_manage(){
	    CreateOneFormPage();
	    LODOP.PRINT_SETUP();
	}
	function CreateTwoFormPage(){
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_表单二");
		//LODOP.ADD_PRINT_RECT(70,27,634,242,0,1);
		//LODOP.ADD_PRINT_TEXT(29,236,279,38,"页面内容改变布局打印");
		LODOP.SET_PRINT_STYLEA(2,"FontSize",18);
		LODOP.SET_PRINT_STYLEA(2,"Bold",1);
		LODOP.ADD_PRINT_HTM(18,10,'80mm',270,document.getElementById("tab1").innerHTML);
		LODOP.ADD_PRINT_HTM(280,10,'80mm',687,document.getElementById("tab2").innerHTML);
		LODOP.ADD_PRINT_HTM(64,380,'80mm',967,document.getElementById("tab3").innerHTML);
		//LODOP.ADD_PRINT_TEXT(319,58,500,30,"注：其中《表单一》按显示大小，《表单二》在程序控制宽度(285px)内自适应调整");
	};              
	function prn3_preview(){
		LODOP=getLodop(document.getElementById('LODOP_OB'),document.getElementById('LODOP_EM'));  
		LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_全页");
		LODOP.ADD_PRINT_HTM(0,0,"100%","100%",document.documentElement.innerHTML);
		LODOP.PREVIEW();	
	};	
    
    function printit(){
        LODOP.PRINT();
    }
</script>
<div class="topLanBar"><b>当前位置：</b>会员管理 > 申请人登记表明细</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<table>
   <tr>
      <td>
         <a href="javascript:prn2_preview()"><span style="color:blue">打印预览</span></a>,其布局风格可<a href="javascript:prn2_manage();"><span style="color:blue">打印维护</span></a>调整,或者也可以<a href="javascript:printit()"><span style="color:blue">直接打印</span></a>
      </td>
   </tr>
</table>
<form>
 <div id="tab1" align="left" class="fixed_div0">
   <h2>G1.申请人登记表</h2>
   <table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;" >
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="32" colspan="3">AA.申请人姓名及证件号</td>
   </tr>
   <tr>
    <td td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="7"><div align="left">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="75"><div align="center"> 姓名<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="40"><div style="font-weight:bold">${mem.memname}</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="left">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">档案编号<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.memid}</div></td>
  </tr>
 <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="7" rowspan="4"><div align="left">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="75"  rowspan="4"><div align="center">
      身份证,社保(医保)号码<span style="color:red;">*</span>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >身份证号码</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.creditid}</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >社保(医保)号码</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  ><div style="font-weight:bold">${mem.conpost}</div></td>
  </tr>
</table>
</div>
<div id="tab2" align="left" class="fixed_div2">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="32" colspan="3">BB.个人信息</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="17"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="100"><div align="center">性别<span style="color:red;">*</span></div></td>
     <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
		 <div style="font-weight:bold">${mem.memsex}</div>
     </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">出生年月<span style="color:red;">*</span></div></td>
     <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"> <div style="font-weight:bold">${mem.birthday}</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">联系电话<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.mylandlinenumber}</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">家庭地址<span style="color:red;">*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.myaddress}</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">文化程度</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.culture}</div><div>1.无 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.小学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3.初中 <br/>4.高中 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.大学及以上</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">现居住地</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.mystreet}</div><div>
        1.私人住房无护理服务<br/> 2.私人住房有护理服务 <br/>3.日间中心<br/> 4.养老院<br/> 5.其他
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">7.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">居住情况</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.reside}</div><div>
        1.独居 <br/>  2.只与配偶及其他人同住 <br/>3.与子女同住(无配偶)<br/> 4.与其他人同住(非子女或配偶) <br/>5.与非亲属关系的其他人同住   
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">8</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">经济情况</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.financial}</div><div>1.退休金 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.子女补贴 <br/>3.低保及困难家庭 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.其他 </div>
      </div>
      <div>
      金额：<span style="font-weight:bold">${mem.beizhu} </span>RMB
     </div> </td>	
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">9</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">其他联系人</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div >
     姓名：<span style="font-weight:bold"> ${mem.coname}</span></div>
     <div>关系：
      <span style="font-weight:bold">
      ${mem.relationship}
      </span>
      </div>
      <div>
    联系地址：
    <span style="font-weight:bold">
    ${mem.concellnumber}</span>
   </div>
   <div >
    电话：<span style="font-weight:bold">
    ${mem.conaddress}</span></div></td>
  </tr>
</table>
</div>

<div class="fixed_div" id="tab3">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" height="31" colspan="3">CC.申请人需求</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="17"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="100"><div align="center">申请/再申请时间</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.concity}&nbsp;</div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">申请原因</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.ways}</div><div>
         1.出院后护理 <br> 2.社区长期护理<br> 3.居家服务需求 <br> 4.日间中心<br> 5.其他
    </div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">服务目标</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.concountry}</div><div>
         1.专业护理服务 <br> 2.定期监护避免意外<br> 3.康复服务 <br> 4.尊重家人选择<br> 5.喘息式照料
      </div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">4.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">最近一次住院</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.connumber}</div><div>
         1.180天内住院 <br> 2.最近一周内<br> 3.最近8-14天内 <br> 4.15-30天内<br> 5.超过30天
      </div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">近期内是否入住养老院</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>
         近两年内是否入住养老院 <span style="font-weight:bold">${mem.mynation}</span><br> 1.是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.否
      </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">是否参与机构项目</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.myemail}</div><div>
         1.是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.否
      </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">7.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">项目名称</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.mycity}&nbsp;</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">8.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">项目提供服务内容</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.mycounty}</div><div>
         1.护理服务 <br> 2.康复服务<br> 3.日间中心体检 <br> 4.其他
      </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">9.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">是否免费体验</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div style="font-weight:bold">${mem.marry}</div><div>
         1.是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.否
      </div>
       <div>次数：
      <span style="font-weight:bold">${mem.mycellnumber}</span>次
  </tr>
</table>
<br/>
<p>
  <div>
      <span style="color:red;">*</span>填表人： <span style="font-weight:bold">${mem.assessment}</span>
  </div>
  <div>
      <span style="color:red;">*</span>日期：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight:bold">${mem.asesdate}</span>
   </div>
</p>
</div>
<div align="center" class="fixed_div3" id="tab3">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="forward('memberlist.do')">返回</button></td>
  </tr>  
</table>
</div>
</form>
</body>
</html>

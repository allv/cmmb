<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cimp.vo.data.healthpsyeval"%>
<%@page import="com.wootion.cimp.vo.data.healtheval"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>心理评估表</title>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="../install_lodop32.exe"></embed>
</object>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:1000px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}
.fixed_div0{ 
position:absolute; 
left:162px; 
top:60px;
width:730px; 
bottom:0;
}
.fixed_divButton{
position:absolute;   
left:162px; 
top:6325px;
width:730px; 
}
.fixed_div1{
position:absolute; 
left:162px; 
top:240px;
width:410px; 
bottom:0;
}
.fixed_div2{
position:absolute; 
left:526px; 
top:240px;
width:410px; 
bottom:0;
}
.fixed_div3{
position:absolute; 
left:162px; 
top:720px;
width:730px; 
bottom:0;
}

.fixed_div4{
position:absolute; 
left:162px; 
top:960px;
width:730px; 
bottom:0;
}

.fixed_div5{
position:absolute; 
left:162px; 
top:1160px;
width:730px; 
bottom:0;
}
.fixed_div6{
position:absolute; 
left:162px; 
top:1660px;
width:730px; 
bottom:0;
}

.fixed_div7{
position:absolute; 
left:162px; 
top:1860px;
width:730px; 
bottom:0;
}
.fixed_divButton{
position:absolute; 
left:162px; 
top:2700px;
width:730px; 
bottom:0;
}

</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';
function disabedDiv(divid){
   $("#"+divid+" :input").attr('disabled', true);
}
var pValue='0';
var pValue2='0';
var pValue3='0';
function getvalue(objS){
     //选中事件
     var mark = parseInt(objS.options[objS.selectedIndex].value); 
     var gapV = mark-pValue;
     var totalmark1 = parseInt(document.getElementById('a21').value);
     document.getElementById('a21').value=gapV+totalmark1;
}

function getvalue1(objS){
     //选中事件
     var mark = parseInt(objS.options[objS.selectedIndex].value); 
     var gapV = mark-pValue2;
     var totalmark1 = parseInt(document.getElementById('a44').value);
     document.getElementById('a44').value=gapV+totalmark1;
}

function getvalue2(objS){
     //选中事件
     var mark = parseInt(objS.options[objS.selectedIndex].value); 
     var gapV = mark-pValue3;
     var totalmark1 = parseInt(document.getElementById('a76').value);
     document.getElementById('a76').value=gapV+totalmark1;
}

function getprevious1(objP1){
    pValue2=parseInt(objP1.options[objP1.selectedIndex].value); 
}

function getprevious2(objP2){
    pValue3=parseInt(objP2.options[objP2.selectedIndex].value); 
}

function getprevious(objP){
    pValue=parseInt(objP.options[objP.selectedIndex].value); 
}

function onSubmit(){
      var memname = document.getElementById('memname').value;
      var mmseid = document.getElementById('mmseid').value;
      var memnumber = document.getElementById('memnumber').value;
      var assesdate = document.getElementById('assesdate').value;
      var healthnumber = document.getElementById('healthnumber').value;
      var belongproname = "";
      var applyreason = document.getElementById('applyreason').value;
      var healthid = document.getElementById('healthid').value;
      var paraurl = '';
      //如果有档案编号了，那么这次进入就是更改操作
      if(document.getElementById('memname').disabled==false){
	        if (memname == "")
	        {
	            alert('请为痴呆症评估量表选择一个会员');
	            return;
	        }else if(applyreason==""){
	            alert('痴呆症评估量表申请原因不能为空');
	            return;
	        }else if(healthnumber==""){
	            alert('痴呆症评估量表档案编号不能为空');
	            return;
	        }
	   }
	   if(document.getElementById('a45').disabled==false){     
	        if (document.getElementById('a45').value == "")
	        {
	            alert('请为社交焦虑评估量表选择一个会员');
	            return;
	        }else if(document.getElementById('a46').value==""){
	            alert('社交焦虑评估量表申请原因不能为空');
	            return;
	        }else if(document.getElementById('a47').value==""){
	            alert('社交焦虑评估量表档案编号不能为空');
	            return;
	        }
	   }   
	   
	    if(document.getElementById('a22').disabled==false){
	        if (document.getElementById('a22').value == "")
	        {
	            alert('请为抑郁症评估量表选择一个会员');
	            return;
	        }else if(document.getElementById('a23').value==""){
	            alert('抑郁症评估量表申请原因不能为空');
	            return;
	        }else if(document.getElementById('a24').value==""){
	            alert('抑郁症评估量表档案编号不能为空');
	            return;
	        }
      	 }
      for(i=1;i<=76;i++){
	         if(document.getElementById("a"+i).type=='checkbox'){
	         	eval("var a" + i + "=" + document.getElementById("a"+i).checked+";");
	         	paraurl = paraurl+'&'+('a'+i)+'='+document.getElementById("a"+i).checked;
	         }else if(document.getElementById("a"+i).nodeName=='SELECT'){
	             var b = document.getElementById("a"+i).value;
	             if((b)==null){
	                //此处不能为空，要给个默认值
	                b='';
	             }
	            
	             eval("var a" + i + "='" + b+"';");
	             paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
	         }else if(document.getElementById("a"+i).type=='text'){
	            var b = document.getElementById("a"+i).value;
	            if((b)==null){
	                //此处不能为空，要给个默认值
	                b='';
	            }
	            
	            eval("var a" + i + "='" + b+"';");
	            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
	         }else if(document.getElementById("a"+i).type=='textarea'){
	            var b1 = document.getElementById("a"+i).value;
	            if((b)==null){
	                //此处不能为空，要给个默认值
	                b1='';
	            }
	            
	            eval("var a" + i + "='" + b1+"';");
	            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b1);
	         }
	        }
	       if(mmseid!='null'&&mmseid!=""){
	            $.ajax({
					  type: "POST",
					  url: basePath + "/healthEvalmodifypsy.do?mmseid="+mmseid+"&healthid="+healthid+"&memnumber="+memnumber+"&healthnumber="+healthnumber+"&applyreason="+encodeURI(applyreason)+"&memname="+encodeURI(memname)+"&belongproname="+encodeURI(belongproname)+"&assesdate="+assesdate+paraurl,
					  success:function (msg){
					  var result = msg;
					  if('success'==result){
					  	  alert('心理评估表编辑成功');
					  	  window.location.href=basePath+"/healthEvallistH.do";
					  }
					  else{
					  	  alert('心理评估表编辑失败');
					  }
					  },
					  failure:function (){
					  	  alert("未知错误！");
					  }   
					  });
	       }else{
	           $.ajax({
					  type: "POST",
					  url: basePath + "/healthEvaladdpsy.do?healthid="+healthid+"&memnumber="+memnumber+"&healthnumber="+healthnumber+"&applyreason="+encodeURI(applyreason)+"&memname="+encodeURI(memname)+"&belongproname="+encodeURI(belongproname)+"&assesdate="+assesdate+paraurl,
					  success:function (msg){
					  var result = msg;
					  if('success'==result){
					  	  alert('心理评估表新增成功');
					  	  window.location.href=basePath+"/healthEvallistH.do";
					  }
					  else{
					  	  alert('心理评估表新增失败');
					  }
					  },
					  failure:function (){
					  	  alert("未知错误！");
					  }   
					  });
		   }
}

function Bian(targetCom1,targetCom2,selectindex){
        if(selectindex==0){
           document.getElementById(targetCom1).disabled=true;
           document.getElementById(targetCom1).value='';
           if(targetCom2!=''){
               document.getElementById(targetCom2).disabled=true;
               document.getElementById(targetCom2).value='';
           }
        }else{
           document.getElementById(targetCom1).disabled=false;
           if(targetCom2!=''){
                document.getElementById(targetCom2).disabled=false;
           }
        }
}

function BianCheck(sindex,eindex,selectindex){
    if(selectindex==0){
       for(i=sindex;i<=eindex;i++){
         document.getElementById('a'+i).checked=false;
       }
    }
}

function disAb(sindex,eindex){
     for(i=sindex;i<=eindex;i++){
         document.getElementById('a'+i).checked=false;
     }
}

function enableCheck(index){
    document.getElementById('a'+index).checked=false;
}

function enableselect(index){
    document.getElementById('a'+index).options[1].selected=true;
}

function chooseElders(fromwhere){
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
    		document.getElementById("memnumber").value=arr[0];
    		document.getElementById('a22').value=arr[1];
    		document.getElementById("a25").value=arr[0];
    		document.getElementById('a45').value=arr[1];
    		document.getElementById('a48').value=arr[0];
    } 	
 }
</script>
</head>
<body>
<script type="text/javascript">
    var basePath = '<%=basePath%>';
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
		//第一页
		LODOP.ADD_PRINT_HTM(8,10,570,795,document.getElementById("divA").innerHTML);
		LODOP.ADD_PRINT_HTM(213,10,570,700,document.getElementById("div1").innerHTML);
		LODOP.ADD_PRINT_HTM(213,370,590,1000,document.getElementById("div2").innerHTML);
		LODOP.ADD_PRINT_HTM(823,10,570,500,document.getElementById("div3").innerHTML);
		
		LODOP.NEWPAGE();
		//第二页
		LODOP.ADD_PRINT_HTM(88,10,570,795,document.getElementById("div4").innerHTML);
		LODOP.ADD_PRINT_HTM(373,10,570,995,document.getElementById("div5").innerHTML);
		
		LODOP.NEWPAGE();
		//第三页
		LODOP.ADD_PRINT_HTM(3,10,570,795,document.getElementById("div6").innerHTML);
		LODOP.ADD_PRINT_HTM(273,10,570,1095,document.getElementById("div7").innerHTML);
		
	};	                     
	function prn1_manage(){
	    CreateOneFormPage();
	    LODOP.PRINT_SETUP();
	}
    
    function printit(){
        LODOP.PRINT();
    }
</script>
<div class="topLanBar"><b>当前位置：</b>健康评估 > 心理评估</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<table>
   <tr>
      <td>
         <a href="javascript:prn1_preview()"><span style="color:blue">打印预览</span></a>,其布局风格可<a href="javascript:prn1_manage();"><span style="color:blue">打印维护</span></a>调整</a>
      </td>
   </tr>
</table>
<form  method="post">
<input name="healthid" id="healthid" type="hidden" value="${health.healthid}"/>
<input name="mmseid" id="mmseid" type="hidden" value="${healthpsy.mmseid}"/>
<div align="left" id="divA" class="fixed_div0">
<div><h2>G3.1 MMSE简易精神状态评估表(痴呆症评估量表)</h2></div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="138"><span style='color:red;'>&nbsp;*</span>姓名：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="200"><input type="text" name="memname" id="memname" value="${health.memname}" readonly/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="190" rowspan="5"><div align="center">评估原因</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="174" rowspan="5"><div>评估类型：
      <select name="applyreason" id="applyreason">
           <option value="首次评估" ${healthpsy.applyreason == '首次评估' ? "selected" : ""}>首次评估</option>
	       <option value="后续评估" ${healthpsy.applyreason == '后续评估' ? "selected" : ""}>后续评估</option>
	       <option value="阶段评估" ${healthpsy.applyreason == '阶段评估' ? "selected" : ""}>阶段评估</option>
	       <option value="出院后评估" ${healthpsy.applyreason == '出院后评估' ? "selected" : ""}>出院后评估</option>
	       <option value="其他" ${healthpsy.applyreason == '其他' ? "selected" : ""}>其他</option>
      </select>
    </div>
    <div>1.首次评估</div>
    <div>2.后续评估</div>
    <div>3.阶段评估</div>
    <div>4.出院后评估</div>
    <div>5.其他</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><span style='color:red;'>&nbsp;*</span>档案编号：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="healthnumber" id="healthnumber" value="${healthpsy.healthnumber}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><span style='color:red;'>&nbsp;*</span>会员编号(如有)：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="memnumber" id="memnumber" value="${health.memnumber}" readonly/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员签字：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="assesname" id="assesname" value="${healthpsy.assesname}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员职务：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="assesdep" id="assesdep" value="${healthpsy.assesdep}"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估日期：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="assesdate" id="assesdate" value="${healthpsy.assesdate}" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">&nbsp;</td>
  </tr>
</table>
</div>
<div align="left" id="div1" class="fixed_div1">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="23">&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="95">最高分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="73">得分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="131">问题</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="10">一、时间与方位</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="5"><div align="center">5分(1题1分)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a1" id="a1" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
      分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">今年是哪一年？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a2" id="a2" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
    分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">现在是什么季节？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a3" id="a3" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
    分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">今天是几号？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a4" id="a4" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
    分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">今天是星期几？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a5" id="a5" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
    分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">现在是几月份？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="5"><div align="center">5分(1题1分)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
     <select name="a6" id="a6" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">我们现在在哪个区？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a7" id="a7" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">我们现在在哪个国家？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a8" id="a8" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">我们现在在哪个城市？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
   <select name="a9" id="a9" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">我们现在在哪层楼？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a10" id="a10" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
    </select>
分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">我们现在在什么建筑物里？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">二、预备记忆</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">3分(答出1项得1分)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
     <select name="a11" id="a11" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
	  <option value="2">2</option>
	  <option value="3">3</option>
    </select>
    分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><p>评估员缓慢、清晰说出3种不关联的事物(例如苹果、汽车、闹钟)，等申请人完全听清楚(重复不超过6次)，并能够一次性重复后，告知需要在稍后让其重复</p>
    <p>重复次数：
      <input type="text" size="3" name="a12" id="a12"/>
    </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">三、注意力与计算</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">5分(答出1项得1分)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a13" id="a13" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
	  <option value="2">2</option>
	  <option value="3">3</option>
	  <option value="4">4</option>
	  <option value="5">5</option>	
    </select>
    分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">倒着计算&quot;100-7&quot;，连续说5个数字&quot;93,86,79,72,65&quot;</td>
  </tr>
</table>
</div>
<div  align="left" id="div2" class="fixed_div2">
<table width="365" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="24">&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="63">最高分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="64">得分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="185">问题</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">四、重复</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3分(答出1项得1分)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
    <select name="a14" id="a14" onclick="getprevious(this);" onchange="getvalue(this);">
      <option value="0" selected>0</option>
	  <option value="1">1</option>
	  <option value="2">2</option>
	  <option value="3">3</option>
    </select>
    分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">之前说过的3个事物，你能否告诉我他们分别是什么吗？</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="8"><div align="center">五、语言及应用</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2分(答出1项得1分)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
       <select name="a15" id="a15" onclick="getprevious(this);" onchange="getvalue(this);">
	      <option value="0" selected>0</option>
		  <option value="1">1</option>
		  <option value="2">2</option>
       </select>
分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <div>(出示手表)这是什么</div>
      <div>(出示铅笔)这是什么</div>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a16" id="a16" onclick="getprevious(this);" onchange="getvalue(this);">
	      <option value="0" selected>0</option>
		  <option value="1">1</option>
       </select>
分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">请您跟着我说：“大家齐心协力拉紧绳”</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">3分(做对1个步骤得1分)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">
      <select name="a17" id="a17" onclick="getprevious(this);" onchange="getvalue(this);">
	      <option value="0" selected>0</option>
		  <option value="1">1</option>
		  <option value="2">2</option>
		  <option value="3">3</option>
       </select>
分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">我给您好一张纸，请按我说的去做，现在开始：“用右手拿着这张纸”</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">“用两只手将他对折起来”</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">“放在您好的左腿上”</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a18" id="a18" onclick="getprevious(this);" onchange="getvalue(this);">
	      <option value="0" selected>0</option>
		  <option value="1">1</option>
       </select>
分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">请您念一念这句话，并且按着上面的意思去做“闭上您的眼睛”</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a19" id="a19" onclick="getprevious(this);" onchange="getvalue(this);">
	      <option value="0" selected>0</option>
		  <option value="1">1</option>
       </select>
分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">请造一句句子，必须有一个名词和一个动词</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
       <select name="a20" id="a20" onclick="getprevious(this);" onchange="getvalue(this);">
	      <option value="0" selected>0</option>
		  <option value="1">1</option>
       </select>
分</div></td>
    <td height="120" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <div>请照这个样子画出来。(必须有10个角，其中两个重叠在一起)</div>
      <div><img src='<%=basePath%>/pages/train/skins/img/testpic.png' style='width:60px;height:40px' border='0' hspace='1'/></div>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">30</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">总分：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="5" value="0" name="a21" id="a21" readonly/>
      分</td>
  </tr>
</table>
</div>
<div align="left" id="div3" class="fixed_div3">
<div>评分说明：</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="133"><div align="center">方式方法</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="271"><div align="center">分数</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="304"><div align="center">解释说明</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">简单方类</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">&lt; 24</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">不正常</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">范围</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">&lt; 21</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">老年失忆症患病率增加</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">&gt; 25</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">老年失忆症患病降低</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">学历分类</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">21</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">初中教育程度不正常分界值</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">&lt; 23</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">高中教育程度不正常分界值</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">&lt; 24</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">大专以上教育程度不正常分界值</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">严重度 </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">24 - 30</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">无认知功能障碍</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">18 - 23</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">轻度认知功能障碍</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0 - 17</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">重试认知功能障碍</td>
  </tr>
</table>
</div>

<div align="left" id="div4" class="fixed_div4">
<h2>G3.2 抑郁症评估量表</h2>
<div>GDS 简易老年抑郁症评估表</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="138"><span style='color:red;'>&nbsp;*</span>姓名：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="200"><input type="text" name="a22" id="a22" value="${health.memname}" readonly/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="190" rowspan="5"><div align="center">评估原因</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="174" rowspan="5"><div>评估类型：
      <select name="a23" id="a23">
           <option value="首次评估">首次评估</option>
	       <option value="后续评估">后续评估</option>
	       <option value="阶段评估">阶段评估</option>
	       <option value="出院后评估">出院后评估</option>
	       <option value="其他">其他</option>
      </select>
    </div>
    <div>1.首次评估</div>
    <div>2.后续评估</div>
    <div>3.阶段评估</div>
    <div>4.出院后评估</div>
    <div>5.其他</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><span style='color:red;'>&nbsp;*</span>档案编号：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a24" id="a24"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><span style='color:red;'>&nbsp;*</span>会员编号(如有)：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a25" id="a25" value="${health.memnumber}" readonly/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员签字：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a26" id="a26"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员职务：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a27" id="a27"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估日期：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a28" id="a28" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">&nbsp;</td>
  </tr>
</table>
</div>

<div align="left" id="div5" class="fixed_div5">
<div>说明：过去一周内描述：符合想法的在分数选项填写相应数值</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="72" rowspan="2"><div align="center">编号</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="431" rowspan="2"><div align="center">问题</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"><div align="center">分数
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="67"><div align="center">是
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="58"><div align="center">否</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="68"><div align="center">得分</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你现在对你的生活基本满意吗？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a29" id="a29" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是不是放弃了许多你喜欢的活动和兴趣爱好？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
     <select name="a30" id="a30" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否感觉你的生活很空虚？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a31" id="a31" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否很容易感到无聊？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
     <select name="a32" id="a32" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你大部分时间是否总是很有精神？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a33" id="a33" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否担心有些坏的事情将要发生在自己身上？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a34" id="a34" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">7.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你大部分时间是否感到快乐？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
       <select name="a35" id="a35" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">8.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否总是感到无助？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
        <select name="a36" id="a36" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">9.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否更喜欢呆在家里，不愿意外出活动？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a37" id="a37" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">10.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否感觉记性比大部分人都是要糟糕？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
     <select name="a38" id="a38" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">11.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否觉得现在活着真好？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
     <select name="a39" id="a39" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">12.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否感到你现在很没有价值？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
       <select name="a40" id="a40" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">13.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否觉得充满活力？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
      <select name="a41" id="a41" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">14.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否觉得你现在的处境很无助？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
        <select name="a42" id="a42" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">15.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">你是否觉得大部分人都生活的比你好？</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">0</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">
     <select name="a43" id="a43" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="right">总分</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"><div align="center">
      <input type="text" value="0" size="5" name="a44" id="a44" readonly/>
    </div></td>
  </tr>
</table>
<div align="right">分数&ge;5时，可能是有抑郁症</div>
</div>

<div align="left" id="div6" class="fixed_div6">
<h2>G3.3 社交焦虑评估量表 </h2>
<p>LSAS 社交焦虑评估表</p>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="138"><span style='color:red;'>&nbsp;*</span>姓名：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="200"><input type="text" name="a45" id="a45" value="${health.memname}" readonly/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="190" rowspan="5"><div align="center">评估原因</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="174" rowspan="5"><div>评估类型：
      <select name="a46" id="a46">
           <option value="首次评估">首次评估</option>
	       <option value="后续评估">后续评估</option>
	       <option value="阶段评估">阶段评估</option>
	       <option value="出院后评估">出院后评估</option>
	       <option value="其他">其他</option>
      </select>
    </div>
    <div>1.首次评估</div>
    <div>2.后续评估</div>
    <div>3.阶段评估</div>
    <div>4.出院后评估</div>
    <div>5.其他</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><span style='color:red;'>&nbsp;*</span>档案编号：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a47" id="a47"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><span style='color:red;'>&nbsp;*</span>会员编号(如有)：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a48" id="a48" value="${health.memnumber}" readonly/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员签字：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a49" id="a49"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估人员职务：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a50" id="a50"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">评估日期：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" name="a51" id="a51" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
  </table>
</div>

<div align="left" id="div7" class="fixed_div7">
<div>说明：表格分为&quot;恐惧&quot;、&quot;避免&quot;两项选项，根据两项内容填写相应分数</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="38" rowspan="2"><div align="center">编号</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="165" rowspan="2"><div align="center">问题</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4"><div align="center">害怕
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4"><div align="center">避免</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="22" rowspan="2"><div align="center">得分</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50">无0分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50">轻度1分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50">中度2分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50">严重3分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >从不0分</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >偶尔(1-33%)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >经常(34-66%)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >经常(67-100%)</td>
  </tr>
  <tr  height="25">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">1</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在公共场所打电话</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="50"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
    <select id="a52" name="a52" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">2</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >参加小组活动</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
      <select id="a53" name="a53" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">3</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在公共场所吃东西</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>


</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
    <select id="a54" name="a54" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">4</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在公共场所喝东西</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
     </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a55" name="a55" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">5</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >与权威人士交谈</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
     </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
      <select id="a56" name="a56" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">6</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在公众前表演、演讲</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a57" name="a57" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">7</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >去参加聚会</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
   </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a58" name="a58" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">8</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >活动时被人注视</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
   </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a59" name="a59" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">9</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >写东西时被人注视</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
     <select id="a60" name="a60" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">10</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >与不认识的人打电话</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
  </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a61" name="a61" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">11</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >与不熟悉的人交谈</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
  </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
        <select id="a62" name="a62" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">12</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >与陌生人见面</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
     <select id="a63" name="a63" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">13</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在公共厕所如厕</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a64" name="a64" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">14</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >走进一间房间已经有人坐在里面</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
   </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
        <select id="a65" name="a65" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">15</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >成为众人焦点</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
  </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
      <select id="a66" name="a66" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">16</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在开会时发言</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
  </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a67" name="a67" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">17</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >参加测试</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
   </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a68" name="a68" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">18</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >向不认识的人表达式不同观点</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
     </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
        <select id="a69" name="a69" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">19</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >与不认识的人有目光交流</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
       <select id="a70" name="a70" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">20</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >在小组活动中进行演讲</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
   </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
      <select id="a71" name="a71" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">21</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >试图与他人搭讪</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
  </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
      <select id="a72" name="a72" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">22</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >将物品退还商店</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
   </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
        <select id="a73" name="a73" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">23</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >自己组织聚会</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
      <select id="a74" name="a74" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">24</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >拒绝强力推销人员</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div>
     </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="right">
      <select id="a75" name="a75" onclick="getprevious2(this);" onchange="getvalue2(this);">
       <option value="0">0</option>
       <option value="1">1</option>
       <option value="2">2</option>
       <option value="3">3</option>
       <option value="4">4</option>
       <option value="5">5</option>
       <option value="6">6</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="10"><div align="right">总分</div><div align="right"></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" value="0" size="5"  name="a76" id="a76" readonly/>
    </div></td>
  </tr>
</table>
<div>评分说明：</div>
<div>总分共计144分，&quot;害怕&quot; 72分 ，&quot;避免&quot; 72分;</div>
<div>分数：55-65中度社交焦虑</div>
<div> 65-80明显社交焦虑</div>
<div>80-95 严重社交焦虑</div>
<div>&gt;95 非常严重社交焦虑</div>
</div>
<div align="center" id="divButton" class="fixed_divButton">
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="onSubmit()">确定</button><button onClick="forward('healthEvallistH.do')">返回</button></td>
  </tr>  
</table>
</div>
</form>
<script type="text/javascript">
<%
   healthpsyeval healthpsy = (healthpsyeval)request.getAttribute("healthpsy");
   healtheval health = (healtheval)request.getAttribute("health");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=76;methodi++){
    	 String methodname = "getA"+methodi;
    	 //动态调用方法
         parasb.append(healthpsy.getClass().getMethod(methodname, new Class[]{}).invoke(healthpsy, new Object[]{})).append(",");
   }
   String parstr = parasb.toString();
   //是否进行G3.1
   String g31 = health.getA6();
   //是否进行G3.2
   String g32 = health.getA29();
   //是否进行G3.3
   String g33 = health.getA36();
%>
var paras = '<%=parstr%>' ;
var g31 = '<%=g31%>';
var g32 = '<%=g32%>';
var g33 = '<%=g33%>';
function fillBlank(){
     var strs= new Array(); 
     strs = paras.split(',');
     for(i=0;i<strs.length-1;i++){
            //会员名字，会员编号以健康评估表为准
            if(i==21||i==44||i==47||i==24){continue;}
            if(i==20||i==43||i==75){
	            if(strs[i]=='null'){
	               strs[i]=0;
	               continue;
	            }
            }else{
                if(strs[i]=='null'){
	               strs[i]='';
	               continue;
	            }
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

fillBlank();
//判断哪些心理评估表需要填写
if(g31=='0'){
	disabedDiv('divA');
	disabedDiv('div1');
	disabedDiv('div2');
}

if(g32=='0'){
    disabedDiv('div5');
	disabedDiv('div4');
}

if(g33=='0'){
    disabedDiv('div7');
	disabedDiv('div6');
}
</script>
</body>
</html>
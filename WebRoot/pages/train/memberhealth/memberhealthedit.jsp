<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cimp.vo.data.healtheval"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健康评估修改</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:1000px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}
.fixed_div0{ 
position:absolute; 
left:162px; 
top:60px;
width:410px; 
bottom:0;
}

.fixed_div{
position:absolute;   
left:533px; 
top:90px;
width:410px; 
bottom:0;
}

.fixed_divB{
position:absolute;   
left:162px; 
top:320px;
width:410px; 
bottom:0;
}

.fixed_divD{
position:absolute;   
left:533px; 
top:320px;
width:410px; 
bottom:0;
}
.fixed_divE{
position:absolute;   
left:162px; 
top:670px;
width:410px; 
bottom:0;
}

.fixed_divF{
position:absolute;   
left:562px; 
top:670px;
width:410px; 
bottom:0;
}

.fixed_divG{
position:absolute;   
left:562px; 
top:950px;
width:410px; 
bottom:0;
}

.fixed_divG1{
position:absolute;   
left:162px; 
top:1350px;
width:410px; 
bottom:0;
}

.fixed_divG2{
position:absolute;   
left:562px; 
top:1350px;
width:410px; 
bottom:0;
}

.fixed_divH{
position:absolute;   
left:162px; 
top:2000px;
width:410px; 
bottom:0;
}
.fixed_divI1{
position:absolute;   
left:562px; 
top:2010px;
width:410px; 
bottom:0;
}

.fixed_divI{
position:absolute;   
left:162px; 
top:2430px;
width:410px; 
bottom:0;
}

.fixed_divj{
position:absolute;   
left:162px; 
top:2680px;
width:410px; 
bottom:0;
}

.fixed_divj1{
position:absolute;   
left:562px; 
top:2700px;
width:410px; 
bottom:0;
}

.fixed_divk{
position:absolute;   
left:162px; 
top:3535px;
width:410px; 
bottom:0;
}
.fixed_divL{
position:absolute;   
left:162px; 
top:3850px;
width:410px; 
bottom:0;
}

.fixed_divM{
position:absolute;   
left:162px; 
top:3990px;
width:410px; 
bottom:0;
}

.fixed_divM1{
position:absolute;   
left:562px; 
top:3552px;
width:410px; 
bottom:0;
}
.fixed_divN{
position:absolute;   
left:562px; 
top:3752px;
width:410px; 
bottom:0;
}

.fixed_divO{
position:absolute;   
left:562px; 
top:4015px;
width:410px; 
bottom:0;
}

.fixed_divO1{
position:absolute;   
left:162px; 
top:4315px;
width:730px; 
}
.fixed_divP{
position:absolute;   
left:162px; 
top:4865px;
width:730px; 
}
.fixed_divP1{
position:absolute;   
left:162px; 
top:5665px;
width:730px; 
}
.fixed_divQ{
position:absolute;   
left:162px; 
top:6015px;
width:730px; 
}

.fixed_divButton{
position:absolute;   
left:162px; 
top:6325px;
width:730px; 
}
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';

function onSubmit(){
      var memname = document.getElementById('memname').value;
      var assesdate = document.getElementById('assesdate').value;
      var healthnumber = document.getElementById('healthnumber').value;
      var belongproname = "";
      var applyreason = document.getElementById('applyreason').value;
      var healthid = document.getElementById('healthid').value;
      var memnumber = document.getElementById('memnumber').value;
      var paraurl = '';
      
      for(i=1;i<=369;i++){
	         if(document.getElementById("a"+i).type=='checkbox'){
	         	eval("var a" + i + "=" + document.getElementById("a"+i).checked+";");
	         	paraurl = paraurl+'&'+('a'+i)+'='+document.getElementById("a"+i).checked;
	         }else if(document.getElementById("a"+i).nodeName=='SELECT'){
	             var b = document.getElementById("a"+i).value;
	             if(b==null){
	                //此处不能为空，要给个默认值
	                b='';
	             }
	            
	             eval("var a" + i + "='" + b+"';");
	             paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
	         }else if(document.getElementById("a"+i).type=='text'){
	            var b = document.getElementById("a"+i).value;
	            if(b==null){
	                //此处不能为空，要给个默认值
	                b='';
	            }
	            
	            eval("var a" + i + "='" + b+"';");
	            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
	         }else if(document.getElementById("a"+i).type=='textarea'){
	            var b1 = document.getElementById("a"+i).value;
	            if(b1==null){
	                //此处不能为空，要给个默认值
	                b1='';
	            }
	            
	            eval("var a" + i + "='" + b1+"';");
	            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b1);
	         }
      }
        if (memname == "")
        {
            alert('请选择一个会员');
            return;
        }else if(applyreason==""){
            alert('申请原因不能为空');
            return;
        }else if(healthnumber==""){
            alert('档案编号不能为空');
            return;
        }else if(assesdate==""){
            alert('评估日期不能为空');
            return;
        }
        
           $.ajax({
				  type: "POST",
				  url: basePath + "/healthEvalmodifyhealth.do?memnumber="+memnumber+"&healthid="+healthid+"&healthnumber="+healthnumber+"&applyreason="+encodeURI(applyreason)+"&memname="+encodeURI(memname)+"&assesdate="+assesdate+"&belongproname="+encodeURI(belongproname)+paraurl,
				  success:function (msg){
				  var result = msg;
				  if('success'==result){
				  	  alert('评估表修改成功');
				  	  window.location.href=basePath+"/healthEvallistH.do";
				  }
				  else{
				  	  alert('评估表修改失败');
				  }
				  },
				  failure:function (){
				  	  alert("未知错误！");
				  }   
				  });
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
    	document.getElementById("memnumber").value=arr[0];
    } 	
 }
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>会员管理 > 健康评估修改</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div id="floatdiv" style="width:120px;height:40px;position:absolute;right:20px;top:80px;background:#FFCC00;border:1px solid #999;">
   <table>
    <tr>
        <td>
   			<a href="javascript:document.getElementById('divA').focus();"><span style="color:blue">A</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divB').focus();"><span style="color:blue">B</span></a>
   		</td>
   		 <td>
   			<a href="javascript:document.getElementById('divC').focus();"><span style="color:blue">C</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divD').focus();"><span style="color:blue">D</span></a>
   		</td>
   		
   		 <td>
   			<a href="javascript:document.getElementById('divE').focus();"><span style="color:blue">E</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divF').focus();"><span style="color:blue">F</span></a>
   		</td>
   		
   		 <td>
   			<a href="javascript:document.getElementById('divG').focus();"><span style="color:blue">G</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divH').focus();"><span style="color:blue">H</span></a>
   		</td>
   		 <td>
   			<a href="javascript:document.getElementById('divI').focus();"><span style="color:blue">I</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divj').focus();"><span style="color:blue">J</span></a>
   		</td>
   		
    </tr>
     <tr>
         <td>
   			<a href="javascript:document.getElementById('divk').focus();"><span style="color:blue">K</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divL').focus();"><span style="color:blue">L</span></a>
   		</td>
         <td>
   			<a href="javascript:document.getElementById('divM').focus();"><span style="color:blue">M</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divN').focus();"><span style="color:blue">N</span></a>
   		</td>
   		 <td>
   			<a href="javascript:document.getElementById('divO').focus();"><span style="color:blue">O</span></a>
   		</td>
   		<td>
   			<a href="javascript:document.getElementById('divP').focus();"><span style="color:blue">P</span></a>
   		</td>
   		
   		 <td>
   			<a href="javascript:document.getElementById('divQ').focus();"><span style="color:blue">Q</span></a>
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
<form  method="post">
<div style="text-align:center">
<input name="healthid" id="healthid" type="hidden" value="${health.healthid}"/>
<input name="memnumber" id="memnumber" type="hidden" value="${health.memnumber}"/>
<div align="left" id="divA" class="fixed_div0">
<p><h2>G2.健康评估表</h2></p>
<br>
<p>A.评估信息</p>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="20"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="92">姓名<span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="272"><input type="text" value="${health.memname}" name="memname" id="memname" size="13" readonly/><input type="button" value="选择" onclick="chooseElders();"></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >档案编号<span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" value="${health.healthnumber}" name="healthnumber" id="healthnumber"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >评估日期<span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" value="${health.assesdate}" class="Wdate" name="assesdate" id="assesdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >申请原因</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><p>评估类型
       <select id="applyreason" name="applyreason">
       <option value="首次评估" ${health.applyreason == '首次评估' ? "selected" : ""}>首次评估</option>
       <option value="后续评估" ${health.applyreason == '后续评估' ? "selected" : ""}>后续评估</option>
       <option value="阶段评估" ${health.applyreason == '阶段评估' ? "selected" : ""}>阶段评估</option>
       <option value="出院后评估" ${health.applyreason == '出院后评估' ? "selected" : ""}>出院后评估</option>
       <option value="其他" ${health.applyreason == '其他' ? "selected" : ""}>其他</option>
    </select>
    </p>
    <div>1、首次评估</div>
    <div>2、后续评估(如：项目终期）</div>
    <div>3、阶段评估(更新最近一次评估)</div>
    <div>4、出院后评估</div>
    <div>5、其他</div></td>
  </tr>
</table>
</div>
<br>
<div align="left" id="divC" class="fixed_div">
<p>C.沟通与听力</p>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="19"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="64"><div align="center">听力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="296">
    <select name="a8" id="a8" style="width:50px">
       <option value="0"}>0</option>
	   <option value="1">1</option>
	   <option value="2">2</option>
    </select>
    <div>0、能够听到：正常音量对话，电视声，电话话，门铃</div>
    <div>1、听力减退：需调高音量或大声重复</div>
    <div>2、弱听：需要有助听器等等辅助</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">理解能力(表达)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a9" id="a9" style="width:50px">
        <option value="0" selected>0</option>
	    <option value="1">1</option>
	    <option value="2">2</option>
	    <option value="3">3</option>
    </select>
    <div>0、正常：理解没有困难</div>
    <div>1、一般：用词和表述完整想法有些困难，但给予一定时间或一点提示能够表达</div>
    <div>2、有时候能理解：较难做出准确反馈</div>
    <div>3、几乎无法理解</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">沟通能力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">b.比过去90天糟糕： 
     <select name="a10" id="a10" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    0.否1.是</td>
  </tr>
</table>
</div>
<p>&nbsp;</p>
<div align="left" id="divB" class="fixed_divB" >
<p>B.认知功能评定</p>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="19" rowspan="3"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="65" rowspan="3"><div align="center">记忆能力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="295">
    <select name="a1" id="a1" style="width:50px">
	    <option value="0" selected>0</option>
	    <option value="1">1</option>
    </select>0、记忆力好1、记忆力有问题</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="checkbox" class="checkBox1"  name="a2" id="a2" />
    a.短期记忆力-回想5分钟前发生的事</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="checkbox" class="checkBox1"  name="a3" id="a3" />
    b.程序记忆-不用提醒能够想起所有或大部分测试项目环节中的顺序</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">日常判断能力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    a.服务老人如何决定一天安排(例如，什么时候起床或吃早饭，穿哪件衣服，参与什么活动)
     <select name="a4" id="a4" style="width:50px">
	      <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
      </select>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <div>0.独立完成-决定持续/合理/安全</div>
    <div>1.需协助-对新情况有些困难</div>
    <div>2.轻微丧失-在一些特殊情况下做决定变得很困难、不安全，需要有人指引</div>
    <div>3.中度丧失-经常做出糟糕、不安全的决定，任何时候都需要有人帮助</div>
    <div>4.严重丧失-从不或几乎无法做决定</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">b.比过去90天糟糕：
     <select name="a5" id="a5" style="width:50px">
	      <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      0.否 1.是</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">认知功能测试</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>是否有必要进行？
       <select name="a6" id="a6" style="width:50px" onchange="Bian('a7','',this.options.selectedIndex)">
	      <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>0.否1.是 </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">分数：
   <input type=text id="a7" name="a7" size="5" disabled/></td>
  </tr>
</table>
</div>
<p>&nbsp;</p>
<div align="left" id="divD" class="fixed_divD" >
<p>D.视力</p>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="19"><div align="center">1.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="64"><div align="center">视力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="296"><div>(正常光线及佩戴眼镜可见)
     <select name="a11" id="a11" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
	     <option value="3">3</option>
      </select>
    </div>
      <div>0、正常：可正常阅读报刊等</div>
      <div>1、轻微障碍：能看见大字体，但是一般书报、杂志无法阅读</div>
      <div>2、弱视：有限视力，但是能分辨物体</div>
      <div>3、严重弱视：看不见或能看见光、颜色、形状</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">视觉障碍</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>看到光圈、眼前有暗区或有闪光
     <select name="a12" id="a12" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    </div>
    <div>0、否 1、是</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">沟通能力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">比过去90天糟糕：
     <select name="a13" id="a13" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    0.否1.是</td>
  </tr>
</table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div align="left" id="divE" class="fixed_divE" >
<p>E.心情与行为</p>
<table width="390" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="19" rowspan="2"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="64" rowspan="2"><div align="center">抑郁、焦虑、坏心情指向</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="296">(选择以下编号)0、近3天内未发现1、3天内未发现2次 2、3天内每天表现出</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>a.感到悲伤或抑郁，认为或者没有什么值留恋，任何事情都不在乎，认为自己没用还不如死了
      <select name="a30" id="a30" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div>
    <div>b.持续对自己或对他人发怒，例如在接受护理人员的时候容易烦躁、发怒
    <select name="a14" id="a14" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div>
    <div>c.表现出不切实际的担忧，例如 担心被排斥、被孤立
     <select name="a15" id="a15" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div>
    <div>d.反复抱怨健康、例如经常看医生、过度注意自己的身体机能 
    <select name="a16" id="a16" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select></div>
    <div>e.反复抱怨担忧与焦虑，例如过度紧张日程安排、三餐安排、清洁、服装以及与他人关系
    <select name="a17" id="a17" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div>
    <div>f.脸上表现出担忧、痛苦、难过，例如皱眉
     <select name="a18" id="a18" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div>
    <div>g.经常哭泣
     <select name="a19" id="a19" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div>
    <div>h.丧失兴趣爱好，例如放弃长久以来的兴趣爱好或不与家人朋友交往
     <select name="a20" id="a20" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div>
    <div>i.减少社交活动
     <select name="a21" id="a21" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">心情变差</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>比过去90天糟糕:<select name="a22" id="a22" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
      </select>0.否 1.是</div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">3.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">行为</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>(选择以下编号)</div>
    <div>0、近3天内未发现</div>
    <div>1、3天内发现1-2次</div>
    <div>2、3天内每天表现出</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <div>a.没有目的闲逛
       <select name="a23" id="a23" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
	       <option value="2">2</option>
    </select>     
    </div>
    <div>b.滥用言语，威吓，尖叫，诅咒他人
     <select name="a24" id="a24" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
	       <option value="2">2</option>
    </select> 
    </div>
    <div>c.伤害行为，例如 打、掴、性侵犯他人
      <select name="a25" id="a25" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
	       <option value="2">2</option>
    </select>
    </div>
    <div>d.社交不当行为，例如重复打断他人声音、噪音、尖叫、自虐行为、公共场所脱衣、乱扔、糟蹋食物/排泄物、乱翻物品等造成干扰的行为
      <select name="a26" id="a26" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
	       <option value="2">2</option>
    </select>
    </div>
    <div>e.拒绝护理，例如拒绝治疗、服药、生活辅助、吃饭、或更换位置
       <select name="a27" id="a27" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
	       <option value="2">2</option>
    </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">行为变化
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>比过去90天糟糕：
    <select  name="a28" id="a28" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select></div>
    <div>0、否 1、是</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">进一步评估</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>是否进行进一步心理评估:
    <select  name="a29" id="a29" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div>
    <div>0、否 1、是</div></td>
  </tr>
</table>
</div>
<div align="left" id="divF" class="fixed_divF">
<p>F.社交能力</p>
<table width="330" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="20" rowspan="2"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="63" rowspan="2"><div align="center">合群</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="266"><div>a.容易与他人相处：
        <select name="a31" id="a31" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    0.容易 1.不易</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>b.与家人/朋友有公开矛盾或冲突
      <select  name="a32" id="a32" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>0.否 1.是
      </div>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">社交活动变化</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>比过去90天下降：
       <select  name="a33" id="a33" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
      </select>0.否 1.是</div>
    <div>0.否 1.下降，但不担忧</div>
    <div>2.下降，表示担忧</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">孤立</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>a.白天晚上或一整天一个人独处：
         <select name="a34" id="a34" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    0.从不 1.大约1小时</div>
    <div>2.半天时间 3.所有时间</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>b.表示感到孤独：
       <select name="a35" id="a35" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
   0.是 1.否</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">进一步评估</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>是否进行进一步心理评估：
     <select name="a36" id="a36" style="width:50px">
           <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    0.否 1.是</div></td>
  </tr>
</table>
</div>
<div align="left" id="divG" class="fixed_divG">
 <div>G.身体机能</div>
<div>*7天内工具性日常生活能力(IADL)</div>
<div>*5天内日常生活自理能力(ADL)</div>
<table width="329" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="14" rowspan="6"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="220"><div align="center">IADL评定分数</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="73"><input type="text" size="5" value="0" name="a369" id="a369" readonly//></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>a.使用电话能力：
     <select name="a37" id="a37" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
      </select>
    </div>
    0、无法拨打电话
    1、能够自己拨打电话；能够拨打部分数字;能够回答电话但是不能拨打  </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="63" rowspan="5">&nbsp;</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>b.购物：
      <select name="a38" id="a38" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
      </select></div>
      0、可以进行小额采购;需要买东西时有人陪伴；完全无法独自采购
    1.所有的采购都能够独立完成</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>c.三餐准备：
        <select name="a39" id="a39" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
      </select></div>
      0.能够加热或准备速食食品，但没有充足的营养;每顿饭都需要有人帮助准备
      1.独立计划、烹饪三餐</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>d.居家卫生：
      <select name="a40" id="a40" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
      </select></div>
      0.无法进行任何居家卫生清洁
    1.独立或在别人帮助下完成清洁重活、洗碗、床铺整理、一般日常清洁、家庭设施维护</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >e.衣物清洗
    <select name="a41" id="a41" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
      </select></td>
  </tr>
</table>
</div>
<p>&nbsp;</p>
<div align="left" id="divG1" class="fixed_divG1">
<table width="375" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="20" rowspan="4">&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><p>0.需要别人为自己清洗衣物</p>
    <p>1.所有的私人衣物或部分小件衣服自己可以独立完成清洗</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" ><p>f.交通方式: 
      <select name="a42" id="a42" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select></p>
    <p>0.仅限在别人帮助下叫车或者使用租车服务才能外出，或者完全无法外出</p>
    <p>1.能够独自或在人陪伴下乘坐公共交通工具或能够为自己叫车</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" ><p>g.服药:
     <select name="a43" id="a43" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select></p>
    <p>0.无法独立服药，需要别人将服药剂量准备好才能服药</p>
    <p>1.独立在正确时间服用正确计量的药物</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" ><p>h.理财：
      <select name="a44" id="a44" style="width:50px" onclick="getprevious(this);" onchange="getvalue(this);">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select></p>
    <p>0.无法独立支配财务</p>
    <p>1.独立管理财务能力，偶尔需要别人帮助去银行或支付一些账单</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="15"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="238"><div align="center">ADL评定分数</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="101"><input type="text" size="5" name="a45" id="a45" value="0" readonly//></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" >a.进食：
       <select name="a46" id="a46" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
           <option value="0" selected>0</option>
	       <option value="5">5</option>
	       <option value="10">10</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">0.无法进食 5.需要帮助切割、粉碎食物等 10、独立</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" >b.洗浴：
       <select name="a47" id="a47" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
           <option value="0" selected>0</option>
	       <option value="5">5</option>
	       <option value="10">10</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">0.需要帮助 5.独立完成</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" >c.修饰：
        <select name="a48" id="a48" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
          <option value="0" selected>0</option>
	      <option value="5">5</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">0.需要帮助　5.独立完成洗脸/洗头/刷牙/剃须</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">d.着装：
     <select name="a49" id="a49" style="width:50px"  onclick="getprevious1(this);" onchange="getvalue1(this);">
           <option value="0" selected>0</option>
	       <option value="5">5</option>
	       <option value="10">10</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><p>0.完全需要帮助 5.部分需要帮助</p>
    <p>10.独立完成(包括扣纽扣、拉链等)</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" >e.大便：
     <select name="a50" id="a50" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
           <option value="0" selected>0</option>
	       <option value="5">5</option>
	       <option value="10">10</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">0.失禁(或需要灌肠) 5.偶尔失禁</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" >f.小便：
     <select  name="a51" id="a51" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
           <option value="0" selected>0</option>
	       <option value="5">5</option>
	       <option value="10">10</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><p>0.失禁(或插管，无法进行自理)</p>
    <p>5.偶尔失禁 10.正常</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" >g.如厕：
      <select name="a52" id="a52" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
           <option value="0" selected>0</option>
	       <option value="5">5</option>
	       <option value="10">10</option>
      </select>
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><p>0.需要帮助</p>
    <p>5.需要部分帮助</p>
    <p>10.独立完成(坐、站立、系裤、擦拭)</p></td>
  </tr>
</table>
</div>

<div align="left" id="divG2" class="fixed_divG2">
  <table width="349" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="18" rowspan="4">&nbsp;<div align="center"></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" >h.转移(床与椅子之间)：
     <select name="a53" id="a53" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="5">5</option>
	     <option value="10">10</option>
	     <option value="15">15</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><p>0.需要帮助，坐时无法平衡</p>
      <p>5.需要大部分帮助，1-2人搬移，能坐</p>
    <p>10.部分帮助(口头与肢体上) 15.独立</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" ><p>i.平地行走：
       <select name="a54" id="a54" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="5">5</option>
	     <option value="10">10</option>
	     <option value="15">15</option>
      </select>
    </p>
      <p>0.无法走动或行走少于45米</p>
      <p>5.独自使用轮椅行走大于45米</p>
      <p>10.在一人帮助(语言、肢体)下行走大于45米</p>
    <p>15.独立行走(但可能需要一些支持，例如拐杖)步行大于45米</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2" ><p>j.楼梯：
     <select name="a55" id="a55" style="width:50px" onclick="getprevious1(this);" onchange="getvalue1(this);">
         <option value="0" selected>0</option>
	     <option value="5">5</option>
	     <option value="10">10</option>
      </select> 
    </p>
      <p>0.无法独立使用</p>
      <p>5.需要帮助(语言、肢体)</p>
    <p>10.独立完成</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><p>ADL状态比过去90天糟糕：
     <select name="a56" id="a56" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </p>
    <p>0.否 1.是</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="74" rowspan="3"><p align="center">最初行动方式</p></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="235"><p>0.无辅助设施 1.拐杖</p>
    <p>2.双手扶助步器 3.电动车</p>
    <p>4.轮椅 5.没有任何活动</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">室内：
     <select name="a57" id="a57" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
	     <option value="3">3</option>
	     <option value="4">4</option>
	     <option value="5">5</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">室外：
      <select name="a58" id="a58" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
	     <option value="3">3</option>
	     <option value="4">4</option>
	     <option value="5">5</option>
      </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><p align="center">忍耐力</p></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>a.一般一周内(过去90天中，或自上次评估后)老人走出家门、大楼的频率：
      <select name="a59" id="a59" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
	     <option value="3">3</option>
      </select>
    </div>
    <div>0.每天 1.2-6天/周</div>
    <div>2.一周一天　3.不出门</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>b.最近3天内的运动小时数(例如散步、锻炼)
      <select name="a60" id="a60" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    </div>
    <div>0、2小时及以上</div>
    <div>1、少于2小时</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">功能潜力</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>
      <input type="checkbox" class="checkBox1"  name="a61" id="a61" onclick="enableCheck(64)"/>
      老人相信他/她能够提升自理能力(ADL、IADL、mobility)</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a62" id="a62" onclick="enableCheck(64)"/>
    护理、康复人员相信老人有提升自理能力(ADL、IADL、mobility)</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a63" id="a63" onclick="enableCheck(64)"/>
      现疾病、情况康复状况良好，预期健康状态能改善</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a64" id="a64" onclick="disAb(61,63)"/>
    以上都不是</div></td>
  </tr>
</table>
</div>

<div align="left" id="divH" class="fixed_divH">
<p>H.7天内二便情况</p>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="20"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="73"><div align="center">小便</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="235"><div>a.7天内小便排便功能(插管或者特殊排便护理要求的老人)：
        <select name="a65" id="a65" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
	       <option value="2">2</option>
	       <option value="3">3</option>
	       <option value="4">4</option>
	       <option value="5">5</option>
    </select>
    </div>
    <div>0.正常，能够控制，不使用任何插管或排便装置</div>
    <div>1.正常插管，使用的插管装置、排尿装置使用正常，没有尿液漏出</div>
    <div>2.一般情况正常，一周内可能出现一次无法正常排便</div>
    <div>3.经常出现失禁，一周内几次出现问题</div>
    <div>4.失禁，每天多次出现状况</div>
    <div>5.无排尿</div>
    <div>b.比过去90天糟糕：
     <select name="a66" id="a66" style="width:50px">
           <option value="0" selected>0</option>
	       <option value="1">1</option>
      </select>
    0否  1.是</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">小便排便装置 </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>(最近7天内检查装置)</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a67" id="a67" onclick="enableCheck(69)"/>
      使用成人尿布或者防护垫</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a68" id="a68" onclick="enableCheck(69)"/>
    使用导尿管</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a69" id="a69" onclick="disAb(67,68)"/>
      以上都不是
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">大便</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>(最近7天内排便情况): <select name="a70" id="a70" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
      </select></div>
    <div>0.正常，能够控制，不使用造口装置 </div>
    <div>1.正常使用造口装置，没有漏便情况发生</div>
    <div>2.一般情况正常，一周出现一次无法排便情况</div>
    <div>3.经常出现失禁，一周内出现2-3次大便失禁问题</div>
    <div>4.失禁 ，总是出现</div>
    <div>5.7天内无排便</div></td>
  </tr>
</table>
</div>
<div align="left" id="divI" class="fixed_divI">
<div>I.疾病诊断</div>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3">医院诊断申请人现患有疾病/感染症状。或者90天内因此疾病住院的。</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="23" rowspan="2"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2"><div>【空白】无此症状</div>
    <div>【1】没有专门治疗或被居家养老服务机构特别监护</div>
    <div>【2】被专业居家养老服务机构监护(如果列表中没有疾病，请在[ac]选项中打钩)</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="66"><div align="center">疾病</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="239"><div>心脑血管疾病</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a71" id="a71" onclick="enableCheck(74)"/>
      a.脑血管疾病(如中风)</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a72" id="a72" onclick="enableCheck(74)"/>
      &nbsp;b.心力衰竭</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a73" id="a73" onclick="enableCheck(74)"/>
      c.冠心病(心肌梗塞、心绞痛)</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a74" id="a74" onclick="enableCheck(74)"/>
      &nbsp;d.高血压</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a75" id="a75" onclick="enableCheck(99)"/>
    e.心律不齐</div></td>
  </tr>
</table>
</div>

<div align="left" id="divI1" class="fixed_divI1">
<table width="320" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="23" rowspan="9"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="117" rowspan="9"><div align="center">疾病</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="178">
    <input type="checkbox" class="checkBox1"  name="a76" id="a76" onclick="enableCheck(99)"/>
    f.外周动脉疾病</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><p>神经系统</p>
    <div>
      <input type="checkbox" class="checkBox1"  name="a77" id="a77" onclick="enableCheck(99)"/>
      g.阿兹海默症</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a78" id="a78" onclick="enableCheck(99)"/>
      h.阿兹海默症以外的痴呆症</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a79" id="a79" onclick="enableCheck(99)"/>
      i.头部创伤</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a80" id="a80" onclick="enableCheck(99)"/>
      j.偏瘫</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a81" id="a81" onclick="enableCheck(99)"/>
      k.多发性硬化症(癫痫)</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a82" id="a82" onclick="enableCheck(99)"/>
    l.帕金森氏症</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><p>骨骼肌系统</p>
    <div>
     <input type="checkbox" class="checkBox1"  name="a83" id="a83" onclick="enableCheck(99)"/>
      m.关节炎</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a84" id="a84" onclick="enableCheck(99)"/>
      n.髋部骨折</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a85" id="a85" onclick="enableCheck(99)"/>
      o.其他骨折(如腕、脊椎)</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a86" id="a86" onclick="enableCheck(99)"/>
    p.骨质疏松症</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>感觉</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a87" id="a87" onclick="enableCheck(99)"/>
      q.白内障</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a88" id="a88" onclick="enableCheck(99)"/>
    r.青光眼</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><p>精神疾病</p>
    <div>
     <input type="checkbox" class="checkBox1"  name="a89" id="a89" onclick="enableCheck(99)"/>
    s.任何精神疾病诊断</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>感染</div>
    <p>
      <input type="checkbox" class="checkBox1"  name="a90" id="a90" onclick="enableCheck(99)"/>
      t.HIV(艾滋)</p>
    <p>
      <input type="checkbox" class="checkBox1"  name="a91" id="a91" onclick="enableCheck(99)"/>
      u.肺炎</p>
    <p>
      <input type="checkbox" class="checkBox1"  name="a92" id="a92" onclick="enableCheck(99)"/>
      v.肺结核</p>
    <p>
      <input type="checkbox" class="checkBox1"  name="a93" id="a93" onclick="enableCheck(99)"/>
    w.尿路感染(30天内)</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">其他疾病</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>
     <input type="checkbox" class="checkBox1"  name="a94" id="a94" onclick="enableCheck(99)"/>
      x.癌症(近5年内)，不包括皮肤癌</div>
    <p>
      <input type="checkbox" class="checkBox1"  name="a95" id="a95" onclick="enableCheck(99)"/>
      y.糖尿病</p>
    <p>
     <input type="checkbox" class="checkBox1"  name="a96" id="a96" onclick="enableCheck(99)"/>
      z.肺气肿/慢性阻塞性肺病/哮喘结核</p>
    <p>
     <input type="checkbox" class="checkBox1"  name="a97" id="a97" onclick="enableCheck(99)"/>
      aa.肾功能衰竭</p>
    <div>
      <input type="checkbox" class="checkBox1"  name="a98" id="a98" onclick="enableCheck(99)"/>
    ab.甲状腺疾病</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="checkbox" class="checkBox1"  name="a99" id="a99" onclick="disAb(71,98)"/>
    ac.以上都不是</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">其他疾病描述</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><textarea name="textarea" name="a100" id="a100" cols="30" rows="4"></textarea></td>
  </tr>
</table>
</div>

<div align="left" id="divj" class="fixed_divj">
<div>J.健康干预</div>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="22" rowspan="10"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="80" rowspan="10"><div align="center">体检</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="226"><div>血型：
       <select name="a101" id="a101" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
	      <option value="2">2</option>
	      <option value="3">3</option>
	      <option value="4">4</option>
	      <option value="5">5</option>
      </select>
      1.A型 2.B型 3.AB型</div>
    <div>4.O型 5.RH阴性 0.不详</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">过敏史：
      <select name="a102" id="a102" style="width:50px">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
    </select>
      0.无 1.有</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">手术史：
      <select name="a103" id="a103" style="width:50px" onchange="Bian('a109','a110',this.options.selectedIndex)">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
      0.无 1.有</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>年份：
      <input type="text" class="Wdate" name="a104" id="a104" onClick="WdatePicker({dateFmt:'yyyy',readOnly:true})"/>
    </div>
    <div>名称：
      <input type="text" size="15" name="a105" id="a105"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">身高(cm)：
      <input type="text" size="7" name="a106" id="a106"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">体重(kg)：
    <input type="text" size="7" name="a107" id="a107"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">腰围(cm)：
    <input type="text" size="7" name="a108" id="a108"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>空腹血糖：
       <select name="a109" id="a109" style="width:50px" onchange="Bian('a110','',this.options.selectedIndex)">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
      </select>
    0.未测 1.已测</div>
    <div>
      <input type="text" size="7" name="a110" id="a110"/> 
      (mmol/L)
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">胸透检查：
      <select name="a111" id="a111" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
    </select>
      0.无 1.有</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">肝功能检查：
     <select name="a112" id="a112" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
      0.无 1.有</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">现阶段问题(2天内)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>近2-3天内出现的问题</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a113" id="a113" onclick="disAb(114,118)"/>
      无</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a114" id="a114" onclick="enableCheck(113)"/>
      a.腹泻</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a115" id="a115" onclick="enableCheck(113)"/>
      b.排尿不畅，或晚间起夜3次以上</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a116" id="a116" onclick="enableCheck(113)"/>
      c.发烧</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a117" id="a117" onclick="enableCheck(113)"/>
      d.食欲下降</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a118" id="a118" onclick="enableCheck(113)"/>
      e.呕吐
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="3"><div align="center">问题症状</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">近3天内出现的问题：
      <select name="a119" id="a119" style="width:50px">
          <option value="0" selected>0</option>
	      <option value="1">1</option>
      </select>
    (0.无 1.有)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>生理健康</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a120" id="a120"/>
      a.平躺和放松时胸口有压力/疼痛</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a121" id="a121"/>
      b..3天内未排便</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a122" id="a122"/>
      c.晕眩</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a123" id="a123"/>
      d.食欲下降</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a124" id="a124"/>
      e.水肿</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a125" id="a125"/>
    f.呼吸急促</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>精神健康</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a126" id="a126"/>
      g.幻觉</div>
    <div>
       <input type="checkbox" class="checkBox1"  name="a127" id="a127"/>
    h.错觉</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="4"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="4"><div align="center">疼痛</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>a.申请人抱怨疼痛频率:
        <select name="a128" id="a128">
           <option value="0" selected>0</option>
	      <option value="1">1</option>
        </select>
    </div>
    <div>0.没有疼痛 2.每天一次</div>
    <div>1.几天一次 3.每天多次</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>b.疼痛强度:
      <select name="a129" id="a129" >
         <option value="0" selected>0</option>
	     <option value="1">1</option>
	     <option value="2">2</option>
	     <option value="3">3</option>
	     <option value="4">4</option>
      </select>
    </div>
    <div>0.没有疼痛 1.轻微 2.一般</div>
    <div>3.严重 4.难以忍受</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">c.申请人认为疼痛影响日常生活:
      <select name="a130" id="a130">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
    </select>
      0.不是 1.是的</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>d.疼痛患处:
     <select name="a131" id="a131">
         <option value="0" selected>0</option>
	     <option value="1">1</option>
    </select>
    </div>
    <div>0.一处 1.多处</div></td>
  </tr>
</table>
</div>

<div align="left" id="divj1" class="fixed_divj1">
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="22"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="80"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="226"><div>e.用药能够控制疼痛
        <select name="a132" id="a132" style="width:50px">
            <option value="0" selected>0</option>
	        <option value="1">1</option>
	        <option value="2">2</option>
      </select> 
    </div>
    <div>0.能够或没有疼痛</div>
    <div>1.用药不能够完全控制疼痛</div>
    <div>2.疼痛存在，但不服用药物 </div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">5.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">跌倒频率</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >最近90天内跌倒次数(超过9次的填9)
    <input type="text" size="7" name="a133" id="a133"/></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">6.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">跌倒危险性</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <select name="a134" id="a134" style="width:50px">
            <option value="0" selected>0</option>
	        <option value="1">1</option>
      </select> 
    0.没有危险 1.有危险</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >
    <div><input type="checkbox" class="checkBox1"  name="a135" id="a135" />a.走步不稳</div>
    <div><input type="checkbox" class="checkBox1"  name="a136" id="a136" />b.申请人因害怕摔倒不愿意外出</div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="4"><div align="center">7.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="4"><div align="center">生活方式</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>是否吸烟或者喝酒：
    </div>
    <div> <input type="checkbox" class="checkBox1"  name="a137" id="a137" onclick="disAb(138,140)"/>没有</div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a138" id="a138" onclick="enableCheck(137)"/>
    a.90天内(或上次评估后)，申请人感到或被人告知要少喝酒，或者他人为老人的饮酒习惯感到担心</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a139" id="a139" onclick="enableCheck(137)"/>
      b.90天内(或上次评估后)，申请人每天一早就开始喝酒或者因为喝酒造成问题</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a140" id="a140" onclick="enableCheck(137)"/>
      c.每天需要吸烟</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="7"><div align="center">8.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="7"><div align="center">健康状态</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >相同的打钩</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a141" id="a141" onclick="enableCheck(146)"/>
      申请人感到他/她健康很糟糕</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a142" id="a142" onclick="enableCheck(146)"/>
      申请人的疾病或生活条件使得认知功能、脾气或者行为不稳定</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a143" id="a143" onclick="enableCheck(146)"/>
      经历突发性严重疾病或慢性疾病</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a144" id="a144" onclick="enableCheck(146)"/>
      近30天内(或上次评估后)由于突发状况治疗变化</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a145" id="a145" onclick="enableCheck(146)"/>
      诊断活不过6个月-例如医生告知申请者或其家人申请人在病症晚期</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a146" id="a146" onclick="disAb(141,145)"/>
      以上都不是</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="7"><div align="center">9.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="7"><div align="center">其他状态指向</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >相同的打钩</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a147" id="a147" onclick="enableCheck(152)"/>
      害怕家人或者护理者</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a148" id="a148" onclick="enableCheck(152)"/>
      个人卫生很糟糕</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a149" id="a149" onclick="enableCheck(152)"/>
      无法解释的创伤、骨折或烧伤</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a150" id="a150" onclick="enableCheck(152)"/>
      被忽视、侵害或虐待</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a151" id="a151" onclick="enableCheck(152)"/>
      肢体受缚(如四肢被绑、坐在椅子上时被绑)</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a152" id="a152" onclick="disAb(147,151)"/>
      以上都不是</td>
  </tr>
</table>
</div>

<div align="left" id="divk" class="fixed_divk">
<div>K.营养/水份</div>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="22"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="77"><div align="center">体重</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="229"><div>
      <input type="checkbox" class="checkBox1"  name="a153" id="a153"/>
    a.30天内不刻意流失5%体重(180天内体重下降10%)</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a154" id="a154"/>
      b.严重营养不良(极瘦弱)</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a155" id="a155"/>
      c.病态超重
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan ="4"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan ="4"><div align="center">消耗</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a156" id="a156"/>
      a.近2-3天内每天吃1顿或很少</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a157" id="a157"/>
      b.近3天内申请人平时吃的食物或饮水明显减少</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a158" id="a158"/>
      c.水份不足近3天几乎很少补充水份</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a159" id="a159"/>
      d.需用食管进食</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan ="4"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan ="4"><div align="center">吞咽</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a160" id="a160"/>
    0.正常</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a161" id="a161"/>
    1.需要对大块需要咀嚼的食物进行加工(例如肉块切碎)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a162" id="a162"/>
    2.需要对大块需要咀嚼的食物以及浓稠液体加工</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a163" id="a163"/>
    3.需要口腔与食管喂食</td>
  </tr>
</table>
</div>
<div align="left" id="divL" class="fixed_divL">
<div>L.口腔健康</div>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="22" rowspan="4"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="75" rowspan="4"><div align="center">口腔情况</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="231">相同的打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="checkbox" class="checkBox1"  name="a164" id="a164"/>
      1.咀嚼困难(例如：下巴不灵活，味觉功能下降、吃饭时候疼痛)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="checkbox" class="checkBox1"  name="a165" id="a165"/>
      2.吃饭的时候口中干涩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="checkbox" class="checkBox1"  name="a166" id="a166"/>
      3.刷牙洁牙有困难</td>
  </tr>
</table>
</div>

<div align="left" id="divM" class="fixed_divM">
<div>M.皮肤状态</div>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="21"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="76"><div align="center">皮肤问题</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="231">任何皮肤问题或皮肤状态变化：
      <select name="a167" id="a167" style="width:50px">
            <option value="0" selected>0</option>
	        <option value="1">1</option> 
      </select>
    (0.没有变化 1.有变化)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3"><div align="center">压疮、郁血性溃疡</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div>身体任何地方出现溃疡：
       <select name="a168" id="a168" style="width:50px">
            <option value="1" selected>1</option>
	        <option value="2">2</option> 
	        <option value="3">3</option> 
	        <option value="4">4</option> 
      </select>
    </div>
      <div>(1级) 溃疡周边皮肤出现活动</div>
      <div>(2级) 部分皮肤坏死;</div>
      <div>(3级) 皮肤有深坑</div>
    <div>(4级) 破坏皮肤组织肌肉和骨头外露</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a169" id="a169"/>
      a.压疮</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a170" id="a170"/>
      b.郁血性溃疡</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="6"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="6"><div align="center">其他需要治疗的皮肤疾病</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >相同的打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a171" id="a171" onclick="enableCheck(175)"/>
    烧伤(2级或3级)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a172" id="a172" onclick="enableCheck(175)"/>
      破裂溃疡、红疹或伤口</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a173" id="a173" onclick="enableCheck(175)"/>
      皮肤出脓</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a174" id="a174" onclick="enableCheck(175)"/>
      术后伤口</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a175" id="a175" onclick="disAb(171,174)"/>
      以上都不是</td>
  </tr>
</table>
</div>

<div align="left" id="divM1" class="fixed_divM1">
 <table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="22" rowspan="2"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="75" rowspan="2"><div align="center">过去治愈的溃疡</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="231">申请人过去在身体任何部位出现过的溃疡：
      <select name="a176" id="a176" style="width:50px">
            <option value="0" selected>0</option>
	        <option value="1">1</option>
      </select>
      </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >0.无 1.有</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="6"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="6"><div align="center">伤口/溃疡护理</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >过去护理的7天内</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a177" id="a177" onclick="enableCheck(181)"/>
    抗生素(全身或局部)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a178" id="a178" onclick="enableCheck(181)"/>
      外敷</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a179" id="a179" onclick="enableCheck(181)"/>
      术后伤口护理</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a180" id="a180" onclick="enableCheck(181)"/>
      其他疮伤护理(如压力衣、食疗)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="checkbox" class="checkBox1"  name="a181" id="a181" onclick="disAb(177,180)"/>
      以上都不是</td>
  </tr>
</table>
</div>
<div align="left" id="divN" class="fixed_divN">
<div>N.环境评估</div>
 <table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="23" rowspan="2"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="73" rowspan="2"><div align="center">居家安全评估</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="232"><div>是否需要提供居家安全评估(上门服务申请者提供)：
      <select name="a182" id="a182" style="width:50px" onchange="Bian('a183','',this.options.selectedIndex)">
            <option value="0" selected>0</option>
	        <option value="1">1</option> 
      </select>
    </div>
    <div>0.不需要 1.需要</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">居家安全评估分数：
    <input type="text" size="7" name="a183" id="a183" ${health.a183 == 0 ? "disabled" : ""} /></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><div align="center">居住布局</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>a.与90天前相比(或上次评估后)申请者现在与他人一同居住(例如，搬去他人家中或别人搬入自己家中)：
       <select name="a184" id="a184" style="width:50px">
            <option value="0" selected>0</option>
	        <option value="1">1</option> 
      </select>
    </div>
    <div>0.否 1.是</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>b.申请者或护理提供方认为申请者最好能够住到另一个环境：
        <select name="a185" id="a185" style="width:50px">
            <option value="0" selected>0</option>
	        <option value="1">1</option> 
	        <option value="2">2</option> 
	        <option value="3">3</option> 
      </select>
    </div>
    <div>0.否 1.申请者认为</div>
    <div>2.服务提供方</div>
    <div>3.申请者与提供方</div></td>
  </tr>
</table>
</div>
<div align="left" id="divO" class="fixed_divO" >
<div>O.用药</div>
<table width="350" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="22"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="73"><div align="center">用药数量</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="233">记录不同种类药物数量(处方或非处方药物)包括眼药水等7天内每日正常服用的药物(如果没有填&quot;0&quot;，如果超过9种，填写&quot;9&quot;)：
    <input type="text" size="7" name="a186" id="a186"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="2"><div align="center">影响精神的药物</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>7天内服务影响精神的药物：
       <select name="a187" id="a187" style="width:50px" onchange="BianCheck(188,191,this.options.selectedIndex)">
            <option value="0" selected>0</option>
	        <option value="1">1</option> 
      </select>
    </div>
    <div>0.无 1.有</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>
        <input type="checkbox" class="checkBox1"  name="a188" id="a188" onclick="enableselect(187)"/>
    a.抗精神病药物</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a189" id="a189" onclick="enableselect(187)"/>
      b.镇痛药物</div>
    <div>
     <input type="checkbox" class="checkBox1"  name="a190" id="a190" onclick="enableselect(187)"/>
      c.抗抑郁药物</div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a191" id="a191" onclick="enableselect(187)"/>
      d.安眠药物
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">用药咨询</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div>180天内是否有主治医师对用药进行了解：
      <select name="a192" id="a192" style="width:50px">
            <option value="0" selected>0</option>
	        <option value="1">1</option> 
      </select>
    </div>
    <div>0.向至少1位医师咨询</div>
    <div>1.所有药物未得到任何医生咨询</div></td>
  </tr>
</table>
</div>

<div align="left" id="divO1" class="fixed_divO1">
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 1px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="22" rowspan="2"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="73" rowspan="2"><div align="center">用药习惯</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4"><p>30天内，坚持根据医嘱用药情况：
     <select name="a193" id="a193" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    </p>
    <p>0.总是坚持 1.80%以上时间坚持 2.无医嘱服用药物</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4">2.80%以下时间无法坚持(包括由于无法及时采购到药物造成服药延误)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="10"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="10"><div align="center">用药记录</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4"><p>30天内医嘱用药以及柜台购买(OTC)药品用药情况</p>
    <p>a.名称及药量-记录药品名称以及药量  b.服药方式，见下方代码：</p>
    <p>c.服药剂量-记录每次服药所用剂量</p>
    <p>1.口服(PO) <span>&nbsp;</span>4.静脉注射(IV)<span>&nbsp;</span> 7.吸入</p>
    <p>2.吞下(SL) <span>&nbsp;</span>5.皮下注射(SQ)<span>&nbsp;</span> 8.永久插管</p>
    <p>3.肌内给药(IM) <span>&nbsp;</span>6.局部(R)<span>&nbsp;</span> 9.其他</p>
    <p>d.频率：服药每日、每周或每月频率代码如下 ：</p>
    <p>PRN:总是需要 <span>&nbsp;</span>QD：每天 <span>&nbsp;</span> 2W：1周2次</p>
    <p>QH：每小时  <span>&nbsp;</span>B1D：1天2次(包括每12小时一次) <span>&nbsp;</span> 3W：1周3次</p>
    <p>Q2H：每两个小时  <span>&nbsp;</span>T1D：1天3次 <span>&nbsp;</span> 4W：1周4次</p>
    <p>Q3H：每3小时 <span>&nbsp;</span> Q1D：1天4次 <span>&nbsp;</span> 5W：1 周5次</p>
    <p>Q4H： 每4小时 <span>&nbsp;</span> 5D：1天5次 <span>&nbsp;</span> 6W：1周6次</p>
    <p>Q6H：每6小时 <span>&nbsp;</span> QOD： 一天隔一天 <span>&nbsp;</span> 1M：1月1次</p>
    <p>Q8H： 每8小时 <span>&nbsp;</span> QW：每周1次 2M: 1月2次 <span>&nbsp;</span> O:其他</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="218">a.名称和药量  </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="128">b.服用形式</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="143">c.服用次数</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="126">d.服用频率</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">1.
    <input type="text" size="25" name="a194" id="a194"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a195" id="a195" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a196" id="a196"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a197" id="a197" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
  
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">2.
    <input type="text" size="25" name="a198" id="a198"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a199" id="a199" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a200" id="a200"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a201" id="a201" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">3.
    <input type="text" size="25" name="a202" id="a202"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a203" id="a203" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a204" id="a204"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a205" id="a205" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">4.
    <input type="text" size="25" name="a206" id="a206"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a207" id="a207" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a208" id="a208"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a209" id="a209" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">5.
    <input type="text" size="25" name="a210" id="a210"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a211" id="a211" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a212" id="a212"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a213" id="a213" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">6.
    <input type="text" size="25" name="a214" id="a214"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a215" id="a215" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a216" id="a216"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a217" id="a217" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">7.
    <input type="text" size="25" name="a218" id="a218"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a219" id="a219" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a220" id="a220"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a221" id="a221" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">8.
    <input type="text" size="25" name="a222" id="a222"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a223" id="a223" style="width:50px" >
             <option value="1" selected>1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option> 
	         <option value="5">5</option>
	         <option value="6">6</option>
	         <option value="7">7</option>
	         <option value="8">8</option> 
	         <option value="9">9</option>
    </select></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <input type="text" size="20" name="a224" id="a224"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">
    <select name="a225" id="a225" style="width:50px">
     		 <option value="ORN" selected>ORN</option>
	         <option value="OH">OH</option>
	         <option value="O2H">O2H</option>
	         <option value="O3H">O3H</option> 
	         <option value="O4H">O4H</option>
	         <option value="O6H">O6H</option>
	         <option value="O8H">O8H</option>
	         <option value="OD">OD</option> 
	         <option value="B1D">B1D</option>
	         <option value="T1D">T1D</option>
	         <option value="O1D">O1D</option>
	         <option value="5D">5D</option>
	         <option value="O1D">O1D</option> 
	         <option value="OW">OW</option>
	         <option value="2W">2W</option>
	         <option value="3W">3W</option>
	         <option value="4W">4W</option> 
	         <option value="5W">5W</option>
	         <option value="6W">6W</option>
	         <option value="1M">1M</option>
	         <option value="2M">2M</option>
	         <option value="C">C</option>
    </select></td>
  </tr>
</table>
</div>

<div align="left" id="divP" class="fixed_divP">
<div>P.服务使用情况(七天内)</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="18" rowspan="14"><div align="center">1.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="128" rowspan="14"><div align="center">过去护理(时间具体到10分钟)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9"><div>过去7天内的护理服务情况(或上次评估服务情况)
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>(A)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(B)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(C) </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(# of)</td>
  </tr>
   <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="2">DAYS日</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"> HOURS小时</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"> MIN分钟</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="213">a.家庭健康辅助 </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="32"><input type="text" size="3" name="a226" id="a226"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="46"><input type="text" size="3" name="a227" id="a227"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="46"><input type="text" size="3" name="a228" id="a228"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="45"><input type="text" size="3" name="a229" id="a229"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="46"><input type="text" size="3" name="a230" id="a230"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="42"><input type="text" size="3" name="a231" id="a231"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="39"><input type="text" size="3" name="a232" id="a232"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="35"><input type="text" size="3" name="a233" id="a233"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">b.家庭医生\护士上门</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a234" id="a234"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a235" id="a235"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a236" id="a236"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a237" id="a237"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a238" id="a238"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a239" id="a239"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a240" id="a240"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a241" id="a241"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">c.居家护理服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a242" id="a242"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a243" id="a243"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a244" id="a244"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a245" id="a245"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a246" id="a246"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a247" id="a247"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a248" id="a248"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a249" id="a249"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">d.三餐(包括上门送餐)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a250" id="a250"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a251" id="a251"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a252" id="a252"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a253" id="a253"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a254" id="a254"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a255" id="a255"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a256" id="a256"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a257" id="a257"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">e.志愿者服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a258" id="a258"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a259" id="a259"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a260" id="a260"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a261" id="a261"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a262" id="a262"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a263" id="a263"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a264" id="a264"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a265" id="a265"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">f.康复理疗服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a266" id="a266"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a267" id="a267"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a268" id="a268"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a269" id="a269"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a270" id="a270"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a271" id="a271"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a272" id="a272"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a273" id="a273"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">g.康复功能训练服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a274" id="a274"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a275" id="a275"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a276" id="a276"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a277" id="a277"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a278" id="a278"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a279" id="a279"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a280" id="a280"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a281" id="a281"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">h.康复言语治疗</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a282" id="a282"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a283" id="a283"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a284" id="a284"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a285" id="a285"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a286" id="a286"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a287" id="a287"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a288" id="a288"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a289" id="a289"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">i.日间照料中心</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a290" id="a290"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a291" id="a291"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a292" id="a292"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a293" id="a293"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a294" id="a294"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a295" id="a295"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a296" id="a296"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a297" id="a297"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">j.社工上门探访</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a298" id="a298"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a299" id="a299"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a300" id="a300"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a301" id="a301"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a302" id="a302"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a303" id="a303"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a304" id="a304"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><input type="text" size="3" name="a305" id="a305"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="5"><div align="center">2.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" rowspan="5"><div align="center">特殊照料锻炼治疗服务项目</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9">30天内是否有计划接受特殊照料、治疗、锻炼计划。包括在家中接受服务项目
    <div>[空白】0.无&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.有计划，完全按照计划参与服务</div>
    <div>2.有计划，部分按照计划参与服务&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.有计划，未接受服务</div>
    <div>[如果选项中没有提供服务，选择P2aa]</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9"><div>呼吸系统护理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     服务项目
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9"><div>a.吸氧：
      <select name="a307" id="a307" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     o.理疗： 
        <select name="a306" id="a306" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select></div>
      <div>b.辅助呼吸器：
        <select name="a308" id="a308" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;p.日间服务中心 ：
       <select name="a309" id="a309" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>c.所有其他呼吸治疗：
       <select name="a310" id="a310" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      &nbsp;&nbsp;&nbsp;&nbsp; q.医院：
    <select name="a311" id="a311" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
    <div>
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r.临终关怀：
    <select name="a312" id="a312" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    </div>
    <div> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;s.理疗师或医疗机构上门：
     <select name="a313" id="a313" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    </div>
    <div> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;t.喘息照料：
     <select name="a314" id="a314" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9"><div>其他护理
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;特殊家中照料程序</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="9"><div>d.酒精/药物治疗
      ：
       <select name="a315" id="a315" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    u.每日护师/士上门监督指导：
      <select name="a316" id="a316" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    </div>
      <div>e.输血
        ：
        <select name="a317" id="a317" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   v.非每日护师/护士监护：
     <select name="a318" id="a318" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>f.化疗
        ：
        <select name="a319" id="a319" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;w.安全报警装置，如腕带安康通等设备：
 <select name="a320" id="a320" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>g.透析
        ：
        <select name="a321" id="a321" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      x.皮肤护理：
     <select name="a322" id="a322" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>h.输液
        ：
         <select name="a323" id="a323" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>i.注射(打针)：
         <select name="a324" id="a324" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>j.造口护理
        ：
        <select name="a325" id="a325" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>k.放射治疗
        ：
         <select name="a326" id="a326" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
      </div>
      <div>l.气管造口护理：
        <select name="a327" id="a327" style="width:50px">
         	 <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
      </select>
    </div></td>
  </tr>
</table>
</div>
<div align="left" id="divP1" class="fixed_divP1">
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="22">&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="118"><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="283"><div>治疗</div>
    <div>m.拳操锻炼：  <select name="a328" id="a328" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
    </select> </div>
    <div>n.功能训练：  <select name="a329" id="a329" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
    </select> </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="283"><div>y.特殊饮食护理：
     <select name="a330" id="a330" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
    </select></div>
    <div>
      <input type="checkbox" class="checkBox1"  name="a331" id="a331"/>
    aa.以上都不是</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3"><div align="center">3.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3"><div align="center">设备管理</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">选项填写：0不使用 1.自己能够使用 2 .能够自己使用但是需要别人口头提醒 3.部分工作需要他人帮助4.完全需要他人帮助</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">a.吸氧：
     <select name="a332" id="a332" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option>
       </select> 
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">c.插管：
       <select name="a333" id="a333" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option>
       </select> 
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">b.注射：
       <select name="a334" id="a334" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option>
       </select> 
    </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;">d.造口：
      <select name="a335" id="a335" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
	         <option value="3">3</option>
	         <option value="4">4</option>
       </select> 
    </td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">4.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">90天内入院治疗或近期评估</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div>填写入院次数，如果大于9次，填写&quot;9&quot;</div>
    <div>a.在医院过夜次数
      <input type="text" size="6" name="a336" id="a336"/>
    </div>
    <div>b.进医院急诊室(无过夜)的次数
      <input type="text" size="6" name="a337" id="a337"/>
    </div>
    <div>c.急诊监护(医生、护士、治疗师在医院或家中进行)  
      <input type="text" size="6" name="a338" id="a338"/>
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">5.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">治疗预期目标</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div>90天内(或上次评估后)目标是否达成：
      <select name="a339" id="a339" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
       </select> 
    </div>
    <div>0.否 1.是</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">6.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">护理需求变更</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><div>与90天前(或上次评估后)相比，个人情况显著变化：
     <select name="a340" id="a340" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
	         <option value="2">2</option>
       </select> 
    </div>
    <div>0.无变化 1.进步-服务支持减少 2.变差-需要更多服务支持</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">7.</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"><div align="center">价格权衡</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">由于经济情况出现问题，申请者减少购买服务，例如：买药、康复治疗、食物、居家护理服务：
       <select name="a341" id="a341" style="width:50px">
             <option value="0" selected>0</option>
	         <option value="1">1</option>
       </select> 
      0.否 1.是</td>
  </tr>
</table>
</div>
<div align="left" id="divQ" class="fixed_divQ">
<div>Q.评估信息</div>
<table width="730" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="172"><div align="center">1.</div></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"><div align="center">完成评估人签字</div></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >a.评估人员签字</td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"><input type="text" size="20" name="a342" id="a342"/></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >b.评估人员职务</td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"><input type="text" size="20" name="a343" id="a343"/></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >c.评估日期(年/月/日)</td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="3"><input type="text" size="20" name="a344" id="a344" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >d.其他签字</td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="204">职务</td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="180">部门</td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="146">日期</td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >e.<input type="text" size="20" name="a345" id="a345"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a346" id="a346"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a347" id="a347"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a348" id="a348" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >f.<input type="text" size="20" name="a349" id="a349"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a350" id="a350"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a351" id="a351"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a352" id="a352" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
  <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >g.<input type="text" size="20" name="a353" id="a353"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a354" id="a354"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a355" id="a355"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a356" id="a356" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
   <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >h.<input type="text" size="20" name="a357" id="a357"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a358" id="a358"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a359" id="a359"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a360" id="a360" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
   <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >i.<input type="text" size="20" name="a361" id="a361"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a362" id="a362"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a363" id="a363"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a364" id="a364" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
   <tr>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >j.<input type="text" size="20" name="a365" id="a365"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a366" id="a366"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a367" id="a367"/></td>
    <td  style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" size="20" name="a368" id="a368" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
  
</table>
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
   healtheval health = (healtheval)request.getAttribute("health");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=369;methodi++){
    	 String methodname = "getA"+methodi;
    	 //动态调用方法
         parasb.append(health.getClass().getMethod(methodname, new Class[]{}).invoke(health, new Object[]{})).append(",");
   }
   String parstr = parasb.toString();
%>
var paras = '<%=parstr%>' ;

function fillBlank(){
     var strs= new Array(); 
     strs = paras.split(',');
     
     for(i=0;i<strs.length-1;i++){
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

var pValue='0';
var pValue2='0';
function getvalue(objS){
     //选中事件
     var mark = parseInt(objS.options[objS.selectedIndex].value); 
     var gapV = mark-pValue;
     var totalmark1 = parseInt(document.getElementById('a369').value);
     document.getElementById('a369').value=gapV+totalmark1;
}

function getvalue1(objS){
     //选中事件
     var mark = parseInt(objS.options[objS.selectedIndex].value); 
     var gapV = mark-pValue2;
     var totalmark1 = parseInt(document.getElementById('a45').value);
     document.getElementById('a45').value=gapV+totalmark1;
}


function getprevious1(objP1){
    pValue2=parseInt(objP1.options[objP1.selectedIndex].value); 
    //alert(pValue2);
}

function getprevious(objP){
    pValue=parseInt(objP.options[objP.selectedIndex].value); 
}
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>  
<%@page import="com.wootion.cmmb.persistenc.po.bean.CareAssess"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>护理修改</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:885px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}

.fixed_div{ 
position:absolute; 
left:162px; 
bottom:0; 
width:450px; 
top:529px;
} 

.fixed_div1{ 
position:absolute; 
left:593px; 
bottom:0; 
width:410px; 
top:545px;
} 

.fixed_div2{ 
position:absolute; 
left:162px; 
bottom:0; 
width:420px; 
top:885px;
}

.fixed_div3{ 
position:absolute; 
left:593px; 
bottom:0; 
width:410px; 
top:885px;
}

.fixed_div4{ 
position:absolute; 
left:162px; 
bottom:0; 
width:410px; 
top:1145px;
}
.fixed_div5{ 
position:absolute; 
left:593px; 
bottom:0; 
width:410px; 
top:1160px;
}

.fixed_div6{
    position:absolute; 
	left:333px; 
	bottom:0; 
	width:410px; 
	top:2440px;
}

.fixed_div7{
    position:absolute; 
	left:162px; 
	bottom:0; 
	width:840px; 
	top:1810px;
}


.fixed_div0{ 
position:absolute; 
left:162px; 
bottom:0; 
top:40px;
}
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';
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
    	document.getElementById("belongproname").value=arr[2];
    	document.getElementById("a1").value=arr[6];
    } 	
 }

function onSubmit(){
      if(check("memname","string","姓名不能为空！")||check("assesdate","string","评估日期不能为空！")||check("carenumber","string","档案编号不能为空！")
		  ||check("belongproname","string","请填写联系方式！")){
		      return false;
	  }
	  
	  var careid = document.getElementById('careid').value;
      var memnumber = document.getElementById('memnumber').value;
      var memname = document.getElementById('memname').value;
      var assesman = document.getElementById('assesman').value;
      var assesdate = document.getElementById('assesdate').value;
      var carenumber = document.getElementById('carenumber').value;
      var belongproname = document.getElementById('belongproname').value;
      var paraurl = '';
      
      for(i=1;i<=90;i++){
         //85-90批量操作
         if(i>=85&&i<=90){
                var arr = document.getElementsByName("a"+i);
	            var tempa='';
	            if(arr.length>0){
	            	for(var ii=0;ii<arr.length;ii++){
	            	    if(i==87){
		                  if(strTrim(arr[ii].value)!=''){
		            	       //不为空的情况下,要验证合法性，只能填写正数字
		            	       if(!is_positiveInteger(arr[ii].value)){
		            	          alert('时长只能为正整数');
								  arr[ii].className = "errorInput";
								  arr[ii].focus();
								  return;
		            	       }
		            	  }else{
		            	     //arr[ii].value="0";
		            	  }
	                   }
	                   //如果为空就不纳入统计
	                   /*
	                   if(i==85){
		                 if(strTrim(arr[ii].value)==''){
		            	       alert('日期不能为空');
							   arr[ii].className = "errorInput";
							   arr[ii].focus();
							   return;
		            	  }
	                   }*/
	                   tempa+=arr[ii].value+'#';
	            	}
	            	paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(tempa);
	            	continue;
	            }
         }
         
         if(document.getElementById("a"+i).type=='checkbox'){
         	eval("var a" + i + "=" + document.getElementById("a"+i).checked);
         	paraurl = paraurl+'&'+('a'+i)+'='+document.getElementById("a"+i).checked;
         }else if(document.getElementById("a"+i).type=='text'){
            var b = document.getElementById("a"+i).value;
            if(Trim(b)==''){
                //此处不能为空，要给个默认值
                b='';
            }
            
            eval("var a" + i + "='" + b+"';");
            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
         }else if(document.getElementById("a"+i).nodeName=='SELECT'){
            var b = document.getElementById("a"+i).value;
            if(Trim(b)==''){
                //此处不能为空，要给个默认值
                b='';
            }
            
            eval("var a" + i + "='" + b+"';");
            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
         }else if(document.getElementById("a"+i).type=='textarea'){
            var b = document.getElementById("a"+i).value;
            if(Trim(b)==''){
                //此处不能为空，要给个默认值
                b='';
            }
            
            eval("var a" + i + "='" + b+"';");
            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
         }
      }
	            $.ajax({
				   type: "POST",
				   url: basePath + "/caremodifycare.do?careid="+careid+"&memnumber="+encodeURI(memnumber)+"&memname="+encodeURI(memname)+"&assesman="+encodeURI(assesman)+"&assesdate="+assesdate+"&carenumber="+encodeURI(carenumber)+"&belongproname="+encodeURI(belongproname)+paraurl,
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('评估表修改成功');
				   			window.location.href=basePath+"/caremanage.do";
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

function chooseWorkers(objinput){
    var obj = new Object();
    obj.workerdep="1";
    
    var url =  basePath + "/chooseWorkers.do?department=1";
    //window.open(url);
    str = window.showModalDialog(url,obj,"dialogWidth=500px;dialogHeight=400px"); 
    arr = str.split(",");
    if(typeof(str)=="undefined"){
        document.getElementById("a90").value="";
    }else if(str=="nochange"){
        //nothing to do
    }else if(objinput!=null){
        objinput.value=arr[1];
    }else{
    	document.getElementById("a90").value=arr[1];
    } 	
}
</script>
</head>
<body>
<div class="topLanBar"><b>d当前位置：</b>护理管理 > 护理表修改</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<div id="floatdiv" style="width:30px;height:70px;position:absolute;right:20px;top:80px;background:#FFCC00;border:1px solid #999;">
   <table>
    <tr>
        <td>
   			<a href="javascript:document.getElementById('topA').focus();"><span style="color:blue">G5</span></a>
   		</td>
    </tr>
     <tr>
   		<td>
   			<a href="javascript:document.getElementById('divB').focus();"><span style="color:blue">B</span></a>
   		</td>
    </tr>
     <tr>
   		<td>
   			<a href="javascript:document.getElementById('div4').focus();"><span style="color:blue">C</span></a>
   		</td>
    </tr>
     <tr>
   		<td>
   			<a href="javascript:document.getElementById('div7').focus();"><span style="color:blue">A</span></a>
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
<input type="hidden" name="careid" value="${care.careid}" />
<p><div align="left" id="topA" class="fixed_div0">
	<h2>G5 护理评估与计划</h2></p>
<table width="840" border="1"  style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="161">姓名<span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="187"><input name="memname" value="${care.memname}" id="memname" type=“text” size="10"/><input type="button" value="选择" onclick="chooseElders();"></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="184" rowspan="2"><div align="center">联系方式<span style='color:red;'>&nbsp;*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="230" rowspan="2"><input value="${care.belongproname}" id="belongproname" name="belongproname" type="text" /></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >档案编号 <span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input value="${care.carenumber}" name="carenumber" id="carenumber" type="text" /></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >会员编号(如有)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" value="${care.memnumber}" name="memnumber" id="memnumber"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><div align="center">家庭地址</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2"><input value="${care.a1}" type="text" name="a1" id="a1"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >评估人员签字<span style='color:red;'>&nbsp;*</span></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" value="${care.assesman}" name="assesman" id="assesman"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >评估人员职务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" value="${care.a2}" name="a2" id="a2"/></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">评估日期<span style='color:red;'>&nbsp;*</span></div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><input type="text" value="${care.assesdate}" class="Wdate" name="assesdate" id="assesdate" value="${care.assesdate}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
      (年/月/日)</td>
  </tr>
</table>
<p>&nbsp;</p>
<p>A. 健康情况(根据G2.健康评估表 I.疾病诊断)</p>
<table width="840" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="192" height="82"><p>心脑血管疾病</p>
    <p>
      <checkbox>
      <input type="checkbox" class="checkBox1"  name="a3" id="a3"/>
    脑血管疾病(如中风)</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a4" id="a4"/>
      心力衰竭</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a5" id="a5"/>
    冠心病(如心肌梗塞)</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a6" id="a6"/>
      高血压</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a7" id="a7"/>
      心率不齐
    </p></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="220"><p>神经疾病</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a8" id="a8"/>
      老年性脑萎缩</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a9" id="a9"/>
      老年性脑萎缩以外痴呆症</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a10" id="a10"/>
      头部创伤</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a11" id="a11"/>
      脑卒中</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a12" id="a12"/>
      帕金森氏症
    </p></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="184"><p>骨科疾病</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a13" id="a13"/>
      关节炎</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a14" id="a14"/>
      骨折</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a15" id="a15"/>
      骨质疏松症
    </p></td>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="156"><p>其他疾病</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a16" id="a16"/>
      白内障</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a17" id="a17"/>
      精神疾病</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a18" id="a18"/>
      尿路感染</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a19" id="a19"/>
      癌症
    </p></td>
  </tr>
  <tr>
    <td valign="top" style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" colspan="4"><p>备注：(对以上未列入疾病进行描述或对某项疾病进行详细补充)</p>
     <div> <textarea name="textarea" value="${care.a20}" id="a20" cols="120" rows="7">${care.a20}</textarea></div>
    </td>
  </tr>
</table>
<br/>
</div>

<div align="left" id="divB" class="fixed_div">
<p>B.护理评定项目</p>
<table width="410" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="12" height="103" rowspan="3">1.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="76" rowspan="3">失能评定(IADL)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">根据G2健康评估表/G身体机能/IADL评定分数</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="141">根据分值分类，选择以下编号填写(男性IADL评估中，做饭，洗衣，做家事三项不计分)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="153"><input value="${care.a21}" type="text" id="a21" name="a21"/></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="66"  colspan="2"><p>0.健康老人：女性，IADL得分8分;男性得分IADL5分。</p>
    <p>1.轻度失能:女性，IADL得分7-5分;男性得分4-3分;</p>
    <p>2.失能老人：女性IADL得分4分及以下;男性IADL得分2分以下</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="129" rowspan="3">2.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="3">护理依赖程度评定(ADL)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">根据G2健康评定表/G身体机能/ADL评定分数</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >根据分值分类，选择以下编号填写：</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><select name="a22" id="a22">
       <option value="0" ${care.a22 == '0' ? "selected" : ""}>   0  </option>
       <option value="1" ${care.a22 == '1' ? "selected" : ""}>   1  </option>
	   <option value="2" ${care.a22 == '2' ? "selected" : ""}>   2  </option>
    </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2"><p>0、完全能够自理：75分以上</p>
      <p>1、轻度护理依赖：75-60分</p>
      <p>2、中度护理依赖：40-60分</p>
    <p>3、重度护理依赖：40分以下</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >&nbsp;</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  colspan="2">以下选项为可能造成ADL能力下降的风险</td>
  </tr>
</table>
</div>
<p>&nbsp;</p>

<div class="fixed_div1">
<table width="409" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="20" height="57">3.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="99">护理预估评分 </td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="268"><p>因素 ，在相应选项后打钩</p>
      <p>
        <input type="checkbox" class="checkBox1" name="a23" id="a23"/>
      a、男性</p>
      <p>
        <input type="checkbox" class="checkBox1" name="a24" id="a24"/>
      b、80岁以上</p>
      <p>
        <input type="checkbox" class="checkBox1" name="a25" id="a25"/>
        c、行走困难 
        <br />
    </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="109">4.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >二便护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><p>根据G2健康评估表/H.七天内二便情况，在以下相应项目打钩</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a26" id="a26"/>
    a、不需要特别护理</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a27" id="a27"/>
      b、小便失禁，需提醒用厕或协助更换尿片</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a28" id="a28"/>
      c、大便失禁，需提醒用厕或协助更换尿片</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a29" id="a29"/>
      d、使用尿袋，导尿管护理清洁</p>
    <p>
      <input type="checkbox" class="checkBox1" name="a30" id="a30"/>
      e、造口护理
    </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="98">5.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >皮肤护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><p>根据G2健康评估表/M皮肤状态评定内容填写：
      <select name="a31" id="a31">
         <option value="0" ${care.a31 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a31 == '1' ? "selected" : ""}>   1  </option>
      </select>
    </p>
    <p>
  0、不需要褥疮护理</p>
    <p>
    1、需要褥疮护理
    </p></td>
  </tr>
</table>
</div>
<p>&nbsp;</p>

<div class="fixed_div2">
<table width="409" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="13" height="143">6.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="79">饮食护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="295"><p>根据G2健康评估表/K.营养与水份，选择以下编号填写：</p>
    <p>0、不需要服务或提醒</p>
    <p>1、需要服务或提醒</p>
    <p>喂水
      <select name="a32" id="a32">
         <option value="0" ${care.a32 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a32 == '1' ? "selected" : ""}>   1  </option>
      </select>
      浓稠液体加工
      <select name="a33" id="a33">
         <option value="0" ${care.a33 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a33 == '1' ? "selected" : ""}>   1  </option>
      </select>
    </p>
    <p>食物加工
      <select name="a34" id="a34">
         <option value="0" ${care.a34 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a34 == '1' ? "selected" : ""}>   1  </option>
      </select>
      糖尿病
      <select name="a35" id="a35">
         <option value="0" ${care.a35 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a35 == '1' ? "selected" : ""}>   1  </option>
      </select>
      食管进食
      <select name="a36" id="a36">
         <option value="0" ${care.a36 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a36 == '1' ? "selected" : ""}>   1  </option>
      </select>
    </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="106">7.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >口腔护理</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><p>根据G2健康评估表/L.口腔健康评定内容填写：
      <select name="a37" id="a37">
         <option value="0" ${care.a37 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a37 == '1' ? "selected" : ""}>   1  </option>
      </select>
    </p>
    <p>0、不需要口腔护理</p>
    <p>1、需要口腔护理</p></td>
  </tr>
</table>
</div>

<div class="fixed_div3">
<table width="408" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="12" height="65">8.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="81">服药提醒</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="293"><p>根据G2健康评估表/o.用药评定内容填写：
      <select name="a38" id="a38">
         <option value="0" ${care.a38 == '0' ? "selected" : ""}>   0  </option>
         <option value="1" ${care.a38 == '1' ? "selected" : ""}>   1  </option>
      </select>
    </p>
    <p>0、不需要服药提醒与协助</p>
    <p>1、需要服药提醒与协助</p></td>
  </tr>
</table>
</div>
<div id="div4" class="fixed_div4">
<p>C.护理服务计划</p>
<table width="408" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="20" height="57" rowspan="2">9.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="95" rowspan="2">护理方式</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="271" height="42">选择填写护理方式编号
      <select name="a39" id="a39">
         <option value="1" ${care.a39 == '1' ? "selected" : ""}>   1  </option>
         <option value="2" ${care.a39 == '2' ? "selected" : ""}>   2  </option>
         <option value="3" ${care.a39 == '3' ? "selected" : ""}>   3  </option>
    </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="46">1.定点服务 2.上门护理 3.不需要</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="43" rowspan="2">10.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">服务时间</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择填写护理服务时间编号
      <select name="a40" id="a40">
         <option value="1" ${care.a40 == '1' ? "selected" : ""}>   1  </option>
         <option value="2" ${care.a40 == '2' ? "selected" : ""}>   2  </option>
         <option value="3" ${care.a40 == '3' ? "selected" : ""}>   3  </option>
    </select></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="43">1.日间照料(周一至周五，不包括双休日、节假日) 2.陪夜服务 3.住家护理(365天)</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="59" rowspan="2">11.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">个人卫生(生活护理)</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="55"><p>
        <input type="checkbox" class="checkBox1"  name="a41" id="a41"/>
      个人(修饰) 
      <input type="checkbox" class="checkBox1"  name="a42" id="a42"/>
      生活起居护理
      </p>
      <p>
        <input type="checkbox" class="checkBox1"  name="a43" id="a43"/>
        理发 
        <input type="checkbox" class="checkBox1"  name="a44" id="a44"/>
      扦脚</p>
      <p>
  		<input type="checkbox" class="checkBox1" name="a45" id="a45" />
        长期卧床老人床铺管理解
        <input type="checkbox" class="checkBox1" name="a46" id="a46" />
        灌肠 
      </p>
      <p>
        <input type="checkbox" class="checkBox1" name="a47" id="a47" />
        协助如厕
        <input type="checkbox" class="checkBox1" name="a48" id="a48" />
        清理排泄漏
      </p>
      <p>
        <input type="checkbox" class="checkBox1" name="a49" id="a49" />
        不需要
      </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="41" rowspan="2">12.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助餐服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="29">选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="40"><p>
        <input type="checkbox" class="checkBox1" name="a50" id="a50" />
    三餐烹饪
    <input type="checkbox" class="checkBox1" name="a51" id="a51" />
    送餐服务
    </p>
      <p>
        <input type="checkbox" class="checkBox1" name="a52" id="a52" />
        喂饭
        <input type="checkbox" class="checkBox1" name="a53" id="a53" />
        食物加工      </p>
      <p>
        <input type="checkbox" class="checkBox1" name="a54" id="a54" />
    不需要</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="49" rowspan="2">13.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助浴服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="50"><input type="checkbox" class="checkBox1" name="a55" id="a55" />
    洗浴
    <input type="checkbox" class="checkBox1" name="a56" id="a56" />
    擦浴
    <input type="checkbox" class="checkBox1" name="a57" id="a57" />
    洗头
    <input type="checkbox" class="checkBox1" name="a58" id="a58" />
    不需要</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="62" rowspan="2">14.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">家政及清洁</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="59"><p>
        <input type="checkbox" class="checkBox1" name="a59" id="a59" />
    家居卫生
    <input type="checkbox" class="checkBox1" name="a60" id="a60" />
    厨房清洁
    </p>
      <p>
        <input type="checkbox" class="checkBox1" name="a61" id="a61" />
        清洁
        <input type="checkbox" class="checkBox1" name="a62" id="a62" />
      衣物洗涤</p>
      <p>
  <input type="checkbox" class="checkBox1" name="a63" id="a63" />
    不需要</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="62" rowspan="2">15.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助行及待办服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="46"><p>
        <input type="checkbox" class="checkBox1" name="a64" id="a64" />
    陪同外出散步
    <input type="checkbox" class="checkBox1" name="a65" id="a65" />
    陪同外出</p>
      <p>
  <input type="checkbox" class="checkBox1" name="a66" id="a66" />
        代缴费用
        <input type="checkbox" class="checkBox1" name="a67" id="a67" />
        代购物品      </p>
      <p>
        <input type="checkbox" class="checkBox1" name="a68" id="a68" />
        代领物品
        <input type="checkbox" class="checkBox1" name="a69" id="a69" />
    不需要</p></td>
  </tr>
</table>
</div>
<p>&nbsp;</p> 
<div class="fixed_div5">
<table width="408" height="490" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="20" height="76" rowspan="2">16.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="65" rowspan="2">相谈及陪伴服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  width="301" height="34">选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="46"><p>
        <input type="checkbox" class="checkBox1" name="a70" id="a70" />
      心理咨询
      <input type="checkbox" class="checkBox1" name="a71" id="a71" />
      志愿者探访</p>
      <p>
        <input type="checkbox" class="checkBox1" name="a72" id="a72" />
        社工探访
        <input type="checkbox" class="checkBox1" name="a73" id="a73" />
        不需要
      </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="70" rowspan="2">17.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">助医服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="33">选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="52"><p>
        <input type="checkbox" class="checkBox1" name="a74" id="a74" />
      全科医生上门评估
      <input type="checkbox" class="checkBox1" name="a75" id="a75" />
      护士上门指导 
      <input type="checkbox" class="checkBox1" name="a84" id="a84" />
      陪伴就医</p>
      <p>
  <input type="checkbox" class="checkBox1" name="a76" id="a76" />
        护理耗材代购
        <input type="checkbox" class="checkBox1" name="a77" id="a77" />
      不需要</p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="74" rowspan="2">18.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  rowspan="2">其他服务</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="34">选择相应护理服务项目，并打钩</td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="82"><p>
        <input type="checkbox" class="checkBox1" name="a78" id="a78" />
      网络代购
      <input type="checkbox" class="checkBox1" name="a79" id="a79" />
      家居设施检查</p>
      <p>
        <input type="checkbox" class="checkBox1" name="a80" id="a80" />
        衣物缝补
        <input type="checkbox" class="checkBox1" name="a81" id="a81" />
      家具设施维修</p>
      <p>
        <input type="checkbox" class="checkBox1" name="a82" id="a82" />
        不需要
      </p></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;"  height="110">19.</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" >护理计划补充说明</td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="left">
      <textarea name="textarea2" value="${care.a83}" name="a83" id="a83" cols="60" rows="8">${care.a83}</textarea>
    </div></td>
  </tr>
</table>
<p>&nbsp;</p>
</div>

<div align="left" id="divadd1" style="position:absolute; left:162px; top:1790px;width:130px; ">
<input type="button" onclick="AddRowH4()" value="增加" />&nbsp;
<input type="button" onclick="delRow('tbody2')" value="删除" />
</div>
<div class="fixed_div7" id="div7">
<p>A.介护服务说明</p>
<table width="840" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;">
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="110"><div align="center">a.个人卫生</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="115"><div align="center">6.协助如厕</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="115"><div align="center">c.助餐服务</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="115"><div align="center">14.擦浴</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="118"><div align="center">f.相谈及陪伴</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="118"><div align="center">28.陪伴就医</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">1.个人修饰</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">*7.排泄物清理</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">9.三餐烹饪</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">15.洗头</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">23.心理咨询</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">29.护理耗材代购</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">2.生活起居</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">*8灌肠</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">10.送餐服务</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">e.助行及待办</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">24.志愿者探访</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">h.其他服务</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">*3.理发</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">b.家政及清洁</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">11.喂饭</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">19.陪同外出散步</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">25.社工探访</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">30.网络代购</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">*4.扦脚</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">16.家居卫生清洁</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">12.食物加工</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">20.陪同外出</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">g.助医服务</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">31.家居设施检查</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">5.长期卧床老人床铺管理</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">17.厨房清洁</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">d.助浴服务</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">21.代缴费用</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">26.医生评估</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">32.衣物缝补</div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">&nbsp;</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">18.衣物洗涤</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">13.洗浴</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">22.代领物品</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">27.护士上门</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">33.家具设施维修</div></td>
  </tr>
</table>
<table width="840" border="1" style="table-layout:auto;border:solid #8B8378; border-width:1px 0px 0px 1px;"  id="tbody2">
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="70"><div align="center">日期</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="85"><div align="center">时段</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="85"><div align="center">时长(小时)</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="293"><div align="center">服务地址</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="76"><div align="center">服务内容</div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" width="81"><div align="center">护理员</div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
 <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
  <tr onclick="resetTr('tbody2')">
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a86" id="a86"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a87" id="a87"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="45" name="a88" id="a88"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="4" name="a89" id="a89"/>
    </div></td>
    <td style="border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;" ><div align="center">
      <input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" />
    </div></td>
  </tr>
</table>
</div>
<div id="div9" style="position:absolute;left:333px;top:2540px;width:410px;">
  <table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="onSubmit()">确定</button><button onClick="forward('caremanage.do')">返回</button></td>
  </tr>  
</table>
</div>
</form>
</body>
<script type="text/javascript">
<%
   CareAssess ca = (CareAssess)request.getAttribute("care");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=90;methodi++){
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
   
   //initRpow for tbody2
   var len1 = parseInt(strs[84].split('#').length-1-(document.getElementById('tbody2').rows.length-1));
   for(y1=0;y1<len1;y1++){
       AddRowH4();
   }
   
   for(i=0;i<strs.length-1;i++){
         if(i<=89&&i>=84){
               //butch init
               for(var uu=0;uu<strs[i].split('#').length-1;uu++){
                   if(strs[i].split('#')[uu]=='null'){strs[i].split('#')[uu]='';}
                   if(document.getElementsByName("a"+(i+1))[uu].type=='text'){
                      //if 'text'
                      document.getElementsByName("a"+(i+1))[uu].value=strs[i].split('#')[uu];
                   }
               }
               continue;
         }
   
        if(document.getElementById("a"+(i+1)).type=='checkbox'){
             if(strs[i]=='false')
                 document.getElementById("a"+(i+1)).checked=false;
             else
                 document.getElementById("a"+(i+1)).checked=true;
        }
   }
}	

function readjustPos(divid,val){
     var top1=document.getElementById(divid).style.top;
	 var topindex = top1.indexOf('px');
	 var topval = parseInt(top1.substring(0,topindex));
	 var curtop=(topval+val)+'px';
	 document.getElementById(divid).style.top=curtop;
}

function chooseTr(tname,obj){
   var tbody1 = document.getElementById(tname);
   obj.style.backgroundColor='gray';
   startindex=22;
   for(var yy=startindex;yy<tbody1.rows.length;yy++){
      if(yy==obj.rowIndex){continue;}
      tbody1.rows[yy].style.backgroundColor='';
   }
     
   if(tname=='tbody2')
     {delindex2=obj.rowIndex;}
   
}

function resetTr(tname){
   var tbody1 = document.getElementById(tname);
   if(tname=='tbody2')
      startindex=22;
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
   ftd.innerHTML='<div align="center"><input type="text" size="10" name="a85" id="a85" class="Wdate" onClick="WdatePicker({dateFmt:\'yyyy-MM-dd\',readOnly:true})"/></div>';
    
   var ftd1 = row.insertCell(row.cells.length);   
   ftd1.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd1.innerHTML='<div align="center"><input type="text" size="13" name="a86" id="a86"/></div>';
   
   var ftd2 = row.insertCell(row.cells.length);   
   ftd2.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd2.innerHTML='<div align="center"><input type="text" size="4" name="a87" id="a87" /></div>';
   
   
   var ftd3 = row.insertCell(row.cells.length);   
   ftd3.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd3.innerHTML='<div align="center"><input type="text" size="45" name="a88" id="a88"/></div>';
   
   
   var ftd4 = row.insertCell(row.cells.length);   
   ftd4.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd4.innerHTML=' <div align="center"><input type="text" size="4" name="a89" id="a89"/></div>';
   
   
   var ftd5 = row.insertCell(row.cells.length);   
   ftd5.style.cssText='border:solid #8B8378; border-width:0px 1px 1px 0px; padding:0px 0px;';
   ftd5.innerHTML='<div align="center"><input type="text" size="13" name="a90" id="a90" readonly ondblclick="chooseWorkers(this)" /></div>';
   
   readjustPos('div9',25);
}

function delRow(trname){
   var tbody1 = document.getElementById(trname);
   if(trname=='tbody2'){
       if(delindex2==-1){
	      alert('请选择要删除的行(点击要删除的行)!');
	      return;
	   }
   	   tbody1.deleteRow(delindex2);
   	   readjustPos('div9',-25);
   }
}


fillBlank();
</script>
</html>

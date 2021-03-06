<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cmmb.persistenc.po.bean.recoveryAssess"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康复评估编辑</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:885px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}
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

function onSubmit(){
      var memgender = document.getElementById('memgender').value;
      var memname = document.getElementById('memname').value;
      var memage = document.getElementById('memage').value;
      var assesman = document.getElementById('assesman').value;
      var assesdate = document.getElementById('assesdate').value;
      var recoverynumber = document.getElementById('recoverynumber').value;
      var belongproname = document.getElementById('belongproname').value;
      var belongproid = document.getElementById('belongproid').value;
      var recoveryid = document.getElementById('recoveryid').value;
      var paraurl = '';
      
      for(i=1;i<=90;i++){
         if(document.getElementById("a"+i).type=='checkbox'){
         	eval("var a" + i + "=" + document.getElementById("a"+i).checked);
         	paraurl = paraurl+'&'+('a'+i)+'='+document.getElementById("a"+i).checked;
         }else if(document.getElementById("a"+i).type=='radio'){
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
            alert('表编号不能为空');
            return;
        }else if(assesdate==""){
            alert('评估日期不能为空');
            return;
        }
        else
        {
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
    	var dateTime = new Date();
        var thisdate = dateTime.format('yyyy-MM-dd');
        var nyear = parseInt(thisdate.split('-')[0]);
        var eyear = parseInt(arr[4].split('-')[0]);
    	document.getElementById("memage").value=nyear-eyear;
    	document.getElementById("memgender").value=arr[3];
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
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 > 康复评估编辑</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<input name="recoveryid" id="recoveryid" type="hidden" value="${recovery.recoveryid}"/>
<table width="100%" class="tab1" id="tab1" border="0">
  <tr>
    <td>会员姓名:<input type="text" name="memname" id="memname" value="${recovery.memname}" onclick="chooseElders()" readonly/><span style='color:red;'>&nbsp;*</span></td>
    <td>会员性别:<input type="text" name="memgender" id="memgender" value="${recovery.memgender}" readonly/><span style='color:red;'>&nbsp;*</span></td>
    <td>会员年龄:<input type="text" name="memage" id="memage" readonly value="${recovery.memage}"/><span style='color:red;'>&nbsp;*</span></td>
    <td>评估表编号:<input type="text" name="recoverynumber" id="recoverynumber" value="${recovery.recoverynumber}"/><span style='color:red;'>&nbsp;*</span></td>
  </tr>
  <tr>
   <input type="hidden" name="belongproid" value="${recovery.belongproid}" />
   <td>评估员&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" name="assesman" id="assesman" value="${recovery.assesman}"/></td>
    <td>评估日期:<input type="text" class="Wdate" name="assesdate" id="assesdate" value="${recovery.assesdate}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/><span style='color:red;'>&nbsp;*</span></td>
    <td>所属项目:<input type="text" id="belongproname" name="belongproname" value="${recovery.belongproname}" size=20" onclick="choosePro()"><span style='color:red;'>&nbsp;*</span></td>
  </tr>
</table>
<table width="95%" border="1" class="tabcss">
    <tr>
     <th height="36" colspan="9" scope="row">
      康复需求评估表
     </th>
    </tr>
    <tr>
     <th width="152" scope="row">
      意识
     </th>
     <td colspan="8" align="left">
      <input type="radio" class="radio"  id="a1"/>
        <label id="1" name="a1" for="a1">清晰</label>
      <input type="radio" class="radio"  id="a2"/>
        <label id="2"  name="a2" for="a2">嗜睡</label>
      <input type="radio" class="radio"  id="a3"/>
        <label id="3"  name="a3" for="a3">昏迷</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      关节活动度
     </th>
     <td width="264" align="left">
      <input type="radio" class="radio"  id="a4"/>
      <label id="4" value="3" name="a4" for="a4">正常</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"  id="a5"/>
      <label id="5"  value="4" name="a5" for="a5">异常 (</label>
      <input type="checkbox" class="checkBox1"  id="a6"/>
      肩关节
      <input type="checkbox" class="checkBox1"  id="a7"/>
      肘关节
      <input type="checkbox" class="checkBox1"  id="a8"/>
      腕关节
      <input type="checkbox" class="checkBox1"  id="a9"/>
      髋关节
      <input type="checkbox" class="checkBox1"  id="a10"/>
      膝关节
      <input type="checkbox" class="checkBox1"  id="a11"/>
      踝关节 )
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      肌肉力量
     </th>
     <td align="left">
      <input type="radio" class="radio"   id="a12"/>
     <label id="12" name="a12" value="5" for="a12">正常</label>
     </td>
     <td colspan="7" align="left">
      <p>
       <input  type="radio" class="radio"  id="a13"/>
       <label id="13"  name="a13" value="6" for="a13">减弱 上肢： (</label>
       <input type="checkbox" class="checkBox1"  id="a14"/>
       肱二肌头
       <input type="checkbox" class="checkBox1"  id="a15"/>
       肱三肌头
       <input type="checkbox" class="checkBox1"  id="a16"/>
       前臂伸腕肌群
       <input type="checkbox" class="checkBox1"  id="a17"/>
       前臂屈腕肌群)
      </p>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下肢：(
       <input type="checkbox" class="checkBox1"  id="a18"/>
       髂腰肌
       <input type="checkbox" class="checkBox1"  id="a19"/>
       股四头肌
       <input type="checkbox" class="checkBox1"  id="a20"/>
       股二头肌
       <input type="checkbox" class="checkBox1"  id="a21"/>
       小腿三头肌
       <input type="checkbox" class="checkBox1"  id="a22"/>
       胫前肌)
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      感觉功能
     </th>
     <td align="left">
      <input type="radio" class="radio"  id="a23"/>
      <label id="23" name="a23" value="7" for="a23">正常</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"   id="a24"/>
      <label id="24"  name="a24" value="8" for="a24">异常 (备注：)</label>
      <input type="text" size="50" id="a25"/>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      平衡功能
     </th>
     <td colspan="8" align="left">
      <p>
       坐位平衡
       <input type="radio" class="radio"   id="a26"/>
       <label id="26" name="a26" value="9" for="a26">不能完成</label>
       <input type="radio" class="radio"   id="a27"/>
       <label id="27"   name="a27" value="10"  for="a27">能完成</label>
       <select name="a28" id="a28" style="width:100px">
          <option value="0" ${recovery.a28 == '0' ? "selected" : ""}>    -- 请选择 --   </option>
		  <option value="I" ${recovery.a28 == 'I' ? "selected" : ""}>    I 级   </option>
		  <option value="II" ${recovery.a28 == 'II' ? "selected" : ""}>   II 级  </option>
		  <option value="III" ${recovery.a28 == 'III' ? "selected" : ""}>   III 级  </option>
	  </select>
      </p>
      <p>
       站位平衡
       <input type="radio" class="radio"   id="a29"/>
       <label  name="a29" id="29" value="11"  for="a29">不能完成</label>
       <input type="radio" class="radio"  id="a30"/>
       <label  name="a30" id="30" value="12"  for="a30">能完成</label>
       <select name="a31" id="a31" style="width:100px">
          <option value="0" ${recovery.a31 == '0' ? "selected" : ""}>    -- 请选择 --   </option>
		  <option value="I" ${recovery.a31 == 'I' ? "selected" : ""}>    I 级   </option>
		  <option value="II" ${recovery.a31 == 'II' ? "selected" : ""}>   II 级  </option>
		  <option value="III" ${recovery.a31 == 'III' ? "selected" : ""}>   III 级  </option>
	   </select>
      </p>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      转移能力
     </th>
     <td colspan="8" align="left">
      <input type="checkbox" class="checkBox1"  id="a32"/>
      床椅 ，轮椅
      <input type="checkbox" class="checkBox1"  id="a33"/>
      入厕
      <input type="checkbox" class="checkBox1"  id="a34"/>
      浴缸、沐浴
      <input type="checkbox" class="checkBox1"  id="a35"/>
      卧床
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      步态检查
     </th>
     <td align="left">
      <input  type="checkbox" class="checkBox1"  id="a36"/>
      卧床
     </td>
     <td colspan="7" align="left">
      <input type="radio"  class="radio"  id="a37"/>
      <label id="37" name="a37" for="a37">正常步态</label>
      <input type="radio" class="radio"  id="a38"/>
      <label id="38"  name="a38" for="a38"> 异常步态</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      认知能力
     </th>
     <td  colspan="3" align="left">
      记忆力：
      <input  type="radio" class="radio"   id="a39"/>
      <label id="39"  name="a39" for="a39">正常</label>
      <input  type="radio" class="radio"   id="a40"/>
      <label id="40"  name="a40" for="a40">异常</label>
     </td>
     <td colspan="5" align="left">
      注意力：
      <input type="radio" class="radio"   id="a41"/>
       <label  id="41" name="a41" for="a41">正常</label>
      <input type="radio" class="radio"  id="a42"/>
       <label id="42"  name="a42" for="a42">异常</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>辅助工具</strong>
     </th>
     <td colspan="8" align="left">
      <p>
       <input type="radio" class="radio"  id="a43"/>
       <label id="43" name="a43" value="19" for="a43">不需要</label>
      </p>
      <p>
       <input type="radio" class="radio"    id="a44"/>
       <label id="44"  name="a44" value="20" for="a44">需要(</label>
       <input type="checkbox" class="checkBox1"  id="a45"/>
       手仗
       <input type="checkbox" class="checkBox1"  id="a46"/>
       辅助器
       <input type="checkbox" class="checkBox1"  id="a47"/>
       假肢
       <input type="checkbox" class="checkBox1"  id="a48"/>
       轮椅
       <input type="checkbox" class="checkBox1"  id="a49"/>
       拐杖
       <input type="checkbox" class="checkBox1"  id="a50"/>
       矫形器
       <input type="checkbox" class="checkBox1"  id="a51"/>
       平车 )
      </p>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>疼痛</strong>
     </th>
     <td colspan="4" align="left">
      <input  type="radio" class="radio"   id="a52"/>
     <label id="52" value="21" name="a52" for="a52">部位</label>
      <input type="text" size="20" id="a53"/>
      VAS评分：
      <input type="text" size="6" id="a54"/>
      分
     </td>
     <td width="311" colspan="4" align="left">
      <input type="radio" class="radio"  id="a55"/>
      <label id="55"  name="a55" value="22" for="a55">无疼痛</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      肢体肿胀
     </th>
     <td colspan="2" align="left">
      <input type="radio" class="radio"  id="a56"/>
       <label id="56"  value="23" name="a56"  for="a56">部位</label>
      <input type="text" size="20" id="a57"/>
     </td>
     <td colspan="6" align="left">
      <input type="radio" class="radio"  id="a58"/>
     <label id="58"   name="a58" value="24" for="a58"> 无肿胀</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>二便管理</strong>
     </th>
     <td colspan="4" align="left">
      小便：
      <input type="radio" class="radio"   id="a59"/>
      <label  id="59"  name="a59" for="a59">正常</label>
      <input type="radio" class="radio"    id="a60"/>
      <label  id="60"  name="a60" for="a60">留置导尿</label>
      <input type="radio" class="radio"   id="a61"/>
      <label  id="61"   name="a61" for="a61">失禁</label>
     </td>
     <td colspan="4" align="left">
      大便：
      <input type="radio" class="radio"   id="a62"/>
      <label id="62" name="a62" for="a62">正常</label>
      <input type="radio" class="radio"   id="a63"/>
      <label id="63" name="a63" for="a63">便秘</label>
      <input type="radio" class="radio"   id="a64"/>
      <label id="64" name="a64" for="a64">失禁</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>压疮</strong>
     </th>
     <td align="left">
      <input type="radio" class="radio"   id="a65"/>
       <label id="65"  value="31" name="a65" for="a65">无</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"   id="a66"/>
      <label id="66"  name="a66" value="32"  for="a66">有(部位：</label>
      <input type="text" size="20" id="a67"/>
      分度：
      <input type="text" size="20" id="a68"/>
      )
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      言语功能
     </th>
     <td align="left">
      <input type="radio" class="radio"  id="a69"/>
       <label  id="69" name="a69"  for="a69">无</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"  id="a70"/>
      <label id="70" name="a70"  for="a70">异常(需要进一步言语评估)</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      独立生活能力
     </th>
     <td colspan="8" align="left">
      <input type="radio" class="radio"    id="a71"/>
      <label id="71" name="a71" for="a71">独立生活I</label>
      <input type="radio" class="radio"    id="a72"/>
     <label id="72" name="a72" for="a72"> 小部分帮助S</label>
      <input type="radio" class="radio"    id="a73"/>
      <label id="73" name="a73" for="a73">大部分帮助A</label>
      <input type="radio" class="radio"    id="a74"/>
      <label id="74" name="a74" for="a74">完全依赖D</label>
     </td>
    </tr>
    <tr>
     <th rowspan="3" align="center" scope="row">
      特殊评估
     </th>
     <td colspan="2" align="left">
      偏瘫
      <input type="checkbox" class="checkBox1"  id="a75"/>
      <strong>Brunnstrom </strong>
     </td>
     <td colspan="6" align="left">
      评估(手：
      <input type="text" size="10" id="a76"/>
      级； 上肢 ：)
      <input type="text" size="10" id="a77"/>
      级；下肢：
      <input type="text" size="10" id="a78"/>
      级；)
     </td>
    </tr>
    <tr>
     <td colspan="8" align="left">
      截瘫 ：ASIA评估 (
      <input type="radio" class="radio"  id="a79"/>
      <label id="79" name="a79"  for="a79">完全损伤</label>
      <input type="radio" class="radio"  id="a80"/>
      <label id="80" name="a80"  for="a80">不完全损伤)</label>
     </td>
    </tr>
    <tr>
     <td colspan="8" align="left">
      痉挛
      <input type="checkbox" class="checkBox1"  id="a81"/>
      上肢 (级别：
      <input type="text" size="10" id="a82"/>
      )
      <input type="checkbox" class="checkBox1"  id="a83"/>
      下肢 (级别：
      <input type="text" size="10" id="a84"/>
      )
     </td>
    </tr>
    <tr>
     <th height="54" align="center" scope="row">
      <strong>身体状况评估小结</strong>
     </th>
     <td colspan="8" align="left">
      <textarea name="textarea8" cols="100" rows="5" id="a85"></textarea>
     </td>
    </tr>
    <tr>
     <th height="49" align="center" scope="row">
      <strong>有无康复需求</strong>
     </th>
     <td colspan="8" align="left">
      <input type="radio" class="radio"  id="a86"/>
      <label id="86" name="a86" value="41" for="a86">无</label>
      <input type="radio" class="radio"   id="a87"/>
      <label id="87" name="a87" value="42" for="a87">有 备注(</label>
      <input type="text" size="50" id="a88"/>
      )
     </td>
    </tr>
    <tr>
     <th height="57" align="center" scope="row">
      <strong>医生评估建议</strong>
     </th>
     <td colspan="8" align="left">
      <textarea name="textarea10" cols="100" rows="5" id="a89"></textarea>
     </td>
    </tr>
    <tr>
     <th height="85" align="center" scope="row">
      <p align="center">
       <strong>服务人员训练计划</strong><strong> </strong>
      </p>
      <p align="center">
       <strong> </strong>
      </p>
     </th>
     <td colspan="8" align="left">
      <textarea name="textarea9" cols="100" rows="5" id="a90"></textarea>
     </td>
    </tr>
   </table> 	
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="onSubmit()">确定</button><button onClick="forward('revalelvalist.do')">返回</button></td>
  </tr>  
</table>
</form>
</body>
<script type="text/javascript">
<%
   recoveryAssess ca = (recoveryAssess)request.getAttribute("recovery");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=90;methodi++){
    	 String methodname = "getA"+methodi;
    	 //动态调用方法
         parasb.append(ca.getClass().getMethod(methodname, new Class[]{}).invoke(ca, new Object[]{})).append(",");
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
            }else if(document.getElementById("a"+(i+1)).type=='radio'){
               if(strs[i]=='true'){
                  document.getElementById(i+1).click();
               }
            }else if(document.getElementById("a"+(i+1)).type=='text'){
                document.getElementById("a"+(i+1)).value=strs[i];
            }else if(document.getElementById("a"+(i+1)).type=='textarea'){
                document.getElementById("a"+(i+1)).value=strs[i];
            }
     }
}	

var labels=document.getElementsByTagName('label');
var radios=new Array();
//得到所有radio类型的input
var allr=document.getElementsByTagName('input');
for(ir=0;ir<allr.length;ir++){
    if(allr[ir].type=='radio'){
        radios.push(allr[ir]);
    }
}
function initClass(labesindex,labeindex){
   for(i=labesindex,j=labeindex ; i<j ; i++)
   {
       labels[i].onclick=function() 
       {
		       for(k=labesindex,l=labeindex ; k<l ; k++)
		       {
		          labels[k].className='';
		     	  radios[k].checked = false;
		       }
		       this.className='checked';
		       try{
		    	   document.getElementById(this.name).checked = true;
		       }catch (e) {}
		    if(this.value=='3'){
		       document.getElementById('a6').disabled=true;
		       document.getElementById('a7').disabled=true;
		       document.getElementById('a8').disabled=true;
		       document.getElementById('a9').disabled=true;
		       document.getElementById('a10').disabled=true;
		       document.getElementById('a11').disabled=true;
		       
		       document.getElementById('a6').checked=false;
		       document.getElementById('a7').checked=false;
		       document.getElementById('a8').checked=false;
		       document.getElementById('a9').checked=false;
		       document.getElementById('a10').checked=false;
		       document.getElementById('a11').checked=false;
		    }
		    
		    if(this.value=='4'){
		       document.getElementById('a6').disabled=false;
		       document.getElementById('a7').disabled=false;
		       document.getElementById('a8').disabled=false;
		       document.getElementById('a9').disabled=false;
		       document.getElementById('a10').disabled=false;
		       document.getElementById('a11').disabled=false;
		    }
		    
		    if(this.value=='5'){
		       document.getElementById('a14').disabled=true;
		       document.getElementById('a15').disabled=true;
		       document.getElementById('a16').disabled=true;
		       document.getElementById('a17').disabled=true;
		       document.getElementById('a18').disabled=true;
		       document.getElementById('a19').disabled=true;
		       document.getElementById('a20').disabled=true;
		       document.getElementById('a21').disabled=true;
		       document.getElementById('a22').disabled=true;
		       
		       document.getElementById('a14').checked=false;
		       document.getElementById('a15').checked=false;
		       document.getElementById('a16').checked=false;
		       document.getElementById('a17').checked=false;
		       document.getElementById('a18').checked=false;
		       document.getElementById('a19').checked=false;
		       document.getElementById('a20').checked=false;
		       document.getElementById('a21').checked=false;
		       document.getElementById('a22').checked=false;
		    }
		    
		    if(this.value=='6'){
		       document.getElementById('a14').disabled=false;
		       document.getElementById('a15').disabled=false;
		       document.getElementById('a16').disabled=false;
		       document.getElementById('a17').disabled=false;
		       document.getElementById('a18').disabled=false;
		       document.getElementById('a19').disabled=false;
		       document.getElementById('a20').disabled=false;
		       document.getElementById('a21').disabled=false;
		       document.getElementById('a22').disabled=false;
		    }
		    
		    if(this.value=='7'){
		       document.getElementById('a25').value='';
		       document.getElementById('a25').disabled=true;
		    }
		    if(this.value=='8'){
		       document.getElementById('a25').disabled=false;
		    }
		    
		    if(this.value=='9'){
		       document.getElementById('a28').selectedIndex='0';
		       document.getElementById('a28').disabled=true;
		    }
		    
		    if(this.value=='10'){
		       document.getElementById('a28').disabled=false;
		    }
		    
		    if(this.value=='11'){
		       document.getElementById('a31').selectedIndex='0';
		       document.getElementById('a31').disabled=true;
		    }
		    
		    if(this.value=='12'){
		       document.getElementById('a31').disabled=false;
		    }
		    
		    if(this.value=='19'){
		       document.getElementById('a45').disabled=true;
		       document.getElementById('a46').disabled=true;
		       document.getElementById('a47').disabled=true;
		       document.getElementById('a48').disabled=true;
		       document.getElementById('a49').disabled=true;
		       document.getElementById('a50').disabled=true;
		       document.getElementById('a51').disabled=true;
		       
		       document.getElementById('a45').checked=false;
		       document.getElementById('a46').checked=false;
		       document.getElementById('a47').checked=false;
		       document.getElementById('a48').checked=false;
		       document.getElementById('a49').checked=false;
		       document.getElementById('a50').checked=false;
		       document.getElementById('a51').checked=false;
		    }
		    if(this.value=='20'){
		       document.getElementById('a45').disabled=false;
		       document.getElementById('a46').disabled=false;
		       document.getElementById('a47').disabled=false;
		       document.getElementById('a48').disabled=false;
		       document.getElementById('a49').disabled=false;
		       document.getElementById('a50').disabled=false;
		       document.getElementById('a51').disabled=false;
		    }
		    
		    if(this.value=='21'){
		       document.getElementById('a53').disabled=false;
		       document.getElementById('a54').disabled=false; 
		    }
		    
		    if(this.value=='22'){
		       document.getElementById('a53').disabled=true;
		       document.getElementById('a54').disabled=true;
		       
		       document.getElementById('a53').value='';
		       document.getElementById('a54').value='';
		    }
		    
		    if(this.value=='23'){
		       document.getElementById('a57').disabled=false;
		    }
		    
		    if(this.value=='24'){
		       document.getElementById('a57').disabled=true;
		       document.getElementById('a57').value='';
		    }
		    
		    if(this.value=='31'){
		       document.getElementById('a67').disabled=true;
		       document.getElementById('a67').value='';
		       
		       document.getElementById('a68').disabled=true;
		       document.getElementById('a68').value='';
		    }
		    
		    if(this.value=='32'){
		        document.getElementById('a67').disabled=false;
		        document.getElementById('a68').disabled=false;
		    }
		    
		    if(this.value=='41'){
		        document.getElementById('a88').disabled=true;
		        document.getElementById('a88').value='';
		    }
		    
		    if(this.value=='42'){
		        document.getElementById('a88').disabled=false;
		    }
	    }   
   }
}

initClass(0,3);
initClass(3,5);
initClass(5,7);
initClass(7,9);
initClass(9,11);
initClass(11,13);
initClass(13,15);
initClass(15,17);
initClass(17,19);
initClass(19,21);
initClass(21,23);
initClass(23,25);
initClass(25,28);
initClass(28,31);
initClass(31,33);
initClass(33,35);
initClass(35,39);
initClass(39,41);
initClass(41,43);

fillBlank();
</script>
</html>

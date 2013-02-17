<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cmmb.persistenc.po.bean.recoveryAssess"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康复评估详情</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:885px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}
.menu{width:885px;background:#eee;height:28px;border-right:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px}
li{float:left;width:221px;text-align:center;line-height:28px;height:28px;cursor:pointer;border-left:#A8C29F solid 1px;color:#666;font-size:14px;overflow:auto}
.menudiv{width:885px;height:350px;border-left:#A8C29F solid 1px;border-right:#A8C29F solid 1px;border-top:0;background:#fefefe;overflow:auto}
.menudiv div{padding:0px;line-height:15px;}
.off{background:#E0E2EB;color:#336699;font-weight:bold}
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>康复管理 > 康复评估详情</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<input name="startdate" type="hidden" value=""/>
<input name="enddate" type="hidden" value=""/>
<table width="100%" class="tab1" id="tab1" border="0">
  <tr>
    <td>会员姓名:<input type="text" name="memname" id="memname"  value="${recovery.memname}"  disabled/></td>
    <td>会员性别:<input type="text" name="memgender" id="memgender" value="${recovery.memgender}" disabled/></td>
    <td>会员年龄:<input type="text" name="memage" id="memage" disabled value="${recovery.memage}"/></td>
    <td>评估表编号:<input type="text" name="recoverynumber" id="recoverynumber" value="${recovery.recoverynumber}" disabled/></td>
  </tr>
  <tr>
   <input type="hidden" name="belongproid" value="${recovery.belongproid}" />
   <td>评估员&nbsp;&nbsp;&nbsp;&nbsp;:<input type="text" name="assesman" id="assesman"  value="${recovery.assesman}" disabled/></td>
    <td>评估日期:<input type="text" value="${recovery.assesdate}" name="assesdate" id="assesdate" disabled/></td>
    <td>所属项目:<input type="text" value="${recovery.belongproname}" id="belongproname" name="belongproname" size=20" disabled></td>
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
      <input type="radio" class="radio"  id="a1" disabled/>
        <label  name="a1" id="1" for="a1" >清晰</label>
      <input type="radio" class="radio"  id="a2" disabled/>
        <label  name="a2" id="2" for="a2" >嗜睡</label>
      <input type="radio" class="radio"  id="a3" disabled/>
        <label  name="a3" id="3" for="a3" >昏迷</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      关节活动度
     </th>
     <td width="264" align="left">
      <input type="radio" class="radio"  id="a4" disabled/>
      <label  value="3" id="4" name="a4" for="a4" >正常</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"  id="a5" disabled/>
      <label  value="4" id="5" name="a5" for="a5" >异常 (</label>
      <input type="checkbox" class="checkBox1" disabled id="a6"/>
      肩关节
      <input type="checkbox" class="checkBox1" disabled id="a7"/>
      肘关节
      <input type="checkbox" class="checkBox1" disabled id="a8"/>
      腕关节
      <input type="checkbox" class="checkBox1" disabled id="a9"/>
      髋关节
      <input type="checkbox" class="checkBox1" disabled id="a10"/>
      膝关节
      <input type="checkbox" class="checkBox1" disabled id="a11"/>
      踝关节 )
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      肌肉力量
     </th>
     <td align="left">
      <input type="radio" class="radio"   id="a12" disabled/>
     <label  name="a12" id="12" value="5" for="a12" >正常</label>
     </td>
     <td colspan="7" align="left">
      <p>
       <input  type="radio" class="radio"  id="a13" disabled/>
       <label  name="a13" id="13" value="6" for="a13" >减弱</label>
        上肢： (
       <input type="checkbox" class="checkBox1" disabled id="a14"/>
        肱二肌头
       <input type="checkbox" class="checkBox1" disabled id="a15"/>
       肱三肌头
       <input type="checkbox" class="checkBox1" disabled id="a16"/>
       前臂伸腕肌群
       <input type="checkbox" class="checkBox1" disabled id="a17"/>
       前臂屈腕肌群)
      </p>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下肢：(
       <input type="checkbox" class="checkBox1"  id="a18" disabled/>
       髂腰肌
       <input type="checkbox" class="checkBox1"  id="a19" disabled/>
       股四头肌
       <input type="checkbox" class="checkBox1"  id="a20" disabled/>
       股二头肌
       <input type="checkbox" class="checkBox1"  id="a21" disabled/>
       小腿三头肌
       <input type="checkbox" class="checkBox1"  id="a22" disabled/>
       胫前肌)
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      感觉功能
     </th>
     <td align="left">
      <input type="radio" class="radio"  id="a23" disabled/>
      <label  name="a23" id="23" value="7" for="a23" >正常</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"   id="a24" disabled/>
      <label  name="a24" id="24" value="8" for="a24" >异常 (备注：)</label>
      <input type="text" size="50" id="a25" disabled/>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      平衡功能
     </th>
     <td colspan="8" align="left">
      <p>
       坐位平衡
       <input type="radio" class="radio"  disabled id="a26"/>
       <label  name="a26" id="26" value="9"  for="a26">不能完成</label>
       <input type="radio" class="radio"  disabled id="a27"/>
       <label   name="a27" id="27" value="10"  for="a27">能完成</label>
       <select name="a28" id="a28" style="width:100px" disabled>
          <option value="0" ${recovery.a28 == '0' ? "selected" : ""}>    -- 请选择 --   </option>
		  <option value="I" ${recovery.a28 == 'I' ? "selected" : ""}>    I 级   </option>
		  <option value="II" ${recovery.a28 == 'II' ? "selected" : ""}>   II 级  </option>
		  <option value="III" ${recovery.a28 == 'III' ? "selected" : ""}>   III 级  </option>
	  </select>
      </p>
      <p>
       站位平衡
       <input type="radio" class="radio"   id="a29" disabled/>
       <label  name="a29" id="29" value="11"  for="a29" >不能完成</label>
       <input type="radio" class="radio"  id="a30" disabled/>
       <label  name="a30" id="30" value="12"  for="a30" >能完成</label>
       <select name="a31" id="a31" style="width:100px" disabled>
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
      <input type="checkbox" class="checkBox1"  id="a32" disabled/>
      床椅 ，轮椅
      <input type="checkbox" class="checkBox1"  id="a33" disabled/>
      入厕
      <input type="checkbox" class="checkBox1"  id="a34" disabled/>
      浴缸、沐浴
      <input type="checkbox" class="checkBox1"  id="a35" disabled/>
      卧床
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      步态检查
     </th>
     <td align="left">
      <input type="checkbox" class="checkBox1"  id="a36" disabled/>
      卧床
     </td>
     <td colspan="7" align="left">
      <input type="radio"  class="radio"  id="a37" disabled/>
      <label  name="a37" id="37" for="a37" >正常步态</label>
      <input type="radio" class="radio"  disabled id="a38"/>
      <label  name="a38" id="38" for="a38" > 异常步态</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      认知能力
     </th>
     <td  colspan="3" align="left">
      记忆力：
      <input  type="radio" class="radio"  disabled id="a39"/>
      <label  name="a39" id="39" for="a39" >正常</label>
      <input  type="radio" class="radio"  disabled id="a40"/>
      <label  name="a40" id="40" for="a40" >异常</label>
     </td>
     <td colspan="5" align="left">
      注意力：
      <input type="radio" class="radio"  disabled id="a41"/>
       <label   name="a41" id="41"  for="a41" >正常</label>
      <input type="radio" class="radio"  id="a42" disabled/>
       <label  name="a42" id="42"  for="a42" >异常</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>辅助工具</strong>
     </th>
     <td colspan="8" align="left">
      <p>
       <input type="radio" class="radio"  id="a43" disabled/>
       <label name="a43" id="43" value="19" for="a43" >不需要</label>
      </p>
      <p>
       <input type="radio" class="radio"   disabled id="a44"/>
       <label  name="a44" id="44" value="20" for="a44" >需要(</label>
       <input type="checkbox" class="checkBox1"  id="a45" disabled/>
       手仗
       <input type="checkbox" class="checkBox1"  id="a46" disabled/>
       辅助器
       <input type="checkbox" class="checkBox1"  id="a47" disabled/>
       假肢
       <input type="checkbox" class="checkBox1"  id="a48" disabled/>
       轮椅
       <input type="checkbox" class="checkBox1"  id="a49" disabled/>
       拐杖
       <input type="checkbox" class="checkBox1"  id="a50" disabled/>
       矫形器
       <input type="checkbox" class="checkBox1"  id="a51" disabled/>
       平车 )
      </p>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>疼痛</strong>
     </th>
     <td colspan="4" align="left">
      <input  type="radio" class="radio"   id="a52" disabled/>
     <label  value="21" id="52" name="a52" for="a52" >部位</label>
      <input type="text" size="20" id="a53" disabled/>
      VAS评分：
      <input type="text" size="6" id="a54" disabled/>
      分
     </td>
     <td width="311" colspan="4" align="left">
      <input type="radio" class="radio"  id="a55" disabled/>
      <label  name="a55" id="55" value="22" for="a55" >无疼痛</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      肢体肿胀
     </th>
     <td colspan="2" align="left">
      <input type="radio" class="radio"  id="a56" disabled/>
       <label  value="23" id="56" name="a56"  for="a56">部位</label>
       <input type="text" size="20" id="a57" disabled/>
     </td>
     <td colspan="6" align="left">
      <input type="radio" class="radio"  id="a58" disabled/>
      <label   name="a58" id="58" value="24" for="a58" > 无肿胀</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>二便管理</strong>
     </th>
     <td colspan="4" align="left">
      小便：
      <input type="radio" class="radio"   id="a59" disabled/>
      <label  name="a59" id="59" for="a59" >正常</label>
      <input type="radio" class="radio"    id="a60" disabled/>
      <label  name="a60" id="60" for="a60" >留置导尿</label>
      <input type="radio" class="radio"   id="a61" disabled/>
      <label   name="a61" id="61" for="a61" >失禁</label>
     </td>
     <td colspan="4" align="left">
      大便：
      <input type="radio" class="radio"  disabled id="a62"/>
      <label  name="a62" id="62"  for="a62">正常</label>
      <input type="radio" class="radio"  disabled id="a63"/>
      <label   name="a63" id="63" for="a63" >便秘</label>
      <input type="radio" class="radio"  disabled id="a64"/>
      <label   name="a64" id="64" for="a64" >失禁</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      <strong>压疮</strong>
     </th>
     <td align="left">
      <input type="radio" class="radio"   id="a65" disabled/>
       <label  value="31" id="65" name="a65" for="a65" >无</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"   id="a66" disabled/>
      <label   name="a66" id="66" value="32"  for="a66">有(部位：</label>
      <input type="text" size="20" id="a67" disabled/>
      分度：
      <input type="text" size="20" id="a68" disabled/>
      )
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      言语功能
     </th>
     <td align="left">
      <input type="radio" class="radio"  id="a69" disabled/>
       <label   name="a69" id="69"  for="a69">无</label>
     </td>
     <td colspan="7" align="left">
      <input type="radio" class="radio"  id="a70" disabled/>
      <label   name="a70" id="70"   for="a70">异常(需要进一步言语评估)</label>
     </td>
    </tr>
    <tr>
     <th align="center" scope="row">
      独立生活能力
     </th>
     <td colspan="8" align="left">
      <input type="radio" class="radio"    id="a71" disabled/>
      <label  name="a71" id="71"  for="a71">独立生活I</label>
      <input type="radio" class="radio"    id="a72" disabled/>
      <label  name="a72" id="72" for="a72" > 小部分帮助S</label>
      <input type="radio" class="radio"    id="a73" disabled/>
      <label  name="a73" id="73"  for="a73">大部分帮助A</label>
      <input type="radio" class="radio"    id="a74" disabled/>
      <label   name="a74" id="74"  for="a74">完全依赖D</label>
     </td>
    </tr>
    <tr>
     <th rowspan="3" align="center" scope="row">
      特殊评估
     </th>
     <td colspan="2" align="left">
      偏瘫
      <input type="checkbox" class="checkBox1"  id="a75" disabled/>
      <strong>Brunnstrom </strong>
     </td>
     <td colspan="6" align="left">
      评估(手：
      <input type="text" size="10" id="a76" disabled/>
      级； 上肢 ：)
      <input type="text" size="10" id="a77" disabled/>
      级；下肢：
      <input type="text" size="10" id="a78" disabled/>
      级；)
     </td>
    </tr>
    <tr>
     <td colspan="8" align="left">
      截瘫 ：ASIA评估 (
      <input type="radio" class="radio"  id="a79" disabled/>
      <label  name="a79" id="79"  for="a79">完全损伤</label>
      <input type="radio" class="radio"  id="a80" disabled/>
      <label   name="a80" id="80"  for="a80">不完全损伤)</label>
     </td>
    </tr>
    <tr>
     <td colspan="8" align="left">
      痉挛
      <input type="checkbox" class="checkBox1"  id="a81" disabled/>
      上肢 (级别：
      <input type="text" size="10" id="a82" disabled/>
      )
      <input type="checkbox" class="checkBox1"  id="a83" disabled/>
      下肢 (级别：
      <input type="text" size="10" id="a84" disabled/>
      )
     </td>
    </tr>
    <tr>
     <th height="54" align="center" scope="row">
      <strong>身体状况评估小结</strong>
     </th>
     <td colspan="8" align="left">
      <textarea name="textarea8" cols="100" rows="5" id="a85" disabled></textarea>
     </td>
    </tr>
    <tr>
     <th height="49" align="center" scope="row">
      <strong>有无康复需求</strong>
     </th>
     <td colspan="8" align="left">
      <input type="radio" class="radio"  id="a86" disabled/>
      <label  name="a86" id="86" value="41" for="a86">无</label>
      <input type="radio" class="radio"   id="a87" disabled/>
      <label  name="a87" id="87" value="42"  for="a87">有 备注(</label>
      <input type="text" size="50" id="a88" disabled/>
      )
     </td>
    </tr>
    <tr>
     <th height="57" align="center" scope="row">
      <strong>医生评估建议</strong>
     </th>
     <td colspan="8" align="left">
      <textarea name="textarea10" cols="100" rows="5" id="a89" disabled></textarea>
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
      <textarea name="textarea9" cols="100" rows="5" id="a90" disabled></textarea>
     </td>
    </tr>
   </table> 
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="forward('revalelvalist.do')">返回</button></td>
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
            //alert(document.getElementById("a"+(i+1)).type);
            if(document.getElementById("a"+(i+1)).type=='checkbox'){
               if(strs[i]=='false'){
                   document.getElementById("a"+(i+1)).checked=false;
               }else{
                   document.getElementById("a"+(i+1)).checked=true; 
               }
            }else if(document.getElementById("a"+(i+1)).type=='radio'){
               if(strs[i]=='true'){
                  document.getElementById(i+1).className="checked";
               }
            }else if(document.getElementById("a"+(i+1)).type=='text'){
                document.getElementById("a"+(i+1)).value=strs[i];
            }else if(document.getElementById("a"+(i+1)).type=='textarea'){
                document.getElementById("a"+(i+1)).value=strs[i];
            }
     }
}
fillBlank();
</script>
</html>

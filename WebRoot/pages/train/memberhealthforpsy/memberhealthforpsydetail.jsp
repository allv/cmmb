<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cimp.vo.data.healtheval"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健康评估详细</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:1000px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>会员管理 > 健康评估修改</div>
<table width="100%">
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form  method="post">
<div style="text-align:center">
<table width="100%"  style="margin:auto"  class="tab1" id="tab1" border="0">
  <tr>
    <td>会员姓名:<input   type="text" name="memname" id="memname" onclick="chooseElders()" value="${health.memname}" disabled/><span style='color:red;'>&nbsp;*</span></td>
    <td>档案编号:<input   type="text" name="healthnumber" id="healthnumber" value="${health.healthnumber}" disabled/><span style='color:red;'>&nbsp;*</span></td>
    <td>申请原因:<select  id="applyreason" name="applyreason" disabled>
       <option value="1" ${health.applyreason == '1' ? "selected" : ""}>首次评估</option>
       <option value="2" ${health.applyreason == '2' ? "selected" : ""}>后续评估</option>
       <option value="3" ${health.applyreason == '3' ? "selected" : ""}>阶段评估</option>
       <option value="4" ${health.applyreason == '4' ? "selected" : ""}>出院后评估</option>
       <option value="5" ${health.applyreason == '5' ? "selected" : ""}>其他</option>
    </select><span style='color:red;'>&nbsp;*</span></td>
    <td>评估日期:<input type="text" class="Wdate" name="assesdate" value="${health.assesdate}" id="assesdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" disabled/><span style='color:red;'>&nbsp;*</span></td>
    <td>所属项目:<input type="text"  id="belongproname" name="belongproname" value="${health.belongproname}" onclick="choosePro()" disabled><span style='color:red;'>&nbsp;*</span></td> 
  </tr>
</table>
</div>
<p>&nbsp;</p>
<div style="text-align:center"><table style="margin:auto" width="95%" border="1" class="tabcss">
  <tr align="center">
    <td height="33" colspan="12"><strong>健康评估表</strong></td>
  </tr>
  <tr>
    <td height="36" colspan="12">B.认知功能评定</td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">记忆能力</div></td>
    <td height="35" colspan="11"><select disabled name="a1" id="a1" style="width:50px">
	    <option value="0" ${health.a1 == '0' ? "selected" : ""}>0</option>
	    <option value="1" ${health.a1 == '1' ? "selected" : ""}>1</option>
    </select>
      0、记忆力好
    1、记忆力有问题</td>
  </tr>
  <tr>
    <td height="37" colspan="6"><input disabled  type="checkbox" class="checkBox1"  name="a2" id="a2" />
      a.短期记忆力 -回想5分钟前发生的事</td>
    <td colspan="5"><input disabled  type="checkbox" class="checkBox1"  name="a3" id="a3" />
      b.程序记忆 -不用提醒能够想起所有或大部分测试项目环节中的顺序</td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">日常判断能力</div></td>
    <td height="30" colspan="5"><input disabled  type="checkbox" class="checkBox1"  name="a4" id="a4"/>
      a.服务老人如何决定一天安排(例如，什么时候起床或吃早饭，穿哪件衣服，参与什么活动)</td>
    <td colspan="6">b.比过去90天糟糕：
      <select disabled name="a5" id="a5" style="width:50px">
	      <option value="0" ${health.a5 == '0' ? "selected" : ""}>0</option>
	      <option value="1" ${health.a5 == '1' ? "selected" : ""}>1</option>
      </select>
0.否
    1.是</td>
  </tr>
  <tr>
    <td height="31" colspan="11">      <select disabled name="a6" id="a6" style="width:50px">
	      <option value="0" ${health.a6 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a6 == 1 ? "selected" : ""}>1</option>
	      <option value="2" ${health.a6 == 2 ? "selected" : ""}>2</option>
	      <option value="3" ${health.a6 == 3 ? "selected" : ""}>3</option>
	      <option value="4" ${health.a6 == 4 ? "selected" : ""}>4</option>
    </select>
      0. 独立完成- 决定持续/合理/安全
      1. 需协助 -对新情况有些困难
      2. 轻微丧失-在一些特殊情况下做决定变得很困难、不安全，需要有人指引
      3. 中度丧失-经常做出糟糕、不安全的决定，任何时候都需要有人帮助
      4. 严重丧失-从不或几乎无法做决定</td>
  </tr>
  <tr>
    <td><div align="center">认知功能测试</div></td>
    <td colspan="11">是否有必要进行？
      <select disabled name="a7" id="a7" style="width:50px" onchange="Bian('a8','',this.options.selectedIndex)">
	      <option value="0" ${health.a7 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a7 == 1 ? "selected" : ""}>1</option>
      </select>
0.否 
1.是 分数：
    <input disabled  type=text id="a8" name="a8" size="5" />
    分</td>
  </tr>
  <tr>
    <td height="36" colspan="12">C.沟通与听力</td>
  </tr>
  <tr>
    <td><div align="center">听力</div></td>
    <td colspan="11"><select disabled name="a9" id="a9" style="width:50px">
       <option value="0" ${health.a9 == 0 ? "selected" : ""}>0</option>
	   <option value="1" ${health.a9 == 1 ? "selected" : ""}>1</option>
	   <option value="2" ${health.a9 == 2 ? "selected" : ""}>2</option>
    </select>
      0、能够听到：正常音量对话，电视声，电话，门铃
      1、听力减退：需调高音量或大声重复
      2、弱听：需要有助听器等辅助</td>
  </tr>
  <tr>
    <td><div align="center">理解能力（表达）</div></td>
    <td colspan="11"><select disabled name="a10" id="a10" style="width:50px">
        <option value="0" ${health.a10 == 0 ? "selected" : ""}>0</option>
	    <option value="1" ${health.a10 == 1 ? "selected" : ""}>1</option>
	    <option value="2" ${health.a10 == 2 ? "selected" : ""}>2</option>
	    <option value="3" ${health.a10 == 3 ? "selected" : ""}>3</option>
    </select>
      0、正常：理解没有困难
      1、一般：用词和表述完整想法有些困难，但给予一定时间或一点提示能够表达
      2、有时候能理解：较难做出准确反馈
      3、几乎无法理解</td>
  </tr>
  <tr>
    <td><div align="center">沟通能力</div></td>
    <td colspan="11">比过去90天糟糕：
      <select disabled name="a11" id="a11" style="width:50px">
         <option value="0" ${health.a11 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a11 == 1 ? "selected" : ""}>1</option>
      </select>
0.否 
1.是</td>
  </tr>
  <tr>
    <td height="37" colspan="12">D.视力</td>
  </tr>
  <tr>
    <td><div align="center">视力</div></td>
    <td colspan="11">(正常光线及佩戴眼镜可见）
      <select disabled name="a12" id="a12" style="width:50px">
         <option value="0" ${health.a12 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a12 == 1 ? "selected" : ""}>1</option>
	     <option value="2" ${health.a12 == 2 ? "selected" : ""}>2</option>
	     <option value="3" ${health.a12 == 3 ? "selected" : ""}>3</option>
      </select>
	    0、正常：可正常阅读报刊等
	    1、轻微障碍：能看见大字体，但是一般书报、杂志无法阅读
	    2、弱视：有限视力，但是能分辨物体
	    3、严重弱视：看不见或能看见光、颜色、形状</td>
  </tr>
  <tr>
    <td><div align="center">视觉障碍</div></td>
    <td colspan="11">看到光圈、眼前有暗区或有闪光
      <select disabled name="a13" id="a13" style="width:50px">
          <option value="0" ${health.a13 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a13 == 1 ? "selected" : ""}>1</option>
      </select>
        0、否
		1、是</td>
  </tr>
  <tr>
    <td><div align="center">沟通能力</div></td>
    <td colspan="11">比过去90天糟糕：
      <select disabled name="a14" id="a14" style="width:50px">
          <option value="0" ${health.a14 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a14 == 1 ? "selected" : ""}>1</option>
      </select>
		0.否 
		1.是</td>
  </tr>
  <tr>
    <td height="43" colspan="12">E.心情与行为</td>
  </tr>
  <tr>
    <td rowspan="4"><div align="center">抑郁、焦虑、坏心情指向</div></td>
    <td colspan="11">（选择以下编号）
      <select disabled name="a15" id="a15" style="width:50px">
         <option value="0" ${health.a15 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a15 == 1 ? "selected" : ""}>1</option>
	     <option value="2" ${health.a15 == 2 ? "selected" : ""}>2</option>
      </select>
	0、近3天内未发现
    1、3天内发现1-2次
    2、3天内每天表现出</td>
  </tr>
  <tr>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a16" id="a16" />
      a.感到悲伤或抑郁，认为或者没有什么值留恋，任何事情都不在乎，认为自己没用还不如死了
     <input disabled  type="checkbox" class="checkBox1"  name="a17" id="a17" />
      b.持续对自己或对他人发怒，例如在接受护理的时候容易烦躁、发怒
     <input disabled  type="checkbox" class="checkBox1"  name="a18" id="a18" />
      c.表现出不切实际的担忧，例如担心被排期、被孤立</td>
  </tr>
  <tr>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a19" id="a19" />
      d.反复抱怨健康，例如经常看医生、过度注意自己的身体功能
     <input disabled  type="checkbox" class="checkBox1"  name="a20" id="a20" />
      e.反复抱怨担忧与焦虑，例如过度紧张日程安排、三餐安排、清洁、服装以及与他人关系
     <input disabled  type="checkbox" class="checkBox1"  name="a21" id="a21" />
      f.脸上表现出担忧、痛苦、难过，例如皱眉</td>
  </tr>
  <tr>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a22" id="a22" />
      g.经常哭泣
     <input disabled  type="checkbox" class="checkBox1"  name="a23" id="a23" />
    h.丧失兴趣爱好，例如放弃长久以来的兴趣爱好或不与家人朋友交往
   <input disabled  type="checkbox" class="checkBox1"  name="a24" id="a24" />
    i.减少社交活动</td>
  </tr>
  <tr>
    <td><div align="center">心情变差</div></td>
    <td colspan="11">比过去90天糟糕：
      <select disabled name="a25" id="a25" style="width:50px">
           <option value="0" ${health.a25 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a25 == 1 ? "selected" : ""}>1</option>
      </select>
      0.否 
      1.是</td>
  </tr>
  <tr>
    <td rowspan="3"><div align="center">行为</div></td>
    <td height="40" colspan="11"><select disabled name="a26" id="a26" style="width:50px">
           <option value="0" ${health.a26 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a26 == 1 ? "selected" : ""}>1</option>
	       <option value="2" ${health.a26 == 2 ? "selected" : ""}>2</option>
    </select>     
       （选择以下编号）0、近3天内未发现 1、3天内发现1-2次 2、3天内每天表现出</td>
  </tr>
  <tr>
    <td colspan="5"><input disabled  type="checkbox" class="checkBox1"  name="a27" id="a27" />
    a.没有目的的闲逛</td>
    <td colspan="4"><input disabled  type="checkbox" class="checkBox1"  name="a28" id="a28" />
    b.滥用言语，威吓、尖叫、诅咒他人</td>
    <td colspan="2"><input disabled  type="checkbox" class="checkBox1"  name="a29" id="a29" />
      c.伤害行为，例如打、掴、性侵<br />
    犯他人</td>
  </tr>
  <tr>
    <td colspan="5"><input disabled  type="checkbox" class="checkBox1"  name="a30" id="a30" />
    d.社交不当行为，例如重复打断他人声音、噪音、尖叫、自虐行为、公共场所脱衣、乱扔/糟蹋食物/排泄物、乱翻物品等造成干扰行为</td>
    <td colspan="6"><input disabled  type="checkbox" class="checkBox1"  name="a31" id="a31" />
    e.拒绝护理，例如拒绝治疗、服药、生活辅助、吃饭、或更换位置</td>
  </tr>
  <tr>
    <td><div align="center">行为变化</div></td>
    <td colspan="11">比过去90天糟糕 
      <select disabled name="a32" id="a32" style="width:50px">
         <option value="0" ${health.a32 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a32 == 1 ? "selected" : ""}>1</option>
      </select>
		0.否
		1.是</td>
  </tr>
  <tr>
    <td><div align="center">进一步评估</div></td>
    <td colspan="11">是否进行进一步心理评估：
      <select disabled  name="a33" id="a33" style="width:50px">
         <option value="0" ${health.a33 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a33 == 1 ? "selected" : ""}>1</option>
      </select>
0.否
1.是</td>
  </tr>
  <tr>
    <td height="34" colspan="12">F.社交能力</td>
  </tr>
  <tr>
    <td><div align="center">合群</div></td>
    <td colspan="7">a.容易与他人相处
      <select disabled  name="a34" id="a34" style="width:50px">
         <option value="0" ${health.a34 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a34 == 1 ? "selected" : ""}>1</option>
      </select>
		0.否
		1.是</td>
    <td colspan="4">b.与家人/朋友有公开矛盾或冲突 
      <select disabled name="a35" id="a35" style="width:50px">
          <option value="0" ${health.a35 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a35 == 1 ? "selected" : ""}>1</option>
      </select>
		0.否
		1.是</td>
  </tr>
  <tr>
    <td><div align="center">社交活动变化</div></td>
    <td colspan="11">比过去90天下降：
      <select disabled name="a36" id="a36" style="width:50px">
           <option value="0" ${health.a36 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a36 == 1 ? "selected" : ""}>1</option>
	       <option value="2" ${health.a36 == 2 ? "selected" : ""}>2</option>
      </select>
      0.否
      1.下降，但不担忧 
      2.下降，表示担忧</td>
  </tr>
  <tr>
    <td><div align="center">孤立</div></td>
    <td colspan="7">a.白天晚上或一整天一个人独处 
      <select disabled name="a37" id="a37" style="width:50px">
             <option value="0" ${health.a37 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a37 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a37 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a37 == 3 ? "selected" : ""}>3</option>
      </select>
    0.从不
    1.大约1小时 
    2.半天时间 
    3.所有时间</td>
    <td colspan="4">b.表示感到孤独 
      <select disabled name="a38" id="a38" style="width:50px">
          <option value="0" ${health.a38 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a38 == 1 ? "selected" : ""}>1</option>
      </select>
    0.是 
    1.否</td>
  </tr>
  <tr>
    <td><div align="center">进一步评估</div></td>
    <td colspan="11">是否进行进一步心理评估：      
      <select disabled name="a39" id="a39" style="width:50px">
           <option value="0" ${health.a39 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a39 == 1 ? "selected" : ""}>1</option>
      </select> 0.是 
    1.否</td>
  </tr>
  <tr>
    <td height="37" colspan="12">G.身体机能</td>
  </tr>
  <tr>
    <td rowspan="4"><div align="center">IADL评定分数(* 7天内工具性日常生活能力)
      <input disabled  type="text" size="5" name="a40" id="40"/>
    </div></td>
    <td colspan="7">a.使用电话能力
      <select disabled name="a41" id="a41" style="width:50px">
           <option value="0" ${health.a41 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a41 == 1 ? "selected" : ""}>1</option>
      </select>
0.无法拨打电话
    1.能够自己拨打电话；能够拨打部分数字；能够回答电话但是不能拨打。</td>
    <td colspan="4">b.购物
      <select disabled  name="a42" id="a42" style="width:50px">
           <option value="0" ${health.a42 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a42 == 1 ? "selected" : ""}>1</option>
      </select>
0.可以进行小额采购；需要买东西时有<br />
    人陪伴；完全无法独自采购。
    1.所有的采购都能够独立完成。</td>
  </tr>
  <tr>
    <td colspan="7">c.三餐准备 
      <select disabled name="a43" id="a43" style="width:50px">
         <option value="0" ${health.a43 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a43 == 1 ? "selected" : ""}>1</option>
      </select>
0.能够加热或准备速食食品，但没有充<br />
    足的营养；每顿饭都需要有人帮助准备。
    1.独立计划、烹饪三餐。</td>
    <td colspan="4">d.居家卫生 
      <select disabled name="a44" id="a44" style="width:50px">
         <option value="0" ${health.a44 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a44 == 1 ? "selected" : ""}>1</option>
      </select>
0.无法进行任何居家卫生清洁 
    1.独立或在别人帮助下完成清洁重活、洗碗、床铺整理、一般日常清洁、家庭设施维护。</td>
  </tr>
  <tr>
    <td colspan="7">e. 衣物清洗
      <select disabled name="a45" id="a45" style="width:50px">
           <option value="0" ${health.a45 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a45 == 1 ? "selected" : ""}>1</option>
    </select>
    0.需要别人为自己清洗衣物 1.所有的私人衣物或部分小件衣服自己可以独立完成清洗</td>
    <td colspan="4">f. 交通方式
      <select disabled name="a46" id="a46" style="width:50px">
          <option value="0" ${health.a46 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a46 == 1 ? "selected" : ""}>1</option>
      </select>
      0.仅限在别人帮助下叫车或者使用租车服务才能外出，或者完全无法外出。1.能够独自或在人陪伴下乘坐公共交通工具或能够为自己叫车</td>
  </tr>
  <tr>
    <td colspan="7">g. 服药
      <select disabled  name="a47" id="a47" style="width:50px">
          <option value="0" ${health.a47 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a47 == 1 ? "selected" : ""}>1</option>
      </select>
      0.无法独立服药，需要别人将服药剂量准备<br />
    好才能服药。1.独立在正确时间服用正确计量的药物。</td>
    <td colspan="4">h. 理财
      <select disabled name="a48" id="a48" style="width:50px">
          <option value="0" ${health.a48 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a48 == 1 ? "selected" : ""}>1</option>
      </select>
    0.无法独立支配财务 1..独立管理财务能力，偶尔需要别人帮助去银行或支付一些账单。</td>
  </tr>
  <tr>
    <td rowspan="5"><div align="center">ADL评定分数(* 5天内日常生活自理能力)
      <input disabled  type="text" size="5" name="a49" id="a49"/>
    </div></td>
    <td colspan="7">a. 进食
      <select disabled name="a50" id="a50" style="width:50px">
           <option value="0" ${health.a50 == 0 ? "selected" : ""}>0</option>
	       <option value="5" ${health.a50 == 5 ? "selected" : ""}>5</option>
	       <option value="10" ${health.a50 == 10 ? "selected" : ""}jg a
	       =0\	OU>10</option>
      </select>
    0.无法进食 5.需要帮助切割、粉碎食物等 10.独立</td>
    <td colspan="4">b. 洗浴
      <select disabled name="a51" id="a51" style="width:50px">
           <option value="0" ${health.a51 == 0 ? "selected" : ""}>0</option>
	       <option value="5" ${health.a51 == 5 ? "selected" : ""}>5</option>
      </select>
    0.需要帮助 5.独立完成</td>
  </tr>
  <tr>
    <td colspan="7">c. 修饰 
      <select disabled name="a52" id="a52" style="width:50px">
          <option value="0" ${health.a52 == 0 ? "selected" : ""}>0</option>
	      <option value="5" ${health.a52 == 5 ? "selected" : ""}>5</option>
      </select>
    0.需要帮助 5.独立完成洗脸/洗头/刷牙/剃须</td>
    <td colspan="4">d. 着装 
      <select disabled name="a53" id="a53" style="width:50px">
           <option value="0" ${health.a53 == 0 ? "selected" : ""}>0</option>
	       <option value="5" ${health.a53 == 5 ? "selected" : ""}>5</option>
	       <option value="10" ${health.a53 == 10 ? "selected" : ""}>10</option>
      </select>
    0.完全需要帮助 5.部分需要帮助 10.独立完成（包括扣纽扣、拉链等）</td>
  </tr>
  <tr>
    <td colspan="7">e. 大便
      <select disabled name="a54" id="a54" style="width:50px">
           <option value="0" ${health.a54 == 0 ? "selected" : ""}>0</option>
	       <option value="5" ${health.a54 == 5 ? "selected" : ""}>5</option>
	       <option value="10" ${health.a54 == 10 ? "selected" : ""}>10</option>
      </select>
    0.失禁（或需要灌肠）5.偶尔失禁 10.正常</td>
    <td colspan="4">f. 小便 
      <select disabled  name="a55" id="a55" style="width:50px">
           <option value="0" ${health.a55 == 10 ? "selected" : ""}>0</option>
	       <option value="5" ${health.a55 == 5 ? "selected" : ""}>5</option>
	       <option value="10" ${health.a55 == 10 ? "selected" : ""}>10</option>
      </select>
    0.失禁（或插管，无法进行自理） 5.偶尔失禁 10.正常</td>
  </tr>
  <tr>
    <td colspan="7">g. 如厕 
      <select disabled name="a56" id="a56" style="width:50px">
         <option value="0" ${health.a56 == 0 ? "selected" : ""}>0</option>
	     <option value="5" ${health.a56 == 5 ? "selected" : ""}>5</option>
	     <option value="10" ${health.a56 == 10 ? "selected" : ""}>10</option>
      </select>     
       0.需要帮助 5.需要部分帮助 10.独立完成（坐、站立、系裤、擦拭）</td>
    <td colspan="4">h. 转移（床与椅子之间）
      <select disabled name="a57" id="a57" style="width:50px">
         <option value="0" ${health.a57 == 0 ? "selected" : ""}>0</option>
	     <option value="5" ${health.a57 == 5 ? "selected" : ""}>5</option>
	     <option value="10" ${health.a57 == 10 ? "selected" : ""}>10</option>
	     <option value="15" ${health.a57 == 15 ? "selected" : ""}>15</option>
      </select>
    0.需要帮助，坐时无法平衡 5.需要大部分帮助，1-2人搬移，能坐 10.部分帮助（口头与肢体上）15.独立</td>
  </tr>
  <tr>
    <td colspan="7">i. 平地行走
      <select disabled name="a58" id="a58" style="width:50px">
         <option value="0" ${health.a58 == 0 ? "selected" : ""}>0</option>
	     <option value="5" ${health.a58 == 5 ? "selected" : ""}>5</option>
	     <option value="10" ${health.a58 == 10 ? "selected" : ""}>10</option>
	     <option value="15" ${health.a58 == 15 ? "selected" : ""}>15</option>
      </select>     
       0.无法走动或行走少于45米 5.独自使用轮椅行走大于45米 10.在一人帮助（语言、肢体）下行走大于45米.15.独立行走（但可能需要一些支持，例<br />
      如拐杖）步行大于45米。</td>
    <td colspan="4">j. 楼梯
      <select disabled name="a59" id="a59" style="width:50px">
         <option value="0" ${health.a59 == 0 ? "selected" : ""}>0</option>
	     <option value="5" ${health.a59 == 5 ? "selected" : ""}>5</option>
	     <option value="10" ${health.a59 == 10 ? "selected" : ""}>10</option>
      </select>     
       0.无法独立使用 5.需要帮助（语言、肢体）10.独立完成。</td>
  </tr>
  <tr>
    <td><div align="center">进一步评估</div></td>
    <td colspan="11">ADL状态比过去90天糟糕：    
      <select disabled name="a60" id="a60" style="width:50px">
         <option value="0" ${health.a60 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a60 == 1 ? "selected" : ""}>1</option>
      </select>0.否
    1.是</td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">最初行动方式</div></td>
    <td colspan="11"><select disabled name="a61" id="a61" style="width:50px">
         <option value="0" ${health.a61 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a61 == 1 ? "selected" : ""}>1</option>
	     <option value="2" ${health.a61 == 2 ? "selected" : ""}>2</option>
	     <option value="3" ${health.a61 == 3 ? "selected" : ""}>3</option>
	     <option value="4" ${health.a61 == 4 ? "selected" : ""}>4</option>
    </select>
    0.无辅助设施 1.拐杖 2.双手扶助步器 3.电动车 4.轮椅</td>
  </tr>
  <tr>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a62" id="a62" onclick="enableCheck(64)"/>
    室内  <input disabled  type="checkbox" class="checkBox1"  name="a63" id="a63" onclick="enableCheck(64)"/>
    室外 
    <input disabled  type="checkbox" class="checkBox1"  name="a64" id="a64" onclick="disAb(62,63);"/>     没有任何活动</td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">忍耐</div></td>
    <td colspan="11">a.一般一周内（过去90天中，或自上次评估后）老人走出家门、大楼的频率 
      <select disabled name="a65" id="a65" style="width:50px">
         <option value="0" ${health.a65 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a65 == 1 ? "selected" : ""}>1</option>
	     <option value="2" ${health.a65 == 2 ? "selected" : ""}>2</option>
	     <option value="3" ${health.a65 == 3 ? "selected" : ""}>3</option>
    </select>
    0.每天 1.2-6天/周 2.一周一天 3.不出门</td>
  </tr>
  <tr>
    <td colspan="11">b.最近3天内的运动小时数（例如散步、锻炼）
      <select disabled name="a66" id="a66" style="width:50px">
         <option value="0" ${health.a66 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a66 == 1 ? "selected" : ""}>1</option>
      </select>
    0.2小时及以上 1.少于2小时</td>
  </tr>
  <tr>
    <td><div align="center">功能潜力</div></td>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a274" id="a274" onclick="enableCheck(69)"/>
      老人相信他/她能够提升自理能力（ADL、IADL、mobility）。
     <input disabled  type="checkbox" class="checkBox1"  name="a67" id="a67" onclick="enableCheck(69)"/>
      护理、康复人员相信老人有提升自理能力（ADL、IADL、mobility）可能 。
    <input disabled  type="checkbox" class="checkBox1"  name="a68" id="a68" onclick="enableCheck(69)"/>
      现疾病、情况康复状况良好，预期健康状态能改善。
      <input disabled  type="checkbox" class="checkBox1"  name="a69" id="a69" onclick="disAb(67,68);"/>
      以上都不是。</td>
  </tr>
  <tr>
    <td height="34" colspan="12">H.7天内二便情况</td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">小便</div></td>
    <td colspan="11">a.7天内小便排便功能（插管或者特殊排便护理要求的老人）
      <select disabled name="a70" id="a70" style="width:50px">
           <option value="0" ${health.a70 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a70 == 1 ? "selected" : ""}>1</option>
	       <option value="2" ${health.a70 == 2 ? "selected" : ""}>2</option>
	       <option value="3" ${health.a70 == 3 ? "selected" : ""}>3</option>
	       <option value="4" ${health.a70 == 4 ? "selected" : ""}>4</option>
	       <option value="5" ${health.a70 == 5 ? "selected" : ""}>5</option>
    </select>
      0.正常，能够控制，不使用任何插管或排便装置。1.正常插管，使用的插管装置、排尿装置使用正常，没有尿液漏出。2.一般情况正常，一周内可能出现一次无法正常排便。3.经常出现失禁，一周内几次出现问题。4.失禁，每天多次出现状况。5.无排尿。</td>
  </tr>
  <tr>
    <td colspan="11">b.比过去90天糟糕：
      <select disabled name="a71" id="a71" style="width:50px">
           <option value="0" ${health.a71 == 0 ? "selected" : ""}>0</option>
	       <option value="1" ${health.a71 == 1 ? "selected" : ""}>1</option>
      </select>0.否
       1.是</td>
  </tr>
  <tr>
    <td><div align="center">小便排便装置</div></td>
    <td colspan="11"><div align="left">（最近7天内检查装置）
      <input disabled  type="checkbox" class="checkBox1"  name="a72" id="a72" onclick="enableCheck(74)"/>
      使用成人尿布或者防护垫  
      <input disabled  type="checkbox" class="checkBox1"  name="a73" id="a73" onclick="enableCheck(74)"/>
      使用导尿管 
      <input disabled  type="checkbox" class="checkBox1"  name="a74" id="a74" onclick="disAb(72,73);"/>
      以上都不是 </div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div></td>
  </tr>
  <tr>
    <td><div align="center">大便</div></td>
    <td colspan="11">（最近7天内排便情况）
      <select disabled name="a75" id="a75" style="width:50px">
          <option value="0" ${health.a75 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a75 == 1 ? "selected" : ""}>1</option>
	      <option value="2" ${health.a75 == 2 ? "selected" : ""}>2</option>
	      <option value="3" ${health.a75 == 3 ? "selected" : ""}>3</option>
	      <option value="4" ${health.a75 == 4 ? "selected" : ""}>4</option>
	      <option value="5" ${health.a75 == 5 ? "selected" : ""}>5</option>
      </select>
      0.正常，能够控制，不使用造口装置。1.正常使用造口装置，没有漏便情况发生。2.一般情况正常，一周出现一次无法排便情况。3.经常出现失禁，一周内出现2-3次大便失禁问题。4.失禁，总是出现。5.7天内无排便。</td>
  </tr>
  <tr>
    <td height="36" colspan="12">I.疾病诊断(医院诊断申请人现患有疾病/感染症状。或者90天内因此疾病住院的。)</td>
  </tr>
  <tr>
    <td rowspan="5">疾病(【空白】无此症状。【1】没有专门治疗或被居家养老服务机构特别监<br />
      护<br />
      【2】被专业居家养老服务机构监护（如果列表中<br />
    没有疾病，请在【ac】选项中打钩）)</td>
    <td height="66" colspan="7">心脑血管疾病 
      <input disabled  type="checkbox" class="checkBox1"  name="a76" id="a76" onclick="enableCheck(104)"/>
    a.脑血管疾病（如中风）
    <input disabled  type="checkbox" class="checkBox1"  name="a77" id="a77" onclick="enableCheck(104)"/>
    b.心力衰竭 
    <input disabled  type="checkbox" class="checkBox1"  name="a78" id="a78" onclick="enableCheck(104)"/>
    c.冠心病（心肌梗塞、心绞痛）
    <input disabled  type="checkbox" class="checkBox1"  name="a79" id="a79" onclick="enableCheck(104)"/>
    d.高血压 
    <input disabled  type="checkbox" class="checkBox1"  name="a80" id="a80" onclick="enableCheck(104)"/>
    e.心律不齐 
   <input disabled  type="checkbox" class="checkBox1"  name="a81" id="a81" onclick="enableCheck(104)"/>
    f.外周动脉疾病</td>
    <td colspan="4">神经系统
    <input disabled  type="checkbox" class="checkBox1"  name="a82" id="a82" onclick="enableCheck(104)"/>
    g. 阿兹海默症 
   <input disabled  type="checkbox" class="checkBox1"  name="a83" id="a83" onclick="enableCheck(104)"/>
    h. 阿兹海默症以外的痴呆症 
   <input disabled  type="checkbox" class="checkBox1"  name="a84" id="a84" onclick="enableCheck(104)"/>
    i. 头部创伤 
   <input disabled  type="checkbox" class="checkBox1"  name="a85" id="a85" onclick="enableCheck(104)"/>
    j. 偏瘫
   <input disabled  type="checkbox" class="checkBox1"  name="a86" id="a86" onclick="enableCheck(104)"/>
    k. 多发性硬化症（癫痫）
    <input disabled  type="checkbox" class="checkBox1"  name="a87" id="a87" onclick="enableCheck(104)"/>
    l. 帕金森氏症</td>
  </tr>
  <tr>
    <td height="67" colspan="7">骨骼肌系统
   <input disabled  type="checkbox" class="checkBox1"  name="a88" id="a88" onclick="enableCheck(104)"/>
    m. 关节炎
   <input disabled  type="checkbox" class="checkBox1"  name="a89" id="a89" onclick="enableCheck(104)"/>
    n. 髋部骨折
   <input disabled  type="checkbox" class="checkBox1"  name="a90" id="a90" onclick="enableCheck(104)"/>
    o. 其他骨折（如腕、脊椎）
    <input disabled  type="checkbox" class="checkBox1"  name="a91" id="a91" onclick="enableCheck(104)"/>
    p. 骨质疏松症</td>
    <td colspan="4">感觉
     <input disabled  type="checkbox" class="checkBox1"  name="a92" id="a92" onclick="enableCheck(104)"/>
    q. 白内障 
    <input disabled  type="checkbox" class="checkBox1"  name="a93" id="a93" onclick="enableCheck(104)"/>
    r. 青光眼</td>
  </tr>
  <tr>
    <td colspan="4">精神疾病
    <input disabled  type="checkbox" class="checkBox1"  name="a94" id="a94" onclick="enableCheck(104)"/>
    s. 任何精神疾病诊断</td>
    <td colspan="7">感染     <input disabled  type="checkbox" class="checkBox1"  name="a95" id="a95" onclick="enableCheck(104)"/>
    t. HIV（艾滋）
   <input disabled  type="checkbox" class="checkBox1"  name="a96" id="a96" onclick="enableCheck(104)"/>
    u. 肺炎
   <input disabled  type="checkbox" class="checkBox1"  name="a97" id="a97" onclick="enableCheck(104)"/>
    v. 肺结核 
   <input disabled  type="checkbox" class="checkBox1"  name="a98" id="a98" onclick="enableCheck(104)"/>
    w. 尿路感染（30天内）</td>
  </tr>
  <tr>
    <td height="30" colspan="11">其他疾病 
   <input disabled  type="checkbox" class="checkBox1"  name="a99" id="a99" onclick="enableCheck(104)"/>
    x.癌症（近5年内），不包括皮肤癌 
    <input disabled  type="checkbox" class="checkBox1"  name="a100" id="a100" onclick="enableCheck(104)"/>
    y. 糖尿病 
   <input disabled  type="checkbox" class="checkBox1"  name="a101" id="a101" onclick="enableCheck(104)"/>
    z.肺气肿/慢性阻塞性肺病/哮喘结核 
   <input disabled  type="checkbox" class="checkBox1"  name="a102" id="a102" onclick="enableCheck(104)"/>
    aa. 肾功能衰竭 
   <input disabled  type="checkbox" class="checkBox1"  name="a103" id="a103" onclick="enableCheck(104)"/>
    ab. 甲状腺疾病 </td>
  </tr>
  <tr>
    <td height="70" colspan="2"><input disabled  type="checkbox" class="checkBox1"  name="a104" id="a104" onclick="disAb(76,103);"/>
    ac. 以上都不是</td>
    <td colspan="9">其他疾病描述
    <textarea disabled name="a105" id="a105" cols="80" rows="3"></textarea></td>
  </tr>
  <tr>
    <td height="36" colspan="12">J.健康干预</td>
  </tr>
  <tr>
    <td rowspan="3"><div align="center">体检</div></td>
    <td colspan="6">血型：
      <select disabled name="a106" id="a106" style="width:50px">
          <option value="0" ${health.a106 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a106 == 1 ? "selected" : ""}>1</option>
	      <option value="2" ${health.a106 == 2 ? "selected" : ""}>2</option>
	      <option value="3" ${health.a106 == 3 ? "selected" : ""}>3</option>
	      <option value="4" ${health.a106 == 4 ? "selected" : ""}>4</option>
	      <option value="5" ${health.a106 == 5 ? "selected" : ""}>5</option>
      </select>
    1.A型 2.B型 3.AB型 4.O型 5.RH阴性 0.不详</td>
    <td colspan="5">过敏史：      
      <select disabled name="a107" id="a107" style="width:50px">
         <option value="0" ${health.a107 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a107 == 1 ? "selected" : ""}>1</option>
    </select>0.否
       1.是</td>
  </tr>
  <tr>
    <td colspan="6">手术史：
      <select disabled name="a108" id="a108" style="width:50px" onchange="Bian('a109','a110',this.options.selectedIndex)">
         <option value="0" ${health.a108 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a108 == 1 ? "selected" : ""}>1</option>
      </select>
      0.无
       1.有<br>
年份
<input disabled  type="text" class="Wdate" name="a109" id="a109" onClick="WdatePicker({dateFmt:'yyyy',readOnly:true})" /> 名称 <input disabled  type="text" size="20" name="a110" id="a110" /></td>
    <td colspan="5">身高（cm）
    <input disabled  type="text" size="7" name="a111" id="a111"/>
     体重（kg）
    <input disabled  type="text" size="7" name="a112" id="a112"/>    
     腰围
    <input disabled  type="text" size="7" name="a113" id="a113" /></td>
  </tr>
  <tr>
    <td colspan="5">空腹血糖：
      <select disabled name="a114" id="a114" style="width:50px" onchange="Bian('a115','',this.options.selectedIndex)">
         <option value="0" ${health.a114 == 0 ? "selected" : ""}>0</option>
	     <option value="1" ${health.a114 == 1 ? "selected" : ""}>1</option>
      </select>
        0.未测
        1.已测
      <input disabled  type="text" size="7" name="a115" id="a115" />
     （mmol/L）</td>
    <td colspan="3">胸透检查：      
      <select disabled name="a116" id="a116" style="width:50px">
          <option value="0" ${health.a116 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a116 == 1 ? "selected" : ""}>1</option>
    </select>0.无
       1.有</td>
    <td colspan="3">肝功能检查：      
      <select disabled name="a275" id="a275" style="width:50px">
          <option value="0" ${health.a275 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a275 == 1 ? "selected" : ""}>1</option>
      </select>0.无
       1.有</td>
  </tr>
  <tr>
    <td><div align="center">现阶段问题(2天内)</div></td>
    <td colspan="11">近2-3天内出现的问题 
    <input disabled  type="checkbox" class="checkBox1"  name="a117" id="a117" onclick="disAb(118,122)"/>无 
    <input disabled  type="checkbox" class="checkBox1"  name="a118" id="a118" onclick="enableCheck(117)"/>
    腹泻
    <input disabled  type="checkbox" class="checkBox1"  name="a119" id="a119" onclick="enableCheck(117)"/>
    排尿不畅,或晚间起夜3次以上
   <input disabled  type="checkbox" class="checkBox1"  name="a120" id="a120" onclick="enableCheck(117)"/>
    发烧
   <input disabled  type="checkbox" class="checkBox1"  name="a121" id="a121" onclick="enableCheck(117)"/>
    食欲下降
    <input disabled  type="checkbox" class="checkBox1"  name="a122" id="a122" onclick="enableCheck(117)"/>
    呕吐</td>
  </tr>
  <tr>
    <td><div align="center">问题症状近3天内出现的问题</td>
    <td colspan="11"><p>生理健康
      <input disabled  type="checkbox" class="checkBox1"  name="a123" id="a123" onclick="disAb(124,131)"/>
      无
      <input disabled  type="checkbox" class="checkBox1"  name="a124" id="a124" onclick="enableCheck(123)"/>
      平躺和放松时胸口有压力/疼痛
      <input disabled  type="checkbox" class="checkBox1"  name="a125" id="a125" onclick="enableCheck(123)"/>
      3天内未排便
     <input disabled  type="checkbox" class="checkBox1"  name="a126" id="a126" onclick="enableCheck(123)"/>
      晕眩
      <input disabled  type="checkbox" class="checkBox1"  name="a127" id="a127" onclick="enableCheck(123)"/>
      食欲下降
      <input disabled  type="checkbox" class="checkBox1"  name="a128" id="a128" onclick="enableCheck(123)"/>
      水肿
      <input disabled  type="checkbox" class="checkBox1"  name="a129" id="a129" onclick="enableCheck(123)"/>
      呼吸急促 </p>
      <p>精神健康
  <input disabled  type="checkbox" class="checkBox1"  name="a130" id="a130" onclick="enableCheck(123)"/>
        幻觉 
       <input disabled  type="checkbox" class="checkBox1"  name="a131" id="a131" onclick="enableCheck(123)"/>
    错觉</p></td>
  </tr>
  <tr>
    <td rowspan="5"><div align="center">疼痛</div></td>
    <td colspan="11">申请人抱怨疼痛频率
      <select disabled name="a132" id="a132" style="width:50px">
            <option value="0" ${health.a132 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a132 == 1 ? "selected" : ""}>1</option>
	        <option value="2" ${health.a132 == 2 ? "selected" : ""}>2</option>
	        <option value="3" ${health.a132 == 3 ? "selected" : ""}>3</option>
      </select> 
0.没有疼痛 1.几天一次 2.每天一次  3.每天多次</td>
  </tr>
  <tr>
    <td colspan="11">疼痛强度 
      <select disabled name="a133" id="a133" style="width:50px">
            <option value="0" ${health.a133 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a133 == 1 ? "selected" : ""}>1</option>
	        <option value="2" ${health.a133 == 2 ? "selected" : ""}>2</option>
	        <option value="3" ${health.a133 == 3 ? "selected" : ""}>3</option>
	        <option value="4" ${health.a133 == 4 ? "selected" : ""}>4</option>
    </select>     
       0.没有疼痛 1.轻微 2.一般 3.严重 4.难以忍受</td>
  </tr>
  <tr>
    <td colspan="11">申请人认为疼痛影响日常生活      
      <select disabled name="a134" id="a134" style="width:50px">
            <option value="0" ${health.a134 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a134 == 1 ? "selected" : ""}>1</option>
      </select> 0.不是
         1.是</td>
  </tr>
  <tr>
    <td colspan="11">疼痛患处      
      <select disabled name="a135" id="a135" style="width:50px">
            <option value="0" ${health.a135 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a135 == 1 ? "selected" : ""}>1</option>
    </select>0.一处
         1.多处</td>
  </tr>
  <tr>
    <td colspan="11">用药能够控制疼痛 
      <select disabled name="a136" id="a136" style="width:50px">
            <option value="0" ${health.a136 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a136 == 1 ? "selected" : ""}>1</option>
	        <option value="2" ${health.a136 == 2 ? "selected" : ""}>2</option>
      </select> 
    0.能够或没有疼痛 1.用药不能够完全控制疼痛 2.疼痛存在，但不服用药物</td>
  </tr>
  <tr>
    <td><div align="center">跌倒频率</div></td>
    <td colspan="11">最近90天内跌倒次数（超过9次的填9）
    <input disabled  type="text" size="7" name="a137" id="a137"/>
    次</td>
  </tr>
  <tr>
    <td><div align="center">跌倒危险性</div></td>
    <td colspan="6"> <select disabled name="a138" id="a138" style="width:50px">
            <option value="0" ${health.a138 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a138 == 1 ? "selected" : ""}>1</option>
      </select> 
0.没有危险
1.有危险</td>
    <td colspan="5"><input disabled  type="checkbox" class="checkBox1"  name="a139" id="a139" />
    走步不稳 
    <input disabled  type="checkbox" class="checkBox1"  name="a140" id="a140" />
    申请人因害怕摔倒不愿意外出</td>
  </tr>
  <tr>
    <td><div align="center">生活方式</div></td>
    <td colspan="11">是否吸烟或者喝酒
     <input disabled  type="checkbox" class="checkBox1"  name="a141" id="a141" onclick="disAb(142,144)"/>
没有
<input disabled  type="checkbox" class="checkBox1"  name="a142" id="a142" onclick="enableCheck(141)"/>
90天内（或上次评估后），申请人感到或被人告知要少喝酒，或者他人为老人的饮酒习惯感到担心.
<input disabled  type="checkbox" class="checkBox1"  name="a143" id="a143" onclick="enableCheck(141)"/>
90天内（或上次评估后），申请人每天一早就开始喝酒或者因为喝酒造成问题
<input disabled  type="checkbox" class="checkBox1"  name="a144" id="a144" onclick="enableCheck(141)"/>
每天需要吸烟.</td>
  </tr>
  <tr>
    <td><div align="center">健康状态指向</div></td>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a145" id="a145" onclick="enableCheck(150)"/>
    申请人感到他/她健康很糟糕
     <input disabled  type="checkbox" class="checkBox1"  name="a146" id="a146" onclick="enableCheck(150)"/>
      申请人的疾病或生活条件使得认知功能、脾气或者行为不稳定
<input disabled  type="checkbox" class="checkBox1"  name="a147" id="a147" onclick="enableCheck(150)"/>
经历突发性严重疾病或慢性疾病
<input disabled  type="checkbox" class="checkBox1"  name="a148" id="a148" onclick="enableCheck(150)"/>
近30天内（或上次评估后）由于突发状况治疗变化
<input disabled  type="checkbox" class="checkBox1"  name="a149" id="a149" onclick="enableCheck(150)"/>
    诊断活不过6个月 -例如医生告知申请者或其家人申请人在病症晚期
    <input disabled  type="checkbox" class="checkBox1"  name="a150" id="a150" onclick="disAb(145,149)"/>
    以上都不是</td>
  </tr>
  <tr>
    <td><div align="center">其他状态指向</div></td>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a151" id="a151" onclick="enableCheck(157)"/>
    害怕家人或者护理者
     <input disabled  type="checkbox" class="checkBox1"  name="a152" id="a152" onclick="enableCheck(157)"/>
      个人卫生情况很糟糕
<input disabled  type="checkbox" class="checkBox1"  name="a153" id="a153" onclick="enableCheck(157)"/>
无法解释的创伤、骨折或烧伤
<input disabled  type="checkbox" class="checkBox1"  name="a154" id="a154" onclick="enableCheck(157)"/>
    被忽视、侵害或虐待
    <input disabled  type="checkbox" class="checkBox1"  name="a155" id="a155" onclick="enableCheck(157)"/>
    <input disabled  type="hidden" class="checkBox1"  name="a156" id="a156" onclick="enableCheck(157)"/>
    肢体受缚（如四肢被绑、坐在椅子上时被绑）
<input disabled  type="checkbox" class="checkBox1"  name="a157" id="a157" onclick="disAb(151,156)"/>
以上都不是</td>
  </tr>
  <tr>
    <td height="33" colspan="12">K.营养/水份</td>
  </tr>
  <tr>
    <td><div align="center">体重</div></td>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a158" id="a158"/>
    30天内不刻意流失5%体重（180天内体重下降10%）
   <input disabled  type="checkbox" class="checkBox1"  name="a159" id="a159"/>
    严重营养不良（极瘦弱）
    <input disabled  type="checkbox" class="checkBox1"  name="a160" id="a160"/>
    病态 超重</td>
  </tr>
  <tr>
    <td><div align="center">消耗</div></td>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a161" id="a161"/>
    近2-3天内每天吃1顿或很少
    <input disabled  type="checkbox" class="checkBox1"  name="a162" id="a162"/>
    近3天内申请人平时吃的食物或饮水明显减少
   <input disabled  type="checkbox" class="checkBox1"  name="a163" id="a163"/>
    水份不足近3天几乎很少补充水份
  <input disabled  type="checkbox" class="checkBox1"  name="a164" id="a164"/>
    需用食管进食</td>
  </tr>
  <tr>
    <td><div align="center">吞咽</div></td>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a165" id="a165"/>
      正常
     <input disabled  type="checkbox" class="checkBox1"  name="a166" id="a166"/>
      需要对大块需要咀嚼的食物进行加工（例如肉块切碎）
     <input disabled  type="checkbox" class="checkBox1"  name="a167" id="a167"/>
      需要对大块需要咀嚼的食物以及浓稠液体加工
     <input disabled  type="checkbox" class="checkBox1"  name="a168" id="a168"/>
      需要口腔与食管喂食</td>
  </tr>
  <tr>
    <td><div align="center">过去治愈的溃疡</div></td>
    <td colspan="11">申请人过去在身体任何部位出现过的溃疡
      <select disabled name="a169" id="a169" style="width:50px">
            <option value="0" ${health.a169 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a169 == 1 ? "selected" : ""}>1</option>
      </select>
0.无
1.有</td>
  </tr>
  <tr>
    <td><div align="center">伤口/溃疡护理</div></td>
    <td colspan="11">过去护理的7天内
     <input disabled  type="checkbox" class="checkBox1"  name="a170" id="a170" onclick="enableCheck(174)"/>
    抗生素（全身或局部）
   <input disabled  type="checkbox" class="checkBox1"  name="a171" id="a171" onclick="enableCheck(174)"/>
    外敷
   <input disabled  type="checkbox" class="checkBox1"  name="a172" id="a172" onclick="enableCheck(174)"/>
    术后伤口护理
   <input disabled  type="checkbox" class="checkBox1"  name="a173" id="a173"  onclick="enableCheck(174)"/>
    其他疮伤护理（如压力衣、食疗，）
   <input disabled  type="checkbox" class="checkBox1"  name="a174" id="a174" onclick="disAb(170,173)"/>
    以上都不是</td>
  </tr>
  <tr>
    <td height="38" colspan="12">L.口腔健康</td>
  </tr>
  <tr>
     <td><div align="center">口腔情况</div></td>
     <td colspan="11">
       <select name="a276" id="a276" style="width:50px" disabled>
            <option value="1" ${health.a276 == 1 ? "selected" : ""}>1</option>
	        <option value="2" ${health.a276 == 2 ? "selected" : ""}>2</option> 
	        <option value="3" ${health.a276 == 3 ? "selected" : ""}>3</option> 
        </select>
   		1.咀嚼困难(例如：下巴不灵活,味觉功能下降、吃饭时候疼痛) 2.吃饭的时候口中干涩.3.刷牙洁牙有困难</td>
  </tr>
  <tr>
    <td height="38" colspan="12">M.皮肤状态</td>
  </tr>
  <tr>
    <td><div align="center">皮肤问题</div></td>
    <td colspan="11">任何皮肤问题或皮肤状态变化
      <select disabled name="a179" id="a179" style="width:50px">
            <option value="0" ${health.a179 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a179 == 1 ? "selected" : ""}>1</option> 
      </select>
    （0.没有变化 1.有变化）</td>
  </tr>
  <tr>
    <td><div align="center">压疮、郁血性溃疡</div></td>
    <td colspan="8">身体任何地方出现溃疡
      <select disabled name="a180" id="a180" style="width:50px">
            <option value="1" ${health.a180 == 1 ? "selected" : ""}>1</option>
	        <option value="2" ${health.a180 == 2 ? "selected" : ""}>2</option> 
	        <option value="3" ${health.a180 == 3 ? "selected" : ""}>3</option> 
	        <option value="4" ${health.a180 == 4 ? "selected" : ""}>4</option> 
	        
      </select>
    （1级）溃疡周边皮肤出现活动（2级）部分皮肤坏死；（3级）皮肤有深坑；（4级）破坏皮肤组织肌肉和骨头外露</td>
    <td colspan="3"><input disabled  type="checkbox" class="checkBox1"  name="a181" id="a181"/>
      压疮
     <input disabled  type="checkbox" class="checkBox1"  name="a182" id="a182"/>
      郁血性溃疡</td>
  </tr>
  <tr>
    <td><div align="center">其他需要治疗的皮肤疾病</div></td>
    <td colspan="11"><input disabled  type="checkbox" class="checkBox1"  name="a183" id="a183" onclick="enableCheck(186)"/>
    烧伤（2级或3级）
     <input disabled  type="checkbox" class="checkBox1"  name="a184" id="a184" onclick="enableCheck(186)"/>
    破裂溃疡、红疹或伤口
    <input disabled  type="checkbox" class="checkBox1"  name="a273" id="a273" onclick="enableCheck(186)"/>
    皮肤出脓
    <input disabled  type="checkbox" class="checkBox1"  name="a185" id="a185" onclick="enableCheck(186)"/>
    术后伤口
    <input disabled  type="checkbox" class="checkBox1"  name="a186" id="a186"  onclick="disAb(183,185)"/>
    以上都不是</td>
  </tr>
  <tr>
    <td height="36" colspan="12">N.环境评估</td>
  </tr>
  <tr>
    <td><div align="center">居家安全评估</div></td>
    <td colspan="11">是否需要提供居家安全评估（上门服务申请者提供）
      <select disabled name="a175" id="a175" style="width:50px" onchange="Bian('a176','',this.options.selectedIndex)">
            <option value="0" ${health.a175 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a175 == 1 ? "selected" : ""}>1</option> 
      </select>
      0.需要
      1.不需要 居家安全评估分数
      <input disabled  type="text" size="7" name="a176" id="a176" />
      分</td>
  </tr>
  <tr>
    <td><div align="center">居住布局</div></td>
    <td colspan="5">与90天前相比（或上次评估后）申请者现在与他人一同居住（例如，搬去他人家中或别人搬入自己家中）
      <select disabled name="a177" id="a177" style="width:50px">
            <option value="0" ${health.a177 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a177 == 1 ? "selected" : ""}>1</option> 
      </select> 0.否
      1.是 </td>
    <td colspan="6"><p>申请者或护理提供方认为申请者最好能够住到另一个环境</p>
    <p>
      <select disabled name="a178" id="a178" style="width:50px">
            <option value="0" ${health.a178 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a178 == 1 ? "selected" : ""}>1</option> 
	        <option value="2" ${health.a178 == 2 ? "selected" : ""}>2</option> 
      </select>
      0.否 1.申请者认为2.服务提供方3.申请者与提供方    </p></td>
  </tr>
  <tr>
    <td height="32" colspan="12">O.用药</td>
  </tr>
  <tr>
    <td><div align="center">用药数量</div></td>
    <td colspan="11">记录不同种类药物数量（处方或非处方药物）包括眼药水等7天内每日正常服用的药物(如果没有填&quot;0&quot;，如果超过9种，填写&quot;9&quot;)
    <input disabled  type="text" size="7" name="a187" id="a187"/></td>
  </tr>
  <tr>
    <td><div align="center">影响精神的药物</div></td>
    <td colspan="11">7天内服务影响精神的药物
      <select disabled name="a188" id="a188" style="width:50px" onchange="BianCheck(189,192,this.options.selectedIndex)">
            <option value="0" ${health.a188 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a188 == 1 ? "selected" : ""}>1</option> 
      </select>
      0.无 1.有 
     <input disabled  type="checkbox" class="checkBox1"  name="a189" id="a189" onclick="enableselect(188)"/>
      抗精神病药物
<input disabled  type="checkbox" class="checkBox1"  name="a190" id="a190" onclick="enableselect(188)"/>
镇痛药物
<input disabled  type="checkbox" class="checkBox1"  name="a191" id="a191" onclick="enableselect(188)"/>
抗抑郁药物
<input disabled  type="checkbox" class="checkBox1"  name="a192" id="a192" onclick="enableselect(188)"/>
安眠药物</td>
  </tr>
  <tr>
    <td><div align="center">用药咨询</div></td>
    <td colspan="11">180天内是否有主治医师对用药进行了解
      <select disabled name="a193" id="a193" style="width:50px">
            <option value="0" ${health.a193 == 0 ? "selected" : ""}>0</option>
	        <option value="1" ${health.a193 == 1 ? "selected" : ""}>1</option> 
      </select>
0.向至少1位医师咨询 1.所有药物未得到任何医生咨询</td>
  </tr>
  <tr>
    <td><div align="center">用药习惯</div></td>
    <td colspan="11">30天内，坚持根据医嘱用药情况：
      <select disabled name="a194" id="a194" style="width:50px">
             <option value="0" ${health.a194 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a194 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a194 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a194 == 3 ? "selected" : ""}>3</option>
      </select>
    0.总是坚持 1.80%以上时间坚持 2.80%以下时间无法坚持(包括由于无法及时采购到药物造成服药延误）3.无医嘱服用药物</td>
  </tr>
  <tbody id="tbody1">
  <tr>
    <td id="changeRowspan" rowspan="3"><div align="center">用药记录</div></td>
    <td colspan="11"><p>30天内医嘱用药以及柜台购买（OTC）药品用药情况 </p>
    <p>a.名称及药量 - 记录药品名称以及药量 b.服药方式，见下方代码：</p>
    <p>1.口服（PO）2.舌下 （SL）3. 肌内给药（IM）4.静脉注射(IV)5.皮下注射(SQ)6.局部（R）7.吸入8.永久插管9.其他</p>
    <p>c.服药剂量 - 记录每次服药所用剂量</p>
    <p>d.频率：服药每日、每周或每月频率代码如下：</p>
    <p>ORN:总是需要 OH：每小时 O2H：每两个小时 O3H：每3小时 O4H：每4小时 O6H：每6小时 O8H：每8小时</p>
    <p>OD. 每天 B1D.1天2次(包括每12小时一次) T1D. 1天3次 O1D.1天4次 5D. 1天5次 O1D. 一天隔一天<br />
      OW.每周1次 2W.1周2次 3W.1周3次 4W.1周4次 5W.1周5次 6W.1周6次 1M.1月1次 2M.1月2次<br />
    C.其他</p></td>
  </tr>
  <tr>
    <td colspan="4">名称和药量</td>
    <td colspan="2">服用形式</td>
    <td colspan="2">服用次数</td>
    <td colspan="3"><div align="center">服用频率</div></td>
  </tr>
 </tbody>
  <tr>
    <td height="38" colspan="12" name="a199" id="a199">P.服务使用情况（七天内）</td>
  </tr>
  <tr>
    <td rowspan="11"><div align="center">过去护理 （时间具体<br />
    到10分钟）</div></td>
    <td colspan="13">过去7天内的护理服务情况（或上次评估服务情况）</td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">家庭健康辅助&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled  type="text" size="7" name="a200" id="a200"/>
    日
    <input disabled  type="text" size="7" name="a201" id="a201"/>
小时
<input disabled  type="text" size="7" name="a202" id="a202"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">家庭医生\护士上门&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input disabled  type="text" size="7" name="a203" id="a203"/>
        日      
        <input disabled  type="text" size="7" name="a204" id="a204"/>
    小时    
      <input disabled  type="text" size="7" name="a205" id="a205"/>
    分钟</div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">居家护理服务&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input disabled  type="text" size="7" name="a206" id="a206"/>
日
<input disabled  type="text" size="7" name="a207" id="a207"/>
小时
<input disabled  type="text" size="7" name="a208" id="a208"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">三餐（包括上门送餐）
      <input disabled  type="text" size="7" name="a209" id="a209"/>
日
<input disabled  type="text" size="7" name="a210" id="a210"/>
小时
<input disabled  type="text" size="7" name="a211" id="a211"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">志愿者服务&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled  type="text" size="7" name="a212" id="a212"/>
日
<input disabled  type="text" size="7" name="a213" id="a213"/>
小时
<input disabled  type="text" size="7" name="a214" id="a214"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">康复理疗服务&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled  type="text" size="7" name="a215" id="a215"/>
日
<input disabled  type="text" size="7" name="a216" id="a216" />
小时
<input disabled  type="text" size="7" name="a217" id="a217"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">康复功能训练服务&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled  type="text" size="7" name="a218" id="a218"/>
日
<input disabled  type="text" size="7" name="a219" id="a219"/>
小时
<input disabled  type="text" size="7" name="a220" id="a220"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">康复言语治疗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled  type="text" size="7" name="a221" id="a221"/>
日
<input disabled  type="text" size="7" name="a222" id="a222"/>
小时
<input disabled  type="text" size="7" name="a223" id="a223"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">日间照料中心&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled  type="text" size="7" name="a224" id="a224"/>
日
<input disabled  type="text" size="7" name="a225" id="a225"/>
小时
<input disabled  type="text" size="7" name="a226" id="a226"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td colspan="13"><div align="left">社工上门探访&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input disabled  type="text" size="7" name="a227" id="a227"/>
日
<input disabled  type="text" size="7" name="a228" id="a228"/>
小时
<input disabled  type="text" size="7" name="a229" id="a229"/>
分钟</div>      <div align="left"></div>      <div align="left"></div>    <div align="left"></div></td>
  </tr>
  <tr>
    <td rowspan="6"><div align="center">特殊照料锻炼治疗服务项目</div></td>
    <td colspan="11">30天内是否有计划接受特殊照料、治疗、锻炼计划。包括在家中接受服务项目<br />
      【空白】0.无 1.有计划，完全按照计划参与服务2.有计划，部分按照计划参与服务 3.有计划，未接受服务[如果选项中没有提供服务，选择aa] 
      <input disabled  type="checkbox" class="checkBox1"  name="a230" id="a230"/>
      以下都没有</td>
  </tr>
  <tr>
    <td colspan="11">呼吸系统护理： 
      <select disabled name="a231" id="a231" style="width:50px">
     		 <option value="0" ${health.a231 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a231 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a231 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a231 == 3 ? "selected" : ""}>3</option>
    </select>
    吸氧 
    <select disabled name="a232" id="a232" style="width:50px">
             <option value="0" ${health.a232 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a232 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a232 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a232 == 3 ? "selected" : ""}>3</option>
    </select>    
     辅助呼吸器 
     <select disabled name="a233" id="a233" style="width:50px">
             <option value="0" ${health.a233 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a233 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a233 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a233 == 3 ? "selected" : ""}>3</option>
    </select>  
    所有其他呼吸治疗</td>
  </tr>
  <tr>
    <td colspan="11">其他护理：
      <select disabled name="a234" id="a234" style="width:50px">
             <option value="0" ${health.a234 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a234 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a234 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a234 == 3 ? "selected" : ""}>3</option>
    </select> 
      酒精/药物治疗
<select disabled name="a235" id="a235" style="width:50px">
             <option value="0" ${health.a235 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a235 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a235 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a235 == 3 ? "selected" : ""}>3</option>
    </select> 
输血
<select disabled name="a236" id="a236" style="width:50px">
             <option value="0" ${health.a236 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a236 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a236 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a236 == 3 ? "selected" : ""}>3</option>
    </select> 
化疗
<select disabled name="a237" id="a237" style="width:50px">
             <option value="0" ${health.a237 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a237 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a237 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a237 == 3 ? "selected" : ""}>3</option>
    </select> 
透析
<select disabled name="a238" id="a238" style="width:50px">
             <option value="0" ${health.a238 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a238 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a238 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a238 == 3 ? "selected" : ""}>3</option>
    </select> 
输液
<select disabled name="a239" id="a239" style="width:50px">
             <option value="0" ${health.a239 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a239 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a239 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a239 == 3 ? "selected" : ""}>3</option>
    </select> 
注射（打针）
<select disabled name="a240" id="a240" style="width:50px">
             <option value="0" ${health.a240 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a240 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a240 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a240 == 3 ? "selected" : ""}>3</option>
    </select> 
造口护理
<select disabled name="a241" id="a241" style="width:50px">
             <option value="0" ${health.a241 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a241 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a241 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a241 == 3 ? "selected" : ""}>3</option>
    </select> 
放射治疗
<select disabled name="a242" id="a242" style="width:50px">
             <option value="0" ${health.a242 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a242 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a242 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a242 == 3 ? "selected" : ""}>3</option>
    </select> 
气管造口护理</td>
  </tr>
  <tr>
    <td colspan="11">治疗：
     <select disabled name="a243" id="a243" style="width:50px">
             <option value="0" ${health.a243 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a243 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a243 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a243 == 3 ? "selected" : ""}>3</option>
    </select> 
    拳操锻炼
   <select disabled name="a244" id="a244" style="width:50px">
             <option value="0" ${health.a244 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a244 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a244 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a244 == 3 ? "selected" : ""}>3</option>
    </select> 
    功能训练
   <select disabled name="a245" id="a245" style="width:50px">
             <option value="0" ${health.a245 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a245 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a245 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a245 == 3 ? "selected" : ""}>3</option>
    </select> 
    理疗</td>
  </tr>
  <tr>
    <td colspan="11">服务项目：
     <select disabled name="a246" id="a246" style="width:50px">
             <option value="0" ${health.a246 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a246 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a246 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a246 == 3 ? "selected" : ""}>3</option>
    </select> 
      日间服务中心
 <select disabled name="a247" id="a247" style="width:50px">
             <option value="0" ${health.a247 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a247 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a247 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a247 == 3 ? "selected" : ""}>3</option>
    </select> 
      医院
      <select disabled name="a248" id="a248" style="width:50px">
             <option value="0" ${health.a248 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a248 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a248 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a248 == 3 ? "selected" : ""}>3</option>
    </select> 
      临终关怀
 <select disabled name="a249" id="a249" style="width:50px">
             <option value="0" ${health.a249 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a248 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a248 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a248 == 3 ? "selected" : ""}>3</option>
    </select> 
      理疗师或医疗机构上门
      <select disabled name="a250" id="a250" style="width:50px">
             <option value="0" ${health.a250 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a250 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a250 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a250 == 3 ? "selected" : ""}>3</option>
    </select> 
    喘息照料</td>
  </tr>
  <tr>
    <td colspan="11">特殊家中照料程序：
       <select disabled name="a251" id="a251" style="width:50px">
             <option value="0" ${health.a251 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a251 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a251 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a251 == 3 ? "selected" : ""}>3</option>
       </select> 
      每日护师/士上门监督指导
      <select disabled name="a252" id="a252" style="width:50px">
             <option value="0" ${health.a252 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a252 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a252 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a252 == 3 ? "selected" : ""}>3</option>
       </select> 
非每日护师/护士监护      
 <select disabled name="a253" id="a253" style="width:50px">
             <option value="0" ${health.a253 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a253 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a253 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a253 == 3 ? "selected" : ""}>3</option>
       </select> 
安全报警装置，如腕带安康通等设备
 <select disabled name="a254" id="a254" style="width:50px">
             <option value="0" ${health.a254 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a254 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a254 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a254 == 3 ? "selected" : ""}>3</option>
       </select> 
皮肤护理
 <select disabled name="a255" id="a255" style="width:50px">
             <option value="0" ${health.a255 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a255 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a255 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a255 == 3 ? "selected" : ""}>3</option>
       </select> 
特殊饮食护理</td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">设备管理</div></td>
    <td colspan="11">选项填写：0.不使用 1.自己能够使用 2.能够自己使用但是需要别人口头提醒3.部分工作需要他人帮助 4.完全需要他人帮助</td>
  </tr>
  <tr>
    <td colspan="11"><select disabled name="a256" id="a256" style="width:50px">
             <option value="0" ${health.a256 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a256 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a256 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a256 == 3 ? "selected" : ""}>3</option>
	         <option value="4" ${health.a256 == 4 ? "selected" : ""}>4</option>
       </select> 
    吸氧 
   <select disabled name="a257" id="a257" style="width:50px">
             <option value="0" ${health.a257 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a257 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a257 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a257 == 3 ? "selected" : ""}>3</option>
	         <option value="4" ${health.a257 == 4 ? "selected" : ""}>4</option>
       </select> 
    插管
<select disabled name="a258" id="a258" style="width:50px">
             <option value="0" ${health.a258 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a258 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a258 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a258 == 3 ? "selected" : ""}>3</option>
	         <option value="4" ${health.a258 == 4 ? "selected" : ""}>4</option>
       </select> 
注射
<select disabled name="a259" id="a259" style="width:50px">
             <option value="0" ${health.a259 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a259 == 1 ? "selected" : ""}>1</option>
	         <option value="2" ${health.a259 == 2 ? "selected" : ""}>2</option>
	         <option value="3" ${health.a259 == 3 ? "selected" : ""}>3</option>
	         <option value="4" ${health.a259 == 4 ? "selected" : ""}>4</option>
       </select> 
造口</td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">90天内入院治疗或近期评估</div></td>
    <td colspan="11">填写入院次数，如果大于9次，填写&quot;9&quot;</td>
  </tr>
  <tr>
    <td colspan="3">在医院过夜次数
    <input disabled  type="text" size="7" name="a260" id="a260" /></td>
    <td colspan="4">进医院急诊室（无过夜）的次数
      <input disabled  type="text" size="7" name="a261" id="a261"/></td>
    <td colspan="4">急诊监护（医生、护士、治疗师在医院或家中进行）
    <input disabled  type="text" size="7" name="a262" id="a262"/></td>
  </tr>
  <tr>
    <td><div align="center">治疗预期目标</div></td>
    <td colspan="11">90天内（或上次评估后）目标是否达成 
      <select disabled name="a263" id="a263" style="width:50px">
             <option value="0" ${health.a263 == 0 ? "selected" : ""}>0</option>
	         <option value="1" ${health.a263 == 1 ? "selected" : ""}>1</option>
      </select>
    0.否 1.是</td>
  </tr>
  <tr>
    <td><div align="center">护理需求变更</div></td>
    <td colspan="11">与90天前（或上次评估后）相比，个人情况显著变化
      <select disabled name="a264" id="a264" style="width:50px">
          <option value="0" ${health.a264 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a264 == 1 ? "selected" : ""}>1</option>
	      <option value="2" ${health.a264 == 2 ? "selected" : ""}>2</option>
      </select>
    0.无变化 1.进步-服务支持减少 2.变差-需要更多服务支持</td>
  </tr>
  <tr>
    <td><div align="center">价格权衡</div></td>
    <td colspan="11">由于经济情况出现问题，申请者减少购买服务，例如：买药、康复治疗、食物、居家护理服务：
      <select disabled name="a265" id="a265" style="width:50px">
          <option value="0" ${health.a265 == 0 ? "selected" : ""}>0</option>
	      <option value="1" ${health.a265 == 1 ? "selected" : ""}>1</option>
      </select>
0.否 1.是</td>
  </tr>
  </table>
  <p>&nbsp;</p>
  <table style="margin:auto" width="95%" border="1" class="tabcss">
  <tr>
    <td height="33" colspan="4"><div align="center">Q.完成评估人员签字</div></td>
  </tr>
  <tr>
    <td colspan="4">评估人员签字：
      <input disabled  type="text" size="17" name="a266" id="a266"/>
评估人员职务：
<input disabled  type="text" size="17" name="a267" id="a267"/>
评估日期（年/月/日）：
<input disabled  type="text" class="Wdate" name="a268" id="a268" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/></td>
  </tr>
  <tr>
    <td width="259"><div align="center">其他签字</div></td>
    <td width="225"><div align="center">职务</div></td>
    <td width="188"><div align="center">部门</div></td>
    <td width="190"><div align="center">日期</div></td>
  </tr>
  <tbody id="tbody2">
  </tbody>
</table>

</div>
<table width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="forward('healthEvallistH.do')">返回</button></td>
  </tr>  
</table>
</form>
<script type="text/javascript">
<%
   healtheval health = (healtheval)request.getAttribute("health");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=276;methodi++){
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
            if((i+1)>=269){
              if((i+1)<=272){
			      continue;
			  }
            }
            
            if((i+1)>=195){
               if((i+1)<=198){
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
            }
     }
     var ii=268;
     
	 for(var trindex=0;trindex<strs[ii].split('#').length-1;trindex++){
	    initRow(strs[ii].split('#')[trindex],strs[ii+1].split('#')[trindex],strs[ii+2].split('#')[trindex],strs[ii+3].split('#')[trindex]);
	 }
	 
	 var jj=194;
	 for(var trindex=0;trindex<strs[jj].split('#').length-1;trindex++){
	    initRow1(strs[jj].split('#')[trindex],strs[jj+1].split('#')[trindex],strs[jj+2].split('#')[trindex],strs[jj+3].split('#')[trindex]);
	    //设置select选中
	    setSelected(trindex,strs[jj+1].split('#')[trindex],strs[jj+3].split('#')[trindex]);
	 }
}	

function setSelected(sindex,val1,val2){
    var srr = document.getElementsByName('a196');
    var srr1 = document.getElementsByName('a198');
    for (var i = 0; i < srr[sindex].options.length; i++) {
        if (srr[sindex].options[i].text == val1) {        
            srr[sindex].options[i].selected = true;        
            break;        
        }        
    }   
    
    for (var i = 0; i < srr1[sindex].options.length; i++) {        
        if (srr1[sindex].options[i].text == val2) {        
            srr1[sindex].options[i].selected = true;        
            break;        
        }        
    }
}

function initRow(inival,inival1,inival2,inival3){
    var tbody2 = document.getElementById('tbody2');
    var row = tbody2.insertRow(tbody2.rows.length);
    var ftd = row.insertCell(row.cells.length); 
    ftd.innerHTML='<div align="center"><input disabled type="text" size="17" name="a269" value='+inival+' ></div>';
    var std = row.insertCell(row.cells.length);
    std.innerHTML='<div align="center"><input disabled type="text" size="17" name="a270" value='+inival1+' ></div>';
    var ttd = row.insertCell(row.cells.length);
    ttd.innerHTML='<div align="center"><input disabled type="text" size="17" name="a271" value='+inival2+' ></div>'
    var ftd = row.insertCell(row.cells.length);
    ftd.innerHTML='<div align="center"><input disabled type="text" class="Wdate" name="a272" onClick="WdatePicker({dateFmt:\'yyyy-MM-dd\',readOnly:true})" value='+inival3+' ></div>'
}

function initRow1(inival,inival1,inival2,inival3){
     var tbody1 = document.getElementById('tbody1');
     var retd = document.getElementById('changeRowspan');
     retd.setAttribute('rowSpan',tbody1.rows.length+1);
     var row = tbody1.insertRow(tbody1.rows.length);
     var ftd = row.insertCell(row.cells.length);   
     ftd.setAttribute('colSpan',4);
     ftd.innerHTML=(tbody1.rows.length-2)+'.<input disabled type="text" size="40"  name="a195" value='+inival+' >';
     var std = row.insertCell(row.cells.length);
     std.setAttribute('colSpan',2);
     std.innerHTML='<select disabled name="a196" value='+inival1+' style="width:50px"> '
             +'<option value="1">1</option>'
			 +'<option value="2">2</option>'
	         +'<option value="3">3</option>'
	         +'<option value="4">4</option>' 
	         +'<option value="5">5</option>'
	         +'<option value="6">6</option>'
	         +'<option value="7">7</option>'
	         +'<option value="8">8</option>' 
	         +'<option value="9">9</option></select>';
    var ttd = row.insertCell(row.cells.length);
    ttd.setAttribute('colSpan',2);
    ttd.innerHTML='<input disabled type="text" name="a197" size="7" value='+inival2+' >';
    var ftd = row.insertCell(row.cells.length);
    ftd.setAttribute('colSpan',3);
    ftd.innerHTML='<div align="center"><select disabled name="a198" value='+inival3+' style="width:50px">'
     		 +'<option value="ORN">ORN</option>'
	         +'<option value="OH">OH</option>'
	         +'<option value="O2H">O2H</option>'
	         +'<option value="O3H">O3H</option>'
	         +'<option value="O4H">O4H</option>'
	         +'<option value="O6H">O6H</option>'
	         +'<option value="O8H">O8H</option>'
	         +'<option value="OD">OD</option>' 
	         +'<option value="B1D">B1D</option>'
	         +'<option value="T1D">T1D</option>'
	         +'<option value="O1D">O1D</option>'
	         +'<option value="5D">5D</option>'
	         +'<option value="O1D">O1D</option>' 
	         +'<option value="OW">OW</option>'
	         +'<option value="2W">2W</option>'
	         +'<option value="3W">3W</option>'
	         +'<option value="4W">4W</option>' 
	         +'<option value="5W">5W</option>'
	         +'<option value="6W">6W</option>'
	         +'<option value="1M">1M</option>'
	         +'<option value="2M">2M</option>'
	         +'<option value="C">C</option></select></div>';
    
}

fillBlank();
</script>
</body>
</html>
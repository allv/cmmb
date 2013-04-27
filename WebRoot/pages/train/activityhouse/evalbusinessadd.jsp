<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import.jsp"%>
<%@page import="com.wootion.cmmb.persistenc.po.bean.evaluationforbusiness"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考評表新增</title>
<style type="text/css">
*{list-style:none;margin:0;padding:0;overflow:hidden}
body{overflow:auto}
.tab1{width:885px;border-top:#A8C29F solid 1px;border-bottom:#A8C29F solid 1px;margin:20px 100px}
</style>
<script type="text/javascript">
var basePath = '<%=basePath%>';
function onSubmit(){
      if(check("evalname","string","姓名不能为空！")||check("evaluationnumber","string","请填写表編號！")){
	  	      return false;
	  }
      var evalname = document.getElementById('evalname').value;
      var evaluationnumber = document.getElementById('evaluationnumber').value;
      
      var paraurl = '';
      for(i=1;i<=66;i++){
         if(document.getElementById("a"+i).type=='text'){
            var arr = document.getElementById("a"+i);
            var b = arr.value;
	        var tempa='';
      		if(strTrim(arr.value)!=''){
		           //不为空的情况下,要验证合法性，只能填写正数字
		           //为空的情况下，为0
		           if(!is_positiveInteger(arr.value)){
		              alert('只能为正整数');
				      arr.className = "errorInput";
					  arr.focus();
					  return;
		           }
		        }
            if(strTrim(b)==''){
                //此处不能为空，要给个默认值
                b='';
            }
            
            eval("var a" + i + "='" + b+"';");
            paraurl = paraurl+'&'+('a'+i)+'='+encodeURI(b);
         }
      }
         var evalid=document.getElementById('evalid').value;
          if(evalid=='null'||evalid==""){
	            $.ajax({
				   type: "POST",
				   url: basePath + "/evaluationworkeraddevalform.do?evalname="+encodeURI(evalname)+"&evaluationnumber="+encodeURI(evaluationnumber)+paraurl,
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('考評表新增成功');
				   			window.location.href=basePath+"/evaluationworkerlist.do";
				   		}else if('duplicated'==result){
				   		    alert('表編號已被使用,請重新填寫');
				   		    return;
				   		}else{
				   			alert('考評表新增失败');
				   			return;
				   		}
				   },
				   failure:function (){
				   		alert("未知错误！");
				   		return;
				   }	   
			   });
	     }else{
	          $.ajax({
				   type: "POST",
				   url: basePath + "/evaluationworkermodifyevalform.do?evalid="+evalid+"&evalname="+encodeURI(evalname)+"&evaluationnumber="+encodeURI(evaluationnumber)+paraurl,
				   success:function (msg){
				   		var result = msg;
				   		if('success'==result){
				   		 	alert('考評表修改成功');
				   			window.location.href=basePath+"/evaluationworkerlist.do";
				   		}else if('duplicated'==result){
				   		    alert('表編號已被使用,請重新填寫');
				   		    return;
				   		}else{
				   			alert('考評表修改失败');
				   			return;
				   		}
				   },
				   failure:function (){
				   		alert("未知错误！");
				   		return;
				   }	   
			   });
	     }
}
</script>
</head>
<body>
<div class="topLanBar"><b>当前位置：</b>機構管理 > 考評表</div>
<table width="100%" >
  <tr>
    <td background="<%=basePath%>/pages/train/skins/img/lan-index.gif">&nbsp;</td>
  </tr>
</table>
<form>
<div align="center">
<table width="606" border="1" class="tabcss">
  <tr>
    <td width="147"><div align="center">姓名：</div></td>
    <td colspan="2"><div align="left">
      <input type="text" name="evalname" id="evalname" size="12" value="${evalEntity.evalname}"/>
    </div><div align="center"></div></td>
    <td width="63"><div align="center">编号：</div></td>
    <td width="121"><div align="left">
      <input type="text" name="evaluationnumber" id="evaluationnumber" size="20" value="${evalEntity.evaluationnumber}"/>
    </div></td>
  </tr>
  <tr>
    <td><div align="center">评分内容</div></td>
    <td><div align="center">评分标准</div>      <div align="center"></div></td>
    <td><div align="center">当月指标</div></td>
    <td><div align="center">完成量</div></td>
    <td><div align="center">得分</div></td>
  </tr>
  <tr>
    <td rowspan="6"><div align="center">培训、活动组织</div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div>      <div align="center"></div></td>
    <td width="159"><div align="center">人次数</div></td>
    <td width="82"><div align="center">
      <input type="text" name="a1" id="a1" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a2" id="a2" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a3" id="a3" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">活动组织数</div></td>
    <td><div align="center">
      <input type="text" name="a4" id="a4" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a5" id="a5" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a6" id="a6" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">记录人次数</div></td>
    <td><div align="center">
      <input type="text" name="a7" id="a7" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a8" id="a8" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a9" id="a9" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">满意反馈</div></td>
    <td><div align="center">
      <input type="text" name="a10" id="a10" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a11" id="a11" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a12" id="a12" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">活动策划</div></td>
    <td><div align="center">
      <input type="text" name="a13" id="a13" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a14" id="a14" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a15" id="a15" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">活动小结</div></td>
    <td><div align="center">
      <input type="text" name="a16" id="a16" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a17" id="a17" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a18" id="a18" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">服务推广</div></td>
    <td><div align="center">人数</div></td>
    <td><div align="center">
      <input type="text" name="a19" id="a19" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a20" id="a20" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a21" id="a21" size="6" />
    </div></td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">档案建立</div></td>
    <td><div align="center">人数</div></td>
    <td><div align="center">
      <input type="text" name="a22" id="a22" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a23" id="a23" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a24" id="a24" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">有效性</div></td>
    <td><div align="center">
      <input type="text" name="a25" id="a25" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a26" id="a26" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a27" id="a27" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">公益性收入</div></td>
    <td><div align="center">金额</div></td>
    <td><div align="center">
      <input type="text" name="a28" id="a28" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a29" id="a29" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a30" id="a30" size="6" />
    </div></td>
  </tr>
  <tr>
    <td rowspan="3"><div align="center">投诉</div></td>
    <td><div align="center">投诉数量</div></td>
    <td><div align="center">
      <input type="text" name="a31" id="a31" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a32" id="a32" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a33" id="a33" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">损失程度</div></td>
    <td><div align="center">
      <input type="text" name="a34" id="a34" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a35" id="a35" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a36" id="a36" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">后续处理</div></td>
    <td><div align="center">
      <input type="text" name="a37" id="a37" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a38" id="a38" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a39" id="a39" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">会议缺勤</div></td>
    <td><div align="center">数量</div></td>
    <td><div align="center">
      <input type="text" name="a40" id="a40" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a41" id="a41" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a42" id="a42" size="6" />
    </div></td>
  </tr>
  <tr>
    <td colspan="5"><div align="center">累计指标</div></td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">服务定点拓展</div></td>
    <td><div align="center">数量
    </div></td>
    <td><div align="center">
      <input type="text" name="a43" id="a43" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a44" id="a44" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a45" id="a45" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">活动参与度</div></td>
    <td><div align="center">
      <input type="text" name="a46" id="a46" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a47" id="a47" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a48" id="a48" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">志愿者</div></td>
    <td><div align="center">三星及以上人数</div></td>
    <td><div align="center">
      <input type="text" name="a49" id="a49"  size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a50" id="a50" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a51" id="a51" size="6" />
    </div></td>
  </tr>
  <tr>
    <td rowspan="2"><div align="center">合作机构</div></td>
    <td><div align="center">数量</div></td>
    <td><div align="center">
      <input type="text" name="a52" id="a52" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a53" id="a53" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" name="a54" id="a54" size="6" />
    </div></td>
  </tr>
  <tr>
    <td><div align="center">合作频率</div></td>
    <td><div align="center">
      <input type="text" name="a55" id="a55" size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a56" id="a56" />
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a66" id="a66"/>
    </div></td>
  </tr>
  <tr>
    <td rowspan="3"><div align="center">项目管理</div>      <div align="center"></div>      <div align="center"></div></td>
    <td><div align="center">申请数</div></td>
    <td><div align="center">
      <input type="text" name="a57" id="a57"  size="6" />
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a58" id="a58"/>
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a59" id="a59"/>
    </div></td>
  </tr>
  <tr>
    <td><div align="center">中标数</div></td>
    <td><div align="center">
      <input type="text" size="6" name="a60" id="a60"/>
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a61" id="a61"/>
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a62" id="a62"/>
    </div></td>
  </tr>
  <tr>
    <td><div align="center">管理数</div></td>
    <td><div align="center">
      <input type="text" size="6" name="a63" id="a63"/>
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a64" id="a64"/>
    </div></td>
    <td><div align="center">
      <input type="text" size="6" name="a65" id="a65"/>
    </div></td>
  </tr>
</table>
<input name="evalid" id="evalid" type="hidden" value="${evalEntity.evaluationid}"/>
  <table  border="0" cellspacing="0" cellpadding="5">
  <tr align="center">
    <td><button onClick="onSubmit()">确定</button><button id="backButton" onClick="forward('evaluationworkerlist.do')">返回</button></td>
  </tr>  
</table>
</div>
<script type="text/javascript">
<%
   evaluationforbusiness ca = (evaluationforbusiness)request.getAttribute("evalEntity");
   String isView = (String)request.getAttribute("view");
   StringBuffer parasb = new StringBuffer(); 
   for(int methodi=1;methodi<=66;methodi++){
    	 String methodname = "getA"+methodi;
    	 //动态调用方法
         parasb.append(ca.getClass().getMethod(methodname, new Class[]{}).invoke(ca, new Object[]{})).append(",");
   }
   String parstr = parasb.toString();
   //是否普通员工 
   String isleader = (String)request.getAttribute("isadmin");
   
%>
var paras = '<%=parstr%>' ;
var isView = '<%=isView%>';
var isleader = '<%=isleader%>';


forbideGrade();
function forbideGrade(){
   if(isleader=='employee'){
   	   //普通员工禁止打分功能
       for(i=3;i<=56;i++){
          document.getElementById('a'+i).disabled=true;
          i++;
          i++;
       }
       document.getElementById('a59').disabled=true;
       document.getElementById('a65').disabled=true;
       document.getElementById('a62').disabled=true;
       document.getElementById('a66').disabled=true;
   }
}
function fillBlank(){
     var strs= new Array(); 
     strs = paras.split(',');
     
     for(i=0;i<strs.length-1;i++){
            if(document.getElementById("a"+(i+1)).type=='text'){
                document.getElementById("a"+(i+1)).value=strs[i];
            }
     }
}
var evalid = document.getElementById("evalid").value;
//如果有recoveryid 那么是编辑页面
if(evalid!='null'&&evalid!=""){
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
}
</script>
</form>
</body>
</html>
